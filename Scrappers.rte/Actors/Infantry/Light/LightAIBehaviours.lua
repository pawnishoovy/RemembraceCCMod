LightAIBehaviours = {};

-- function LightAIBehaviours.createSoundEffect(self, effectName, variations)
	-- if effectName ~= nil then
		-- self.soundEffect = AudioMan:PlaySound(effectName .. math.random(1, variations) .. ".ogg", self.Pos, -1, 0, 130, 1, 400, false);	
	-- end
-- end

-- no longer needed as of pre3!

function LightAIBehaviours.createVoiceSoundEffect(self, soundContainer, priority, emotion, canOverridePriority)
	if canOverridePriority == nil then
		canOverridePriority = false;
	end
	local usingPriority
	if canOverridePriority == false then
		usingPriority = priority - 1;
	else
		usingPriority = priority;
	end
	if self.Head and soundContainer ~= nil then
		if self.voiceSound then
			if self.voiceSound:IsBeingPlayed() then
				if self.lastPriority <= usingPriority then
					self.voiceSound:Stop();
					self.voiceSound = soundContainer;
					soundContainer:Play(self.Pos)
					self.lastPriority = priority;
					return true;
				end
			else
				self.voiceSound = soundContainer;
				soundContainer:Play(self.Pos)
				self.lastPriority = priority;
				return true;
			end
		else
			self.voiceSound = soundContainer;
			soundContainer:Play(self.Pos)
			self.lastPriority = priority;
			return true;
		end
	end
end

