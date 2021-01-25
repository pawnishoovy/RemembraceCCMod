
function Create(self)

	self.burstTimer = Timer();
	self.burst = false;
	self.canBurst = true;

	self.parent = nil;
	self.pullTimer = Timer();

	self.newMag = false;
	self.chamber = true;		--
	--self.pullTimer:Reset();	--
	self.num = math.pi;		--
	self.sfx = true;		--

	self.negNum = 0;
	self.sLength = self.SharpLength;

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end
end

function Update(self)

	if self.canBurst == true and self:IsActivated() and self.Magazine ~= nil and self.Magazine.RoundCount > 0 then
		self.burstTimer:Reset();
		self.canBurst = false;
		self.burst = true;
	end

	if self.burst == true then
		if self.burstTimer:IsPastSimMS(150) then
			self.burstTimer:Reset();
			self:Deactivate();
			self.burst = false;
		else
			self:Activate();
		end
	else
		if self.canBurst == false then
			self:Deactivate();
			if self.burstTimer:IsPastSimMS(200) then
				self.canBurst = true;
			end
		end
	end

	if self:IsReloading() and self.roundsSFX == false then -- lord forgive me for this code	-- nah it's good, mine is even more retarded and dysfunctional -KhromosomeKing
		
		if self.lastAmmo == 1 then
			sfx = CreateAEmitter("Dump One Salvaged SMG");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);
			for i = 1, self.lastAmmo do
				casing = CreateAEmitter("Scrappers Unspent SMG Casing");
				casing.Pos = self.Pos+Vector(2*self.negNum,-2):RadRotate(self.RotAngle);
				casing.Vel = self.Vel+Vector(-math.random(2,3)*self.negNum,-math.random(1,3)):RadRotate(self.RotAngle);
				MovableMan:AddParticle(casing);
			end
		elseif self.lastAmmo == 2 then
			sfx = CreateAEmitter("Dump Two Salvaged SMG");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);
			for i = 1, self.lastAmmo do
				casing = CreateAEmitter("Scrappers Unspent SMG Casing");
				casing.Pos = self.Pos+Vector(2*self.negNum,-2):RadRotate(self.RotAngle);
				casing.Vel = self.Vel+Vector(-math.random(2,3)*self.negNum,-math.random(1,3)):RadRotate(self.RotAngle);
				MovableMan:AddParticle(casing);
			end
		elseif self.lastAmmo >= 3 then
			sfx = CreateAEmitter("Dump Rounds Salvaged SMG");
			sfx.Pos = self.Pos;
			MovableMan:AddParticle(sfx);
			for i = 1, self.lastAmmo do
				casing = CreateAEmitter("Scrappers Unspent SMG Casing");
				casing.Pos = self.Pos+Vector(2*self.negNum,-2):RadRotate(self.RotAngle);
				casing.Vel = self.Vel+Vector(-math.random(2,3)*self.negNum,-math.random(1,3)):RadRotate(self.RotAngle);
				MovableMan:AddParticle(casing);
			end
		end
		
		self.roundsSFX = true;
	end


	if self:DoneReloading() == true and self.lastMagazineAmmo > 0 then
		self.newMag = false;
	end

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	else
		self.parent = nil;
	-- cock and load on pickup
		--self.chamber = true;	--
		--self.pullTimer:Reset();	--
		--self.num = math.pi;	--
		--self.sfx = true;	--
	end

	if self.HFlipped then
		self.negNum = -1;
	else
		self.negNum = 1;
	end

	if self.parent then

		if self.Magazine then

			self.lastAmmo = self.Magazine.RoundCount;
			self.roundsSFX = false;

			if self.newMag == true then

				self.chamber = true;
				self.pullTimer:Reset();
				self.num = math.pi;
				self.sfx = true;

				self.newMag = false;
			end
		else
			self.newMag = true;
			self.lastMagazineAmmo = self.lastAmmo;
		end

		if self.chamber == true then

			self:Deactivate();
			--self.parent:GetController():SetState(Controller.WEAPON_FIRE,false);

			if self.pullTimer:IsPastSimMS(500) then
				--self.parent:GetController():SetState(Controller.AIM_SHARP,false);
				--self.Frame = 1;

				if self.sfx ~= false then
					sfx = CreateAEmitter("Chamber " .. self.PresetName);
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);

					self.sfx = false;
				end

				self.SharpLength = self.SharpLength+(self.sLength/30)*math.sin(2*self.num);

				self.RotAngle = self.RotAngle -self.negNum*math.sin(self.num)/4;

				self.num = self.num - math.pi*0.08;
			end

			if self.num <= 0 then

				self.num = 0;
				self.chamber = false;
				self.SharpLength = self.sLength;
			end
		end
	end
end