
function mathSign(x)
   if x<0 then
     return -1
   elseif x>0 then
     return 1
   else
     return 0
   end
end

function Create(self)

	self.footStepSound = CreateSoundContainer("Scrapmech Movement Footstep", "Scrappers.rte");
	self.metalAccentSound = CreateSoundContainer("Scrapmech Movement MetalAccent", "Scrappers.rte");
	self.stressLightSound = CreateSoundContainer("Scrapmech Movement StressLight", "Scrappers.rte");
	self.stressHeavySound = CreateSoundContainer("Scrapmech Movement StressHeavy", "Scrappers.rte");
	self.jumpSound = CreateSoundContainer("Scrapmech Movement Jump", "Scrappers.rte");
	self.landSound = CreateSoundContainer("Scrapmech Movement Land", "Scrappers.rte");
	
	self.terrainSounds = {
	Footstep = {[12] = CreateSoundContainer("Scrapmech Footstep Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Scrapmech Footstep Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Scrapmech Footstep Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"), -- sand
			[8] = CreateSoundContainer("Scrapmech Footstep Dirt", "Scrappers.rte"), -- sand
			[178] = CreateSoundContainer("Scrapmech Footstep SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Scrapmech Footstep SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Scrapmech Footstep SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Scrapmech Footstep SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Scrapmech Footstep SolidMetal", "Scrappers.rte")},
	};


	--PrimitiveMan:DrawCirclePrimitive(self.Pos, self.IndividualRadius, 13);
	self.flipTimer = Timer()
	self.flipDelay = 100
	
	self.lastHealth = self.Health - 0
	
	self.deathExplosionTimer = Timer()
	self.deathExplosionDelay = RangeRand(200,1000)
	
	self.deathExplosions = 0
	
	self.rayOrigins = {Vector(-5,8),Vector(5,8)}
	self.legs = {}
	self.legFeetContact = {false, false}
	self.legFeetContactTimer = {Timer(), Timer()}
	
	self.legFeetSoundTimer = {Timer(), Timer()}
	self.legFeetLandSoundTimer = Timer();
	
	local i = 0
	for limb in self.Attachables do
		if string.find(limb.PresetName, "Scrapmech Leg") then
			i = i + 1
			self.legs[i] = limb
			--print("Added leg")
		end
		--if string.find(limb.PresetName, "Null Leg") then
		--	limb.ToDelete = true
		--end
	end
	
	self.walkAnimationAcc = 0 -- "accumulator"
	self.walkFactorCont = 0
	
	self.legLength = 20
	self.legFootSprite = CreateMOSRotating("Scrapmech Leg Foot")
	self.legFootSprite.ToDelete = true
	
	self.walkSpeed = 30
end

