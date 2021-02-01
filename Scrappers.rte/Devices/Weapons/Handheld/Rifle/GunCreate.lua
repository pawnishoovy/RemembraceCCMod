--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/Rifle/Parts")
ScrappersRifleData = {}

--ScrappersData.Ammunition.List

--[[
Fire Modes:
	0 - full-auto,
	1 - semi-auto,
	2 - burst A
	3 - burst B
	4 - burst C
	
VariantTableCost = { {thing, Cost = x}, {thing, Cost = x}, {thing, Cost = x} }
VariantTable = { thing, thing, thing }

ReceiverObject:
	Name- String
	Cost- Int
	Mass- Float
	Mode- Int or VariantTable
	RateOfFire- Int or VariantTable
	BurstCount- Int (default - 3)
	BurstDelay- Int or VariantTable (in MS, default - (60 000 / RateOfFire) + 100)
	
	FrameStart- Int
	FrameEnd- Int
	FrameIntermediatePosition- Int (default - 0)
	
	Calibers- String or VariantTable
	
	JointOffset- Vector (default - ini offset)
	StanceOffset- Vector (default - ini offset)
	SharpStanceOffset- Vector (default - ini offset)
	SupportOffset- Vector (default - ini offset)
	SharpLength- Vector (default - ini offset)
	
	SightOffset- Vector
	BarrelOffset- Vector
	StockOffset- Vector
	MagazineOffset- Vector
	ModOffset- Vector (side mod offset, for example: laser)
	
	MechSound- String or VariantTable
	PreSound- String or VariantTable
	PreDelay- Int or VariantTable
	
	OnCreate- Function(self, parent)
	OnUpdate- Function(self, parent, firedFrame, activated)
	
BarrelObject
	Cost- Int (default - calculated)
	Length- Int
	Mass- Float (default - calculated)
	Density- Float
	Bonus- String
	
ForegripObject
	Cost- Int (default - calculated)
	Mass- Float
	RecoilReductionStrength- Float
	RecoilReductionPowStrength- Float
	RecoilReductionDamping- Float
	
StockObject
	Cost- Int (default - calculated)
	Mass- Float
	RecoilReductionStrength- Float
	RecoilReductionPowStrength- Float
	RecoilReductionDamping- Float
	
MagazineObject
	Cost- Int
	RoundCount- Int
	Calibers- String or VariantTable
	
	EjectVelocity- Vector
	
	ReloadSoundSet- String
	ReloadSoundSetVariants- Int
]]

-- Constants
ScrappersRifleData.BarrelAlloyLight = 0.1
ScrappersRifleData.BarrelAlloyMedium = 0.2
ScrappersRifleData.BarrelAlloyHeavy = 0.35

ScrappersRifleData.StockLight = 0.6
ScrappersRifleData.StockMedium = 1.25
ScrappersRifleData.StockHeavy = 1.75

ScrappersRifleData.GripLight = 0.5
ScrappersRifleData.GripMedium = 1.0
ScrappersRifleData.GripHeavy = 1.5

ScrappersRifleData.Budget = 20


ScrappersRifleData.Receivers = {}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "M4A1",
	Cost = 13,
	Mass = 4,
	Mode = 0,
	RateOfFire = {{800, Cost = 1}, {740, Cost = 0}},
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "556x45",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = nil,
	PreDelay = 0,
	
	OnCreate = function () end,
	OnUpdate = function () end
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "AK",
	Cost = 10,
	Mass = 4,
	Mode = 0,
	RateOfFire = {{690, Cost = 1}, {600, Cost = 0}},
	
	FrameStart = 4,
	FrameEnd = 7,
	
	Calibers = "762x39",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = nil,
	PreDelay = 0,
	
	OnCreate = function () end,
	OnUpdate = function () end
}


ScrappersRifleData.Magazines = {}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 30,
	Calibers = "556x45",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 2,
	Cost = 2,
	RoundCount = 20,
	Calibers = "556x45",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 3,
	Cost = 3,
	RoundCount = {{30, Cost = 0}, {35, Cost = 1}},
	Calibers = {{"556x45", Cost = 0}, {"762x39", Cost = 1}},
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 4,
	Cost = 3,
	RoundCount = {{30, Cost = 0}, {35, Cost = 1}},
	Calibers = {{"556x45", Cost = 0}, {"762x39", Cost = 1}},
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 7,
	Cost = 3,
	RoundCount = 30,
	Calibers = "762x39",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 14,
	Cost = 0,
	RoundCount = 13,
	Calibers = {"556x45", "762x39"},
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
}

ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 16,
	Cost = 5,
	RoundCount = 60,
	Calibers = {"556x45", "762x39"},
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
}


ScrappersRifleData.Barrels = {}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = ScrappersRifleData.BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Density = ScrappersRifleData.BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Density = ScrappersRifleData.BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 3,
	Cost = 0,
	Length = 3,
	Density = ScrappersRifleData.BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 4,
	Cost = 0,
	Length = 2,
	Density = ScrappersRifleData.BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 5,
	Length = 4,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 6,
	Length = 6,
	Density = ScrappersRifleData.BarrelAlloyLight
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 7,
	Length = 6,
	Density = ScrappersRifleData.BarrelAlloyMedium
}


