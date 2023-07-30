--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersSMGData = {}

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
ScrappersSMGData.BarrelAlloyLight = 0.075
ScrappersSMGData.BarrelAlloyMedium = 0.2
ScrappersSMGData.BarrelAlloyHeavy = 0.4

ScrappersSMGData.StockLight = 0.6
ScrappersSMGData.StockMedium = 1.25
ScrappersSMGData.StockHeavy = 2.15

ScrappersSMGData.GripLight = 0.5
ScrappersSMGData.GripMedium = 1.0
ScrappersSMGData.GripHeavy = 2.5

ScrappersSMGData.QualityBad = 1
ScrappersSMGData.QualityAverage = 2
ScrappersSMGData.QualityGood = 3

ScrappersSMGData.Budget = 17


ScrappersSMGData.Receivers = {}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "American-180",
	Cost = 3,
	Mass = 2.6,
	Mode = 0,
	RateOfFire = 1200,
	
	FrameStart = 1,
	FrameEnd = 3,
	FrameChargeStart = 1,
	FrameChargeIntermediate = 3, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 1,
	
	Calibers = "22LR",
	MagazineType = "TopfedPan",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = "Fire Mech Very Small Rifle G",
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = "Fire Pre Very Small Rifle B",
	BoltDelay = {50},
	
	BoltDropSound = "Bolt Drop C",
	
	ReloadSoundSet = "Reload Bolt Very Small Rifle E",
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "K6-92 Borz",
	Cost = 5,
	Mass = 2,
	Mode = 0,
	RateOfFire = {{800, Cost = 0}, {1000, Cost = 1}, {1200, Cost = 2}},
	IntegratedBarrelLength = 5,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = {"9x18", "9x19"},
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = {"Fire Mech Very Small Rifle A", "Fire Mech Very Small Rifle B", "Fire Mech Very Small Rifle C"},
	PreSound = "Fire Pre Small Rifle B",
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Very Small Rifle B",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "Uzi",
	Cost = 4,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = 600,
	
	FrameStart = 1,
	FrameEnd = 3,
	FrameChargeStart = 1,
	FrameChargeIntermediate = 3, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 1,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = {"Fire Mech Very Small Rifle E", "Fire Mech Very Small Rifle F"},
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = {"Fire Pre Very Small Rifle B", "Fire Pre Very Small Rifle C"},
	BoltDelay = {50},
	
	BoltDropSound = "Bolt Drop C",
	
	ReloadSoundSet = {"Reload Bolt Very Small Rifle C", "Reload Bolt Very Small Rifle D"},
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "MP5A5",
	Cost = 5,
	Mass = 2.88,
	Mode = 0,
	RateOfFire = 800,
	
	FrameStart = 1,
	FrameIntermediate = 1,
	FrameEnd = 3,
	
	Calibers = "9x19",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallPoly",
	
	MechSound = "Fire Mech Very Small Rifle A",
	PreSound = "Fire Pre Very Small Rifle A",
	PreDelay = {0, 20, 30},
	
	ReloadSoundSet = {"Reload Bolt Very Small Rifle A"},
	
	OnCreate = ScrappersReloadsData.HKMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.HKMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "GP10",
	Cost = 5,
	Mass = 3,
	Mode = 0,
	RateOfFire = {{700, Cost = 0}, {800, Cost = 1}, {900, Cost = 2}},
	IntegratedBarrelLength = 5,
	
	FrameStart = 4,
	FrameEnd = 5,
	
	Calibers = "45ACP",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, -1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = {"Fire Mech Very Small Rifle C"},
	PreSound = "Fire Pre Small Rifle B",
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Small Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "M1928",
	Cost = 5,
	Mass = 5,
	Mode = 0,
	RateOfFire = 800,
	
	FrameStart = 1,
	FrameEnd = 3,
	FrameChargeStart = 1,
	FrameChargeIntermediate = 3, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 1,
	
	Calibers = "45ACP",
	MagazineType = "Straight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = "Fire Mech Small Rifle C",
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = "Fire Pre Small Rifle A",
	BoltDelay = {50},
	
	BoltDropSound = "Bolt Drop A",
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle I"},
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "UMP",
	Cost = 5,
	Mass = 2.3,
	Mode = 0,
	RateOfFire = {{550, Cost = 0}, {600, Cost = 1}, {700, Cost = 2}},
	IntegratedBarrelLength = 5,
	
	FrameStart = 6,
	FrameEnd = 8,
	
	Calibers = "45ACPSpecial",
	MagazineType = {"Tilted"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(3, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(3, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallPoly",
	
	MechSound = {"Fire Mech Small Rifle D"},
	PreSound = "Fire Pre Medium Rifle A",
	PreDelay = {10, 35},
	
	ReloadSoundSet = "Reload Bolt Small Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "MP7",
	Cost = 5,
	Mass = 2.1,
	Mode = 0,
	RateOfFire = 950,
	IntegratedBarrelLength = 5,
	
	FrameStart = 6,
	FrameEnd = 8,
	
	Calibers = "46x30",
	MagazineType = {"GripStraight"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(3, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(3, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallPoly",
	
	MechSound = {"Fire Mech Small Rifle A"},
	PreSound = "Fire Pre Medium Rifle A",
	PreDelay = {10, 35},
	
	ReloadSoundSet = "Reload Bolt Small Rifle D",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "Burst Gun",
	Cost = 5,
	Mass = 2,
	Mode = 2,
	BurstCount = 45,
	RateOfFire = 2000,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "22LR",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallPoly",
	
	MechSound = {"Fire Mech Very Small Rifle D"},
	PreSound = "Fire Pre Small Rifle B",
	PreDelay = 200,
	
	ReloadSoundSet = "Reload Bolt Small Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "50AE Thunker",
	Cost = 7,
	Mass = 5,
	Mode = 0,
	RateOfFire = {{400, Cost = 0}, {500, Cost = 1}},
	IntegratedBarrelLength = 5,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = {"50AE"},
	MagazineType = {"Straight"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(-1, -2),
	BarrelOffset = Vector(3, 0),
	StockOffset = Vector(-5, -1),
	MagazineOffset = Vector(0, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "SmallMetal",
	
	MechSound = {"Fire Mech Small Rifle E"},
	PreSound = "Fire Pre Medium Rifle A",
	PreDelay = {5, 20},
	
	ReloadSoundSet = "Reload Bolt Small Rifle C",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Magazines = {}
-- Thin Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 4,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"9x19", "9x18"},
	
	SoundType = "Small Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Very Small Rifle A"
}
-- gripstraight normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 4,
	Cost = 3,
	RoundCount = 32,
	Calibers = "9x19",
	
	SoundType = "Small Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Very Small Rifle C", "Reload Magazine Very Small Rifle D"}
}
-- gripstraight drum
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 4,
	Cost = 7,
	RoundCount = 70,
	Calibers = "9x19",
	
	SoundType = "Small Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Very Small Rifle E"}
}
-- gripstraight mp7
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 4,
	Cost = 3,
	RoundCount = 30,
	Calibers = "46x30",
	
	SoundType = "Small Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Small Rifle F"}
}
-- Thin  E X T R A  L O N G
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 5,
	Cost = 5,
	RoundCount = 45,
	Calibers = {"9x19", "9x18", "22LR"},
	
	SoundType = "Small Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Very Small Rifle B"
}
-- supposed to be a pan
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 5,
	Cost = 3,
	RoundCount = 150,
	Calibers = {"22LR"},
	
	SoundType = "Drum",
	Type = "TopfedPan",
	
	ReloadSoundSet = "Reload Magazine Very Small Rifle F"
}
-- Thick Short
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 20,
	Calibers = {"45ACP", "45ACPSpecial"},
	
	SoundType = "Small Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Small Rifle D"
}
-- Thick Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 2,
	Cost = 3,
	RoundCount = 20,
	Calibers = {"45ACP", "45ACPSpecial", "46x30"},
	
	SoundType = "Small Poly",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}