function LightAIBehaviours.handleMovement(self)
	
	local crouching = self.controller:IsState(Controller.BODY_CROUCH)
	local moving = self.controller:IsState(Controller.MOVE_LEFT) or self.controller:IsState(Controller.MOVE_RIGHT);
	
	-- Leg Collision Detection system
    --local i = 0
	if self:IsPlayerControlled() then -- AI doesn't update its own foot checking when playercontrolled so we have to do it
		if self.Vel.Y > 10 then
			self.wasInAir = true;
		else
			self.wasInAir = false;
		end
		for i = 1, 2 do
			--local foot = self.feet[i]
			local foot = nil
			--local leg = self.legs[i]
			if i == 1 then
				foot = self.FGFoot 
			else
				foot = self.BGFoot 
			end

			--if foot ~= nil and leg ~= nil and leg.ID ~= rte.NoMOID then
			if foot ~= nil then
				local footPos = foot.Pos				
				local mat = nil
				local pixelPos = footPos + Vector(0, 4)
				self.footPixel = SceneMan:GetTerrMatter(pixelPos.X, pixelPos.Y)
				--PrimitiveMan:DrawLinePrimitive(pixelPos, pixelPos, 13)
				if self.footPixel ~= 0 then
					mat = SceneMan:GetMaterialFromID(self.footPixel)
				--	PrimitiveMan:DrawLinePrimitive(pixelPos, pixelPos, 162);
				--else
				--	PrimitiveMan:DrawLinePrimitive(pixelPos, pixelPos, 13);
				end
				
				local movement = (self.controller:IsState(Controller.MOVE_LEFT) == true or self.controller:IsState(Controller.MOVE_RIGHT) == true or self.Vel.Magnitude > 3)
				if mat ~= nil then
					--PrimitiveMan:DrawTextPrimitive(footPos, mat.PresetName, true, 0);
					if self.feetContact[i] == false then
						self.feetContact[i] = true
						if self.feetTimers[i]:IsPastSimMS(self.footstepTime) and movement then																	
							self.feetTimers[i]:Reset()
						end
					end
				else
					if self.feetContact[i] == true then
						self.feetContact[i] = false
						if self.feetTimers[i]:IsPastSimMS(self.footstepTime) and movement then
							self.feetTimers[i]:Reset()
						end
					end
				end
			end
		end
	else
		if self.AI.flying == true and self.wasInAir == false then
			self.wasInAir = true;
		elseif self.AI.flying == false and self.wasInAir == true then
			self.wasInAir = false;
			self.isJumping = false
			if self.moveSoundTimer:IsPastSimMS(500) then
				self.movementSounds.Land:Play(self.Pos);
				self.moveSoundTimer:Reset();
			end
		end
	end
	
	
	
	-- Custom Jump
	if self.controller:IsState(Controller.BODY_JUMPSTART) == true and self.controller:IsState(Controller.BODY_CROUCH) == false and self.jumpTimer:IsPastSimMS(self.jumpDelay) and not self.isJumping then
		if (self:IsPlayerControlled() and self.feetContact[1] == true or self.feetContact[2] == true) or self.wasInAir == false then
			local jumpVec = Vector(0,-1.5)
			local jumpWalkX = 3
			if self.controller:IsState(Controller.MOVE_LEFT) == true then
				jumpVec.X = -jumpWalkX
			elseif self.controller:IsState(Controller.MOVE_RIGHT) == true then
				jumpVec.X = jumpWalkX
			end
			self.movementSounds.Jump:Play(self.Pos);
			
			local pos = Vector(0, 0);
			SceneMan:CastObstacleRay(self.Pos, Vector(0, 45), pos, Vector(0, 0), self.ID, self.Team, 0, 10);				
			local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
			
			if self.terrainSounds.FootstepJump[terrPixel] ~= nil then
				self.terrainSounds.FootstepJump[terrPixel]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.FootstepJump[177]:Play(self.Pos);
			end
			
			if math.abs(self.Vel.X) > jumpWalkX * 2.0 then
				self.Vel = Vector(self.Vel.X, self.Vel.Y + jumpVec.Y)
			else
				self.Vel = Vector(self.Vel.X + jumpVec.X, self.Vel.Y + jumpVec.Y)
			end
			self.isJumping = true
			self.jumpTimer:Reset()
			self.jumpStop:Reset()
		end
	elseif self.isJumping or self.wasInAir then
		if (self:IsPlayerControlled() and self.feetContact[1] == true or self.feetContact[2] == true) and self.jumpStop:IsPastSimMS(100) then
			self.isJumping = false
			self.wasInAir = false;
			if self.Vel.Y > 0 and self.moveSoundTimer:IsPastSimMS(500) then
				self.movementSounds.Land:Play(self.Pos);
				self.moveSoundTimer:Reset();
				
				local pos = Vector(0, 0);
				SceneMan:CastObstacleRay(self.Pos, Vector(0, 45), pos, Vector(0, 0), self.ID, self.Team, 0, 10);				
				local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
				
				if self.terrainSounds.FootstepLand[terrPixel] ~= nil then
					self.terrainSounds.FootstepLand[terrPixel]:Play(self.Pos);
				else -- default to concrete
					self.terrainSounds.FootstepLand[177]:Play(self.Pos);
				end						
				
			end
		end
	end

	if (crouching) then
		if (not self.wasCrouching and self.moveSoundTimer:IsPastSimMS(600)) then
			if (moving) then
				self.movementSounds.Prone:Play(self.Pos);
			else
				self.movementSounds.Crouch:Play(self.Pos);
			end
		end
		if (moving) then
			if self.terrainCollided == true and self.proneTerrainSoundPlayed ~= true then
				self.proneTerrainSoundPlayed = true;
				
				if self.terrainSounds.Prone[self.terrainCollidedWith] ~= nil then
					self.terrainSounds.Prone[self.terrainCollidedWith]:Play(self.Pos);
				else -- default to concrete
					self.terrainSounds.Prone[177]:Play(self.Pos);
				end
			end
				
			if (self.moveSoundWalkTimer:IsPastSimMS(700)) then
				self.movementSounds.Crawl:Play(self.Pos);
				self.moveSoundWalkTimer:Reset();
				
				local pos = Vector(0, 0);
				SceneMan:CastObstacleRay(self.Pos, Vector(0, 20), pos, Vector(0, 0), self.ID, self.Team, 0, 5);				
				local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
				
				if self.terrainSounds.Crawl[terrPixel] ~= nil then
					self.terrainSounds.Crawl[terrPixel]:Play(self.Pos);
				else -- default to concrete
					self.terrainSounds.Crawl[177]:Play(self.Pos);
				end		
				
			end
		end
	else
		if (self.wasCrouching and self.moveSoundTimer:IsPastSimMS(600)) then
			self.movementSounds.Stand:Play(self.Pos);
			self.moveSoundTimer:Reset();
		end
		self.proneTerrainSoundPlayed = false;
	end

	self.wasCrouching = crouching;
	self.wasMoving = moving;
end

