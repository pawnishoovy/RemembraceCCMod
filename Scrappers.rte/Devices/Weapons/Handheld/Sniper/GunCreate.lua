--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersSniperData = {}

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
ScrappersSniperData.BarrelAlloyLight = 0.075
ScrappersSniperData.BarrelAlloyMedium = 0.2
ScrappersSniperData.BarrelAlloyHeavy = 0.4

ScrappersSniperData.StockLight = 0.6
ScrappersSniperData.StockMedium = 1.25
ScrappersSniperData.StockHeavy = 2.15

ScrappersSniperData.GripLight = 0.5
ScrappersSniperData.GripMedium = 1.0
ScrappersSniperData.GripHeavy = 2.5

ScrappersSniperData.QualityBad = 1
ScrappersSniperData.QualityAverage = 2
ScrappersSniperData.QualityGood = 3

ScrappersSniperData.Budget = 20


ScrappersSniperData.Receivers = {}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Mosin",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "762x54",
	MagazineType = {"Straight", "RoundLoad", "Stripper"},
	
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
	
	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = "Reload Bolt Medium Single Rifle B",
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "M24",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "762x51",
	MagazineType = {"Straight", "RoundLoad", "Stripper"},
	
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

	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Medium Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = "Reload Bolt Medium Single Rifle A",
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Oldie Boy",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "4570",
	MagazineType = {"RoundLoad", "Stripper"},
	
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
	
	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = {"Reload Bolt Large Single Rifle A", "Reload Bolt Large Single Rifle B", "Reload Bolt Large Single Rifle E"},
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Winchester 1885",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "4570",
	MagazineType = {"RoundLoad", "Stripper"},
	
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

	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = "Reload Bolt Large Single Rifle C",
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Marlin 1895",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameEnd = 8,
	
	Calibers = "4570",
	MagazineType = {"SideRoundLoad"},
	
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
	
	ReleaseNotAllowed = true,

	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = {"Reload Bolt Large Single Rifle D", "Reload Bolt Large Single Rifle C"},
	
	OnCreate = ScrappersReloadsData.SingleNoBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleNoBreechUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Straight-Pull",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 1,
	FrameEnd = 8,
	
	Calibers = "3006",
	MagazineType = {"RoundLoad", "Stripper"},
	
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

	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = {"Reload Bolt Medium Single Rifle C", "Reload Bolt Medium Single Rifle D"},
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "SMLE",
	Cost = 2,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "3006",
	MagazineType = {"RoundLoad", "Stripper"},
	
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

	MechSound = {"Fire Mech Large Single Rifle A"},
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {35, 60},
	
	ReloadSoundSet = {"Reload Bolt Large Single Rifle A", "Reload Bolt Large Single Rifle B", "Reload Bolt Large Single Rifle E"},
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Hecate II",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "50BMG",
	MagazineType = {"Straight", "RoundLoad", "Stripper"},
	
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

	MechSound = {"Fire Mech Very Large Single Rifle A"},
	PreSound = {"Fire Pre Very Large Single Rifle A"},
	PreDelay = {70, 120},
	
	ReloadSoundSet = "Reload Bolt Very Large Single Rifle A",
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "950JDJ Elephantile",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 2,
	FrameEnd = 8,
	
	Calibers = "950JDJ",
	MagazineType = {"RoundLoad"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-2, -1),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",

	MechSound = {"Fire Mech Very Large Single Rifle A"},
	PreSound = {"Fire Pre Very Large Single Rifle B"},
	PreDelay = {100, 150},
	
	ReloadSoundSet = "Reload Bolt Very Large Single Rifle B",
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Selbstlader",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 400,
	
	FrameStart = 1,
	FrameIntermediate = 1,
	FrameEnd = 8,
	
	Calibers = "762x51",
	MagazineType = {"RoundLoad", "Stripper"},
	SelfLoading = true;
	
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
	
	GunRattleType = "Large",

	MechSound = "Fire Mech Large Semi Rifle D",
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {10, 25},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle G"},
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Mondragon",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 400,
	
	FrameStart = 1,
	FrameIntermediate = 1,
	FrameEnd = 8,
	
	Calibers = "762x54",
	MagazineType = {"RoundLoad", "Stripper"},
	SelfLoading = true;
	
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
	
	GunRattleType = "Large",

	MechSound = "Fire Mech Large Semi Rifle E",
	PreSound = {"Fire Pre Large Single Rifle A", "Fire Pre Medium Single Rifle B", "Fire Pre Medium Single Rifle C"},
	PreDelay = {10, 25},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle H"},
	
	OnCreate = ScrappersReloadsData.BoltActionCreate,
	OnUpdate = ScrappersReloadsData.BoltActionUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "PSG-1",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 300,
	
	FrameStart = 1,
	FrameIntermediate = 7,
	FrameEnd = 8,
	
	Calibers = "762x51",
	MagazineType = {"Straight"},
	
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
	
	GunRattleType = "Large",

	MechSound = "Fire Mech Large Semi Rifle C",
	PreSound = {"Fire Pre Medium Semi Rifle A", "Fire Pre Medium Semi Rifle B"},
	PreDelay = {0, 20},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle F"},
	
	OnCreate = ScrappersReloadsData.HKMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.HKMagazineFedUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "SVD",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameIntermediate = 7,
	FrameEnd = 8,
	
	Calibers = "762x54",
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
	
	GunRattleType = "Large",

	MechSound = "Fire Mech Large Semi Rifle B",
	PreSound = {"Fire Pre Large Semi Rifle A"},
	PreDelay = {10, 30, 50},
	
	ReloadSoundSet = {"Reload Bolt Large Rifle I"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "M82A2",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 200,
	
	FrameStart = 1,
	FrameIntermediate = 7,
	FrameEnd = 8,
	
	Calibers = "50BMG",
	MagazineType = {"Straight"},
	
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
	
	GunRattleType = "Large",

	MechSound = {"Fire Mech Very Large Semi Rifle A", "Fire Mech Very Large Semi Rifle C"},
	PreSound = {"Fire Pre Very Large Semi Rifle A"},
	PreDelay = {50, 80},
	
	ReloadSoundSet = {"Reload Bolt Very Large Rifle A", "Reload Bolt Very Large Rifle B"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSniperData.Receivers[#ScrappersSniperData.Receivers + 1] = {
	Name = "Zijiang Bigun",
	Cost = 5	,
	Mass = 4,
	Mode = 1,
	RateOfFire = 200,
	
	FrameStart = 1,
	FrameIntermediate = 7,
	FrameEnd = 8,
	
	Calibers = "50BMG",
	MagazineType = {"Straight"},
	
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
	
	GunRattleType = "Large",

	MechSound = "Fire Mech Very Large Semi Rifle B",
	PreSound = {"Fire Pre Very Large Semi Rifle A"},
	PreDelay = {80, 120},
	
	ReloadSoundSet = {"Reload Bolt Very Large Rifle A", "Reload Bolt Very Large Rifle B"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSniperData.Magazines = {}

-- 76251 mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 10,
	Calibers = "762x51",
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle E", "Reload Magazine Large Rifle G"}
}
-- 76251 Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 10,
	Calibers = {{"762x51", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Rifle Single Round A", "Reload RoundLoad Medium Rifle Single Round B"}
}
-- 76251 Rounds + stripper
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 10,
	Calibers = {{"762x51", Cost = 0}},
	
	Type = "Stripper",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Rifle Stripper A", "Reload RoundLoad Medium Rifle Stripper B"}
}

-- 76254 mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 2,
	RoundCount = 5,
	Calibers = "762x54",
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle E", "Reload Magazine Large Rifle G"}
}
-- 76254 mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 10,
	Calibers = "762x54",
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle H"}
}
-- 76254 Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"762x54", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Rifle Single Round A", "Reload RoundLoad Medium Rifle Single Round B", "Reload RoundLoad Medium Rifle Single Round C"}
}
-- 76254 Rounds + stripper
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"762x54", Cost = 0}},
	
	Type = "Stripper",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Rifle Stripper A", "Reload RoundLoad Medium Rifle Stripper B", "Reload RoundLoad Medium Rifle Stripper C"}
}

