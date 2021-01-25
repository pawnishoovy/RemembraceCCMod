
function Create(self)
	
	-- full credit to 4zk for recoil code
	
	self.recoilIn = 14;	-- recoil "volume"?
	self.recoilOut = 1.5;	-- how slowly the accuracy will revert
	self.crouchNum = 1;
	self.rotNum = 0;
	
	self:SetNumberValue("SharpLength", self.SharpLength);
	self:SetNumberValue("ShakeRange", self.ShakeRange+0.1);
	self:SetNumberValue("SharpShakeRange", self.SharpShakeRange+0.1);
	self:SetNumberValue("NoSupportFactor", self.NoSupportFactor+0.1);
	
	-- end recoil code
	
	self.rotAngleManipulator = 0;

	self.parent = nil;
	self.pullTimer = Timer();

	self.newMag = false;
	self.num = math.pi;
	self.sfx = true;
	self.sfxSetShot = true;
	self.sfxSetTail = true;
	self.sfxSetMech = true;
	self.chamber = false;

	self.negNum = 0;
	
	self.chargeDelay = 25;      
	self.chargeTimer = Timer();  
	self.charge = false;  

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end
	
	-- experimental --
	
	self.randomizationComplete = false;
	self.checkClass = false;

	-- end experimental --
	
end

