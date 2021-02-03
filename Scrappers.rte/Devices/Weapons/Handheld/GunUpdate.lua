
function AddCutoff(timeMS, duration, baseVolume)
	baseVolume = 1 - baseVolume
	return (math.cos(math.min(timeMS / duration, 1) * math.pi) + ((1 / baseVolume) - 1)) * baseVolume
end

function Create(self)
	self.ReceiverCreate = true
	
	self.parent = nil
	self.parentSet = false;
	
	self.firstShot = false;
	self.firingFirstShot = false;
	self.fireSoundFadeTimer = Timer()
	
	self.experimentalFullAutoSounds = true
	self.experimentalFullAutoVolume = 0.67
	
	-- Animation
	self.originalStanceOffset = Vector(math.abs(self.StanceOffset.X), self.StanceOffset.Y)
	self.originalSharpStanceOffset = Vector(self.SharpStanceOffset.X, self.SharpStanceOffset.Y)
	self.originalSharpLength = self.SharpLength
	
	self.rotation = 0
	self.rotationTarget = 0
	self.rotationSpeed = 5
	
	self.horizontalAnim = 0
	self.verticalAnim = 0
	
	self.angVel = 0
	self.lastRotAngle = self.RotAngle
	
	-- Recoil System 
	self.recoilAcc = 0 -- for sinous
	self.recoilStr = 0 -- for accumulator
	self.recoilStrength = 7 -- multiplier for base recoil added to the self.recoilStr when firing
	self.recoilPowStrength = 0.4 -- multiplier for self.recoilStr when firing
	self.recoilRandomUpper = 2 -- upper end of random multiplier (1 is lower)
	self.recoilDamping = 1.0
	
	self.recoilMax = 20 -- in deg.
	
	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end
end

