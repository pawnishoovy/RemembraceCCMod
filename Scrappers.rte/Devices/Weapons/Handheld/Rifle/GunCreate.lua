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
	
VariantTableCost = { {Value = thing, Cost = x}, {Value = thing, Cost = x}, {Value = thing, Cost = x} }
VariantTable = { thing, thing, thing }

ReceiverObject:
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

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers+1] = {
	Cost = 10,
	Mass = 4,
	Mode = 0,
	RateOfFire = 500,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "556x45",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
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
	OnUpdate = function () end,
}

ScrappersRifleData.Barrels = {}
ScrappersRifleData.Foregrips = {}
ScrappersRifleData.Receivers = {}
ScrappersRifleData.Magazines = {}

function Create(self)
	
end