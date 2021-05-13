--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersShotgunData = {}

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
	
	ReloadSoundSet
	
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
]]

-- Constants
ScrappersShotgunData.BarrelAlloyLight = 0.075
ScrappersShotgunData.BarrelAlloyMedium = 0.2
ScrappersShotgunData.BarrelAlloyHeavy = 0.4

ScrappersShotgunData.StockLight = 0.6
ScrappersShotgunData.StockMedium = 1.25
ScrappersShotgunData.StockHeavy = 2.15

ScrappersShotgunData.GripLight = 0.5
ScrappersShotgunData.GripMedium = 1.0
ScrappersShotgunData.GripHeavy = 2.5

ScrappersShotgunData.QualityBad = 1
ScrappersShotgunData.QualityAverage = 2
ScrappersShotgunData.QualityGood = 3

ScrappersShotgunData.Budget = 20


ScrappersShotgunData.Receivers = {}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "AA-20",
	Cost = 2,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = 400,
	
	FrameStart = 1,
	FrameEnd = 8,
	FrameChargeStart = 1,
	FrameChargeIntermediate = 8, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 8,
	
	Calibers = "20Ga",
	MagazineType = {"Straight"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Large Rifle F",
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = "Fire Pre Large Rifle E",
	BoltDelay = {90, 120},
	
	BoltDropSound = "Bolt Drop B",
	
	ReloadSoundSet = {"Reload Bolt Large Rifle J"},
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersShotgunData.Magazines = {}

-- 20Ga mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 8,
	Calibers = "20Ga",
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle I"}
}

-- 20Ga small drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 20,
	Calibers = "20Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle J"}
}

-- 20Ga drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 4,
	RoundCount = 32,
	Calibers = "20Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle K"}
}


ScrappersShotgunData.Barrels = {}
-- 000
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 001
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 002
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 003
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 3,
	Cost = 0,
	Length = 6,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 004
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 4,
	Cost = 0,
	Length = 8,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 005
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 5,
	Cost = 0,
	Length = 8,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 006
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 6,
	Length = 9,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 007
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 7,
	Length = 7,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 008
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 8,
	Length = 8,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 009
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 9,
	Length = 7,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 010
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 10,
	Length = 15,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 011
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 11,
	Length = 14,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 012
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 12,
	Length = 18,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 013
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 13,
	Length = 16,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 014
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 14,
	Length = 15,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 015
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 15,
	Length = 16,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 016
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 16,
	Length = 14,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 017
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 17,
	Length = 16,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 018
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 18,
	Length = 12,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 019
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 19,
	Length = 17,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 020
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 20,
	Length = 9,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 021
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 21,
	Length = 12,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 022
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 22,
	Length = 10,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 023
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 23,
	Length = 8,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 024
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 24,
	Length = 12,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 025
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 25,
	Length = 7,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 026
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 26,
	Length = 10,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 027
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 27,
	Length = 8,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 028
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 28,
	Length = 11,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 029
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 29,
	Length = 17,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 030
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 30,
	Length = 13,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}


ScrappersShotgunData.BarrelMods = {}
-- 000
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 0,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 001
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 1,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 002
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 2,
	Cost = 2,
	Length = 4,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 003
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 3,
	Cost = 2,
	Length = 5,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUp,
	MuzzleFlash = "Scrapper Muzzle Flash Up"
}
-- 004
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 4,
	Cost = 4,
	Length = 6,
	RecoilReduction = 0.075,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 005
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 5,
	Cost = 3,
	Length = 5,
	RecoilReduction = 0.05,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 006
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 6,
	Cost = 1,
	Length = 6,
	IsSupressor = true
}
-- 007
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 7,
	Cost = 1,
	Length = 7,
	IsSupressor = true
}
-- 008
ScrappersShotgunData.BarrelMods[#ScrappersShotgunData.BarrelMods + 1] = {
	Frame = 8,
	Cost = 1,
	Length = 10,
	IsSupressor = true
}


