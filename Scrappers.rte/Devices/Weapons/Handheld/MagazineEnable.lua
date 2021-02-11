function Create(self)

	self:DisableScript("Scrappers.rte/Devices/Weapons/Handheld/MagazinePhysics.lua");
	
end

function OnDetach(self)

	self:EnableScript("Scrappers.rte/Devices/Weapons/Handheld/MagazinePhysics.lua");

	local type = self:GetStringValue("MagazineType");

	self.playSound = true;
	
	if type == "Pistol Metal" then
	
		self.concreteHit = {["IDs"] = {[12] = "Exists", [177] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Metal Concrete", "Scrappers.rte")};
		
		self.dirtHit = {["IDs"] = {[9] = "Exists", [10] = "Exists", [11] = "Exists", [128] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " Dirt", "Scrappers.rte")};
		
		self.sandHit = {["IDs"] = {[6] = "Exists", [8] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Metal Sand", "Scrappers.rte")};
		
		self.solidMetalHit = {["IDs"] = {[178] = "Exists", [182] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Metal SolidMetal", "Scrappers.rte")};
		
	elseif type == "Pistol Poly" then
	
		self.concreteHit = {["IDs"] = {[12] = "Exists", [177] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Poly Concrete", "Scrappers.rte")};
		
		self.dirtHit = {["IDs"] = {[9] = "Exists", [10] = "Exists", [11] = "Exists", [128] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " Dirt", "Scrappers.rte")};
		
		self.sandHit = {["IDs"] = {[6] = "Exists", [8] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Poly Sand", "Scrappers.rte")};
		
		self.solidMetalHit = {["IDs"] = {[178] = "Exists", [182] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine Small Poly SolidMetal", "Scrappers.rte")};
		
	else
	
		self.concreteHit = {["IDs"] = {[12] = "Exists", [177] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " Concrete", "Scrappers.rte")};
		
		self.dirtHit = {["IDs"] = {[9] = "Exists", [10] = "Exists", [11] = "Exists", [128] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " Dirt", "Scrappers.rte")};
		
		self.sandHit = {["IDs"] = {[6] = "Exists", [8] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " Sand", "Scrappers.rte")};
		
		self.solidMetalHit = {["IDs"] = {[178] = "Exists", [182] = "Exists"},
		["Container"] = CreateSoundContainer("Physics Magazine " .. type .. " SolidMetal", "Scrappers.rte")};
	end
	
end