-- 3006 mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 5,
	Calibers = "3006",
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle E", "Reload Magazine Large Rifle G"}
}
-- 3006 Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"3006", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Large Rifle Single Round A", "Reload RoundLoad Large Rifle Single Round B", "Reload RoundLoad Large Rifle Single Round C"}
}
-- 3006 Rounds + stripper
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"3006", Cost = 0}},
	
	Type = "Stripper",
	
	ReloadSoundSet = {"Reload RoundLoad Large Rifle Stripper A", "Reload RoundLoad Large Rifle Stripper B", "Reload RoundLoad Large Rifle Stripper C"}
}

-- 4570 mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 5,
	Calibers = "4570",
	
	SoundType = "Rifle Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle E", "Reload Magazine Large Rifle G"}
}
-- 4570 Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"4570", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Large Rifle Single Round A", "Reload RoundLoad Large Rifle Single Round B", "Reload RoundLoad Large Rifle Single Round C"}
}
-- 4570 Rounds for lever actions!
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"4570", Cost = 0}},
	
	Type = "SideRoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Rifle Single Round D"}
}
-- 4570 Rounds + stripper
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"4570", Cost = 0}},
	
	Type = "Stripper",
	
	ReloadSoundSet = {"Reload RoundLoad Large Rifle Stripper A", "Reload RoundLoad Large Rifle Stripper B", "Reload RoundLoad Large Rifle Stripper C"}
}