function LightAIBehaviours.handleHealth(self)

	local healthTimerReady = self.healthUpdateTimer:IsPastSimMS(750);
	local wasInjured = self.Health < (self.oldHealth - 10);

	if (healthTimerReady or wasInjured) then
		self.oldHealth = self.Health;
		self.healthUpdateTimer:Reset();
		
		if (wasInjured) and self.Head then
			
			-- if self.Health > 0 then
				-- LightAIBehaviours.createVoiceSoundEffect(self, self.voiceSounds.Pain, 5)
			-- else
				-- LightAIBehaviours.createVoiceSoundEffect(self, self.voiceSounds.Death, 6)
			-- end
		end
	end
	
end

function LightAIBehaviours.handleRagdoll(self)
	-- EXPERIMENTAL BETTER RAGDOLL
	local radius = self.Radius * 0.9
	
	local min_value = -math.pi;
	local max_value = math.pi;
	local value = self.RotAngle
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
	
	local str = math.max(1 - math.abs(result / math.pi * 2.0), 0)
	--local normal = Vector(0,0)
	--local slide = false
	
	-- Trip on the ground
	for j = 0, 1 do
		local pos = self.Pos + Vector(0, -3):RadRotate(self.RotAngle)
		if self.Head and math.random(1,2) < 2 then
			pos = self.Head.Pos
		end
		
		local maxi = 6
		for i = 0, maxi do
			local checkVec = Vector(radius * (0.7 - 0.2 * j),0):RadRotate(math.pi * 2 / maxi * i + self.RotAngle)
			local checkOrigin = Vector(pos.X, pos.Y) + checkVec + Vector(self.Vel.X, self.Vel.Y) * rte.PxTravelledPerFrame * 0.3
			local checkPix = SceneMan:GetTerrMatter(checkOrigin.X, checkOrigin.Y)
			
			if checkPix > 0 then
				self.Vel = self.Vel - Vector(checkVec.X, checkVec.Y):SetMagnitude(30 * str) * TimerMan.DeltaTimeSecs
				self.AngularVel = self.AngularVel + (self.AngularVel / math.abs(self.AngularVel)) * str * 20 * TimerMan.DeltaTimeSecs
				
				--normal = normal + checkVec
				--slide = true
			end
		end
		
	end
	--[[
	normal = (normal / 12):SetMagnitude(1)
	if slide then
		local slideAngle = normal.AbsRadAngle + math.pi * 0.5
		
		local newVel = Vector(self.Vel.X, self.Vel.Y)
		newVel:RadRotate(slideAngle)
		newVel = Vector(newVel.X, -math.abs(-newVel.Y))
		newVel:RadRotate(-slideAngle)
		self.Vel = self.Vel * str + newVel * (1 - str)
	end]]
	-- SOUNDS
	
	local mat = self.HitWhatTerrMaterial
	--PrimitiveMan:DrawLinePrimitive(self.Pos, self.Pos + self.TravelImpulse * 0.1, 5);
	--PrimitiveMan:DrawLinePrimitive(self.Pos, self.Pos + self.Vel, 13);
	--self.TravelImpulse.Magnitude
	if mat ~= 0 then
		if self.TravelImpulse.Magnitude > self.ImpulseDamageThreshold and self.ragdollTerrainImpactTimer:IsPastSimMS(self.ragdollTerrainImpactDelay) then
			if self.terrainSounds.TerrainImpactHeavy[self.terrainCollidedWith] ~= nil then
				self.terrainSounds.TerrainImpactHeavy[self.terrainCollidedWith]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.TerrainImpactHeavy[177]:Play(self.Pos);
			end
			self.ragdollTerrainImpactDelay = math.random(200, 500)
			self.ragdollTerrainImpactTimer:Reset()
		elseif self.TravelImpulse.Magnitude > 400 and self.ragdollTerrainImpactTimer:IsPastSimMS(self.ragdollTerrainImpactDelay) then
			if self.terrainSounds.TerrainImpactLight[self.terrainCollidedWith] ~= nil then
				self.terrainSounds.TerrainImpactLight[self.terrainCollidedWith]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.TerrainImpactLight[177]:Play(self.Pos);
			end
			self.ragdollTerrainImpactDelay = math.random(200, 500)
			self.ragdollTerrainImpactTimer:Reset()
		elseif self.TravelImpulse.Magnitude > 230 then
			self.movementSounds.Crawl:Play(self.Pos);
		end
	end
end

function LightAIBehaviours.handleHeadLoss(self)
	if not (self.Head) then
		self.voiceSounds = {};
		self.voiceSound:Stop(-1);
	end
end