ScrappersRifleData.Foregrips = {}


ScrappersRifleData.Stocks = {}


function PickProperty(self, var)
	if type(var) == "table" then
		local mode = 0
		for i, v in ipairs(var) do
			if v.Cost then
				mode = 1
			end
		end
		if mode == 0 then
			return var[math.random(1, #var)]
		elseif mode == 1 then
			local tab = {}
			local tabCost = {}
			
			for i, v in ipairs(var) do
				if v.Cost <= self.Budget then
					for name, value in pairs(v) do
						if (name == "Cost") then
							table.insert(tabCost, value)
						else
							table.insert(tab, value)
						end
					end
				end
			end
			if #tab > 0 then
				local pickedI = math.random(1, #tab)
				self.Budget = self.Budget - tabCost[pickedI]
				return tab[pickedI]
			else
				return nil
			end
		end
	else
		return var
	end
end

function PickCaliber(self, magazine)
	calibers = magazine.Calibers
	if type(calibers) == "table" then
		local mode = 0
		for i, v in ipairs(calibers) do
			if v.Cost then
				mode = 1
			end
		end
		if mode == 0 then
			local pickedI = 1
			while(not valid) do -- Dirty fix
				-- TO DO: COME WITH A BETTER FIX YOU LAZY ASS
				pickedI = math.random(1, #calibers)
				if type(self.Receiver.Calibers) == "table" then
					for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
						if receiverCaliber == calibers[pickedI] then
							valid = true
							break
						end
					end
				elseif self.Receiver.Calibers == calibers[pickedI] then
					valid = true
					break
				end
			end
			return calibers[pickedI]
		elseif mode == 1 then
			local tab = {}
			local tabCost = {}
			
			for i, v in ipairs(calibers) do
				
				if v.Cost <= self.Budget then
					for name, value in pairs(v) do
						if (name == "Cost") then
							table.insert(tabCost, value)
						else
							table.insert(tab, value)
						end
					end
				end
			end
			if #tab > 0 then
				local pickedI = 1
				local valid = true
				while(not valid) do -- Dirty fix
					-- TO DO: COME WITH A BETTER FIX YOU LAZY ASS
					pickedI = math.random(1, #tab)
					if type(self.Receiver.Calibers) == "table" then
						for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
							if receiverCaliber == tab[pickedI] then
								valid = true
								break
							end
						end
					elseif self.Receiver.Calibers == tab[pickedI] then
						valid = true
						break
					end
				end
				self.Budget = self.Budget - tabCost[pickedI]
				return tab[pickedI]
			else
				return nil
			end
		end
	else
		return calibers
	end
end

function Create(self)
	
	self.Budget = ScrappersRifleData.Budget
	
	---- Randomization
	
	--- Pick the Receiver
	if #ScrappersRifleData.Receivers < 1 then return end
	
	local randI = math.random(1, #ScrappersRifleData.Receivers)
	self.Receiver = ScrappersRifleData.Receivers[randI]
	if self.Receiver.Cost > self.Budget then
		print("Receiver MUST NOT be more expensive than maximum budget!")
		print("Maximum Budget: "..ScrappersRifleData.Budget)
		print("Receiver Cost: "..self.Receiver.Cost)
		print("Receiver Index: "..randI)
		return
	end
	self.Budget = self.Budget - self.Receiver.Cost -- Sold!
	
	-- Copy the variables
	self.Mass = self.Receiver.Mass
	self.RateOfFire = PickProperty(self, self.Receiver.RateOfFire)
	if self.Receiver.Mode then self.FireMode = PickProperty(self, self.Receiver.Mode) else self.FireMode = 0 end
	
	if self.Receiver.JointOffset then self.JointOffset = self.Receiver.JointOffset end
	if self.Receiver.SupportOffset then self.SupportOffset = self.Receiver.SupportOffset end
	if self.Receiver.StanceOffset then self.StanceOffset = self.Receiver.StanceOffset end
	if self.Receiver.SharpStanceOffset then self.SharpStanceOffset = self.Receiver.SharpStanceOffset end
	
	self.MuzzleOffset = self.Receiver.BarrelOffset
	
	self.Frame = self.Receiver.FrameStart
	self.FrameLocal = 0
	
	if self.FireMode == 0 then
		self.FullAuto = true
	else
		self.FullAuto = false
	end
	
	-- Sounds
	self.soundFireMech = CreateSoundContainer(PickProperty(self, self.Receiver.MechSound), ScrappersData.Module)
	
	--print("Receiver:")
	--print("Budget: "..self.Budget)
	
	--- Pick the Magazine
	local potentialMagazines = {}
	for i, magazine in ipairs(ScrappersRifleData.Magazines) do
		if magazine.Cost <= self.Budget then
			local valid = false
			if type(magazine.Calibers) == "table" then
				for _, magazineCaliber in ipairs(magazine.Calibers) do
					if type(self.Receiver.Calibers) == "table" then
						for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
							if receiverCaliber == magazineCaliber then
								valid = true
								break
							end
						end
					elseif self.Receiver.Calibers == magazineCaliber then
						valid = true
						break
					end
				end
			else
				if type(self.Receiver.Calibers) == "table" then
					for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
						if receiverCaliber == magazine.Calibers then
							valid = true
							break
						end
					end
				elseif self.Receiver.Calibers == magazine.Calibers then
					valid = true
				end
			end
			
			if valid then
				table.insert(potentialMagazines, magazine)
			end
		end
	end
	if #potentialMagazines > 0 then
		randI = math.random(1, #potentialMagazines)
		self.MagazineData = potentialMagazines[randI]
		
		self.Budget = self.Budget - self.MagazineData.Cost -- Sold!
		
		local MagazineMO = CreateAttachable("Scrapper Assault Rifle Magazine", ScrappersData.Module);
		
		MagazineMO.ParentOffset = self.Receiver.MagazineOffset
		--BarrelMO.JointOffset = self.Receiver.BarrelOffset * -1
		MagazineMO.Frame = self.MagazineData.Frame
		
		self:AddAttachable(MagazineMO);
		self.MagazineData.MO = MagazineMO
		
		--- Caliber
		self.Caliber = ScrappersData.Ammunition[PickCaliber(self, self.MagazineData)]
		
		-- Sounds
		local bass = ""
		local add = ""
		local fireSound = self.Caliber.FireSound
		local noiseSound = self.Caliber.NoiseSound
		
		-- Add
		if self.FullAuto then
			if fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			end
		else
			if fireSound["AddSemiVariants"] < 1 then
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			elseif fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				local total = fireSound["AddSemiVariants"] + fireSound["AddVariants"]
				if math.random() < (fireSound["AddSemiVariants"] / total) then
					add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				else
					add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				end
			end
		end
		
		self.soundFireAdd = CreateSoundContainer(add, ScrappersData.Module)
		self.soundFireAdd.Pitch = RangeRand(0.95, 1.05)
		
		-- Bass
		if fireSound["BassVariants"] > 1 then
			bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["BassVariants"]))
		else
			bass = fireSound["Bass"]
		end
		
		self.soundFireBass = CreateSoundContainer(bass, ScrappersData.Module)
		self.soundFireBass.Pitch = self.Caliber.BaseBassPitch
		self.soundFireBass.Volume = self.Caliber.BaseBassVolume
		
		-- Noise
		self.soundFireNoiseOutdoors = CreateSoundContainer(noiseSound["Outdoors"], ScrappersData.Module)
		self.soundFireNoiseIndoors = CreateSoundContainer(noiseSound["Indoors"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors = CreateSoundContainer(noiseSound["BigIndoors"], ScrappersData.Module)

		self.soundFireNoiseSemiOutdoors = CreateSoundContainer(noiseSound["OutdoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseSemiIndoors = CreateSoundContainer(noiseSound["IndoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseSemiBigIndoors = CreateSoundContainer(noiseSound["BigIndoorsSemi"], ScrappersData.Module)
		-- Reflection
		--self.soundReflection = ""
		
		self:SetNextMagazineName("Scrapper Magazine "..self.MagazineData.RoundCount)
		self:Reload()
	end
	--print("Magazine:")
	--print("Budget: "..self.Budget)
	
	--- Pick the Barrel
	local potentialBarrels = {}
	for i, barrel in ipairs(ScrappersRifleData.Barrels) do
		local ignore = false
		
		
		if not barrel.Mass and barrel.Density then
			barrel.Mass = barrel.Length * barrel.Density
		end
		
		if not barrel.Cost then
			if barrel.Mass then
				barrel.Cost = math.ceil((math.pow(barrel.Length, 2) / (barrel.Mass)) * 0.075)
			else
				barrel.Cost = 0
			end
		end
		if not ignore and barrel.Cost <= self.Budget then
			table.insert(potentialBarrels, barrel)
		end
	end
	if #potentialBarrels > 0 then
		for i = 1, 3 do -- Roll 3 times and pick the longest barrel
			randI = math.random(1, #potentialBarrels)
			local barrel = potentialBarrels[randI]
			if not self.Barrel or barrel.Length > self.Barrel.Length then
				self.Barrel = barrel
			end
		end
		self.Budget = self.Budget - self.Barrel.Cost -- Sold!
		
		local BarrelMO = CreateAttachable("Scrapper Assault Rifle Barrel", ScrappersData.Module);
		
		BarrelMO.ParentOffset = self.Receiver.BarrelOffset
		--BarrelMO.JointOffset = self.Receiver.BarrelOffset * -1
		BarrelMO.Mass = self.Barrel.Mass
		BarrelMO.Frame = self.Barrel.Frame
		
		self:AddAttachable(BarrelMO);
		self.Barrel.MO = BarrelMO
		
		self.MuzzleOffset = self.MuzzleOffset + Vector(self.Barrel.Length, 0)
	end
	
	--print("Barrel:")
	--print("Budget: "..self.Budget)
end