function Update(self)
	if not self.Receiver then return end
	
	if self.ID == self.RootID then
		self.parent = nil;
		self.parentSet = false;
	elseif self.parentSet == false then
		local actor = MovableMan:GetMOFromID(self.RootID);
		if actor and IsAHuman(actor) then
			self.parent = ToAHuman(actor);
			self.parentSet = true;
		end
	end
	
	
	local firedFrame = self.FiredFrame
	local activated = self:IsActivated()
	
	self.Frame = math.min(self.Receiver.FrameStart + math.max(self.FrameLocal, 0), self.Receiver.FrameEnd)
	
	if self:DoneReloading() and self.ReceiverCreate and self.Receiver.OnCreate then -- Dirty haxx for magazine issues
		self.Receiver.OnCreate(self, self.parent)
		self.ReceiverCreate = false
	end
	if not self.ReceiverCreate and self.Receiver.OnUpdate then
		self.Receiver.OnUpdate(self, self.parent, activated)
	end
	
	if self:NumberValueExists("MagRemoved") then
		self:MagazineOut()
	else
		self:MagazineIn()
	end
	
	-- Test
	--if UInputMan:KeyPressed(22) then
	--	self.experimentalFullAutoSounds = not self.experimentalFullAutoSounds
	--end
	--PrimitiveMan:DrawTextPrimitive(self.Pos, (self.experimentalFullAutoSounds and "Yes" or "No"), true, 0);
	
	if not activated then
		self.firstShot = true
		--self.firingFirstShot = false;
	end
	
	if self.experimentalFullAutoSounds and (self.FullAuto and (not self.firstShot or not firedFrame) and not self.firingFirstShot) then -- EXPERIMENTAL FULL AUTO SOUNDS
		self.soundFireAdd.Volume = AddCutoff(self.fireSoundFadeTimer.ElapsedSimTimeMS, 50, 0.67)
	end
	
	if firedFrame then -- Fire sounds and bullet spawning
	
		-- Bullet
		for i = 1, self.Caliber.ProjectileCount do
			local velocity = self.Caliber.ProjectileVelocity * 0.5 + (self.Caliber.ProjectileVelocity * 0.3 * self.Barrel.Length / 10)
			local spread = self.Caliber.ProjectileSpread * 0.5 + math.max(1 - (self.Barrel.Length / 21), 0) * 3
			
			local Bullet = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module)
			Bullet.Pos = self.MuzzlePos;
			Bullet.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + RangeRand(-math.rad(spread), math.rad(spread)))
			Bullet.Team = self.Team
			Bullet.Sharpness = Bullet.Sharpness * (1 + math.random(0,2) * 0.3)
			Bullet.IgnoresTeamHits = true
			MovableMan:AddParticle(Bullet);
		end
		
		-- Sounds
		if self.experimentalFullAutoSounds and self.FullAuto then -- EXPERIMENTAL FULL AUTO SOUNDS
			self.fireSoundFadeTimer:Reset()
			
			if self.firstShot then
				self.firingFirstShot = true
				self.firstShot = false
				
				 -- Two variants for mech modulation
				if self.UniqueID % 2 == 0 then -- Quieter mech, higher pitch
					self.soundFireMech.Pitch = self.soundFireMechBasePitch * 1.15
					self.soundFireMech.Volume = self.soundFireMechBaseVolume * 0.5
				else -- Louder mech, lower pitch
					self.soundFireMech.Pitch = self.soundFireMechBasePitch * 0.975
					self.soundFireMech.Volume = self.soundFireMechBaseVolume * 2.0
				end
				
				-- Louder Bbss
				self.soundFireBass.Pitch = self.soundFireBassBasePitch * 1.1
				self.soundFireBass.Volume = self.soundFireBassBaseVolume * 1.2
				
				-- No changes here
				self.soundFireAdd.Pitch = self.soundFireAddBasePitch
				self.soundFireAdd.Volume = self.soundFireAddBaseVolume
			else
				self.firingFirstShot = false
				
				self.soundFireAdd:Stop(-1)
				
				-- No changes here
				self.soundFireMech.Pitch = self.soundFireMechBasePitch
				self.soundFireMech.Volume = self.soundFireMechBaseVolume
				
				-- No changes here
				self.soundFireBass.Pitch = self.soundFireBassBasePitch
				self.soundFireBass.Volume = self.soundFireBassBaseVolume
				
				-- Cutoff?
				self.soundFireAdd.Pitch = self.soundFireAddBasePitch
				self.soundFireAdd.Volume = AddCutoff(self.fireSoundFadeTimer.ElapsedSimTimeMS, 50, 0.67)
			end
		else -- Normal
			self.soundFireMech.Pitch = self.soundFireMechBasePitch
			self.soundFireMech.Volume = self.soundFireMechBaseVolume
			
			self.soundFireBass.Pitch = self.soundFireBassBasePitch
			self.soundFireBass.Volume = self.soundFireBassBaseVolume
			
			self.soundFireAdd.Pitch = self.soundFireAddBasePitch
			self.soundFireAdd.Volume = self.soundFireAddBaseVolume
		end
		
		self.soundFireMech:Play(self.Pos)
		self.soundFireAdd:Play(self.Pos)
		self.soundFireBass:Play(self.Pos)
		
		
		self.soundFireNoiseOutdoors:Stop(-1)
		self.soundFireNoiseIndoors:Stop(-1)
		self.soundFireNoiseBigIndoors:Stop(-1)
		
		self.soundFireNoiseSemiOutdoors:Stop(-1)
		self.soundFireNoiseSemiIndoors:Stop(-1)
		self.soundFireNoiseSemiBigIndoors:Stop(-1)

		local outdoorRays = 0;
		local indoorRays = 0;
		local bigIndoorRays = 0;

		if self.parent:IsPlayerControlled() then
			self.rayThreshold = 2; -- this is the first ray check to decide whether we play outdoors
			local Vector2 = Vector(0,-700); -- straight up
			local Vector2Left = Vector(0,-700):RadRotate(45*(math.pi/180));
			local Vector2Right = Vector(0,-700):RadRotate(-45*(math.pi/180));			
			local Vector2SlightLeft = Vector(0,-700):RadRotate(22.5*(math.pi/180));
			local Vector2SlightRight = Vector(0,-700):RadRotate(-22.5*(math.pi/180));		
			local Vector3 = Vector(0,0); -- dont need this but is needed as an arg
			local Vector4 = Vector(0,0); -- dont need this but is needed as an arg

			self.ray = SceneMan:CastObstacleRay(self.Pos, Vector2, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.rayRight = SceneMan:CastObstacleRay(self.Pos, Vector2Right, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.rayLeft = SceneMan:CastObstacleRay(self.Pos, Vector2Left, Vector3, Vector4, self.RootID, self.Team, 128, 7);			
			self.raySlightRight = SceneMan:CastObstacleRay(self.Pos, Vector2SlightRight, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.raySlightLeft = SceneMan:CastObstacleRay(self.Pos, Vector2SlightLeft, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			
			self.rayTable = {self.ray, self.rayRight, self.rayLeft, self.raySlightRight, self.raySlightLeft};
		else
			self.rayThreshold = 1; -- has to be different for AI
			local Vector2 = Vector(0,-700); -- straight up
			local Vector3 = Vector(0,0); -- dont need this but is needed as an arg
			local Vector4 = Vector(0,0); -- dont need this but is needed as an arg		
			self.ray = SceneMan:CastObstacleRay(self.Pos, Vector2, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			
			self.rayTable = {self.ray};
		end
		
		for _, rayLength in ipairs(self.rayTable) do
			if rayLength < 0 then
				outdoorRays = outdoorRays + 1;
			elseif rayLength > 170 then
				bigIndoorRays = bigIndoorRays + 1;
			else
				indoorRays = indoorRays + 1;
			end
		end
		
		if outdoorRays >= self.rayThreshold then
			self.soundFireNoiseOutdoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiOutdoors:Play(self.Pos)
			end
		elseif math.max(outdoorRays, bigIndoorRays, indoorRays) == indoorRays then
			self.soundFireNoiseIndoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiIndoors:Play(self.Pos)
			end
		else -- bigIndoor
			self.soundFireNoiseBigIndoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiBigIndoors:Play(self.Pos)
			end
		end
	end
end