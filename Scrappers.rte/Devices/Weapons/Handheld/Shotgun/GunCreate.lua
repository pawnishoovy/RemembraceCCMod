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
	Name = "M770",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Pump = true,
	Magtube = true,
	MagtubeOffset = Vector(0,1),
	
	Calibers = "20Ga",
	MagazineType = {"Straight", "RoundLoad"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -2),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",

	MechSound = {"Fire Mech Large Single Rifle B"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C"},
	PreDelay = {20, 40},
	
	ReloadSoundSet = {"Reload Bolt Medium Shotgun A", "Reload Bolt Medium Shotgun C"},
	
	OnCreate = ScrappersReloadsData.SingleBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleBreechUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "TOZ-194",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Pump = true,
	Magtube = true,
	MagtubeOffset = Vector(0,1),
	
	Calibers = {"20Ga", "12Ga"},
	MagazineType = {"Straight", "RoundLoad"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 1),
	EjectionOffset = Vector(1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(5, -2),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",

	MechSound = {"Fire Mech Large Single Rifle B"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle D"},
	PreDelay = {40, 60},
	
	ReloadSoundSet = {"Reload Bolt Medium Shotgun B", "Reload Bolt Large Shotgun C"},
	
	OnCreate = ScrappersReloadsData.SingleBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleBreechUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "M870",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 250,
	
	FrameStart = 4,
	FrameEnd = 7,
	
	Pump = true,
	Magtube = true,
	MagtubeOffset = Vector(0,2),
	
	Calibers = "12Ga",
	MagazineType = {"RoundLoad"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(5, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",

	MechSound = {"Fire Mech Large Single Rifle B"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C"},
	PreDelay = {30, 60},
	
	ReloadSoundSet = "Reload Bolt Large Shotgun A",
	
	OnCreate = ScrappersReloadsData.SingleBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleBreechUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "Tuber",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 200,
	
	FrameStart = 4,
	FrameEnd = 7,
	
	Pump = true,
	Magtube = true,
	MagtubeOffset = Vector(0,2),
	
	Calibers = "12Ga",
	MagazineType = {"SpecialTube"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(5, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",

	MechSound = {"Fire Mech Large Single Rifle B"},
	PreSound = {"Fire Pre Large Single Rifle D"},
	PreDelay = {50, 75},
	
	ReloadSoundSet = "Reload Bolt Large Shotgun B",
	
	OnCreate = ScrappersReloadsData.DP12Create,
	OnUpdate = ScrappersReloadsData.DP12Update
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "M4 Benelli",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 300,
	
	FrameStart = 8,
	FrameEnd = 11,
	
	Pump = false,
	Magtube = true,
	MagtubeOffset = Vector(0,2),
	
	Calibers = "12Ga",
	MagazineType = {"RoundLoad"},
	SelfLoading = true,
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",

	MechSound = {"Fire Mech Large Semi Rifle F"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C", "Fire Pre Large Single Rifle D"},
	PreDelay = {25, 45},
	
	ReloadSoundSet = "Reload Bolt Large Rifle K",
	
	OnCreate = ScrappersReloadsData.SingleNoBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleNoBreechUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "Saiga-20K",
	Cost = 3,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 300,
	
	FrameStart = 8,
	FrameEnd = 11,
	
	Calibers = "20Ga",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",

	MechSound = {"Fire Mech Large Semi Rifle F"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C", "Fire Pre Large Single Rifle D"},
	PreDelay = {25, 45},
	
	ReloadSoundSet = "Reload Bolt Large Rifle M",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "Saiga-12K",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 300,
	
	FrameStart = 8,
	FrameEnd = 11,
	
	Calibers = "12Ga",
	MagazineType = {"Straight", "Curved"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumMetal",

	MechSound = {"Fire Mech Large Semi Rifle F"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C", "Fire Pre Large Single Rifle D"},
	PreDelay = {25, 45},
	
	ReloadSoundSet = "Reload Bolt Large Rifle M",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "M2 Prenelli",
	Cost = 4,
	Mass = 3.5,
	Mode = 1,
	RateOfFire = 350,
	
	FrameStart = 8,
	FrameEnd = 11,
	
	Pump = false,
	Magtube = true,
	MagtubeOffset = Vector(0,2),
	
	Calibers = "20Ga",
	MagazineType = {"RoundLoad"},
	SelfLoading = true,
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(5, 0),
	EjectionOffset = Vector(3.5, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(3, -3),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-4, -1),
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "MediumPoly",

	MechSound = {"Fire Mech Medium Semi Rifle B"},
	PreSound = {"Fire Pre Large Single Rifle B", "Fire Pre Large Single Rifle C"},
	PreDelay = {25, 45},
	
	ReloadSoundSet = "Reload Bolt Large Rifle L",
	
	OnCreate = ScrappersReloadsData.SingleNoBreechCreate,
	OnUpdate = ScrappersReloadsData.SingleNoBreechUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "AA-20",
	Cost = 2,
	Mass = 3,
	Mode = 0,
	RateOfFire = 400,
	
	FrameStart = 12,
	FrameEnd = 14,
	FrameChargeStart = 15,
	FrameChargeIntermediate = 17, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 19,
	
	Calibers = "20Ga",
	MagazineType = {"Straight"},
	
	JointOffset = Vector(-4, 3),
	SupportOffset = Vector(4, 0),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -3),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, -1),
	MagazineOffset = Vector(2, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "Large",
	
	MechSound = "Fire Mech Medium Rifle H",
	PreSound = nil,
	PreDelay = 0,
	
	BoltSound = "Fire Pre Medium Rifle F",
	BoltDelay = {60, 75},
	
	BoltDropSound = "Bolt Drop D",
	
	ReloadSoundSet = {"Reload Bolt Medium Rifle J"},
	
	OnCreate = ScrappersReloadsData.OpenBoltMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.OpenBoltMagazineFedUpdate
}

ScrappersShotgunData.Receivers[#ScrappersShotgunData.Receivers + 1] = {
	Name = "AA-12",
	Cost = 2,
	Mass = 3.5,
	Mode = 0,
	RateOfFire = 350,
	
	FrameStart = 20,
	FrameEnd = 23,
	FrameChargeStart = 24,
	FrameChargeIntermediate = 27, -- boltback, handle back, before handle goes forward
	FrameChargeEnd = 30,
	
	Calibers = "12Ga",
	MagazineType = {"Straight"},
	
	JointOffset = Vector(-4, 3),
	SupportOffset = Vector(4, -1),
	EjectionOffset = Vector(1, -0.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 170,
	
	SightOffset = Vector(0, -4),
	BarrelOffset = Vector(4, -2),
	StockOffset = Vector(-5, -2),
	MagazineOffset = Vector(2, -1),
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

-- 20Ga Rounds
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 10,
	Calibers = {{"20Ga", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Medium Shotgun Single Round A", "Reload RoundLoad Medium Shotgun Single Round B"}
}

-- 12Ga Rounds
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 7,
	Calibers = {{"12Ga", Cost = 0}},
	
	Type = "RoundLoad",
	
	ReloadSoundSet = {"Reload RoundLoad Large Shotgun Single Round B", "Reload RoundLoad Large Shotgun Single Round C", "Reload RoundLoad Large Shotgun Single Round D"}
}

-- 12Ga Special Tube
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 8,
	Calibers = {{"12Ga", Cost = 0}},
	
	Type = "SpecialTube",
	
	ReloadSoundSet = {"Reload RoundLoad Large Shotgun Single Round A"}
}

-- 20Ga small free mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 0,
	RoundCount = 5,
	Calibers = "20Ga",
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle Q"}
}

-- 20Ga mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 8,
	Calibers = "20Ga",
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle L", "Reload Magazine Large Rifle O", "Reload Magazine Large Rifle Q"}
}

-- 20Ga small free curved mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 0,
	RoundCount = 5,
	Calibers = "20Ga",
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle R"}
}

-- 20Ga curved mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 8,
	Calibers = "20Ga",
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle R"}
}

-- 20Ga small drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 20,
	Calibers = "20Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle M", "Reload Magazine Large Rifle P"}
}

-- 20Ga drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 4,
	RoundCount = 32,
	Calibers = "20Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle N"}
}

-- 12Ga small free mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 0,
	RoundCount = 5,
	Calibers = "12Ga",
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle I"}
}

-- 12Ga mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 8,
	Calibers = "12Ga",
	
	SoundType = "Rifle Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle I"}
}

