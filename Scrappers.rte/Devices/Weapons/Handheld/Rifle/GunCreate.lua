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
ScrappersRifleData.BarrelAlloyLight = 1
ScrappersRifleData.BarrelAlloyMedium = 1
ScrappersRifleData.BarrelAlloyHeavy = 1

ScrappersRifleData.StockLight = 1
ScrappersRifleData.StockMedium = 1
ScrappersRifleData.StockHeavy = 1

ScrappersRifleData.GripLight = 1
ScrappersRifleData.GripMedium = 1
ScrappersRifleData.GripHeavy = 1

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
	MagazineOffset = Vector(3, 2),
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
	MagazineOffset = Vector(3, 2),
	ModOffset = Vector(5, 0),
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = nil,
	PreDelay = 0,
	
	OnCreate = function () end,
	OnUpdate = function () end
}

ScrappersRifleData.Magazines = {}

ScrappersRifleData.Barrels = {}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Density = BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Density = BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 3,
	Cost = 0,
	Length = 3,
	Density = BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 4,
	Cost = 0,
	Length = 2,
	Density = BarrelAlloyMedium
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 5,
	Length = 4,
	Density = BarrelAlloyHeavy
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 6,
	Length = 6,
	Density = BarrelAlloyLight
}

ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 7,
	Length = 6,
	Density = BarrelAlloyMedium
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

function Create(self)
	
	self.Budget = ScrappersRifleData.Budget
	
	--- Randomization
	
	-- Pick random receiver
	if #ScrappersRifleData.Receivers < 1 then return end
	
	local randI = ScrappersRifleData.Receivers[math.random(1, #ScrappersRifleData.Receivers)]
	self.Receiver = randI
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
	if self.FireMode then self.FireMode = PickProperty(self, self.Receiver.Mode) else self.FireMode = 0 end
	
	if self.Receiver.JointOffset then self.JointOffset = self.Receiver.JointOffset end
	if self.Receiver.SupportOffset then self.SupportOffset = self.Receiver.SupportOffset end
	if self.Receiver.StanceOffset then self.StanceOffset = self.Receiver.StanceOffset end
	if self.Receiver.SharpStanceOffset then self.SharpStanceOffset = self.Receiver.SharpStanceOffset end
	
	self.MuzzleOffset = self.Receiver.BarrelOffset
	
	self.Frame = self.Receiver.FrameStart
	self.FrameLocal = 0
	
	self.soundFireMech = CreateSoundContainer(PickProperty(self, self.Receiver.MechSound), ScrappersData.Module)
	
	--self.soundFireAdd = CreateSoundContainer("", ScrappersData.Module);
	--self.soundFireBass = CreateSoundContainer("", ScrappersData.Module);
	
end