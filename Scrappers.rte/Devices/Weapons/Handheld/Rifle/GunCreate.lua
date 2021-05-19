--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersRifleData = {}

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
ScrappersRifleData.BarrelAlloyLight = 0.075
ScrappersRifleData.BarrelAlloyMedium = 0.2
ScrappersRifleData.BarrelAlloyHeavy = 0.4

ScrappersRifleData.StockLight = 0.6
ScrappersRifleData.StockMedium = 1.25
ScrappersRifleData.StockHeavy = 2.15

ScrappersRifleData.GripLight = 0.5
ScrappersRifleData.GripMedium = 1.0
ScrappersRifleData.GripHeavy = 2.5

ScrappersRifleData.QualityBad = 1
ScrappersRifleData.QualityAverage = 2
ScrappersRifleData.QualityGood = 3

ScrappersRifleData.Budget = 20


ScrappersRifleData.Receivers = {}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "M4A1",
	Cost = 12,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = {{800, Cost = 1}, {740, Cost = 0}},
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "556x45",
	MagazineType = {"Straight", "Curved"},
	
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
	
	GunRattleType = "MediumPoly",
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = {"Fire Pre Medium Rifle A", "Fire Pre Medium Rifle C"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "M16A2",
	Cost = 6,
	Mass = 3.5,
	Mode = 3,
	RateOfFire = 700,
	
	FrameStart = 4,
	FrameEnd = 6,
	
	Calibers = "556x45",
	MagazineType = {"Straight", "Curved"},
	
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
	
	GunRattleType = "MediumMetal",
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = {"Fire Pre Medium Rifle A", "Fire Pre Medium Rifle C"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "M16A4",
	Cost = 8,
	Mass = 3.5,
	Mode = 2,
	RateOfFire = 740,
	
	FrameStart = 7,
	FrameEnd = 9,
	
	Calibers = "556x45",
	MagazineType = {"Straight", "Curved"},
	
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
	
	GunRattleType = "MediumPoly",
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = {"Fire Pre Medium Rifle A", "Fire Pre Medium Rifle C"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "CQBA",
	Cost = 14,
	Mass = 3,
	Mode = 0,
	RateOfFire = 741,
	
	FrameStart = 10,
	FrameEnd = 12,
	
	Calibers = "556x45",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = {"Fire Pre Medium Rifle A", "Fire Pre Medium Rifle C"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "AK",
	Cost = 10,
	Mass = 4,
	Mode = 0,
	RateOfFire = {{690, Cost = 2}, {650, Cost = 0}},
	
	FrameStart = 13,
	FrameEnd = 16,
	
	Calibers = "545x39",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle B", "Reload Bolt Medium Rifle C"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "AKM",
	Cost = 9,
	Mass = 4.25,
	Mode = 0,
	RateOfFire = {{640, Cost = 2}, {600, Cost = 0}},
	
	FrameStart = 17,
	FrameEnd = 20,
	
	Calibers = "762x39",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {0 , 35},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle B", "Reload Bolt Medium Rifle C"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "SKS",
	Cost = 7,
	Mass = 4,
	Mode = 1,
	RateOfFire = 500,
	
	FrameStart = 21,
	FrameEnd = 24,
	
	Calibers = "762x39",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-5, 1),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -2.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 190,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-5, 0),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",
	
	MechSound = "Fire Mech Medium Semi Rifle A",
	PreSound = {"Fire Pre Medium Semi Rifle A", "Fire Pre Medium Semi Rifle B"},
	PreDelay = 50,
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle B", "Reload Bolt Medium Rifle C", "Reload Bolt Medium Rifle E"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "AKSU",
	Cost = 12,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = 735,
	
	FrameStart = 25,
	FrameEnd = 27,
	
	Calibers = "545x39",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 150,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle B", "Reload Bolt Medium Rifle C"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "StG 44",
	Cost = 9,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = {{600, Cost = 1}, {500, Cost = 0}},
	
	FrameStart = 75,
	FrameEnd = 78,
	
	Calibers = "792x33",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(1, -2.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-6, -3),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",
	
	MechSound = "Fire Mech Medium Rifle F",
	PreSound = {"Fire Pre Medium Rifle A"},
	PreDelay = {20, 40},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle H",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "SOCOM AR",
	Cost = 10,
	Mass = 4.3,
	Mode = 0,
	RateOfFire = {{610, Cost = 1}, {590, Cost = 0}},
	
	FrameStart = 28,
	FrameEnd = 31,
	
	Calibers = "458SOCOM",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(6, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Large Rifle B",
	PreSound = {"Fire Pre Large Rifle C", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 20, 30, 45},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle C", "Reload Bolt Large Rifle D"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "G3A3",
	Cost = 9,
	Mass = 4.6,
	Mode = 0,
	RateOfFire = {{525, Cost = 1}, {495, Cost = 0}},
	
	FrameStart = 32,
	FrameIntermediate = 34,
	FrameEnd = 35,
	
	Calibers = "762x51",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(6, -1),
	StockOffset = Vector(-7, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Large Rifle A",
	PreSound = {"Fire Pre Large Rifle C", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 20, 30, 45},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle F"},
	
	OnCreate = ScrappersReloadsData.HKMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.HKMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "FAL",
	Cost = 10,
	Mass = 4.9,
	Mode = 0,
	RateOfFire = 670,
	
	FrameStart = 28,
	FrameEnd = 31,
	
	Calibers = "762x51",
	MagazineType = "Straight",
	
	JointOffset = Vector(-5, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(2, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 180,
	
	SightOffset = Vector(1, -3),
	BarrelOffset = Vector(6, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(-1, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Large Rifle E",
	PreSound = "Fire Pre Large Rifle D",
	PreDelay = {25, 30, 50},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle C", "Reload Bolt Large Rifle B"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "BAR",
	Cost = 9,
	Mass = 4.6,
	Mode = 0,
	RateOfFire = {{650, Cost = 1}, {500, Cost = 0}},
	
	FrameStart = 36,
	FrameEnd = 39,
	FrameChargeStart = 40,
	FrameChargeIntermediate = 42, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 45,
	
	Calibers = {"556x45", "762x39", "762x51", "3006"},
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(6, -1),
	StockOffset = Vector(-7, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Medium Rifle G",
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = "Fire Pre Medium Rifle E",
	BoltDelay = {60},
	
	BoltDropSound = "Bolt Drop B",
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle G"},
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "30-06 Tommygun",
	Cost = 10,
	Mass = 5,
	Mode = 0,
	RateOfFire = {{700, Cost = 1}, {600, Cost = 0}},
	
	FrameStart = 36,
	FrameEnd = 39,
	FrameChargeStart = 40,
	FrameChargeIntermediate = 42, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 45,
	
	Calibers = {"3006"},
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(6, -1),
	StockOffset = Vector(-7, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
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

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "FAMAS",
	Cost = 11,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = 800,
	
	FrameStart = 46,
	FrameEnd = 49,
	
	Calibers = {"545x39", "556x45"},
	MagazineType = "Straight",
	
	JointOffset = Vector(-2, 2),
	SupportOffset = Vector(3, 1),
	EjectionOffset = Vector(-5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	
	StanceOffset = Vector(6, 5),
	SharpStanceOffset = Vector(9, 1),
	SharpLength = 150,
	
	SightOffset = Vector(-2, -3),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-7, -1),
	MagazineOffset = Vector(-6, 0),
	ModOffset = Vector(2, -1),
	
	GunRattleType = "MediumPoly",
	
	MechSound = {"Fire Mech Medium Rifle A", "Fire Mech Medium Rifle B"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {25, 50, 75},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "Cursed FAMAS",
	Cost = 14,
	Mass = 4.5,
	Mode = 0,
	RateOfFire = 1000,
	
	FrameStart = 50,
	FrameEnd = 53,
	
	Calibers = {"545x39", "556x45"},
	MagazineType = "Straight",
	
	JointOffset = Vector(-2, 2),
	SupportOffset = Vector(3, 1),
	EjectionOffset = Vector(-5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	
	StanceOffset = Vector(6, 5),
	SharpStanceOffset = Vector(9, 1),
	SharpLength = 160,
	
	SightOffset = Vector(3, -4),
	BarrelOffset = Vector(1, -1),
	StockOffset = Vector(-7, -1),
	MagazineOffset = Vector(-6, 0),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "MediumPoly",
	
	MechSound = "Fire Mech Medium Rifle A",
	PreSound = "Fire Pre Large Rifle D",
	PreDelay = {50, 75, 100},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle D",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "Kolibr",
	Cost = 10,
	Mass = 3.0,
	Mode = 0,
	RateOfFire = 800,
	
	FrameStart = 58,
	FrameEnd = 60,
	
	Calibers = "556x45",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(4, 0),
	EjectionOffset = Vector(0, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 190,
	
	SightOffset = Vector(-5, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-8, -1),
	MagazineOffset = Vector(0, 0),
	ModOffset = Vector(-2, -1),
	
	GunRattleType = "MediumMetal",
	
	MechSound = "Fire Mech Small Rifle B",
	PreSound = {"Fire Pre Medium Rifle A", "Fire Pre Medium Rifle C"},
	PreDelay = {35, 80},

	ReloadSoundSet = {"Reload Bolt Medium Rifle D"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "Madsen",
	Cost = 10,
	Mass = 6,
	Mode = 0,
	RateOfFire = 450,
	
	FrameStart = 61,
	FrameEnd = 66,
	FiredFrameFrame = 0,
	
	Calibers = {"545x39", "556x45", "3006", "762x39", "762x51"},
	MagazineType = "Topfed",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(4, 0),
	EjectionOffset = Vector(2, -1.5),
	EjectionVelocity = Vector(0, 3),
	SharpLength = 170,
	
	SightOffset = Vector(4, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-5, 1),
	MagazineOffset = Vector(2, -3),
	ModOffset = Vector(2, -1),
	
	GunRattleType = "MediumMetal",
	
	ReleaseNotAllowed = true,
	
	MechSound = "Fire Mech Large Rifle D",
	PreSound = {"Fire Pre Medium Rifle D"},
	PreDelay = {70},
	
	ReloadSoundSet = "Reload Bolt Large Rifle E",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	Name = "AN94",
	Cost = 10,
	Mass = 4,
	Mode = 0,
	RateOfFire = 1800,
	
	FrameStart = 13,
	FrameEnd = 16,
	
	Calibers = "545x39Special",
	MagazineType = "AN94",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Unique AN94",
	
	OnCreate = ScrappersReloadsData.AN94Create,
	OnUpdate = ScrappersReloadsData.AN94Update
}

-- ScrappersRifleData.Receivers[#ScrappersRifleData.Receivers + 1] = {
	-- Name = "Testalicious Rex",
	-- Cost = 9,
	-- Mass = 4.6,
	-- Mode = 0,
	-- RateOfFire = {{600, Cost = 0}, {700, Cost = 2}},
	
	-- FrameStart = 32,
	-- FrameIntermediate = 34,
	-- FrameEnd = 35,
	
	-- Calibers = "50BMG",
	-- MagazineType = {"Straight", "Curved"},
	
	-- JointOffset = Vector(-4, 2),
	-- SupportOffset = Vector(5, 1),
	-- EjectionOffset = Vector(1, -1.5),
	-- SharpLength = 170,
	
	-- SightOffset = Vector(0, -3),
	-- BarrelOffset = Vector(6, -1),
	-- StockOffset = Vector(-7, -1),
	-- MagazineOffset = Vector(2, 0),
	-- ModOffset = Vector(5, 0),
	
	-- MechSound = "Fire Mech Very Large Rifle A",
	-- PreSound = nil,
	-- PreDelay = 0,
	
	-- ReloadSoundSet = {"Reload Bolt Medium Rifle F"},
	
	-- OnCreate = ScrappersReloadsData.HKMagazineFedCreate,
	-- OnUpdate = ScrappersReloadsData.HKMagazineFedUpdate
-- }

ScrappersRifleData.Magazines = {}
-- Mish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 30,
	Calibers = "556x45",
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Mish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 2,
	Cost = 2,
	RoundCount = {{20, Cost = 0}, {25, Cost = 1}},
	Calibers = {"556x45", "50AE"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Polymer
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 3,
	Cost = 3,
	RoundCount = {{30, Cost = 0}, {35, Cost = 1}},
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 1}},
	
	SoundType = "Rifle Poly",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Polymer
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 4,
	Cost = 3,
	RoundCount = {{30, Cost = 0}, {35, Cost = 1}},
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 1}, {"762x51", Cost = 2}},
	
	SoundType = "Rifle Poly",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Polymer
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 5,
	Cost = 2,
	RoundCount = 20,
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 1}, {"762x51", Cost = 2}},
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle D"}
}
-- Battle Rifle'y
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 5,
	Cost = 3,
	RoundCount = 20,
	Calibers = {"762x39", "762x51", "458SOCOM"},
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle B"}
}
-- Battle Rifle'y
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 6,
	Cost = 2,
	RoundCount = 18,
	Calibers = {"762x51", "458SOCOM"},
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle A"}
}
-- AN94
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 7,
	Cost = 3,
	RoundCount = 30,
	Calibers = "545x39Special",
	
	SoundType = "Rifle Poly",
	Type = "AN94",
	
	ReloadSoundSet = "Reload Magazine Unique AN94"
}
-- AN94 Drum
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 17,
	Cost = 6,
	RoundCount = 75,
	Calibers = "545x39Special",
	
	SoundType = "Drum",
	Type = "AN94",
	
	ReloadSoundSet = "Reload XMagazine Unique AN94"
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 7,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C", "Reload Magazine Large Rifle R"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 8,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39", "458SOCOM"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C", "Reload Magazine Large Rifle R"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 9,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39", "458SOCOM"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C", "Reload Magazine Large Rifle R"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 10,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"556x45", "545x39", "762x39"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C", "Reload Magazine Large Rifle R"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 11,
	Cost = 3,
	RoundCount = 25,
	Calibers = {{"545x39", Cost = 0}, {"762x39", Cost = 0}, {"762x51", Cost = 1}},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C", "Reload Magazine Large Rifle R"}
}
-- STG44-y
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 11,
	Cost = 3,
	RoundCount = 30,
	Calibers = {{"545x39", Cost = 0}, {"792x33", Cost = 0}},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle F"
}
-- Battle Rifle'y Snipe'ry
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 12,
	Cost = 1,
	RoundCount = 18,
	Calibers = {"762x51", "458SOCOM"},
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Large Rifle D"
}

-- Shitties multiuse magazine
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 14,
	Cost = 0,
	RoundCount = 13,
	Calibers = ScrappersData.Ammunition.List,
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle E"
}
-- Shitties multiuse magazine
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 15,
	Cost = 0,
	RoundCount = 15,
	Calibers = ScrappersData.Ammunition.List,
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
}
-- Drum
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 16,
	Cost = 5,
	RoundCount = 50,
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 2}},
	
	SoundType = "Drum",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Large Rifle C"
}
-- Drum
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 17,
	Cost = 6,
	RoundCount = 60,
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 2}},
	
	SoundType = "Drum",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Large Rifle F"
}
-- Mish Multiuse Straight (not gay)
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 18,
	Cost = 3,
	RoundCount = 30,
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 2}, {"458SOCOM", Cost = 3}},
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Topfed Thin Big
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 19,
	Cost = 2,
	RoundCount = 30,
	Calibers = {{"545x39", Cost = 0}, {"762x39", Cost = 1}},
	
	EjectVelocity = Vector(1, -2),
	
	SoundType = "Rifle Poly",
	Type = "Topfed",
	Topfed = true,
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Topfed Thin Small
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 20,
	Cost = 0,
	RoundCount = 15,
	Calibers = {{"545x39", Cost = 0}, {"762x39", Cost = 1}},
	
	EjectVelocity = Vector(1, -2),
	
	SoundType = "Rifle Metal",
	Type = "Topfed",
	Topfed = true,
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle E"}
}
-- Topfed Thick Giant
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 21,
	Cost = 6,
	RoundCount = 40,
	Calibers = {{"762x51", Cost = 0}, {"458SOCOM", Cost = 2}, {"3006", Cost = 4}},
	
	EjectVelocity = Vector(1, -2),
	
	SoundType = "Large Poly",
	Type = "Topfed",
	Topfed = true,
	
	ReloadSoundSet = {"Reload Magazine Large Rifle F", "Reload Magazine Large Rifle G"}
}
-- Topfed Thick Big
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 22,
	Cost = 3,
	RoundCount = 30,
	Calibers = {{"762x51", Cost = 0}, {"458SOCOM", Cost = 1}, {"3006", Cost = 3}},

	EjectVelocity = Vector(1, -2),
	
	SoundType = "Large Poly",
	Type = "Topfed",
	Topfed = true,
	
	ReloadSoundSet = {"Reload Magazine Large Rifle C", "Reload Magazine Large Rifle A"}
}
-- Topfed Thick Small
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 23,
	Cost = 1,
	RoundCount = 15,
	Calibers = {{"762x51", Cost = 0}, {"458SOCOM", Cost = 1}, {"3006", Cost = 2}},
	
	EjectVelocity = Vector(1, -2),
	
	SoundType = "Rifle Metal",
	Type = "Topfed",
	Topfed = true,
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle D", "Reload Magazine Medium Rifle B"}
}


