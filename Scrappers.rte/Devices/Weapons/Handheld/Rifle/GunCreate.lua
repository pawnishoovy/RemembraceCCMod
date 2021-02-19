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
ScrappersRifleData.BarrelAlloyLight = 0.1
ScrappersRifleData.BarrelAlloyMedium = 0.2
ScrappersRifleData.BarrelAlloyHeavy = 0.35

ScrappersRifleData.StockLight = 0.6
ScrappersRifleData.StockMedium = 1.25
ScrappersRifleData.StockHeavy = 1.75

ScrappersRifleData.GripLight = 0.5
ScrappersRifleData.GripMedium = 1.0
ScrappersRifleData.GripHeavy = 1.5

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
	
	MechSound = {"Fire Mech Medium Rifle C", "Fire Mech Medium Rifle D", "Fire Mech Medium Rifle E"},
	PreSound = {"Fire Pre Medium Rifle B", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 35},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle B", "Reload Bolt Medium Rifle C"},
	
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
	
	MechSound = "Fire Mech Large Rifle C",
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
	
	MechSound = "Fire Mech Large Rifle C",
	PreSound = {"Fire Pre Large Rifle C", "Fire Pre Medium Rifle D"},
	PreDelay = {0, 20, 30, 45},
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle F"},
	
	OnCreate = ScrappersReloadsData.HKMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.HKMagazineFedUpdate
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
	
	Calibers = {"556x45", "762x39", "762x51"},
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
	
	MechSound = {"Fire Mech Medium Rifle B", "Fire Mech Medium Rifle C"},
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
	
	MechSound = "Fire Mech Medium Pistol C",
	PreSound = "Fire Pre Large Rifle D",
	PreDelay = {50, 75, 100},
	
	ReloadSoundSet = "Reload Bolt Medium Rifle D",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
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
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Battle Rifle'y
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 6,
	Cost = 2,
	RoundCount = 18,
	Calibers = {"762x51", "458SOCOM"},
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 7,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 8,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39", "458SOCOM"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 9,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"762x39", "545x39", "458SOCOM"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 10,
	Cost = 3,
	RoundCount = 30,
	Calibers = {"556x45", "545x39", "762x39"},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- AKish
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 11,
	Cost = 3,
	RoundCount = 25,
	Calibers = {{"545x39", Cost = 0}, {"762x39", Cost = 0}, {"762x51", Cost = 1}},
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Medium Rifle A", "Reload Magazine Medium Rifle B", "Reload Magazine Medium Rifle C"}
}
-- Battle Rifle'y Snipe'ry
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 12,
	Cost = 1,
	RoundCount = 18,
	Calibers = {"762x51", "458SOCOM"},
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
}

