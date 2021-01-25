
function Create(self)
	-- local ps
	-- local offset = self.Vel*(20*TimerMan.DeltaTimeSecs)	-- the effect will be created the next frame so move it one frame backwards towards the barrel

	-- --self.Lifetime = 900

	-- for i = 1, 2 do
		-- ps = CreateMOSParticle("Tiny Smoke Ball 1", "Base.rte")
		-- if ps then
			-- ps.Pos = self.Pos - offset
			-- ps.Vel = (self.Vel + Vector(RangeRand(-20,20), RangeRand(-20,20)))* 0.1
			-- MovableMan:AddParticle(ps)
		-- end
	-- end
	
	-- if PosRand() < 0.5 then
		-- ps = CreateMOSParticle("Side Thruster Blast Ball 1", "Base.rte")
		-- if ps then
			-- ps.Pos = self.Pos - offset
			-- ps.Vel = self.Vel*0.05
			-- MovableMan:AddParticle(ps)
		-- end
	-- end

	self.Vel = self.Vel+Vector(5*math.random(),0):RadRotate(math.random()*(math.pi*2));
	--self.time = math.random(40,80);
	self.time = math.random(20,60);
	self.slowDownTimer = Timer();
	self.slowDownsRemaining = 6
end

function Update(self)

	if self.slowDownTimer:IsPastSimMS(self.time/1.5) then
		self.slowDownTimer:Reset();

		self.Mass = self.Mass*0.95;
		self.Sharpness = self.Sharpness*0.95;
		if self.slowDownsRemaining > 0 then
			self.Vel = self.Vel*0.75
			self.slowDownsRemaining = self.slowDownsRemaining-1
		end
	end
end