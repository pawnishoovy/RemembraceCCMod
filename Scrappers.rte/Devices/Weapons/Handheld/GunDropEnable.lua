function Create(self)

	self:DisableScript("Scrappers.rte/Devices/Weapons/Handheld/GunDropPhysics.lua");
	
end

function OnAttach(self)

	self.rattleSound:Play(self.Pos);
	
end

function OnDetach(self)

	self:EnableScript("Scrappers.rte/Devices/Weapons/Handheld/GunDropPhysics.lua");
	
	if not self:IsAttached() then	
		self.rattleSound:Play(self.Pos);
	end

	self.playSound = true;
	
end