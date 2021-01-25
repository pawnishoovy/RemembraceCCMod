ScrapperHumanSoundBehaviours = {};

function ScrapperHumanSoundBehaviours.createSoundEffect(self, effectName)
	local sfx = CreateAEmitter(effectName, self.RTE);
	sfx.Pos = self.Pos;
	MovableMan:AddParticle(sfx);
end

function ScrapperHumanSoundBehaviours.handleCalming(self)
	--I've extracted this out into a separate function cause it's easier to look through the code that way. I also removed an elseif you didn't need cause the timer resets in both cases
	if (self.meleeIntensity >= 6) then
		self.meleeIntensity = 1;
		local sfx = CreateAEmitter("Scrappers Melee Wind Down");
		sfx.Pos = self.Pos;
		MovableMan:AddParticle(sfx);
		self.gruntTimer:Reset();
	end
end

function ScrapperHumanSoundBehaviours.handleMeleed(self)
	--Note: Why not just use 1 number value with 1 for meleed small and 2 for meleed?
	local meleed = self:NumberValueExists("Meleed");
	local meleedSmall = self:NumberValueExists("MeleedSmall");
	
	if (meleed or meleedSmall) then
		if (self.Health < 25) then
			self.meleeIntensity = meleed and 6 or 3; --This is the lua way of writing a ternary operator (google it if you want, they're cool), essentially it's 1 line that says if testvalue1 then set value as x else set value as y
		end
		ScrapperHumanSoundBehaviours.createSoundEffect(self, self.meleeIntensitySounds[math.max(self.meleeIntensity, #self.meleeIntensitySounds)]); --This uses the table to avoid a bunch of if else checks, and uses math max so if your melee intensity is outside of table range it picks the highest
		self.meleeIntensity = self.meleeIntensity + 1;
		
		if (meleed) then
			self:RemoveNumberValue("Meleed");
		end
		if (meleedSmall) then
			self:RemoveNumberValue("MeleedSmall")
		end
		
		self.gruntTimer:Reset();
	end
end

function ScrapperHumanSoundBehaviours.handlePanic(self)
	if (self.Health < 45) then
		for p in MovableMan.Particles do
			if (p.HitsMOs and p.Vel.Magnitude >= 40 and p.Team ~= self.Team and p.ClassName == "MOPixel") then
				local dist = SceneMan:ShortestDistance(self.Pos , p.Pos, true).Magnitude; --Remember that without local here you're using global variables, be careful!
				if (dist < 40) then
					ScrapperHumanSoundBehaviours.createSoundEffect(self, "Scrappers Bullet Panic");
					self.panicTimer:Reset();
					break; --You've already panicked, don't keep looping through all the particles
				end
			end
		end
	end
end

function ScrapperHumanSoundBehaviours.handleAirAndFalling(self)
	self.altitude = SceneMan:FindAltitude(self.Pos, 100, 3);
	
	if (self.wasInAir and self.altitude < 25) then
		ScrapperHumanSoundBehaviours.createSoundEffect(self, self.movementSounds.Land);
		self.wasInAir = false;
		
		if (self.gruntTimer:IsPastSimMS(3000)) then
			ScrapperHumanSoundBehaviours.createSoundEffect(self, self.voiceSounds.landingGrunt);
			self.gruntTimer:Reset();
		end
	end
	--NOTE: you could also put in things like your falling scream here easily with very little overhead
	
	if self.altitude > 60 then
		self.wasInAir = true;
	end
end

function ScrapperHumanSoundBehaviours.handleMovement(self)
	local crouching = self:GetController():IsState(Controller.BODY_CROUCH)
	local moving = self:GetController():IsState(Controller.MOVE_LEFT) or self:GetController():IsState(Controller.MOVE_RIGHT);
	
	if (crouching) then
		if (moving and self.moveSoundWalkTimer:IsPastSimMS(700)) then
			ScrapperHumanSoundBehaviours.createSoundEffect(self, self.movementSounds.Crawl);
			self.moveSoundWalkTimer:Reset();
		end
		
		if (not self.wasCrouching and self.moveSoundTimer:IsPastSimMS(800)) then
			if (moving) then
				ScrapperHumanSoundBehaviours.createSoundEffect(self, self.movementSounds.Sprint);
				if self.gruntTimer:IsPastSimMS(3000) then
					ScrapperHumanSoundBehaviours.createSoundEffect(self, self.voiceSounds.crouchGrunt);
					self.gruntTimer:Reset();
				end
			else
				ScrapperHumanSoundBehaviours.createSoundEffect(self, self.movementSounds.Prone);
			end
		end
	else
		if (self.wasCrouching and self.moveSoundTimer:IsPastSimMS(800)) then
			ScrapperHumanSoundBehaviours.createSoundEffect(self, self.movementSounds.Stand);
			self.moveSoundTimer:Reset();
		end
	end
	
	self.wasCrouching = crouching;
	self.wasMoving = moving;
end

function ScrapperHumanSoundBehaviours.handleHealth(self)
	local healthTimerReady = self.healthUpdateTimer:IsPastSimMS(500);
	local wasInjured = self.Health < (self.oldHealth - 10);
	
	if (healthTimerReady or wasInjured) then
		self.oldHealth = self.Health;
		self.healthUpdateTimer:Reset();
		
		if (wasInjured) then
			ScrapperHumanSoundBehaviours.createSoundEffect(self, "Scrappers Pain");
			if (math.random() < 0.5) then --This is the same as math.random(100) < 50, I just prefer it haha
				ScrapperHumanSoundBehaviours.createSoundEffect(self, self.miscSounds.damageSound);
			end
		end
	end
end