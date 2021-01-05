
dofile("Base.rte/Constants.lua")
dofile("ScrapperFaction.rte/Actors/Basic/MeleeAI/ScrapperNativeHumanAI.lua")
--thanks to 4zk and pawnis for this script

function Create(self)
	self.AI = ScrapperNativeHumanAI:Create(self)

	-- experimental code, thanks to pawnis -- 
	
	self.oldHealth = 100;
	self.moveSoundTimer = Timer();
	self.moveSound = true;
	self.moveSoundWalkTimer = Timer();
	self.panicTimer = Timer();
	self.ownGrenadeIdentifier = math.random(100)
	self.inAir = false;
	self.landSound = false;
	self.healthUpdateTimer = Timer();
	self.meleeIntensity = 1;
	
	self.meleeCalmTime = math.random(6000, 12000); -- randomize how long it takes for the guy to calm
	
	self.gruntTimer = Timer();
	self.jumpGruntTimer = Timer();
	
	self:SetNumberValue("IsAScrapper", 1); -- let weapons know the actor is a Scrapper
	
	-- 1: ASSAULT
	-- 2: HEAVY GUNNER
	-- 3: MARKSMAN
	
	self:SetNumberValue("Class", math.random(1,3));
	
	self.classesSet = false;
	self.Pass = 0;
	
	-- end experimental --

	self.iOffsetFG = Vector(0,11);
	self.iOffsetBG = Vector(0,10);

	if self.FGArm then
		--self.iOffsetFG = ToArm(self.FGArm).IdleOffset;
		self.iOffsetFG = Vector(0,self.FGArm.Radius);
	end
	if self.BGArm then
		--self.iOffsetBG = ToArm(self.BGArm).IdleOffset;
		self.iOffsetFG = Vector(0,self.BGArm.Radius);
	end

	self.swayNum = 0;	-- for arms

	self.settleTimer = Timer();
	self.dead = false;
	self.delay = 5000;		-- base time (in MS) until the body turns into terrain
					-- (+ 100*mass)
					-- basic coalition soldier is about 125 mass (with all limbs attached)

					--> coalition soldier settle time = 5 + 12.5 = 17.5 seconds

	self.tilt = 0.3;	-- for visible inventory

	self.visibleInventory = false;	--
	self.lingeringCorpses = false;	-- change into true to enable
end

