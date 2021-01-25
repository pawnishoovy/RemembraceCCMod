
function Create(self)
	self.parent = nil;
	self.loadShellTimer = Timer();
	self.canLoadShellTimer = Timer();

	self.shellsShot = 0
	self.shellsToReload = 0
	self.getShells = true
	self.lastAmmo = self.Magazine.RoundCount

	self.randLoadNum = math.random(60,30)

	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end

	function self.shellsToDrop(num)
		if num < 1 then return end

		local shellAmount = num or 1
		local mir
		if self.HFlipped then
			mir = -1;
		else
			mir = 1;
		end

		for i = 1, shellAmount do
			casing = CreateAEmitter("Scrappers Generic Shotgun Casing");
			casing.Pos = self.Pos+Vector(-4*mir,-1):RadRotate(self.RotAngle);
			casing.Vel = self.Vel+Vector(-math.random(3,6)*mir,-math.random(2,5)):RadRotate(self.RotAngle)
			MovableMan:AddParticle(casing);
		end
	end
end

function Update(self)
	--done
	if self:DoneReloading() == true then
		self.getShells = true
		self.shellsShot = 0

		self.lastAmmo = self.Magazine.RoundCount
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

		if self:IsReloading() then
			if self.getShells then
				self.shellsToReload = 1-self.lastAmmo
				self.getShells = false

				self.canLoadShellTimer:Reset()
				self.loadShellTimer:Reset()
			end

			--drop shells
			self.shellsToDrop(self.shellsShot)
			self.shellsShot = 0

			--load new shells
			if self.canLoadShellTimer:IsPastSimMS(300) and self.shellsToReload > 0 then
				if self.loadShellTimer:IsPastSimMS(self.randLoadNum) then
					self.randLoadNum = math.random(60,30)

					self.shellsToReload = self.shellsToReload-1
					self.canLoadShellTimer:Reset()

					local sfx = CreateAEmitter("Shell In Pipe Shotgun");
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);
				end
			end

		elseif self.Magazine then

			if self.lastAmmo > self.Magazine.RoundCount then
				self.lastAmmo = self.Magazine.RoundCount
				self.shellsShot = self.shellsShot+1
			end
		end
	end

	local PipeShotgunEffect

	if self.FiredFrame then

		for i = 1, 2 do
			PipeShotgunEffect = CreateMOSParticle("Tiny Smoke Ball 1", "Base.rte")
			if PipeShotgunEffect then
				PipeShotgunEffect.Pos = self.MuzzlePos;
				--PipeShotgunEffect.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)))* 0.1
				PipeShotgunEffect.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)) + Vector(100*negNum,0):RadRotate(self.RotAngle)) / 30
				PipeShotgunEffect.Team = self.Team
				MovableMan:AddParticle(PipeShotgunEffect)
			end
		end

		if PosRand() < 0.5 then
			PipeShotgunEffect = CreateMOSParticle("Side Thruster Blast Ball 1", "Base.rte")
			if PipeShotgunEffect then
				PipeShotgunEffect.Pos = self.MuzzlePos;
				PipeShotgunEffect.Vel = self.Vel*0.05
				PipeShotgunEffect.Team = self.Team
				MovableMan:AddParticle(PipeShotgunEffect)
			end
		end
	end
end