ScrappersRifleData.Barrels = {}
-- 000
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 001
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 002
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 003
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 3,
	Cost = 0,
	Length = 6,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 004
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 4,
	Cost = 0,
	Length = 8,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 005
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 5,
	Cost = 0,
	Length = 8,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 006
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 6,
	Length = 9,
	Density = ScrappersRifleData.BarrelAlloyLight
}
-- 007
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 7,
	Length = 7,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 008
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 8,
	Length = 8,
	Density = ScrappersRifleData.BarrelAlloyLight
}
-- 009
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 9,
	Length = 7,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 010
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 10,
	Length = 15,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 011
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 11,
	Length = 14,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 012
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 12,
	Length = 18,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 013
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 13,
	Length = 16,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 014
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 14,
	Length = 15,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 015
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 15,
	Length = 16,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 016
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 16,
	Length = 14,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 017
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 17,
	Length = 16,
	Density = ScrappersRifleData.BarrelAlloyLight
}
-- 018
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 18,
	Length = 12,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 019
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 19,
	Length = 17,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}
-- 020
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 20,
	Length = 9,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 021
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 21,
	Length = 12,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 022
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 22,
	Length = 10,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 023
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 23,
	Length = 8,
	Density = ScrappersRifleData.BarrelAlloyLight
}
-- 024
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 24,
	Length = 12,
	Density = ScrappersRifleData.BarrelAlloyLight
}
-- 025
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 25,
	Length = 7,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 026
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 26,
	Length = 10,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 027
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 27,
	Length = 8,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 028
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 28,
	Length = 11,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 029
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 29,
	Length = 17,
	Density = ScrappersRifleData.BarrelAlloyMedium
}
-- 030
ScrappersRifleData.Barrels[#ScrappersRifleData.Barrels + 1] = {
	Frame = 30,
	Length = 13,
	Density = ScrappersRifleData.BarrelAlloyHeavy
}