function Update(self)
	if self.Status == Actor.DEAD or self.Status == Actor.DYING then 
		if self.deathExplosionTimer:IsPastSimMS(self.deathExplosionDelay) then
			
			local effect = CreateMOSRotating("Scrapmech Death Explosion");
			if effect then
				effect.Pos = self.Pos + Vector(RangeRand(-1,1), RangeRand(-1,1)) * self.IndividualRadius;
				MovableMan:AddParticle(effect);
				effect:GibThis();
				self.deathExplosions = self.deathExplosions + 1
			end
			self.deathExplosionTimer:Reset()
			self.deathExplosionDelay = RangeRand(100,500)
			
			if self.deathExplosions > 5 then
				--[[
				for attachable in self.Attachables do
					attachable:GibThis()
				end
				]]
				self:GibThis()
			end
		end
		return 
	end
	
	local ctrl = self:GetController()
	local player = false
	if self:IsPlayerControlled() then
		player = true
	end
	
	if self.lastHealth > self.Health then
		local diff = math.abs(self.lastHealth - self.Health)
		self:FlashWhite(100)
		if diff > 30 and math.random(1,2) < 2 then
			local effect = CreateMOSRotating("Scrapmech Death Explosion");
			if effect then
				effect.Pos = self.Pos + Vector(RangeRand(-1,1), RangeRand(-1,1)) * self.IndividualRadius;
				MovableMan:AddParticle(effect);
				effect:GibThis();
			end
		end
		self.lastHealth = self.Health - 0
	end
	
	--PrimitiveMan:DrawCirclePrimitive(self.Pos, self.IndividualRadius, 13);
	
	-- Physics
	local contactAmoutMax = 0
	for limb in self.Attachables do
		if string.find(limb.PresetName, "Scrapmech Leg") then
			contactAmoutMax = contactAmoutMax + 1
			self.legs[contactAmoutMax] = limb
		end
	end
	
	-- Accumulator
	local walkAcc = self.Vel.X * 0.8
	
	-- Raycast/Legs/Terrain detection
	local terrCont = {}
	
	local minLegLift = 1
	
	local contactAmout = 0
	
	local contactPos = {}
	local contactVec = {}
	local contactLength = {}
	for i = 1, contactAmoutMax do
		local leg = self.legs[i]
		--print(MovableMan:ValidMO(leg))
		--print(leg.Age)
		if leg then
			local offset = self.rayOrigins[i]
			local rayLength = self.legLength
			
			-- math.max(math.sin(self.walkAnimationAcc * math.pi + math.pi * (i-1)) * mathSign(walkAcc), 0) * mathSign(walkAcc)
			-- Absolue mathematical and programming clusterf#ck
			local walkSin = math.sin(self.walkAnimationAcc * math.pi + math.pi * (i-1)) + math.min(math.sin(self.walkAnimationAcc * math.pi + math.pi * (i-1)) * mathSign(walkAcc), 0) * mathSign(walkAcc) * 1.0
			walkSin = math.abs(walkSin) * mathSign(walkSin)
			local walkLegLift = 1 * (1 - self.walkFactorCont) + (((math.abs(math.sin(self.walkAnimationAcc * 0.5 * math.pi + math.pi * (i-1) * 0.5)) + 1) / 2)) * self.walkFactorCont
			local walkAngle = walkSin * self.walkFactorCont * 0.4
			
			minLegLift = math.min(minLegLift, walkLegLift)
			
			local rayOrigin = Vector(leg.Pos.X, leg.Pos.Y)
			local rayVector = Vector(self.Vel.X * GetPPM() * TimerMan.DeltaTimeSecs * 2.0, rayLength):RadRotate(self.RotAngle + walkAngle)-- * Vector(self.FlipFactor, 1)
			local terrCheck = SceneMan:CastStrengthRay(rayOrigin, rayVector, 30, Vector(), 1, 0, SceneMan.SceneWrapsX);
			--PrimitiveMan:DrawLinePrimitive(rayOrigin, rayOrigin + rayVector,  147);
			local pos = rayOrigin + rayVector
			contactPos[i] = rayOrigin + rayVector
			contactVec[i] = rayVector
			contactLength[i] = rayLength
			
			if terrCheck then
				local hitPos = SceneMan:GetLastRayHitPos()
				local pos = Vector(hitPos.X, hitPos.Y)
				contactAmout = contactAmout + 1
				contactPos[i] = pos
				contactVec[i] = SceneMan:ShortestDistance(rayOrigin, contactPos[i], SceneMan.SceneWrapsX); --contactPos[i] - rayOrigin
				contactLength[i] = contactVec[i].Magnitude
				
				self.legFeetContactTimer[i]:Reset()
				if self.legFeetContact[i] == false and walkLegLift > 0.85 then
					self.legFeetContact[i] = true
					
					if self.Vel.Y > 10 and self.legFeetLandSoundTimer:IsPastSimMS(500) then
						self.landSound:Play(self.Pos);
						self.stressHeavySound:Play(self.Pos);
						
						local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
						
						if terrPixel ~= 0 then -- 0 = air
							if self.terrainSounds.Footstep[terrPixel] ~= nil then
								self.terrainSounds.Footstep[terrPixel]:Play(self.Pos);
							else -- default to concrete
								self.terrainSounds.Footstep[177]:Play(self.Pos);
							end
						end
						
						self.legFeetLandSoundTimer:Reset();
						
						self.legFeetSoundTimer[1]:Reset();
						self.legFeetSoundTimer[2]:Reset();
					end
					
					if self.legFeetSoundTimer[i]:IsPastSimMS(250) then
						self.footStepSound:Play(self.Pos);
						self.metalAccentSound:Play(self.Pos);
						
						local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
						
						if terrPixel ~= 0 then -- 0 = air
							if self.terrainSounds.Footstep[terrPixel] ~= nil then
								self.terrainSounds.Footstep[terrPixel]:Play(self.Pos);
							else -- default to concrete
								self.terrainSounds.Footstep[177]:Play(self.Pos);
							end
						end						
						
						self.legFeetSoundTimer[i]:Reset()
					end
					
				elseif walkLegLift < 0.8 and self.legFeetContact[i] == true then -- PERHAPS PLAY MOTOR SOUND
					self.legFeetContact[i] = false
					if math.random(0, 100) < 51 then
						self.stressLightSound:Play(self.Pos);
					end
					
				end
				
				local fac = math.pow(1 - math.pow(contactLength[i] / rayLength, 3.0), 2.0) * 1.2
				self.Vel = Vector(self.Vel.X, self.Vel.Y / (1 + (TimerMan.DeltaTimeSecs * 1)))
				self.Vel = self.Vel - Vector(contactVec[i].X, contactVec[i].Y):SetMagnitude(fac) * TimerMan.DeltaTimeSecs * math.min(10 + math.min(math.abs(self.Vel.X * 0.6),20), 12) * 3 -- Spring
				--self.Vel = self.Vel - SceneMan.GlobalAcc * (fac + 2) / 3 * TimerMan.DeltaTimeSecs * 0.5 -- Stop the gravity
				self.Vel = self.Vel - SceneMan.GlobalAcc * TimerMan.DeltaTimeSecs * 0.25 -- Stop the gravity
				
				--PrimitiveMan:DrawTextPrimitive(self.Pos + Vector(-20, 10 + 10 * i), "fac"..i.." = "..math.floor(fac * 100), true, 0);
				
				--for i = 0, 3 do
				--	local offset = Vector(2,0):RadRotate(math.pi * 0.5 * i)
				--	PrimitiveMan:DrawLinePrimitive(pos, pos + offset, 13);
				--end
			elseif self.legFeetContactTimer[i]:IsPastSimMS(200) then
				self.legFeetContact[i] = false
			end
			
			--leg:SetNumberValue("Rotation", rayVector.AbsRadAngle)
			local angle = rayVector.AbsRadAngle + (math.pi * (-self.FlipFactor + 1) / 2)
			leg.InheritedRotAngleOffset = angle * self.FlipFactor - self.RotAngle-- + math.pi * (-self.FlipFactor + 1) / 2
			leg.Frame = math.floor(math.max(math.min((1 - (contactLength[i] * walkLegLift / rayLength)), 1.0) * 6, 0) + 0.55)
			
			local drawPos = Vector(rayOrigin.X, rayOrigin.Y) + Vector(contactVec[i].X, contactVec[i].Y) * walkLegLift
			drawPos = Vector(math.floor(drawPos.X), math.floor(drawPos.Y))
			for player = Activity.PLAYER_1, Activity.MAXPLAYERCOUNT - 1 do
				if not SceneMan:IsUnseen(drawPos.X, drawPos.Y, ActivityMan:GetActivity():GetTeamOfPlayer(player)) then
					PrimitiveMan:DrawBitmapPrimitive(ActivityMan:GetActivity():ScreenOfPlayer(player), drawPos, self.legFootSprite, self.RotAngle + rayVector.AbsRadAngle + math.pi * 0.5, 0);
				end
			end
			
			terrCont[i] = terrCheck
		end
	end
	self.walkAnimationAcc = (self.walkAnimationAcc + TimerMan.DeltaTimeSecs * walkAcc / math.max(contactAmoutMax, 1) * contactAmout) % 4
	local walkFactor = math.min(math.abs(self.Vel.X * 0.7), 1) / math.max(contactAmoutMax, 1) * contactAmout
	self.walkFactorCont = (self.walkFactorCont + walkFactor * TimerMan.DeltaTimeSecs * 20) / (1 + TimerMan.DeltaTimeSecs * 20)
	
	self.Vel = self.Vel + Vector(0, -math.max(self.Vel.Y, 0) * TimerMan.DeltaTimeSecs * 15):RadRotate(self.RotAngle) / math.max(contactAmoutMax, 1) * contactAmout -- Deaccelerate Y velocty
	
	local input = 0
	if ctrl:IsState(Controller.MOVE_LEFT) then
		input = -1
		if self.flipTimer:IsPastSimMS(self.flipDelay) and not self.HFlipped then
			--self.HFlipped = true
			self.flipTimer:Reset()
		end
	elseif ctrl:IsState(Controller.MOVE_RIGHT) then
		input = 1
		if self.flipTimer:IsPastSimMS(self.flipDelay) and self.HFlipped then
			--self.HFlipped = false
			self.flipTimer:Reset()
		end
	end
	
	
	local targetVel = self.walkSpeed / math.max(contactAmoutMax, 1) * contactAmout * input * math.pow(minLegLift, 2) * 1.5
	local v = self.walkSpeed * TimerMan.DeltaTimeSecs / math.max(contactAmoutMax, 1) * contactAmout
	if ctrl:IsState(Controller.MOVE_UP) then
		self.Vel = self.Vel + Vector(0, -v)
	end
	local diff = (targetVel - self.Vel.X) * TimerMan.DeltaTimeSecs
	if input ~= 0 and (diff / math.abs(diff)) == self.FlipFactor then
		self.Vel = self.Vel + Vector(diff / math.max(contactAmoutMax, 1) * contactAmout, 0)-- + --Vector(v, 0)
		self.Vel = Vector(self.Vel.X / (1 + (TimerMan.DeltaTimeSecs * 5 / math.max(contactAmoutMax, 1) * contactAmout)), self.Vel.Y) -- Friction
	else
		self.Vel = Vector(self.Vel.X / (1 + (TimerMan.DeltaTimeSecs * 8 / math.max(contactAmoutMax, 1) * contactAmout)), self.Vel.Y) -- Friction
	end
	
	
	-- Mirror
	--[[
	if self.flipTimer:IsPastSimMS(self.flipDelay) then
		if self.Vel.X > 2 and self.HFlipped then
			self.HFlipped = false
			self.flipTimer:Reset()
		elseif self.Vel.X < 2 and not self.HFlipped then
			self.HFlipped = true
			self.flipTimer:Reset()
		end
	end]]
	
	-- Balance
	local min_value = -math.pi;
	local max_value = math.pi;
	local value = self.RotAngle;
	local result;
	local ret = 0
	
	local range = max_value - min_value;
	if range <= 0 then
		result = min_value;
	else
		ret = (value - min_value) % range;
		if ret < 0 then ret = ret + range end
		result = ret + min_value;
	end
	
	self.RotAngle = (self.RotAngle - result * TimerMan.DeltaTimeSecs * 8)
	self.AngularVel = (self.AngularVel - result * TimerMan.DeltaTimeSecs * (20 + 30 * contactAmout))
	self.AngularVel = (self.AngularVel) / (1 + TimerMan.DeltaTimeSecs * 45)-- - self.Vel.X * TimerMan.DeltaTimeSecs * 6
	