-- 50BMG mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 5,
	Calibers = "50BMG",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Very Large Rifle A", "Reload Magazine Very Large Rifle B"}
}

-- 50BMG mag
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 7,
	Calibers = "50BMG",
	
	SoundType = "Large Metal",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Very Large Rifle C"}
}

-- 50BMG Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"50BMG", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = "Reload RoundLoad Very Large Rifle Single Round A"
}
-- 50BMG Rounds + stripper
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"50BMG", Cost = 0}},
	
	Type = "Stripper",
	
	ReloadSoundSet = "Reload RoundLoad Very Large Rifle Stripper A"
}
-- 950JDJ Rounds
ScrappersSniperData.Magazines[#ScrappersSniperData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 1,
	Calibers = {{"950JDJ", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = "Reload RoundLoad Very Large Rifle Single Round B"
}


ScrappersSniperData.Barrels = {}
-- 000
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 001
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 002
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 003
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 3,
	Cost = 0,
	Length = 6,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 004
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 4,
	Cost = 0,
	Length = 8,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 005
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 5,
	Cost = 0,
	Length = 8,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 006
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 6,
	Length = 9,
	Density = ScrappersSniperData.BarrelAlloyLight
}
-- 007
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 7,
	Length = 7,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 008
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 8,
	Length = 8,
	Density = ScrappersSniperData.BarrelAlloyLight
}
-- 009
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 9,
	Length = 7,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 010
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 10,
	Length = 15,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 011
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 11,
	Length = 14,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 012
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 12,
	Length = 18,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 013
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 13,
	Length = 16,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 014
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 14,
	Length = 15,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 015
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 15,
	Length = 16,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 016
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 16,
	Length = 14,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 017
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 17,
	Length = 16,
	Density = ScrappersSniperData.BarrelAlloyLight
}
-- 018
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 18,
	Length = 12,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 019
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 19,
	Length = 17,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}
-- 020
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 20,
	Length = 9,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 021
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 21,
	Length = 12,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 022
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 22,
	Length = 10,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 023
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 23,
	Length = 8,
	Density = ScrappersSniperData.BarrelAlloyLight
}
-- 024
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 24,
	Length = 12,
	Density = ScrappersSniperData.BarrelAlloyLight
}
-- 025
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 25,
	Length = 7,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 026
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 26,
	Length = 10,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 027
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 27,
	Length = 8,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 028
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 28,
	Length = 11,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 029
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 29,
	Length = 17,
	Density = ScrappersSniperData.BarrelAlloyMedium
}
-- 030
ScrappersSniperData.Barrels[#ScrappersSniperData.Barrels + 1] = {
	Frame = 30,
	Length = 13,
	Density = ScrappersSniperData.BarrelAlloyHeavy
}


ScrappersSniperData.BarrelMods = {}
-- 000
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 0,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 001
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 1,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 002
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 2,
	Cost = 2,
	Length = 4,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUpDown,
	MuzzleFlash = "Scrapper Muzzle Flash Up Down"
}
-- 003
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 3,
	Cost = 2,
	Length = 5,
	RecoilReduction = 0.02,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXUp,
	MuzzleFlash = "Scrapper Muzzle Flash Up"
}
-- 004
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 4,
	Cost = 4,
	Length = 6,
	RecoilReduction = 0.075,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 005
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 5,
	Cost = 3,
	Length = 5,
	RecoilReduction = 0.05,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}
-- 006
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 6,
	Cost = 1,
	Length = 6,
	IsSupressor = true
}
-- 007
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 7,
	Cost = 1,
	Length = 7,
	IsSupressor = true
}
-- 008
ScrappersSniperData.BarrelMods[#ScrappersSniperData.BarrelMods + 1] = {
	Frame = 8,
	Cost = 1,
	Length = 10,
	IsSupressor = true
}