ScrappersRifleData.BarrelMods = {}
-- 000
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 0,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 001
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 1,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 002
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 2,
	Cost = 2,
	Length = 4,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 003
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 3,
	Cost = 2,
	Length = 5,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUp,
	MuzzleFlash = "Scrapper Muzzle Flash Up"
}
-- 004
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 4,
	Cost = 4,
	Length = 6,
	RecoilReduction = 0.075,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 005
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 5,
	Cost = 3,
	Length = 5,
	RecoilReduction = 0.05,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 006
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 6,
	Cost = 1,
	Length = 6,
	IsSupressor = true
}
-- 007
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 7,
	Cost = 1,
	Length = 7,
	IsSupressor = true
}
-- 008
ScrappersRifleData.BarrelMods[#ScrappersRifleData.BarrelMods + 1] = {
	Frame = 8,
	Cost = 1,
	Length = 10,
	IsSupressor = true
}


ScrappersRifleData.Foregrips = {}
-- 000
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 0,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 001
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 1,
	Length = 11,
	Mass = ScrappersRifleData.GripHeavy,
	Quality = ScrappersRifleData.QualityGood
}
-- 002
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 2,
	Length = 9,
	Mass = ScrappersRifleData.GripLight,
	Quality = ScrappersRifleData.QualityGood
}
-- 003
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 3,
	Length = 7,
	Mass = ScrappersRifleData.GripHeavy,
	Quality = ScrappersRifleData.QualityGood
}
-- 004
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 4,
	Length = 8,
	Mass = ScrappersRifleData.GripLight,
	Quality = ScrappersRifleData.QualityBad
}
-- 005
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 5,
	Length = 8,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 006
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 6,
	Length = 8,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 007
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 7,
	Length = 10,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 008
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 8,
	Length = 4,
	Mass = ScrappersRifleData.GripLight,
	Quality = ScrappersRifleData.QualityBad
}
-- 009
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 9,
	Length = 6,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 010
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 10,
	Length = 12,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 011
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 11,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 012
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 12,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 013
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 13,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 014
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 14,
	Length = 6,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 015
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 15,
	Length = 5,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 016
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 16,
	Length = 6,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 017
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 17,
	Length = 8,
	Mass = ScrappersRifleData.GripHeavy,
	Quality = ScrappersRifleData.QualityAverage
}
-- 018
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 18,
	Length = 12,
	Mass = ScrappersRifleData.GripHeavy,
	Quality = ScrappersRifleData.QualityAverage
}
-- 019
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 19,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 020
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 20,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 021
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 21,
	Length = 9,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 022
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 22,
	Length = 10,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 023
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 23,
	Length = 6,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 024
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 24,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 025
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 25,
	Length = 9,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 026
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 26,
	Length = 5,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 027
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 27,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 028
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 28,
	Length = 7,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 029
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 29,
	Length = 5,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 030