-- Thick Extended
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 3,
	Cost = 4,
	RoundCount = 30,
	Calibers = {"45ACP", "45ACPSpecial", "46x30"},
	
	SoundType = "Small Poly",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Small Rifle B"
}
-- Thick Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 2,
	Cost = 4,
	RoundCount = 20,
	Calibers = {"50AE"},
	
	SoundType = "Small Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Small Rifle E"
}
-- Tilted Short
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 6,
	Cost = 2,
	RoundCount = 20,
	Calibers = {"45ACP", "45ACPSpecial"},
	
	SoundType = "Small Poly",
	Type = "Tilted",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}
-- Tilted Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 7,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"45ACP", "45ACPSpecial"},
	
	SoundType = "Small Poly",
	Type = "Tilted",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}

-- Curved Thin Short
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 8,
	Cost = 1,
	RoundCount = 20,
	Calibers = {"9x19", "9x18", "46x30"},
	
	SoundType = "Small Poly",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Small Rifle D"
}

-- Curved Thin Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 9,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"9x19", "9x18", "22LR", "46x30"},
	
	SoundType = "Small Poly",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Very Small Rifle A"
}

-- Curved Thin Extended
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 10,
	Cost = 4,
	RoundCount = 40,
	Calibers = {"9x19", "9x18", "22LR", "46x30"},
	
	SoundType = "Small Poly",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Very Small Rifle B"
}