-- Shitties multiuse magazine
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 14,
	Cost = 0,
	RoundCount = 13,
	Calibers = ScrappersData.Ammunition.List,
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
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
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
}
-- Drum
ScrappersRifleData.Magazines[#ScrappersRifleData.Magazines + 1] = {
	Frame = 17,
	Cost = 6,
	RoundCount = 60,
	Calibers = {{"556x45", Cost = 0}, {"545x39", Cost = 0}, {"762x39", Cost = 2}},
	
	SoundType = "Drum",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Medium Rifle D"
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

function PickProperty(self, var)
	if type(var) == "table" then
		local mode = 0
		for i, v in ipairs(var) do
			if type(v) == "table" and v.Cost then
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
			local valid = false
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
				local valid = false
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
function SpawnCasing(self)
	local casing = CreateMOSParticle(self.Casing, ScrappersData.Module)
	casing.Pos = self.Pos + self.EjectionOffset
	casing.Vel = self.Vel + Vector((self.EjectionVelocity.X*self.FlipFactor)*(math.random(75, 125)/100), (self.EjectionVelocity.Y)*(math.random(90, 110)/100)):RadRotate(self.RotAngle)
	MovableMan:AddParticle(casing)
end

function Create(self)

	
	self.Budget = ScrappersRifleData.Budget + math.random(0,7)
	
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
	if self.Receiver.EjectionOffset then self.EjectionOffset = self.Receiver.EjectionOffset end
	
	self.MuzzleOffset = self.Receiver.BarrelOffset
	
	self.Frame = self.Receiver.FrameStart
	self.FrameLocal = 0
	if self.Receiver.FrameIntermediate then
		self.FrameIntermediate = self.Receiver.FrameIntermediate - self.Receiver.FrameStart
	end
	self.FrameRange = self.Receiver.FrameEnd - self.Receiver.FrameStart
	
	if self.FireMode == 1 then
		self.FullAuto = false
	else
		self.FullAuto = true
	end
	
	-- Sounds
	self.ReloadBoltSoundSet = ScrappersData.ReloadSoundSets.Bolt[PickProperty(self, self.Receiver.ReloadSoundSet)]
	
	self.soundFireMech = CreateSoundContainer(PickProperty(self, self.Receiver.MechSound), ScrappersData.Module)
	self.soundFireMechBasePitch = 1
	self.soundFireMechBaseVolume = 1
	
	self.soundFireMech.Pitch = self.soundFireMechBasePitch
	self.soundFireMech.Volume = self.soundFireMechBaseVolume
	
	if self.Receiver.PreSound then
		self.soundFirePre = CreateSoundContainer(PickProperty(self, self.Receiver.PreSound), ScrappersData.Module)
	end
	
	if self.Receiver.PreDelay then
		self.preDelay = PickProperty(self, self.Receiver.PreDelay)
		--print(self.preDelay)
	end
	
	--- Pick the Magazine
	function self:MagazineIn()
		if not self.MagazineData.MO then
			local MagazineMO = CreateAttachable("Scrapper Assault Rifle Magazine", ScrappersData.Module);
			MagazineMO.ParentOffset = self.Receiver.MagazineOffset
			MagazineMO.Frame = self.MagazineData.Frame
			MagazineMO:SetStringValue("MagazineType", self.MagazineData.SoundType);
			self:AddAttachable(MagazineMO);
			self.MagazineData.MO = MagazineMO
		end
	end

	function self:MagazineOut()
		if self.MagazineData.MO then
			if self.MagazineData.EjectVelocity then
				self.MagazineData.MO.Velocity = self.Vel + Vector(self.MagazineData.EjectVelocity.X * self.FlipFactor, self.MagazineData.EjectVelocity.Y):RadRotate(self.RotAngle)
			else
				self.MagazineData.MO.Velocity = self.Vel + Vector(3 * self.FlipFactor, 6):RadRotate(self.RotAngle)
				self.MagazineData.MO.AngularVel = 1 * self.FlipFactor
			end
			self.MagazineData.MO.JointStrength = -1
			self.MagazineData.MO = nil
		end
	end
	
	local potentialMagazines = {}
	for i, magazine in ipairs(ScrappersRifleData.Magazines) do
		local validType = false
		if type(self.Receiver.MagazineType) == "table" then
			for i, magType in ipairs(self.Receiver.MagazineType) do
				if magazine.Type == magType then
					validType = true
					break
				end
			end
		elseif magazine.Type == self.Receiver.MagazineType then
			validType = true
		end
		if validType and magazine.Cost <= self.Budget then
			local valid = false
			if type(magazine.Calibers) == "table" then
				for _, magazineCaliber in ipairs(magazine.Calibers) do
					
					if type(magazineCaliber) == "table" then
						if #magazineCaliber > 0 and type(magazineCaliber[1]) == "string" then
							magazineCaliber = magazineCaliber[1]
						elseif #magazineCaliber > 1 and type(magazineCaliber[2]) == "string" then
							magazineCaliber = magazineCaliber[2]
						end
					end
					
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
		--randI = math.random(1, #potentialMagazines)
		--self.MagazineData = potentialMagazines[randI]
		for i = 1, 3 do -- Roll 3 times and pick the largest magazine
			randI = math.random(1, #potentialMagazines)
			local magazine = potentialMagazines[randI]
			local roundCount = 0
			local roundCountCurrent = 0
			
			if type(magazine.RoundCount) == "table" then
				if type(magazine.RoundCount[1]) == "table" then -- that's fucked up
					for j = 1, #magazine.RoundCount do
						roundCount = math.max(roundCount, magazine.RoundCount[j][1])
					end
				else
					for j = 1, #magazine.RoundCount do
						roundCount = math.max(roundCount, magazine.RoundCount[j])
					end
				end
			else
				roundCount = magazine.RoundCount
			end
			if not self.MagazineData or roundCount > roundCountCurrent then
				print(roundCount)
				self.MagazineData = magazine
				roundCountCurrent = roundCount
			end
		end
		
		self.Budget = self.Budget - self.MagazineData.Cost -- Sold!
		
		self.ReloadMagazineSoundSet = ScrappersData.ReloadSoundSets.Magazine[PickProperty(self, self.MagazineData.ReloadSoundSet)]
		
		-- messy system to check if we should have a "one in the chamber" compatible roundcount
		-- TODO: standardize somehow
		
		local roundCount = PickProperty(self, self.MagazineData.RoundCount) + 0
		--print("Original: "..roundCount)
		
		if self.Receiver.OnCreate == ScrappersReloadsData.BasicMagazineFedCreate 
		or self.Receiver.OnCreate == ScrappersReloadsData.HKMagazineFedCreate then
			self.MagazineData.RoundCount = roundCount + 1
		else		
			self.MagazineData.RoundCount = roundCount		
		end
		
		--print("After: "..self.MagazineData.RoundCount)
		
		self:MagazineIn()
		
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
				--if math.random() < (fireSound["AddSemiVariants"] / total) then
				if (true) then
					add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				else
					add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				end
			end
		end
		
		self.soundFireAdd = CreateSoundContainer(add, ScrappersData.Module)
		self.soundFireAddBasePitch = RangeRand(0.95, 1.05)
		self.soundFireAddBaseVolume = self.soundFireAdd.Volume
		
		self.soundFireAdd.Pitch = self.soundFireAddBasePitch
		self.soundFireAdd.Volume = self.soundFireAddBaseVolume
		
		-- Bass
		if fireSound["BassVariants"] > 1 then
			bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["BassVariants"]))
		else
			bass = fireSound["Bass"]
		end
		
		self.soundFireBass = CreateSoundContainer(bass, ScrappersData.Module)
		self.soundFireBassBasePitch = self.Caliber.BaseBassPitch * RangeRand(0.975, 1.025)
		self.soundFireBassBaseVolume = self.Caliber.BaseBassVolume
		
		self.soundFireBass.Pitch = self.soundFireBassBasePitch
		self.soundFireBass.Volume = self.soundFireBassBaseVolume
		
		
		-- Noise
		self.soundFireNoiseOutdoors = CreateSoundContainer(noiseSound["Outdoors"], ScrappersData.Module)
		self.soundFireNoiseOutdoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseOutdoors.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireNoiseIndoors = CreateSoundContainer(noiseSound["Indoors"], ScrappersData.Module)
		self.soundFireNoiseIndoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseIndoors.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireNoiseBigIndoors = CreateSoundContainer(noiseSound["BigIndoors"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseVolume


		self.soundFireNoiseSemiOutdoors = CreateSoundContainer(noiseSound["OutdoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		self.soundFireNoiseSemiIndoors = CreateSoundContainer(noiseSound["IndoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		self.soundFireNoiseSemiBigIndoors = CreateSoundContainer(noiseSound["BigIndoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		-- Reflection
		self.soundFireReflection = CreateSoundContainer(self.Caliber.ReflectionSound, ScrappersData.Module)
		self.soundFireReflection.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireReflection.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireReflectionSemi = CreateSoundContainer(self.Caliber.ReflectionSound .. " Semi", ScrappersData.Module)
		self.soundFireReflectionSemi.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireReflectionSemi.Volume = self.Caliber.BaseNoiseVolume
		
		self.reflectionSound = self.soundFireReflection -- default
		self.reflectionSemiSound = self.soundFireReflectionSemi -- default
		
		self:SetNextMagazineName("Scrapper Magazine "..self.MagazineData.RoundCount)
		self.ReloadTime = 0
		self:Reload()
		
	else
		print("SOMETHING WENT WRONG!")
		print("Couldn't afford any magazine!")
		return
	end
	
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
	
	--- Pick the Foregrip
	local potentialForegrips = {}
	for i, foregrip in ipairs(ScrappersRifleData.Foregrips) do
		
		if not foregrip.Cost then
			foregrip.Cost = math.ceil(foregrip.Quality * 1 / (foregrip.Mass)) - math.random(0,1)
		end
		
		if foregrip.Length <= self.Barrel.Length and foregrip.Cost <= self.Budget then
			table.insert(potentialForegrips, foregrip)
		end
	end
	if #potentialForegrips > 0 then
		randI = math.random(1, #potentialForegrips)
		self.Foregrip = potentialForegrips[randI]
		
		self.Budget = self.Budget - self.Foregrip.Cost -- Sold!
		
		local ForegripMO = CreateAttachable("Scrapper Assault Rifle Foregrip", ScrappersData.Module);
		
		ForegripMO.ParentOffset = self.Receiver.BarrelOffset
		ForegripMO.Mass = self.Foregrip.Mass
		ForegripMO.Frame = self.Foregrip.Frame
		
		self:AddAttachable(ForegripMO)
		self.Foregrip.MO = ForegripMO
	end
	
	--- Pick the Stock
	local potentialStocks = {}
	for i, stock in ipairs(ScrappersRifleData.Stocks) do
		
		if not stock.Cost then
			stock.Cost = math.ceil(stock.Quality * 0.5 / (stock.Mass))
		end
		
		if stock.Cost <= self.Budget then
			table.insert(potentialStocks, stock)
		end
	end
	if #potentialStocks > 0 then
		randI = math.random(1, #potentialStocks)
		self.Stock = potentialStocks[randI]
		
		self.Budget = self.Budget - self.Stock.Cost -- Sold!
		
		local StockMO = CreateAttachable("Scrapper Assault Rifle Stock", ScrappersData.Module);
		
		StockMO.ParentOffset = self.Receiver.StockOffset
		StockMO.Mass = self.Stock.Mass
		StockMO.Frame = self.Stock.Frame
		
		self:AddAttachable(StockMO)
		self.Stock.MO = StockMO
	end
	
	self.soundReloadSet = {}
	for i, sound in ipairs(self.ReloadBoltSoundSet.SoundList) do
		local soundPresetName = self.ReloadBoltSoundSet[sound]["SoundContainer"]
		if soundPresetName and soundPresetName ~= "" then
			self.soundReloadSet[sound] = CreateSoundContainer(soundPresetName, ScrappersData.Module)
		end
	end
	for i, sound in ipairs(self.ReloadMagazineSoundSet.SoundList) do
		local soundPresetName = self.ReloadMagazineSoundSet[sound]["SoundContainer"]
		if soundPresetName and soundPresetName ~= "" then
			self.soundReloadSet[sound] = CreateSoundContainer(soundPresetName, ScrappersData.Module)
		end
	end
	
	-- Sights
	if self.Budget > 0 and math.random(0, 100) < 50 then
		self.Budget = self.Budget - 1
		self.Sight = {}
		
		local SightMO = CreateAttachable("Scrapper Assault Rifle Sight", ScrappersData.Module);
		
		SightMO.ParentOffset = self.Receiver.SightOffset
		SightMO.Frame = math.random(0, SightMO.FrameCount - 1)
		
		self:AddAttachable(SightMO)
		self.Sight.MO = SightMO
		
		if SightMO.Frame <= 1 then
			self.SharpLength = self.SharpLength + 200
		elseif SightMO.Frame <= 5 then
			self.SharpLength = self.SharpLength + 100
		else
			self.SharpLength = self.SharpLength + 65
		end
		
	end
	
	-- casing stuff
	
	self.Casing = self.Caliber.CasingPresetName
	self.EjectionVelocity = self.Receiver.EjectionVelocity
	
	-- final tacticoolness
	if self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
end