ScrappersRifleData.Foregrips[#ScrappersRifleData.Foregrips + 1] = {
	Frame = 30,
	Length = 8,
	Mass = ScrappersRifleData.GripMedium,
	Quality = ScrappersRifleData.QualityAverage
}


ScrappersRifleData.Stocks = {}
-- 000
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 0,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityBad
}
-- 001
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 1,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityAverage
}
-- 002
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 2,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityAverage
}
-- 003
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 3,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 004
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 4,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 005
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 5,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 006
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 6,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 007
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 7,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 008
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 8,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityGood
}
-- 009
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 9,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityAverage
}
-- 010
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 10,
	Mass = ScrappersRifleData.StockLight,
	Quality = ScrappersRifleData.QualityGood
}
-- 011
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 11,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 012
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 12,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 013
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 13,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 014
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 14,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 015
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 15,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 016
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 16,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 017
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 17,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityBad
}
-- 018
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 18,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}
-- 019
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 19,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 020
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 20,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityGood
}
-- 021
ScrappersRifleData.Stocks[#ScrappersRifleData.Stocks + 1] = {
	Frame = 21,
	Mass = ScrappersRifleData.StockMedium,
	Quality = ScrappersRifleData.QualityAverage
}


ScrappersRifleData.Sights = {}
-- 000
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 0,
	Cost = 2,
	SharpLength = 200
}
-- 001
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 1,
	Cost = 2,
	SharpLength = 200
}
-- 002
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 2,
	Cost = 2,
	SharpLength = 200
}
-- 003
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 3,
	Cost = 1,
	SharpLength = 100
}
-- 004
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 4,
	Cost = 1,
	SharpLength = 100
}
-- 005
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 5,
	Cost = 1,
	SharpLength = 100
}
-- 006
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 6,
	Cost = 1,
	SharpLength = 100
}
-- 007
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 7,
	Cost = 0,
	SharpLength = 65
}
-- 008
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 8,
	Cost = 0,
	SharpLength = 65
}
-- 009
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 9,
	Cost = 0,
	SharpLength = 65
}
-- 010
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 10,
	Cost = 0,
	SharpLength = 65
}
-- 011
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 11,
	Cost = 0,
	SharpLength = 65
}
-- 012
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 12,
	Cost = 0,
	SharpLength = 65
}
-- 013
ScrappersRifleData.Sights[#ScrappersRifleData.Sights + 1] = {
	Frame = 13,
	Cost = 0,
	SharpLength = 65
}

function Create(self)

	
	self.Budget = ScrappersRifleData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = false -- Force caliber sound picking function to only use semi sounds 
	
	local presetName = "Scrapper Assault Rifle"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersRifleData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersRifleData.Magazines)
	ScrappersGunFunctions.PickBarrel(self, ScrappersRifleData.Barrels, presetName.." Barrel")
	-- Optional
	ScrappersGunFunctions.PickForegrip(self, ScrappersRifleData.Foregrips, presetName.." Foregrip")
	ScrappersGunFunctions.PickStock(self, ScrappersRifleData.Stocks, presetName.." Stock")
	if math.random(0, 100) < 50 then -- 50% chance
		ScrappersGunFunctions.PickSight(self, ScrappersRifleData.Sights, presetName.." Sight")
	end
	if math.random(0, 100) < 40 then -- 40% chance
		ScrappersGunFunctions.PickBarrelMod(self, ScrappersRifleData.BarrelMods, presetName.." Barrel Mod")
	end
	
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
end