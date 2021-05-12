function Create(self)

	self:DisableScript("Scrappers.rte/Devices/Weapons/Handheld/GunDropPhysics.lua");
	
end

function OnDetach(self)

	self:EnableScript("Scrappers.rte/Devices/Weapons/Handheld/GunDropPhysics.lua");

	local type = self:GetStringValue("GunDropType");

	self.playSound = true;
	
	self.concreteHit = {["IDs"] = {[12] = "Exists", [177] = "Exists"},
	["Container"] = CreateSoundContainer("GunDrop " .. type .. " Concrete", "Scrappers.rte")};
	
	self.dirtHit = {["IDs"] = {[9] = "Exists", [10] = "Exists", [11] = "Exists", [128] = "Exists"},
	["Container"] = CreateSoundContainer("GunDrop " .. type .. " Dirt", "Scrappers.rte")};
	
	self.sandHit = {["IDs"] = {[6] = "Exists", [8] = "Exists"},
	["Container"] = CreateSoundContainer("GunDrop " .. type .. " Sand", "Scrappers.rte")};
	
	self.solidMetalHit = {["IDs"] = {[178] = "Exists", [182] = "Exists"},
	["Container"] = CreateSoundContainer("GunDrop " .. type .. " SolidMetal", "Scrappers.rte")};
	
end