-- 12Ga small free curved mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 0,
	RoundCount = 5,
	Calibers = "12Ga",
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle R"}
}

-- 12Ga curved mag
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 1,
	RoundCount = 8,
	Calibers = "12Ga",
	
	SoundType = "Rifle Metal",
	Type = "Curved",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle R"}
}

-- 12Ga small drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 20,
	Calibers = "12Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle J"}
}

-- 12Ga drum
ScrappersShotgunData.Magazines[#ScrappersShotgunData.Magazines + 1] = {
	Frame = 1,
	Cost = 4,
	RoundCount = 32,
	Calibers = "12Ga",
	
	SoundType = "Large Poly",
	Type = "Straight",
	
	ReloadSoundSet = {"Reload Magazine Large Rifle K"}
}


ScrappersShotgunData.Barrels = {}
-- 000
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 001
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 1,
	Length = 12,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 002
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 2,
	Length = 15,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 003
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 3,
	Length = 7,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 004
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 4,
	Length = 10,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 005
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 5,
	Length = 13,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 006
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 6,
	Length = 8,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 007
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 7,
	Length = 10,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 008
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 8,
	Length = 12,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyLight
}
-- 009
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 9,
	Cost = 0,
	Length = 3,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 010
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 10,
	Length = 7,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 011
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 11,
	Length = 10,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyHeavy
}
-- 012
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 12,
	Length = 9,
	Magtube = false,
	Density = ScrappersShotgunData.BarrelAlloyMedium
}
-- 013
ScrappersShotgunData.Barrels[#ScrappersShotgunData.Barrels + 1] = {
	Frame = 13,
	Length = 7,
	Magtube = true,
	Density = ScrappersShotgunData.BarrelAlloyMedium
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
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 001
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 1,
	Length = 8,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityGood
}
-- 002
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 2,
	Length = 6,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityGood
}
-- 003
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 3,
	Length = 5,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityGood
}
-- 004
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 4,
	Length = 6,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityBad
}
-- 005
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 5,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 006
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 6,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 007
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 7,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 008
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 8,
	Length = 6,
	Mass = ScrappersShotgunData.GripLight,
	Quality = ScrappersShotgunData.QualityBad
}
-- 009
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 9,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 010
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 10,
	Length = 7,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 011
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 11,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 012
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 12,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 013
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 13,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 014
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 14,
	Length = 8,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 015
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 15,
	Length = 8,
	Mass = ScrappersShotgunData.GripHeavy,
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
	Length = 6,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 018
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 18,
	Length = 6,
	Mass = ScrappersShotgunData.GripHeavy,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 019
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 19,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 020
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 20,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityGood
}
-- 021
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 21,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 022
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 22,
	Length = 5,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityBad
}
-- 023
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 23,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 024
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 24,
	Length = 6,
	Mass = ScrappersShotgunData.GripMedium,
	Quality = ScrappersShotgunData.QualityAverage
}
-- 025
ScrappersShotgunData.Foregrips[#ScrappersShotgunData.Foregrips + 1] = {
	Frame = 25,
	Length = 5,
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
	
	self.recoilMode = 1
	
	local presetName = "Scrapper Shotgun"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersShotgunData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersShotgunData.Magazines)
	ScrappersGunFunctions.PickBarrel(self, ScrappersShotgunData.Barrels, presetName.." Barrel")
	-- Optional
	ScrappersGunFunctions.PickForegrip(self, ScrappersShotgunData.Foregrips, presetName.." Foregrip")
	ScrappersGunFunctions.PickStock(self, ScrappersShotgunData.Stocks, presetName.." Stock")
	if math.random(0, 100) < 30 then -- 30% chance
		ScrappersGunFunctions.PickSight(self, ScrappersShotgunData.Sights, presetName.." Sight")
	end
	if math.random(0, 100) < 20 then -- 20% chance
		ScrappersGunFunctions.PickBarrelMod(self, ScrappersShotgunData.BarrelMods, presetName.." Barrel Mod")
	end
	
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
	self:AddScript("Scrappers.rte/Devices/Weapons/Handheld/GunUpdate.lua")
	
end