end

function OnCollideWithTerrain(self, terrainID)
	if self.Status == Actor.DEAD or self.Status == Actor.DYING then 
	end
	
	if math.random(1,3) < 2 then
		-- Custom move out of terrain script, EXPERIMENTAL
		local radius = self.IndividualRadius
		--PrimitiveMan:DrawCirclePrimitive(self.Pos, radius, 13);
		local maxi = 6
		for i = 1, maxi do
			local offset = Vector(radius, 0):RadRotate(((math.pi * 2) / maxi) * i)
			local endPos = self.Pos + offset; -- This value is going to be overriden by function below, this is the end of the ray
			self.ray = SceneMan:CastObstacleRay(self.Pos + offset, offset * -1.0, Vector(0, 0), endPos, 0 , self.Team, 0, 1)
			if self.ray == 0 then
				--self.Pos = self.Pos - offset * 0.1;
				self.Pos = self.Pos - offset * 0.01;
				self.Vel = self.Vel * 0.8 - offset * 0.05;
			end
			--PrimitiveMan:DrawLinePrimitive(self.Pos + offset, self.Pos - offset, 46);
			--PrimitiveMan:DrawLinePrimitive(self.Pos + offset, endPos, 116);
		end
	end
end
--[[
function Destroy(self)
	for attachable in self.Attachables do
		attachable:GibThis()
	end
end
]]