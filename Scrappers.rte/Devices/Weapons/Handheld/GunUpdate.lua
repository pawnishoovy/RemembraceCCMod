
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
	
	--- Recoil system and calculation
	
	self.recoilAcc = 0 -- for sinous
	self.recoilStr = 0 -- for accumulator
	
	self.recoilStrength = 0 -- multiplier for base recoil added to the self.recoilStr when firing
	self.recoilPowStrength = 0.5 -- multiplier for self.recoilStr when firing
	self.recoilRandomUpper = 2 -- upper end of random multiplier (1 is lower)
	self.recoilDamping = 1.0
	
	self.recoilMax = 20 -- in deg.
	-- Calculate recoil
	local mass = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module).Mass
	local velocity = self.Caliber.ProjectileVelocity
	
	self.recoilStrength = math.pow(mass * velocity / 4.25, 0.45) * 4
	
	if self.Stock then
		self.recoilStrength = self.recoilStrength / (1 + (self.Stock.Quality / 12))
	end
	
	if self.Foregrip then
		self.recoilDamping = self.recoilDamping * (1 + (self.Foregrip.Quality / 12))
	end
	
	self.shotCounter = 0
	self.coolDownDelay = (60000/self.RateOfFire)
	self.shotsPerBurst = (self.Receiver.BurstCount and self.Receiver.BurstCount or 3)
	
	self.preFireTimer = Timer()
	self.preFire = false
	self.preFireFired = false
	self.preFireActive = false
	
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
	
	-- Prefire
	if self.soundFirePre and self.Receiver.PreDelay > 0 then
		local active = self:IsActivated()
		if active or self.preFire then
			if not self.preFireActive then
				self.soundFirePre:Play(self.Pos)
				self.preFire = true
				self.preFireActive = true
			end
			
			if self.preFireTimer:IsPastSimMS(self.Receiver.PreDelay) then
				if self.FiredFrame then
					self.preFireFired = false
					self.preFire = false
				elseif not self.preFireFired then
					self:Activate()
				end
				
			else
				self:Deactivate()
			end
		else
			self.preFireActive = active
			self.preFireTimer:Reset()
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
	
	if self:IsReloading() then
		if self:NumberValueExists("MagRemoved") then
			self:MagazineOut()
			--self:RemoveNumberValue("MagRemoved");
		else
			self:MagazineIn()
		end
	end
	
	-- Fire Mode
	if self.FireMode == 2 then -- Burst A
		if self.Magazine then
			if self.coolDownTimer then
				if self.coolDownTimer:IsPastSimMS(self.coolDownDelay) and not (self:IsActivated() and self.triggerPulled) then
					self.coolDownTimer, self.shotCounter = nil;
				else
					self:Deactivate();
					local parent = self:GetRootParent();
					if parent and IsActor(parent) and not ToActor(parent):IsPlayerControlled() then
						self.triggerPulled = false;
					end
				end
			elseif self.shotCounter then

				self.triggerPulled = self:IsActivated();
					
				self:Activate();
				if self.FiredFrame then
					self.shotCounter = self.shotCounter + 1;
					if self.shotCounter >= self.shotsPerBurst then
						self.coolDownTimer = Timer();
						if not (self.parent and self.parent:IsPlayerControlled()) then
							self.coolDownDelay = (200000 / self.RateOfFire);
						end
					else
						self.coolDownDelay = (30000 / self.RateOfFire);
					end
				end
			elseif self.FiredFrame then
				self.shotCounter = 1;
			end
		else
			self.coolDownTimer, self.shotCounter = nil;
		end
	elseif self.FireMode == 3 then -- Burst B
		if self.Magazine then
			if self.coolDownTimer then
				if self.parent and self.parent:IsPlayerControlled() then
					self.coolDownDelay = (30000 / self.RateOfFire); -- much shorter delay for players, otherwise gets stuck and is sucky
				else
					self.coolDownDelay = (200000 / self.RateOfFire);
				end
				if self.coolDownTimer:IsPastSimMS(self.coolDownDelay) and self.parent and not (self:IsActivated() and self.parent:IsPlayerControlled()) then
					self.coolDownTimer = nil;
				else
					self:Deactivate();
				end
			elseif self:IsActivated() or self.burstActivated then
				self.burstActivated = true;
				if self.FiredFrame then
					self.shotCounter = self.shotCounter + 1;
					if self.shotCounter >= self.shotsPerBurst then
						self.coolDownTimer = Timer();
						self.shotCounter = 0;
					end
				end
				if not self:IsActivated() then
					self.coolDownTimer = Timer();
					self.burstActivated = false;
				end
			end
		else
			self.coolDownTimer = nil;
		end
	elseif self.FireMode == 4 then -- Burst C
		
	end
	
	-- Test
	--if UInputMan:KeyPressed(22) then
	--	self.experimentalFullAutoSounds = not self.experimentalFullAutoSounds
	--end
	--PrimitiveMan:DrawTextPrimitive(self.Pos, (self.experimentalFullAutoSounds and "Yes" or "No"), true, 0);
	
	-- Animation and recoil system
	if self.parent then
		
		-- Up/down left/right movement
		self.horizontalAnim = math.floor(self.horizontalAnim / (1 + TimerMan.DeltaTimeSecs * 24.0) * 1000) / 1000
		self.verticalAnim = math.floor(self.verticalAnim / (1 + TimerMan.DeltaTimeSecs * 15.0) * 1000) / 1000
		
		local stance = Vector()
		stance = stance + Vector(-1,0) * self.horizontalAnim -- Horizontal animation
		stance = stance + Vector(0,5) * self.verticalAnim -- Vertical animation
		-- Up/down left/right movement
		
		
		-- Aim sway/smoothing
		self.rotationTarget = self.rotationTarget - (self.angVel * 4)
		-- Aim sway/smoothing
		
		
		-- Progressive recoil update
		self.recoilStr = math.floor(self.recoilStr / (1 + TimerMan.DeltaTimeSecs * 8.0 * self.recoilDamping) * 1000) / 1000
		self.recoilAcc = (self.recoilAcc + self.recoilStr * TimerMan.DeltaTimeSecs) % (math.pi * 4)
		
		self:SetNumberValue("recoilStrengthCurrent", self.recoilStr)
		
		local recoilA = (math.sin(self.recoilAcc) * self.recoilStr) * 0.05 * self.recoilStr
		local recoilB = (math.sin(self.recoilAcc * 0.5) * self.recoilStr) * 0.01 * self.recoilStr
		local recoilC = (math.sin(self.recoilAcc * 0.25) * self.recoilStr) * 0.05 * self.recoilStr
		
		local recoilFinal = math.max(math.min(recoilA + recoilB + recoilC, self.recoilMax), -self.recoilMax)
		
		-- Sharp length animation
		self.SharpLength = math.max(self.originalSharpLength - (self.recoilStr * 3 + math.abs(recoilFinal)), 0)
		
		self.rotationTarget = self.rotationTarget + recoilFinal -- apply the recoil
		-- Progressive recoil update
		
		
		-- Final rotation
		self.rotation = (self.rotation + self.rotationTarget * TimerMan.DeltaTimeSecs * self.rotationSpeed) / (1 + TimerMan.DeltaTimeSecs * self.rotationSpeed)
		local total = math.rad(self.rotation) * self.FlipFactor
		
		self.RotAngle = self.RotAngle + total;
		-- Final rotation
		
		
		-- Rotation - pivot position on the grip
		local jointOffset = Vector(self.JointOffset.X * self.FlipFactor, self.JointOffset.Y):RadRotate(self.RotAngle);
		local offsetTotal = Vector(jointOffset.X, jointOffset.Y):RadRotate(-total) - jointOffset
		self.Pos = self.Pos + offsetTotal;
		-- Rotation - pivot position on the grip
		
		
		-- Fix attachable offsets and rotation
		local attachableTable = {
			(self.Stock and self.Stock.MO or nil),
			(self.Barrel and self.Barrel.MO or nil),
			(self.Foregrip and self.Foregrip.MO or nil),
			(self.MagazineData and self.MagazineData.MO or nil),
			(self.Sight and self.Sight.MO or nil)
		}
		--for attachable in self.Attachables do
		for i, attachable in ipairs(attachableTable) do
			if attachable and IsAttachable(attachable) then
				attachable = ToAttachable(attachable)
				attachable.Pos = self.Pos + Vector((attachable.ParentOffset.X - attachable.JointOffset.X) * self.FlipFactor, attachable.ParentOffset.Y - attachable.JointOffset.Y):RadRotate(self.RotAngle)
				attachable.RotAngle = self.RotAngle
			--else
			--	print("ERROR, MO FOR ROTATION MISSING: "..i)
			end
		end
		-- Fix attachable offsets and rotation
		
		
		self.StanceOffset = Vector(self.originalStanceOffset.X, self.originalStanceOffset.Y) + stance
		self.SharpStanceOffset = Vector(self.originalSharpStanceOffset.X, self.originalSharpStanceOffset.Y) + stance
	end
	
	--- Firing
	
	if self.experimentalFullAutoSounds and (self.FullAuto and (not self.firstShot or not firedFrame) and not self.firingFirstShot) then -- EXPERIMENTAL FULL AUTO SOUNDS
		self.soundFireAdd.Volume = AddCutoff(self.fireSoundFadeTimer.ElapsedSimTimeMS, 50, 0.67)
	end
	
	if firedFrame then -- Fire sounds and bullet spawning
		self.Pos = self.Pos + Vector(1 * self.FlipFactor, 0):RadRotate(self.RotAngle)
		
		-- Bullet
		local velocity = self.Caliber.ProjectileVelocity * 0.55 + (self.Caliber.ProjectileVelocity * 0.35 * self.Barrel.Length / 10)
		local barrelSpread = math.max(1 - (self.Barrel.Length / 21), 0) * 3
		local baseSpread = RangeRand(-math.rad(barrelSpread), math.rad(barrelSpread))
		for i = 1, self.Caliber.ProjectileCount do
			local roundSpread = self.Caliber.ProjectileSpread * 0.5
			local spread = baseSpread + RangeRand(-math.rad(roundSpread), math.rad(roundSpread))
			
			local Bullet = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module)
			Bullet.Pos = self.MuzzlePos;
			Bullet.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread)
			Bullet.Team = self.Team
			Bullet.Sharpness = Bullet.Sharpness * (1 + math.random(0,2) * 0.3)
			Bullet.IgnoresTeamHits = true
			MovableMan:AddParticle(Bullet);
		end
		
		-- Recoil
		self.recoilStr = self.recoilStr + ((math.random(10, self.recoilRandomUpper * 10) / 10) * 0.5 * self.recoilStrength) + (self.recoilStr * 0.6 * self.recoilPowStrength)
		self:SetNumberValue("recoilStrengthBase", self.recoilStrength * (1 + self.recoilPowStrength) / self.recoilDamping)
		
		-- Sounds
		
		if self.experimentalFullAutoSounds and self.FullAuto then -- EXPERIMENTAL FULL AUTO SOUNDS
			self.fireSoundFadeTimer:Reset()
			
			if self.firstShot then
				self.firingFirstShot = true
				
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
			if self.firstShot then
				self.reflectionSemiSound:Stop()
				self.reflectionSemiSound = self.soundFireReflectionSemi
				self.reflectionSemiSound:Play(self.Pos)
			else
				self.reflectionSound:Stop()
				self.reflectionSemiSound:Stop()
				self.reflectionSound = self.soundFireReflection
				self.reflectionSound:Play(self.Pos)
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
		
		self.firstShot = false
		
	end
	
	if not activated then
		self.firstShot = true
		--self.firingFirstShot = false;
	end
	
end

function OnDetach(self)
	self.preFireFired = false
	self.preFire = false
end