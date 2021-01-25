
function Create(self)

	self.parent = nil;
	self.pump = false
	self.pumpTimer = Timer();
	self.pumpTime = 200
	self.pumpAng = 0
	self.pumpAngTarget = 0
	self.pumpFX = 0
	self.canEjectShell = false --debug, don't eject non-shot/existing shells

	--self.RateOfFire = self.RateOfFire + self.pumpTime*2.2	--hacky RoF

	self.lastAmmo = self.Magazine.RoundCount

	--shotgun stuff
	self.reloadTimer = Timer();
	self.loadedShell = false;
	self.reloadCycle = false;

	self.reloadDelay = 220;

	if self.Magazine then
		self.ammoCounter = self.Magazine.RoundCount;
	else
		self.ammoCounter = 0;
	end

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end


end

function Update(self)

	--begin animation if done reloading
	if self:DoneReloading() == true then
		self.lastAmmo = self.Magazine.RoundCount
	elseif self:IsReloading() then
		self.pump = true
		self.pumpTimer:Reset();
	end

	--check if flipped
	local negNum
	if self.HFlipped then
		negNum = -1;
	else
		negNum = 1;
	end

	--check user
	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	else
		self.parent = nil;
	end

	if self.parent then

		if self.Magazine then

			if self.pump then
				--not deactivating it makes it an automatic weapon somehow
				self:Deactivate();

				if self.pumpTimer:IsPastSimMS(self.pumpTime*2) then --second move, pump back 1
					if self.pumpFX == 1 then
						local sfx = CreateAEmitter("Pump Back Looted Shotgun");
						sfx.Pos = self.Pos;
						MovableMan:AddParticle(sfx);
						self.pumpFX = 2

						self.pumpAngTarget = 0
					end

					--final move, pump back 2
					if self.pumpAng < math.pi*0.001 then
						self.pumpAng = 0
						self.pumpFX = 0
						self.pump = false
					end

				elseif self.pumpTimer:IsPastSimMS(self.pumpTime*0.8) then --first move, pump forward
					if self.pumpFX == 0 then
						local sfx = CreateAEmitter("Pump Forward Looted Shotgun");
						sfx.Pos = self.Pos;
						MovableMan:AddParticle(sfx);
						self.pumpFX = 1

						self.pumpAngTarget = math.pi/180*30

						if self.canEjectShell then
							casing = CreateAEmitter("Scrappers Generic Shotgun Casing");
							casing.Pos = self.Pos+Vector( 0,-1):RadRotate(self.RotAngle);
							casing.Vel = self.Vel+Vector(-math.random(1,2)*negNum,-math.random(2,6)):RadRotate(self.RotAngle)
							MovableMan:AddParticle(casing);
							self.canEjectShell = false
						end
					end
				end
			else --recoil stuff
				--check if it fired
				if self.lastAmmo > self.Magazine.RoundCount then
					self.pump = true
					self.pumpTimer:Reset();
					self.pumpAngTarget = 0
					self.pumpFX = 0
					self.lastAmmo = self.Magazine.RoundCount
					self.canEjectShell = true
				elseif self.lastAmmo < self.Magazine.RoundCount then --debug
					self.lastAmmo = self.Magazine.RoundCount
				end


			end

		else
			self.pumpTimer:Reset();
		end
		--rotate the shotgun
		self.pumpAng = (self.pumpAng*5+self.pumpAngTarget)/6
		self.RotAngle = self.RotAngle+(self.pumpAng*negNum)

		--shotgun reload
		if self.Magazine ~= nil then
			if self.loadedShell == false then
				self.ammoCounter = self.Magazine.RoundCount;
			else
				self.loadedShell = false;
				self.Magazine.RoundCount = self.ammoCounter + 1;
				self.lastAmmo = self.Magazine.RoundCount
				
				local sfx = CreateAEmitter("Shell In Looted Shotgun");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
			end
		else
			self.reloadTimer:Reset();
			self.reloadCycle = true;
			self.loadedShell = true;
		end

		if self:IsActivated() then
			self.reloadCycle = false;
		end

		if self.reloadCycle == true and self.reloadTimer:IsPastSimMS(self.reloadDelay) and self:IsFull() == false then
			local actor = MovableMan:GetMOFromID(self.RootID);
			if MovableMan:IsActor(actor) then
				ToActor(actor):GetController():SetState(Controller.WEAPON_RELOAD,true);
			end

			self.reloadCycle = false;
		end

	end

	local LootShotgunEffect

	if self.FiredFrame then

		for i = 1, 2 do
			LootShotgunEffect = CreateMOSParticle("Tiny Smoke Ball 1", "Base.rte")
			if LootShotgunEffect then
				LootShotgunEffect.Pos = self.MuzzlePos;
				--LootShotgunEffect.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)))* 0.1
				LootShotgunEffect.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)) + Vector(100*negNum,0):RadRotate(self.RotAngle)) / 30
				LootShotgunEffect.Team = self.Team
				MovableMan:AddParticle(LootShotgunEffect)
			end
		end

		if PosRand() < 0.5 then
			LootShotgunEffect = CreateMOSParticle("Side Thruster Blast Ball 1", "Base.rte")
			if LootShotgunEffect then
				LootShotgunEffect.Pos = self.MuzzlePos;
				LootShotgunEffect.Vel = self.Vel*0.05
				LootShotgunEffect.Team = self.Team
				MovableMan:AddParticle(LootShotgunEffect)
			end
		end
	end
end