ScrappersSniperData.Foregrips = {}
-- 000
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 0,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 001
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 1,
	Length = 11,
	Mass = ScrappersSniperData.GripHeavy,
	Quality = ScrappersSniperData.QualityGood
}
-- 002
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 2,
	Length = 9,
	Mass = ScrappersSniperData.GripLight,
	Quality = ScrappersSniperData.QualityGood
}
-- 003
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 3,
	Length = 7,
	Mass = ScrappersSniperData.GripHeavy,
	Quality = ScrappersSniperData.QualityGood
}
-- 004
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 4,
	Length = 8,
	Mass = ScrappersSniperData.GripLight,
	Quality = ScrappersSniperData.QualityBad
}
-- 005
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 5,
	Length = 8,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 006
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 6,
	Length = 8,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 007
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 7,
	Length = 10,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 008
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 8,
	Length = 4,
	Mass = ScrappersSniperData.GripLight,
	Quality = ScrappersSniperData.QualityBad
}
-- 009
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 9,
	Length = 6,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 010
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 10,
	Length = 12,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 011
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 11,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 012
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 12,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 013
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 13,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 014
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 14,
	Length = 6,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 015
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 15,
	Length = 5,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 016
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 16,
	Length = 6,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 017
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 17,
	Length = 8,
	Mass = ScrappersSniperData.GripHeavy,
	Quality = ScrappersSniperData.QualityAverage
}
-- 018
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 18,
	Length = 12,
	Mass = ScrappersSniperData.GripHeavy,
	Quality = ScrappersSniperData.QualityAverage
}
-- 019
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 19,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 020
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 20,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 021
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 21,
	Length = 9,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 022
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 22,
	Length = 10,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 023
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 23,
	Length = 6,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 024
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 24,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 025
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 25,
	Length = 9,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 026
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 26,
	Length = 5,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 027
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 27,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 028
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 28,
	Length = 7,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 029
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 29,
	Length = 5,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 030
ScrappersSniperData.Foregrips[#ScrappersSniperData.Foregrips + 1] = {
	Frame = 30,
	Length = 8,
	Mass = ScrappersSniperData.GripMedium,
	Quality = ScrappersSniperData.QualityAverage
}


ScrappersSniperData.Stocks = {}
-- 000
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 0,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityBad
}
-- 001
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 1,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityAverage
}
-- 002
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 2,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityAverage
}
-- 003
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 3,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 004
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 4,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 005
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 5,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 006
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 6,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 007
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 7,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 008
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 8,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityGood
}
-- 009
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 9,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityAverage
}
-- 010
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 10,
	Mass = ScrappersSniperData.StockLight,
	Quality = ScrappersSniperData.QualityGood
}
-- 011
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 11,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 012
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 12,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 013
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 13,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 014
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 14,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 015
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 15,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 016
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 16,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 017
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 17,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityBad
}
-- 018
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 18,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}
-- 019
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 19,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 020
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 20,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityGood
}
-- 021
ScrappersSniperData.Stocks[#ScrappersSniperData.Stocks + 1] = {
	Frame = 21,
	Mass = ScrappersSniperData.StockMedium,
	Quality = ScrappersSniperData.QualityAverage
}


ScrappersSniperData.Sights = {}
-- 000
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 0,
	Cost = 2,
	SharpLength = 200
}
-- 001
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 1,
	Cost = 2,
	SharpLength = 200
}
-- 002
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 2,
	Cost = 2,
	SharpLength = 200
}
-- 003
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 3,
	Cost = 1,
	SharpLength = 100
}
-- 004
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 4,
	Cost = 1,
	SharpLength = 100
}
-- 005
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 5,
	Cost = 1,
	SharpLength = 100
}
-- 006
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 6,
	Cost = 1,
	SharpLength = 100
}
-- 007
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 7,
	Cost = 0,
	SharpLength = 65
}
-- 008
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 8,
	Cost = 0,
	SharpLength = 65
}
-- 009
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 9,
	Cost = 0,
	SharpLength = 65
}
-- 010
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 10,
	Cost = 0,
	SharpLength = 65
}
-- 011
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 11,
	Cost = 0,
	SharpLength = 65
}
-- 012
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 12,
	Cost = 0,
	SharpLength = 65
}
-- 013
ScrappersSniperData.Sights[#ScrappersSniperData.Sights + 1] = {
	Frame = 13,
	Cost = 0,
	SharpLength = 65
}

function Create(self)

	
	self.Budget = ScrappersSniperData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = false -- Force caliber sound picking function to only use semi sounds 
	
	self.recoilMode = 2

	local presetName = "Scrapper Assault Rifle"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersSniperData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersSniperData.Magazines)
	ScrappersGunFunctions.PickBarrel(self, ScrappersSniperData.Barrels, presetName.." Barrel")
	-- Optional
	ScrappersGunFunctions.PickForegrip(self, ScrappersSniperData.Foregrips, presetName.." Foregrip")
	ScrappersGunFunctions.PickStock(self, ScrappersSniperData.Stocks, presetName.." Stock")
	if math.random(0, 100) < 50 then -- 50% chance
		ScrappersGunFunctions.PickSight(self, ScrappersSniperData.Sights, presetName.." Sight")
	end
	if math.random(0, 100) < 40 then -- 40% chance
		ScrappersGunFunctions.PickBarrelMod(self, ScrappersSniperData.BarrelMods, presetName.." Barrel Mod")
	end
	
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
end