-- Curved Thick Short
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 11,
	Cost = 1,
	RoundCount = 20,
	Calibers = {"45ACP", "45ACPSpecial"},
	
	SoundType = "Small Poly",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Small Rifle D"
}

-- Curved Thick Normal
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 12,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"45ACP", "45ACPSpecial"},
	
	SoundType = "Small Poly",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}


ScrappersSMGData.Barrels = {}

ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 0,
	Length = 2,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 1,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 2,
	Length = 7,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 3,
	Length = 3,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 4,
	Length = 2,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 5,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 6,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 7,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 8,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 9,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 10,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 11,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 12,
	Length = 7,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 13,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 14,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 15,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 16,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 17,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 18,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 19,
	Length = 2,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 20,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 21,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 22,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 23,
	Length = 8,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 24,
	Length = 5,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 25,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 26,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 27,
	Length = 4,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 28,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 29,
	Length = 6,
	Density = ScrappersSMGData.BarrelAlloyLight
}


ScrappersSMGData.BarrelMods = {}

ScrappersSMGData.BarrelMods[#ScrappersSMGData.BarrelMods + 1] = {
	Frame = 0,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}


ScrappersSMGData.Foregrips = {}

ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 0,
	Length = 6,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 1,
	Length = 5,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 2,
	Length = 6,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 3,
	Length = 8,
	Mass = ScrappersSMGData.GripHeavy,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 4,
	Length = 6,
	Mass = ScrappersSMGData.GripLight,
	Quality = ScrappersSMGData.QualityBad
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 5,
	Length = 6,
	Mass = ScrappersSMGData.GripLight,
	Quality = ScrappersSMGData.QualityBad
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 6,
	Length = 6,
	Mass = ScrappersSMGData.GripLight,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 7,
	Length = 3,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 8,
	Length = 3,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 9,
	Length = 6,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityAverage
}



ScrappersSMGData.Stocks = {}
-- 000
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 0,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityBad
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 1,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 2,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 3,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 4,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityBad
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 5,
	Mass = ScrappersSMGData.StockMedium,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 6,
	Mass = ScrappersSMGData.StockMedium,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 7,
	Mass = ScrappersSMGData.StockMedium,
	Quality = ScrappersSMGData.QualityGood
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 8,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityAverage
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 9,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityBad
}
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 10,
	Mass = ScrappersSMGData.StockHeavy,
	Quality = ScrappersSMGData.QualityGood
}


ScrappersSMGData.Sights = {}
-- 000
ScrappersSMGData.Sights[#ScrappersSMGData.Sights + 1] = {
	Frame = 0,
	Cost = 2,
	SharpLength = 200
}

function Create(self)

	--self.experimentalFullAutoMech = false
	self.experimentalFullAutoCutOffTime = 100 -- shorter and snappier pistol caliber sounds cant be cut off so fast
	self.experimentalFullAutoVolume = 0.67 -- nor can they be lowered so much in volume
	
	self.Budget = ScrappersSMGData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = false -- Force caliber sound picking function to only use semi sounds 
	
	local presetName = "Scrapper Submachinegun"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersSMGData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersSMGData.Magazines)
	ScrappersGunFunctions.PickBarrel(self, ScrappersSMGData.Barrels, presetName.." Barrel")
	-- Optional
	if math.random(0, 100) < 90 then -- 90% chance
		ScrappersGunFunctions.PickForegrip(self, ScrappersSMGData.Foregrips, presetName.." Foregrip")
	end
	if math.random(0, 100) < 70 then -- 70% chance
		ScrappersGunFunctions.PickStock(self, ScrappersSMGData.Stocks, presetName.." Stock")
	end
	if math.random(0, 100) < 50 then -- 50% chance
		ScrappersGunFunctions.PickSight(self, ScrappersSMGData.Sights, presetName.." Sight")
	end
	if math.random(0, 100) < 40 then -- 40% chance
		ScrappersGunFunctions.PickBarrelMod(self, ScrappersSMGData.BarrelMods, presetName.." Barrel Mod")
	end
	
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
	self:AddScript("Scrappers.rte/Devices/Weapons/Handheld/GunUpdate.lua")
	
end