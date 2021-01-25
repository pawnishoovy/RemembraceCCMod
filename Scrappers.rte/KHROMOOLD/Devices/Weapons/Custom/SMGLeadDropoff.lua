function Create(self)
	local Effect

	self.time = math.random(40,80);
	self.timer = Timer();
end

function Update(self)

	if self.timer:IsPastSimMS(self.time) then
		self.timer:Reset();

		self.Mass = self.Mass*0.95;
		self.Sharpness = self.Sharpness*0.85;
	end
end