function Update(self)

	-- more of pawnis' code --

	-- start actor SFX handling code

	if self.gruntTimer:IsPastSimMS(self.meleeCalmTime) and self.meleeIntensity >= 6 then
		self.meleeIntensity = 1;
		local sfx = CreateAEmitter("Scrappers Melee Wind Down");
		sfx.Pos = self.Pos;
		MovableMan:AddParticle(sfx);
		self.gruntTimer:Reset();
	elseif self.gruntTimer:IsPastSimMS(self.meleeCalmTime) and self.meleeIntensity <= 5 then
		self.gruntTimer:Reset();
	end

	if self:IsDead() then	
		self.panicTimer:Reset()
		self.gruntTimer:Reset()
	end
	
	if self:NumberValueExists("Meleed") then
		if self.Health < 25 then -- always fight for your life if you're about to lose it :)
			self.meleeIntensity = 6;
		end
		if self.gruntTimer:IsPastSimMS(900) then
			if self.meleeIntensity == 1 then
				local sfx = CreateAEmitter("Scrappers Melee Low Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = 2;
			elseif self.meleeIntensity == 2 then
				local sfx = CreateAEmitter("Scrappers Melee Medium Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = 3;
			elseif self.meleeIntensity >= 3 and self.meleeIntensity < 6 then -- and not is ugly but saves me time
				local sfx = CreateAEmitter("Scrappers Melee High Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = self.meleeIntensity + 1
			elseif self.meleeIntensity >= 6 then
				local sfx = CreateAEmitter("Scrappers Melee Max Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = self.meleeIntensity + 1
			end
			self.gruntTimer:Reset();
		end
		self:RemoveNumberValue("Meleed")
	end
	
	if self:NumberValueExists("MeleedSmall") then
		if self.Health < 25 then
			self.meleeIntensity = 3;
		end
		if self.gruntTimer:IsPastSimMS(900) then
			if self.meleeIntensity == 1 then
				local sfx = CreateAEmitter("Scrappers Melee Low Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = 2;
			elseif self.meleeIntensity == 2 then
				local sfx = CreateAEmitter("Scrappers Melee Medium Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
				self.meleeIntensity = 3;
			elseif self.meleeIntensity >= 3 then
				local sfx = CreateAEmitter("Scrappers Melee Medium Intensity");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
			end
			self.gruntTimer:Reset();
		end
		self:RemoveNumberValue("MeleedSmall")
	end

	if self.Health < 45 then -- only panic about bullets when low hp
		for p in MovableMan.Particles do
			if p.ClassName == "MOPixel" and p.HitsMOs and p.Vel.Magnitude >= 40 and self.panicTimer:IsPastSimMS(3000) and p.Team ~= self.Team then
				dist = SceneMan:ShortestDistance(self.Pos , p.Pos,true).Magnitude
				if dist < 40 then
					local sfx = CreateAEmitter("Scrappers Bullet Panic");
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);	
					self.panicTimer:Reset();	
				end
			end
		end
	end
	
	-- removed for optimization

	-- if SceneMan:FindAltitude(self.Pos, 600, 3) > 50 and self.Status == 1 and self.panicTimer:IsPastSimMS(3000) and self.Vel.Magnitude >= 55 then
		-- local sfx = CreateAEmitter("Scrappers Falling Scream");
		-- sfx.Pos = self.Pos;
		-- MovableMan:AddParticle(sfx);	
		-- self.panicTimer:Reset();	
		-- self.gruntTimer:Reset();
	-- end
	-- if SceneMan:FindAltitude(self.Pos, 600, 3) > 500 and self.Status == 1 and self.panicTimer:IsPastSimMS(3000) then	
		-- local sfx = CreateAEmitter("Scrappers Falling Panic");
		-- sfx.Pos = self.Pos;
		-- MovableMan:AddParticle(sfx);	
		-- self.panicTimer:Reset();	
		-- self.gruntTimer:Reset();
	-- end

	if SceneMan:FindAltitude(self.Pos, 100, 3) > 60 then	
		self.inAir = true;
		self.landSound = true;
		self:SetNumberValue("InAir", 1);
	end
		
	if self.inAir == true and SceneMan:FindAltitude(self.Pos, 100, 3) < 25 and self.landSound == true then	
		local sfx = CreateAEmitter("Scrappers Heavy Landing");
		self:RemoveNumberValue("InAir");
		sfx.Pos = self.Pos;
		MovableMan:AddParticle(sfx);				
		self.inAir = false;
		self.landSound = false;	
		if self.gruntTimer:IsPastSimMS(3000) then
			local sfx = CreateAEmitter("Scrappers Landing Grunt");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);		
			self.gruntTimer:Reset();
		end
	end

	if self.EquippedItem then
		if self.EquippedItem.ClassName == "TDExplosive" then
			self.equippedGrenade = ToTDExplosive(self.EquippedItem)
			self.equippedGrenade:SetNumberValue("OwnGrenade", self.ownGrenadeIdentifier);
		end
		if self.EquippedItem.ClassName == "HDFirearm" then
			self.equippedGun = ToHDFirearm(self.EquippedItem);
			if self.equippedGun:IsActivated() then
				self.panicTimer:Reset(); -- disallow panic sounds while firing
			end
		end
	end

	
	-- cannot make it so that only activated grenades trigger it..
	
	-- for p in MovableMan.Items do
		-- if p.ClassName == "TDExplosive" and self.panicTimer:IsPastSimMS(3000) and p.Team ~= self.Team then
			-- self.p = ToTDExplosive(p);
			-- if self.p:GetNumberValue("OwnGrenade") ~= self.ownGrenadeIdentifier then
				-- dist = SceneMan:ShortestDistance(self.Pos , p.Pos,true).Magnitude
				-- if dist < 75 then
					-- local sfx = CreateAEmitter("Scrappers Grenade Panic");
					-- sfx.Pos = self.Pos;
					-- MovableMan:AddParticle(sfx);	
					-- self.panicTimer:Reset();
					-- self.gruntTimer:Reset();
				-- end
			-- end
		-- end
	-- end

	if self:GetController():IsState(Controller.BODY_CROUCH) and self.inAir == false then	
		if self:GetController():IsState(Controller.MOVE_LEFT) or self:GetController():IsState(Controller.MOVE_RIGHT) then
			if self.moveSoundWalkTimer:IsPastSimMS(700) then	
				local sfx = CreateAEmitter("Scrappers Heavy Crawl");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);				
				self.moveSoundWalkTimer:Reset();			
			end
		end
		
		if self.moveSoundTimer:IsPastSimMS(800) and self.moveSound == true then
			if self:GetController():IsState(Controller.MOVE_LEFT) or self:GetController():IsState(Controller.MOVE_RIGHT) then
				local sfx = CreateAEmitter("Scrappers Heavy Sprint To Prone");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);	
				self.moveSoundTimer:Reset();
				self.moveSound = false;
				self.crouched = true;
				if self.gruntTimer:IsPastSimMS(3000) then
					local sfx = CreateAEmitter("Scrappers Crouch Grunt");
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);
					self.gruntTimer:Reset();
				end
			else
				local sfx = CreateAEmitter("Scrappers Heavy Go Prone");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);	
				self.moveSoundTimer:Reset();
				self.moveSound = false;
				self.crouched = true;
			end
		end
	else
		self.moveSound = true;
		if self.crouched == true and self.moveSoundTimer:IsPastSimMS(800) then
			local sfx = CreateAEmitter("Scrappers Heavy Stand");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);	
			self.moveSoundTimer:Reset();
			self.crouched = false;
		elseif self.crouched == true then
			self.crouched = false;
		end
	end	
	
	-- removed for optimization
	
	-- if self:GetController():IsState(Controller.BODY_JUMPSTART) and self.inAir == false and self.jumpGruntTimer:IsPastSimMS(3000) then			
		-- local sfx = CreateAEmitter("Scrappers Jump Grunt");
		-- sfx.Pos = self.Pos;
		-- MovableMan:AddParticle(sfx);			
	-- end

	if self.Health < (self.oldHealth - 10) then	
		if self.Head then -- so the actor won't scream if it's got no head
			local sfx = CreateAEmitter("Scrappers Pain");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);		
			self.oldHealth = self.Health;	
		end
		if math.random(100) < 50 then -- chance for gore sweetener
			local sfx = CreateAEmitter("Scrappers Blood Gush Short");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);		
		end
	end

	if self.healthUpdateTimer:IsPastSimMS(500) then	
		self.oldHealth = self.Health;
		self.healthUpdateTimer:Reset();
	end

	-- end actor SFX handling code

	-- experimental actor class code

	-- the reason we do it in update and not create is because AI might switch guns frame 2 (after create)
	-- thus requiring us to re-do everything anyway

	self.Pass = self.Pass + 1;

	if self.classesSet == false then
		if self.EquippedItem then -- apply class to equipped
			if IsHDFirearm(self.EquippedItem) then
				local item = ToHDFirearm(self.EquippedItem)
				if item:NumberValueExists("Standard") or item:NumberValueExists("Class") then -- if it's already established
				-- do nothing
				else -- if it's not, we must've spawned with it
					item:SetNumberValue("Class", self:GetNumberValue("Class"))	-- set class
				end
			end
		end		
		if not self:IsInventoryEmpty() then
			for i = 1, self.InventorySize do -- apply classes to inventory items
				local item self:Inventory(); -- first item in inventory?
				if item then
					if IsHDFirearm(item) then
						local item2 = ToHDFirearm(self.EquippedItem)
						if item2:NumberValueExists("Standard") or item2:NumberValueExists("Class") then -- if it's already established
						-- do nothing
						else -- if it's not, we must've spawned with it
							item2:SetNumberValue("Class", self:GetNumberValue("Class"))	-- set class
						end
					end
					self.parent:SwapNextInventory(item,true);
				end
			end
		else
			if self.Pass == 3 then -- do 3 passes to make triple sure, then stop to save CPU
				self.classesSet = true;
			end
		end
	end

	-- end class code

	-- end pawnis' code, the rest was written by 4zK

	local negNum = 1;
	local fixNum = 0;	-- slightly different offset when flipped

	if self.HFlipped == true then
		negNum = -1;
		fixNum = -1;	-- (negNum-1)*0.5
	end

	local jumpFace = 0;

	if (self:GetController():IsState(Controller.MOVE_RIGHT)
	or self:GetController():IsState(Controller.MOVE_LEFT))
	and not self:GetController():IsState(Controller.BODY_JUMP) then

		if self:GetController():IsState(Controller.MOVE_RIGHT) then
			self.swayNum = self.swayNum + 0.05*self:GetLimbPathSpeed(1)*math.sqrt(self.Vel.Magnitude);	-- fuck i love square roots hggrkhj
		end
		if self:GetController():IsState(Controller.MOVE_LEFT) then
			self.swayNum = self.swayNum + 0.05*self:GetLimbPathSpeed(1)*math.sqrt(self.Vel.Magnitude);
		end
	elseif self:GetController():IsState(Controller.BODY_JUMP) then
		self.swayNum = (self.swayNum + 1.57)/2;		-- approach 1.57 (pi/2)
		jumpFace = self:GetAimAngle(false)*0.3;
	else
		self.swayNum = 0;--math.sin(self.swayNum)*0.8;
	end

	if self.FGArm
	and self.BGLeg then
		--ToArm(self.FGArm).IdleOffset = Vector(self.iOffsetFG.X,self.iOffsetFG.Y):RadRotate(-math.sin(self.swayNum)*0.2*self:GetLimbPathSpeed(1)+jumpFace);
		ToArm(self.FGArm).IdleOffset = Vector(self.iOffsetFG.X,self.iOffsetFG.Y):RadRotate(self.BGLeg.RotAngle*negNum+1.8);
	end
	if self.BGArm
	and self.FGLeg then
		--ToArm(self.BGArm).IdleOffset = Vector(self.iOffsetBG.X,self.iOffsetBG.Y):RadRotate(math.sin(self.swayNum)*0.2*self:GetLimbPathSpeed(1)+jumpFace);
		ToArm(self.BGArm).IdleOffset = Vector(self.iOffsetFG.X,self.iOffsetFG.Y):RadRotate(self.FGLeg.RotAngle*negNum+1.8);
	end

	-- visible inventory starts here --

	if self.visibleInventory then--
	if self.Health > 0 then
		if self:IsInventoryEmpty() == false then

			local a = 0;	-- HDFirearm / HeldDevice
			local b = 0;	-- TDExplosive

			for i = 1, self.InventorySize do

				local item = self:Inventory();
				if item then

					local negNum = 1;
					local fixNum = 0;	-- slightly different offset when flipped

					if self.HFlipped == true then
						negNum = -1;
						fixNum = -1;	-- (negNum-1)*0.5
					end

					if item.ClassName == "TDExplosive" then

						b = b+1;	-- explosives aren't visible as of now but counted anyway for some reason
							
					elseif item.ClassName == "HDFirearm" or item.ClassName == "HeldDevice" then

						a = a+1;

						local fake
						local hdevice = 1;	-- false

						if item.ClassName == "HDFirearm" then
							fake = CreateHDFirearm(item:GetModuleAndPresetName());
						elseif item.ClassName == "HeldDevice" then
							hdevice = 0;
							fake = CreateHeldDevice(item:GetModuleAndPresetName());
						end
						if fake then	-- in case PresetName was changed

							local sRad = math.sqrt(self.Radius);	-- math
							local fRad = math.sqrt(fake.Radius);
							local fmass = math.sqrt(math.abs(fake.Mass));

							fixNum = fixNum+fake.Radius*0.2+math.sqrt(a);	-- math

								-- bigger actors carry weapons higher up
								-- smaller weapons are carried lower down

			fake.Pos = self.Pos+Vector((-sRad-fixNum)*negNum, - sRad -fmass + 1 + hdevice*3):RadRotate(self.RotAngle);	-- math

							local c = math.sqrt(math.abs(self.InventorySize-b));	-- math
							local d = math.sqrt(a);

				-- parent + 90 deg * shieldvar 		- ( wepnum + invsize/2 - shieldvar/mass ) * flip

			fake.RotAngle = self.RotAngle + (math.pi*0.5)*hdevice + (a*self.tilt-c*self.tilt+hdevice/fmass)/c*negNum;	-- math
			--fake.RotAngle = self.RotAngle + (math.pi*0.5)*hdevice - ((d-c-hdevice/fmass)/c)*negNum;	-- math

							--fake.HFlipped = self.HFlipped;	-- HFlipped isn't applied on first frame for some reason
							fake.PinStrength = 100;

							fake.GibImpulseLimit = 0;	-- not sure if these are needed but whatever
							fake.Mass = 1;			--

							fake.Lifetime = 1;	-- one frame

							fake.GetsHitByMOs = false;
							--fake.HitsMOs = true;

							fake.Team = self.Team;
							fake.IgnoresTeamHits = true;

							fake.HUDVisible = false;

							if fake.Magazine then
								fake.Magazine.Scale = 0;	-- prevent phantom magazines at Vector(0,0)
								--fake.Magazine.ToDelete = true;	--
							end

							--fake.PresetName = (fake.PresetName .. i);	-- debug
							MovableMan:AddParticle(fake);
						end
					end

					self:SwapNextInventory(item,true);
				end
			end
		end
	end
	end--
	-- visible inventory ends here --

	-- lingering corpse starts here --

	if self.lingeringCorpses then--
	if self.Health <= 0 and self.Head then
		if self.dead == false then
			self.AngularVel = self.AngularVel-self.Vel.X*math.sqrt(self.Vel.Magnitude);	--
			self.dead = true;
		end
		if not self.settleTimer:IsPastSimMS(self.delay+(100*math.ceil(math.abs(self.Mass)))) then	-- emphasis of actor mass can be changed
			self.Status = 3;
			self.ToSettle = false;
			self.HUDVisible = false;

		--else
		--	self.Status = 4;	-- not exactl
		--	self.ToSettle = true;	-- y required
		end

		-- try to force some non-movement

		self.HFlipped = self.flippedOnDeath;

		self:GetController():SetState(Controller.BODY_JUMP,false);
		self:GetController():SetState(Controller.BODY_JUMPSTART,false);
		self:GetController():SetState(Controller.BODY_CROUCH,false);
		self:GetController():SetState(Controller.PIE_MENU_ACTIVE,false);
		self:GetController():SetState(Controller.WEAPON_FIRE,false);
		self:GetController():SetState(Controller.AIM_SHARP,false);
		self:GetController():SetState(Controller.MOVE_RIGHT,false);
		self:GetController():SetState(Controller.MOVE_LEFT,false);
	else
		self.settleTimer:Reset();
		self.flippedOnDeath = self.HFlipped;
	end
	end--
end

function UpdateAI(self)
	self.AI:Update(self)
end

function Destroy(self)
	self.AI:Destroy(self)
end