function Update(self)

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	else
		self.parent = nil;
	end
	
	-- experimental --
	
	-- this should run a total of one time until attachments are there
	
	if self.randomizationComplete == false then
	
		if self.checkClass == true then
			if not self:NumberValueExists("Class") then -- if we haven't been assigned a class by now
				if not self:NumberValueExists("Standard") then -- if we aren't standard by now
					if self.parent then -- if we are on an actor
						if not self.parent:NumberValueExists("IsAScrapper") then -- if it's a Scrapper actor, await to be assigned a class by him (do nothing)
							self:SetNumberValue("Standard", 1); -- if it ain't, just be standard and become unmodifiable
						end
					else -- if we are off an actor
						self:SetNumberValue("Standard", 1); -- unmodifiable
					end
				end
			end
		end
		
		if self.checkClass == false then
			self.checkClass = true; -- this is to delay class checking by a frame to allow a Scrapper actor to set the class
		end
		
		-- base stats
		
		self.SharpLength = 130;
		self.Mass = 8.3;
		self.ShakeRange = 3;
		self.SharpShakeRange = 2.6;
		
		-- commence randomization
		
		if self:NumberValueExists("Class") or self:NumberValueExists("Standard") and self.randomizationComplete == false then -- if we've gotten a designation in the first place
			if self.randomizationComplete == false then -- and if we haven't randomized yet
				if self:GetNumberValue("Class") == 1 then -- 1 is ASSAULT, commence assault randomization		
					if math.random(100) < 50 then -- 50% chance
						self:SetNumberValue("Assault Grip", 1); -- ASSAULT GRIP
					end
				end
				if self:GetNumberValue("Class") == 3 then -- 3 is MARKSMAN, commence marksman randomization		
					if math.random(100) < 75 then -- 75% chance
						self:SetNumberValue("Tactical Sight", 1); -- TACTICAL SIGHT
					end
				end
				self.randomizationComplete = true;
			end
		end
		
		-- commence stat boosts from randomized parts (attachments handle visuals)
		
		
		if self:NumberValueExists("Tactical Sight") then	
			self.Mass = self.Mass + 0.3;
			self.SharpShakeRange = self.SharpShakeRange -0.3;
			self.SharpLength = self.SharpLength + 75;
			self:SetNumberValue("SharpLength", self.SharpLength); -- so the recoil recovers properly
		end
		if self:NumberValueExists("Assault Grip") then	
			self.Mass = self.Mass + 0.2;
			self.ShakeRange = self.ShakeRange -0.4;
			self.SharpShakeRange = self.SharpShakeRange -0.2;
			self.recoilOut = self.recoilOut + 0.3;
		end
		self:SetNumberValue("ShakeRange", self.ShakeRange + 0.1)
		self:SetNumberValue("SharpShakeRange", self.SharpShakeRange + 0.1) -- at the end of attachments and all else, save our shake ranges for the recoil system
	end
	
	-- end experimental
	
	if self:IsReloading() then	
		self.endReloadRoutine = true;
		self.RotAngle = self.RotAngle + (((math.pi / 2) * self.negNum) * self.rotAngleManipulator)
		if self.rotAngleManipulator < 0.08 then
			self.rotAngleManipulator = self.rotAngleManipulator + 0.0020;
		end
		if not self.parent == nil then
			self.parent:GetController():SetState(Controller.AIM_SHARP,false);
		end
	elseif self.endReloadRoutine == true then
		self.RotAngle = self.RotAngle + (((math.pi / 2) * self.negNum) * self.rotAngleManipulator)	
		if self.rotAngleManipulator > 0 then
			self.rotAngleManipulator = self.rotAngleManipulator - 0.020;
		else
			self.endReloadRoutine = false;
		end
	end

	if self.justShot == true then
	
		self:RemoveNumberValue("Fired")
		self:RemoveNumberValue("LastShotFired")

		
	end
	
	if self.charge == true then          
		if self.chargeTimer:IsPastSimMS(self.chargeDelay) then   
			self:Activate();    
			self.charge = false;
		else            
			self:Deactivate(); 
		end
	elseif self.Magazine and self:IsActivated() and self.chamber ~= true then      
		if self.triggerPulled == false then        
			self:Deactivate();          
			self.charge = true;        
			self.triggerPulled = true;      
			self.chargeTimer:Reset();    
			sfx = CreateAEmitter("Pre Custom SMG");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);
		end
	else    
		self.triggerPulled = false;
	end

	if self.FiredFrame then	
	
		self.rotNum = self.rotNum +((0.005*self.recoilIn)  - (self.rotNum * 0.5)); -- less and less recoil
	
		if self.Magazine then
			local round = self.Magazine.NextRound;
			if round then
				local massNum = math.sqrt(math.abs(round.NextParticle.Mass));	-- sqrt sqrt sqrt
				local partNum = math.sqrt(round.ParticleCount)*self.RoundsFired;	--B32
				local velNum = math.sqrt(round.FireVel);
				self.SharpLength = self.SharpLength*(1-self.crouchNum*(massNum*velNum*partNum)/((massNum*velNum*partNum)+(self.recoilOut*15)));	-- *RecoilTransmission
			else
				self.SharpLength = self.SharpLength*(1-self.Mass/(self.Mass+self.recoilIn));
			end
			if self.Magazine.RoundCount > 0 then	
				self:SetNumberValue("Fired", 1);				
			else
				self:SetNumberValue("LastShotFired", 1);
				self.chamberOnReload = true;
			end
		end
	
		if self.Magazine then
			if self.Magazine.RoundCount == 0 then
				sfx = CreateAEmitter("Last Round Custom SMG");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
			end
		end
	
		casing = CreateAEmitter("Scrappers Generic SMG Casing");
		casing.Pos = self.Pos+Vector(0*self.negNum,1):RadRotate(self.RotAngle);
		casing.Vel = self.Vel+Vector(math.random(0,0)*self.negNum,math.random(2,6)):RadRotate(self.RotAngle);
		MovableMan:AddParticle(casing);
	
		if self.echoMakingSound == true then
			
			if MovableMan:IsParticle(self.echoSound) then	

				self.echoSound.ToDelete = true;
			
				self.echoMakingSound = false;		
	
			end
		
		end
	
		for i = 1, 2 do
			Effect = CreateMOSParticle("Tiny Smoke Ball 1", "Base.rte")
			if Effect then
				Effect.Pos = self.MuzzlePos;
				Effect.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)) + Vector(150*self.negNum,0):RadRotate(self.RotAngle)) / 30
				MovableMan:AddParticle(Effect)
			end
		end
		
		if PosRand() < 0.5 then
			Effect = CreateMOSParticle("Side Thruster Blast Ball 1", "Base.rte")
			if Effect then
				Effect.Pos = self.MuzzlePos;
				Effect.Vel = (self.Vel + Vector(150*self.negNum,0):RadRotate(self.RotAngle)) / 10
				MovableMan:AddParticle(Effect)
			end
		end

		self.justShot = true;

		if not self.parent == nil then

			if self.parent:IsPlayerControlled() ~= true then

			else

				if self.sfxSetMech ~= false then

					sfxSetShot = CreateAEmitter("HiFi Custom SMG");
					sfxSetShot.Pos = self.Pos;
					MovableMan:AddParticle(sfxSetShot);

				end
			
				if self.sfxSetMech ~= false then

					sfxSetShot = CreateAEmitter("CoreBass Custom SMG");
					sfxSetShot.Pos = self.Pos;
					MovableMan:AddParticle(sfxSetShot);

				end

			end
			
		end

		local Vector2 = Vector(0,-700);

		local Vector2Left = Vector(0,-700):RadRotate(45);

		local Vector2Right = Vector(0,-700):RadRotate(-45);

		local Vector3 = Vector(0,0);

		local Vector4 = Vector(0,0);

		self.ray = SceneMan:CastObstacleRay(self.Pos, Vector2, Vector3, Vector4, self.RootID, self.Team, 128, 7);

		self.rayRight = SceneMan:CastObstacleRay(self.Pos, Vector2Right, Vector3, Vector4, self.RootID, self.Team, 128, 7);

		self.rayLeft = SceneMan:CastObstacleRay(self.Pos, Vector2Left, Vector3, Vector4, self.RootID, self.Team, 128, 7);

		if self.ray < 0 or self.rayRight < 0 or self.rayLeft < 0 then	
		
			if self.parent then
			
				if self.parent:IsPlayerControlled() then
	
					if self.sfxSetTail ~= false then
						self.sfx = CreateAEmitter("Reflection Custom SMG");
						self.sfx.Pos = self.Pos;
						self.echoSound = ToAEmitter(self.sfx)
						MovableMan:AddParticle(self.sfx);
						self.echoMakingSound = true;					
					end					
					if self.sfxSetMech ~= false then
						sfxSetShot = CreateAEmitter("Add Custom SMG");
						sfxSetShot.Pos = self.Pos;
						MovableMan:AddParticle(sfxSetShot);
					end
				else
				
					sfxSetShot = CreateAEmitter("AI Gunshot Custom SMG");
					sfxSetShot.Pos = self.Pos;
					MovableMan:AddParticle(sfxSetShot);	
					
					if self.sfxSetTail ~= false then

						self.sfx = CreateAEmitter("Reflection Weak Custom SMG");
						self.sfx.Pos = self.Pos;
						self.echoSound = ToAEmitter(self.sfx)
						MovableMan:AddParticle(self.sfx);
						self.echoMakingSound = true;

					end			
				end
			end
			
		else
	
			if self.parent then
			
				if self.ray > 200 or self.rayRight > 200 or self.rayLeft > 200 then
			
					if self.parent:IsPlayerControlled() then
					
						if self.sfxSetMech ~= false then
							sfxSetShot = CreateAEmitter("AddShort Custom SMG");
							sfxSetShot.Pos = self.Pos;
							MovableMan:AddParticle(sfxSetShot);
						end
		
						if self.sfxSetTail ~= false then

							self.sfx = CreateAEmitter("Reflection Big Custom SMG Indoors");
							self.sfx.Pos = self.Pos;
							self.echoSound = ToAEmitter(self.sfx)
							MovableMan:AddParticle(self.sfx);
							self.echoMakingSound = true;

						end
					else
					
						sfxSetShot = CreateAEmitter("AI Gunshot Custom SMG Indoors");
						sfxSetShot.Pos = self.Pos;
						MovableMan:AddParticle(sfxSetShot);	
						
						if self.sfxSetTail ~= false then

							self.sfx = CreateAEmitter("Reflection Big Weak Custom SMG Indoors");
							self.sfx.Pos = self.Pos;
							self.echoSound = ToAEmitter(self.sfx)
							MovableMan:AddParticle(self.sfx);
							self.echoMakingSound = true;

						end			
					end
				else
					if self.parent:IsPlayerControlled() then
					
						if self.sfxSetMech ~= false then
							sfxSetShot = CreateAEmitter("AddShort Custom SMG");
							sfxSetShot.Pos = self.Pos;
							MovableMan:AddParticle(sfxSetShot);
						end
		
						if self.sfxSetTail ~= false then

							self.sfx = CreateAEmitter("Reflection Custom SMG Indoors");
							self.sfx.Pos = self.Pos;
							self.echoSound = ToAEmitter(self.sfx)
							MovableMan:AddParticle(self.sfx);
							self.echoMakingSound = true;

						end
					else
						sfxSetShot = CreateAEmitter("AI Gunshot Custom SMG Indoors");
						sfxSetShot.Pos = self.Pos;
						MovableMan:AddParticle(sfxSetShot);	
						if self.sfxSetTail ~= false then

							self.sfx = CreateAEmitter("Reflection Weak Custom SMG Indoors");
							self.sfx.Pos = self.Pos;
							self.echoSound = ToAEmitter(self.sfx)
							MovableMan:AddParticle(self.sfx);
							self.echoMakingSound = true;

						end			
					end
				end
			end	
		end
	end

	if self.HFlipped then
		self.negNum = -1;
	else
		self.negNum = 1;
	end
	
	if self.SharpLength > 0 then
		if self.SharpLength < self:GetNumberValue("SharpLength")/self.crouchNum then
			self.SharpLength = self.SharpLength+((self:GetNumberValue("SharpLength")/self.crouchNum)/(self.SharpLength*self.recoilOut));

		elseif self.SharpLength > self:GetNumberValue("SharpLength")/self.crouchNum then
			self.SharpLength = self:GetNumberValue("SharpLength")/self.crouchNum;
		end

		self.ShakeRange = self.crouchNum*self:GetNumberValue("ShakeRange")+2*(self:GetNumberValue("SharpLength")/(self.SharpLength));
		self.SharpShakeRange = self.crouchNum*self:GetNumberValue("SharpShakeRange")*(self:GetNumberValue("SharpLength")/self.SharpLength);
	end

	if self:DoneReloading() == true and self.lastMagazineAmmo > 0 then
		self.newMag = false;
	end

	if self.parent then	

		-- full credit to 4zk for recoil code
	
		self.RotAngle = self.RotAngle + self.rotNum*self.negNum;
		self:SetNumberValue("ChamberRot", self.RotAngle)
		-- self.Pos = self.Pos + Vector(-self.rotNum*self.negNum*4,-self.rotNum*4):RadRotate(self.RotAngle);	-- makes attachments behave all weird
		-- self:SetNumberValue("AttachmentsPosX", self.Pos.X)
		-- self:SetNumberValue("AttachmentsPosY", self.Pos.Y)

		if self.rotNum > 0 then
			self.rotNum = self.rotNum -0.0001*(self.recoilOut*(self.RateOfFire*0.15));

			if self.rotNum < 0 then
				self.rotNum = 0;
			end
		end
		
		if self.Magazine then
		
			self.lastAmmo = self.Magazine.RoundCount;

			if self.newMag == true then

				self.chamber = true;
				self.pullTimer:Reset();
				self.num = math.pi;
				self.sfx = true;

				self.newMag = false;
			end
			self.lastMag = self.Magazine;
			self.velApplied = false;
		else
			
			self.newMag = true;
			self.lastMagazineAmmo = self.lastAmmo;

		end

		if self.chamber == true then
			self:SetNumberValue("ChamberRot", self.RotAngle)
			self:SetNumberValue("Chambering", 1)
			self:Deactivate();
			--self.parent:GetController():SetState(Controller.WEAPON_FIRE,false);

			if self.pullTimer:IsPastSimMS(550) then
				--self.parent:GetController():SetState(Controller.AIM_SHARP,false);
				--self.Frame = 1;

				if self.sfx ~= false then
					sfx = CreateAEmitter("Chamber " .. self.PresetName);
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);

					self.sfx = false;
				end

				self.RotAngle = self.RotAngle +self.negNum*math.sin(self.num)/8;

				self:SetNumberValue("ChamberRot", self.RotAngle)

				self.num = self.num - math.pi*0.060;
			end

			if self.num <= 0 then

				self.num = 0;
				self.chamber = false;
				self:RemoveNumberValue("Chambering")
			end
		end
	end
	self:SetNumberValue("ChamberRot", self.RotAngle)
end