ScrappersShotgunData.Foregrips = {}
-- 000
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 0,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 001
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 1,
	Length = 11,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityGood
}
-- 002
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 2,
	Length = 9,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityGood
}
-- 003
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 3,
	Length = 7,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityGood
}
-- 004
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 4,
	Length = 8,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityBad
}
-- 005
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 5,
	Length = 8,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 006
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 6,
	Length = 8,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 007
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 7,
	Length = 10,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 008
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 8,
	Length = 4,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityBad
}
-- 009
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 9,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 010
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 10,
	Length = 12,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 011
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 11,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 012
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 12,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 013
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 13,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 014
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 14,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 015
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 15,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 016
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 16,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 017
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 17,
	Length = 8,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 018
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 18,
	Length = 12,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 019
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 19,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 020
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 20,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 021
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 21,
	Length = 9,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 022
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 22,
	Length = 10,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 023
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 23,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 024
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 24,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 025
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 25,
	Length = 9,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 026
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 26,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 027
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 27,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 028
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 28,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 029
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 29,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 030
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 30,
	Length = 8,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}


ScrappersShotgunData.Stocks = {}
-- 000
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 0,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityBad
}
-- 001
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 1,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 002
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 2,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 003
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 3,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 004
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 4,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 005
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 5,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 006
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 6,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 007
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 7,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 008
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 8,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityGood
}
-- 009
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 9,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 010
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 10,
	Mass = ScrappersShotgunData.StockLight,
	Quality = ScrappersShotgunData.QualityGood
}
-- 011
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 11,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 012
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 12,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 013
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 13,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 014
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 14,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 015
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 15,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 016
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 16,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 017
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 17,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 018
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 18,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 019
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 19,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 020
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 20,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 021
ScrappersShotgunData.Stocks[#ScrappersShotgunData.Stocks + 1] = {
	Frame = 21,
	Mass = ScrappersShotgunData.StockMedium,
	Quality = ScrappersShotgunData.QualityAverage
}


ScrappersShotgunData.Sights = {}
-- 000
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 0,
	Cost = 2,
	SharpLength = 200
}
-- 001
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 1,
	Cost = 2,
	SharpLength = 200
}
-- 002
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 2,
	Cost = 2,
	SharpLength = 200
}
-- 003
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 3,
	Cost = 1,
	SharpLength = 100
}
-- 004
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 4,
	Cost = 1,
	SharpLength = 100
}
-- 005
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 5,
	Cost = 1,
	SharpLength = 100
}
-- 006
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 6,
	Cost = 1,
	SharpLength = 100
}
-- 007
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 7,
	Cost = 0,
	SharpLength = 65
}
-- 008
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 8,
	Cost = 0,
	SharpLength = 65
}
-- 009
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 9,
	Cost = 0,
	SharpLength = 65
}
-- 010
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 10,
	Cost = 0,
	SharpLength = 65
}
-- 011
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 11,
	Cost = 0,
	SharpLength = 65
}
-- 012
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 12,
	Cost = 0,
	SharpLength = 65
}
-- 013
ScrappersShotgunData.Sights[#ScrappersShotgunData.Sights + 1] = {
	Frame = 13,
	Cost = 0,
	SharpLength = 65
}

function Create(self)

	
	self.Budget = ScrappersShotgunData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = false -- Force caliber sound picking function to only use semi sounds 
	
	local presetName = "Scrapper Assault Rifle"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersShotgunData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersShotgunData.Magazines)
	ScrappersGunFunctions.PickBarrel(self, ScrappersShotgunData.Barrels, presetName.." Barrel")
	-- Optional
	ScrappersGunFunctions.PickForegrip(self, ScrappersShotgunData.Foregrips, presetName.." Foregrip")
	ScrappersGunFunctions.PickStock(self, ScrappersShotgunData.Stocks, presetName.." Stock")
	if math.random(0, 100) < 50 then -- 50% chance
		ScrappersGunFunctions.PickSight(self, ScrappersShotgunData.Sights, presetName.." Sight")
	end
	if math.random(0, 100) < 40 then -- 40% chance
		ScrappersGunFunctions.PickBarrelMod(self, ScrappersShotgunData.BarrelMods, presetName.." Barrel Mod")
	end
	
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
end