--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersSidearmData = {}

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
ScrappersSidearmData.BarrelAlloyLight = 0.075
ScrappersSidearmData.BarrelAlloyMedium = 0.2
ScrappersSidearmData.BarrelAlloyHeavy = 0.4

ScrappersSidearmData.StockLight = 0.6
ScrappersSidearmData.StockMedium = 1.25
ScrappersSidearmData.StockHeavy = 2.15

ScrappersSidearmData.GripLight = 0.5
ScrappersSidearmData.GripMedium = 1.0
ScrappersSidearmData.GripHeavy = 2.5

ScrappersSidearmData.QualityBad = 1
ScrappersSidearmData.QualityAverage = 2
ScrappersSidearmData.QualityGood = 3

ScrappersSidearmData.Budget = 15


ScrappersSidearmData.ReceiversPistols = {}
ScrappersSidearmData.ReceiversRevolvers = {}

--- PISTOLS

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "M1911",
	Cost = 6,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 600,
	IntegratedBarrelLength = 10,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "45ACP",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 100,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Medium Pistol D",
	PreSound = "Fire Pre Large Pistol A",
	PreDelay = 50,
	
	ReloadSoundSet = {"Reload Bolt Large Pistol C", "Reload Bolt Medium Pistol E"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Browning HP",
	Cost = 6,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 600,
	IntegratedBarrelLength = 10,
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 100,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Medium Pistol D",
	PreSound = "Fire Pre Large Pistol A",
	PreDelay = 50,
	
	ReloadSoundSet = {"Reload Bolt Medium Pistol E"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Glock Semi",
	Cost = 8,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 750,
	IntegratedBarrelLength = 10,
	
	FrameStart = 4,
	FrameEnd = 6,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 100,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallPoly",
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol C",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Glock Auto",
	Cost = 10,
	Mass = 1.0,
	Mode = 0,
	RateOfFire = {1100, 1200},
	IntegratedBarrelLength = 10,
	
	FrameStart = 7,
	FrameEnd = 9,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 90,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallPoly",
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol C",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Hornet",
	Cost = 9,
	Mass = 1.0,
	Mode = 2,
	RateOfFire = 900,
	IntegratedBarrelLength = 5,
	
	FrameStart = 10,
	FrameEnd = 12,
	
	Calibers = "46x30",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 90,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Medium Pistol C",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Large Pistol B",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Deagle",
	Cost = 13,
	Mass = 2.0,
	Mode = 1,
	RateOfFire = 500,
	IntegratedBarrelLength = 10,
	
	FrameStart = 13,
	FrameEnd = 15,
	
	Calibers = "50AE",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 110,
	
	SightOffset = Vector(-2, -2),
	BarrelOffset = Vector(6, -2),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Very Large Pistol A",
	PreSound = "Fire Pre Very Large Pistol A",
	PreDelay = {50, 75, 100},
	
	ReloadSoundSet = "Reload Bolt Very Large Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Chonker",
	Cost = 10,
	Mass = 1.6,
	Mode = 1,
	RateOfFire = 500,
	IntegratedBarrelLength = 15,
	
	FrameStart = 16,
	FrameEnd = 18,
	
	Calibers = "45ACP",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 110,
	
	SightOffset = Vector(-2, -2),
	BarrelOffset = Vector(5, -2),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Large Pistol B",
	PreSound = "Fire Pre Large Pistol A",
	PreDelay = {50, 75},
	
	ReloadSoundSet = "Reload Bolt Very Large Pistol A", -- TODO: pawnis replace it
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Ace",
	Cost = 9,
	Mass = 1.2,
	Mode = 0,
	BurstCount = 2,
	RateOfFire = 700,
	IntegratedBarrelLength = 10,
	
	FrameStart = 19,
	FrameEnd = 21,
	
	Calibers = "45ACP",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 150,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = "Fire Pre Medium Pistol A", -- TODO: pawnis replace it
	PreDelay = 50,
	
	ReloadSoundSet = "Reload Bolt Large Pistol A", -- TODO: pawnis replace it
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Small-Ace",
	Cost = 8,
	Mass = 1.2,
	Mode = 0,
	BurstCount = 2,
	RateOfFire = 700,
	IntegratedBarrelLength = 10,
	
	FrameStart = 19,
	FrameEnd = 21,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 150,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = "Fire Pre Medium Pistol A",
	PreDelay = 50,
	
	ReloadSoundSet = {"Reload Bolt Medium Pistol F", "Reload Bolt Medium Pistol E"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Beretta 93R",
	Cost = 9,
	Mass = 1.15,
	Mode = 2,
	RateOfFire = 1100,
	IntegratedBarrelLength = 7,
	
	FrameStart = 22,
	FrameEnd = 24,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(1, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 100,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Medium Pistol B",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Large Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Beretta M9",
	Cost = 6,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 700,
	IntegratedBarrelLength = 12,
	
	FrameStart = 25,
	FrameEnd = 27,
	
	Calibers = "9x19",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 110,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(5, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "USP Match",
	Cost = 11,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 700,
	IntegratedBarrelLength = 11,
	
	FrameStart = 28,
	FrameEnd = 30,
	
	Calibers = "45ACPSpecial",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 120,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = {"Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Large Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Makarov",
	Cost = 3,
	Mass = 0.6,
	Mode = 1,
	RateOfFire = 700,
	IntegratedBarrelLength = 8.5,
	
	FrameStart = 31,
	FrameEnd = 33,
	
	Calibers = "9x18",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 90,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(3, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(5, 0),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Small Pistol A",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = {"Reload Bolt Small Pistol A", "Reload Bolt Small Pistol B"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Spider",
	Cost = 4,
	Mass = 0.6,
	Mode = 1,
	RateOfFire = 650,
	IntegratedBarrelLength = 10,
	
	FrameStart = 34,
	FrameEnd = 36,
	
	Calibers = "9x18",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 100,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(4, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(3, 0),
	
	GunRattleType = "VerySmallPoly",
	
	MechSound = "Fire Mech Small Pistol A",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = {"Reload Bolt Small Pistol A", "Reload Bolt Small Pistol B"},
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSidearmData.ReceiversPistols[#ScrappersSidearmData.ReceiversPistols + 1] = {
	Name = "Lady Auto",
	Cost = 4,
	Mass = 0.4,
	Mode = 0,
	RateOfFire = 700,
	IntegratedBarrelLength = 6,
	
	FrameStart = 37,
	FrameEnd = 39,
	
	Calibers = "9x18",
	MagazineType = "GripStraight",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-1, -1.5),
	EjectionVelocity = Vector(-6, -3),
	SharpLength = 70,
	
	SightOffset = Vector(-2, -1),
	BarrelOffset = Vector(2, -1),
	StockOffset = Vector(-6, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(3, 0),
	
	GunRattleType = "VerySmallPoly",
	
	MechSound = "Fire Mech Small Pistol A",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

-- REVOLVERS

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Colt Python",
	Cost = 6,
	Mass = 1.1,
	Mode = 1,
	RateOfFire = 300,
	IntegratedBarrelLength = 12,
	
	FrameStart = 40,
	FrameEnd = 41,
	FrameOpenStart = 41,
	FrameOpenEnd = 43,
	FrameEjectStart = 43,
	FrameEjectEnd = 45,
	
	Calibers = "357",
	MagazineType = {"RevolverSpeedloaderSix", "RevolverSix"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-2, 1),
	EjectionVelocity = Vector(-3, 0),
	SharpLength = 140,
	
	SightOffset = Vector(-2, -4),
	BarrelOffset = Vector(6, -1.5),
	StockOffset = Vector(-5, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Scrappers Dummy Silence",
	PreSingleSound = "Fire Pre Medium Single Revolver A",
	PreSingleDelay = 30,
	PreDoubleSound = "Fire Pre Medium Revolver A",
	PreDoubleDelay = 80,
	
	ReloadSoundSet = "Reload Bolt Medium Revolver A",
	
	OnCreate = ScrappersReloadsData.OpeningRevolverCreate,
	OnUpdate = ScrappersReloadsData.OpeningRevolverUpdate
}

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Mateba 6 Unica",
	Cost = 8,
	Mass = 1.35,
	Mode = 1,
	RateOfFire = 450,
	IntegratedBarrelLength = 12,
	
	FrameStart = 61,
	FrameEnd = 62,
	FrameOpenStart = 62,
	FrameOpenEnd = 64,
	FrameEjectStart = 64,
	FrameEjectEnd = 66,
	
	Calibers = "454",
	MagazineType = {"RevolverSpeedloaderSix", "RevolverSix"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-2, 1),
	EjectionVelocity = Vector(-3, 0),
	SharpLength = 140,
	
	SightOffset = Vector(-2, -4),
	BarrelOffset = Vector(7, -1),
	StockOffset = Vector(-5, 2),
	MagazineOffset = Vector(-4, 1),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Fire Mech Very Large Pistol B",
	PreSound = "Fire Pre Large Single Revolver A",
	PreDelay = 40,
	
	ReloadSoundSet = "Reload Bolt Medium Revolver C",
	
	OnCreate = ScrappersReloadsData.MatebaRevolverCreate,
	OnUpdate = ScrappersReloadsData.MatebaRevolverUpdate
}

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Single Action Army",
	Cost = 5,
	Mass = 1.4,
	Mode = 1,
	RateOfFire = 500,
	IntegratedBarrelLength = 13,
	
	FrameStart = 50,
	FrameEnd = 51,
	FrameOpenStart = 51,
	FrameOpenEnd = 52,
	FrameEjectStart = 52,
	FrameEjectEnd = 53,
	
	Calibers = "500SW",
	MagazineType = "SAA",
	
	JointOffset = Vector(-3, 2),
	SupportOffset = Vector(0, -5),
	StanceOffset =  Vector(8, 8),
	SharpStanceOffset =  Vector(10, 7),
	EjectionOffset = Vector(-0.5, -1),
	EjectionVelocity = Vector(-2, 0),
	SharpLength = 120,
	
	SightOffset = Vector(-4, -3),
	BarrelOffset = Vector(10, -2),
	StockOffset = Vector(-5, 2),
	MagazineOffset = Vector(0, 0),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Scrappers Dummy Silence",
	PreSound = "Fire Pre Medium Single Revolver A",
	PreDelay = 40,
	
	ReloadSoundSet = "Reload Bolt Unique Single Action Army",
	
	OnCreate = ScrappersReloadsData.SingleActionArmyRevolverCreate,
	OnUpdate = ScrappersReloadsData.SingleActionArmyRevolverUpdate,
	OnDetach = ScrappersReloadsData.SingleActionArmyRevolverDetach,
	OnAttach = ScrappersReloadsData.SingleActionArmyRevolverAttach
}

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Nu-Colt Multi Action Army",
	Cost = 5,
	Mass = 1.4,
	Mode = 1,
	RateOfFire = 250,
	IntegratedBarrelLength = 13,
	
	FrameStart = 46,
	FrameEnd = 47,
	FrameOpenStart = 47,
	FrameOpenEnd = 48,
	FrameEjectStart = 48,
	FrameEjectEnd = 49,
	
	Calibers = "500SW",
	MagazineType = "RevolverSix",
	
	JointOffset = Vector(-3, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-0.5, -1),
	EjectionVelocity = Vector(-2, 0),
	SharpLength = 120,
	
	SightOffset = Vector(-4, -3),
	BarrelOffset = Vector(10, -2),
	StockOffset = Vector(-5, 2),
	MagazineOffset = Vector(0, 0),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Scrappers Dummy Silence",
	PreSingleSound = "Fire Pre Medium Single Revolver A",
	PreSingleDelay = 40,
	PreDoubleSound = "Fire Pre Large Revolver A",
	PreDoubleDelay = 80,
	
	ReloadSoundSet = "Reload Bolt Large Revolver C",
	
	OnCreate = ScrappersReloadsData.GatedRevolverCreate,
	OnUpdate = ScrappersReloadsData.GatedRevolverUpdate
}

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Schofield",
	Cost = 6,
	Mass = 1.4,
	Mode = 1,
	RateOfFire = 250,
	IntegratedBarrelLength = 13,
	
	FrameStart = 67,
	FrameEnd = 68,
	
	Calibers = "44",
	MagazineType = {"RevolverSpeedloaderSix", "RevolverSix"},
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(2, 1),
	EjectionVelocity = Vector(-2, -3),
	SharpLength = 120,
	
	SightOffset = Vector(-2, -4),
	BarrelOffset = Vector(8, -2),
	StockOffset = Vector(-7, 1),
	MagazineOffset = Vector(0, 0),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Scrappers Dummy Silence",
	PreSingleSound = "Fire Pre Medium Single Revolver A",
	PreSingleDelay = 40,
	PreDoubleSound = "Fire Pre Large Revolver A",
	PreDoubleDelay = 80,
	
	ReloadSoundSet = "Reload Bolt Large Revolver B",
	
	BreakActionPart = "Scrapper Sidearm Schofield Part",
	BreakActionPartFrame = 0,
	BreakActionPartOffset = Vector(-1, 1),
	
	OnCreate = ScrappersReloadsData.BreakActionRevolverCreate,
	OnUpdate = ScrappersReloadsData.BreakActionRevolverUpdate
}

ScrappersSidearmData.ReceiversRevolvers[#ScrappersSidearmData.ReceiversRevolvers + 1] = {
	Name = "Big Frame Revolver",
	Cost = 8,
	Mass = 2.4,
	Mode = 1,
	RateOfFire = 160,
	IntegratedBarrelLength = 15,
	
	FrameStart = 54,
	FrameEnd = 56,
	FrameOpenStart = 56,
	FrameOpenEnd = 58,
	FrameEjectStart = 58,
	FrameEjectEnd = 60,
	
	Calibers = "4570",
	MagazineType = "RevolverFive",
	
	JointOffset = Vector(-4, 2),
	SupportOffset = Vector(-4, 2),
	EjectionOffset = Vector(-0, -0),
	EjectionVelocity = Vector(-3, 0),
	SharpLength = 120,
	
	SightOffset = Vector(4, -4),
	BarrelOffset = Vector(10, -2.5),
	StockOffset = Vector(-5, 2),
	MagazineOffset = Vector(0, 0),
	ModOffset = Vector(0, -1),
	
	GunRattleType = "VerySmallMetal",
	
	MechSound = "Scrappers Dummy Silence",
	PreSingleSound = "Fire Pre Very Large Single Revolver A",
	PreSingleDelay = 60,
	PreDoubleSound = "Fire Pre Very Large Revolver A",
	PreDoubleDelay = 170,
	
	ReloadSoundSet = "Reload Bolt Very Large Revolver A",
	
	OnCreate = ScrappersReloadsData.OpeningRevolverCreate,
	OnUpdate = ScrappersReloadsData.OpeningRevolverUpdate
}

-- SAWN OFF

-- OTHER

ScrappersSidearmData.Magazines = {}
-- -- Grip Straight
-- ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	-- Frame = 1,
	-- Cost = 0,
	-- RoundCount = 6,
	-- Calibers = ScrappersData.Ammunition.List,
	
	-- SoundType = "Pistol Metal",
	-- Type = "GripStraight",
	
	-- ReloadSoundSet = "Reload Magazine Medium Pistol A"
-- }
-- Six Speedloader
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 6,
	Calibers = {{"357", Cost = 0}, {"454", Cost = 1},},
	
	Type = "RevolverSpeedloaderSix",
	
	ReloadSoundSet = "Reload RoundLoad Medium Revolver Speedloader A"
}
-- Six SingleRound
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 1,
	RoundCount = 6,
	Calibers = {{"357", Cost = 0}, {"454", Cost = 0},},
	
	Type = "RevolverSix",
	
	ReloadSoundSet = "Reload RoundLoad Medium Revolver Single Round A"
}
-- Single Action Army
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 6,
	Calibers = {{"500SW", Cost = 0}},
	
	Type = "SAA",
	
	ReloadSoundSet = "Reload RoundLoad Unique Single Action Army Single Round"
}
-- Six SingleRound
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 6,
	Calibers = {{"44", Cost = 0}, {"454", Cost = 0}, {"500SW", Cost = 0}},
	
	Type = "RevolverSix",
	
	ReloadSoundSet = "Reload RoundLoad Large Revolver Single Round A"
}
-- Six Speedloader
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 1,
	RoundCount = 6,
	Calibers = {{"44", Cost = 0}, {"454", Cost = 1}, {"500SW", Cost = 1}},
	
	Type = "RevolverSpeedloaderSix",
	
	ReloadSoundSet = "Reload RoundLoad Large Revolver Speedloader A"
}
-- Five SingleRound
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Internal = true,
	Cost = 0,
	RoundCount = 5,
	Calibers = {{"4570", Cost = 0}},
	
	Type = "RevolverFive",
	
	ReloadSoundSet = "Reload RoundLoad Large Revolver Single Round B"
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {7,8,9},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Small Pistol A", "Reload Magazine Small Pistol B"}
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {7},
	Calibers = {{"46x30", Cost = 0}, {"45ACP", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Large Pistol C"
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 3,
	Cost = 3,
	RoundCount = {18,20,22},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Poly",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Large Pistol D", "Reload Magazine Medium Pistol F"}
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 4,
	Cost = 1,
	RoundCount = {10,11,12},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Medium Pistol B", "Reload Magazine Medium Pistol H"}
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 4,
	Cost = 1,
	RoundCount = {10,11,12},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}},
	
	SoundType = "Pistol Poly",
	Type = "GripStraight",
	
	ReloadSoundSet = {"Reload Magazine Medium Pistol G", "Reload Magazine Medium Pistol I", "Reload Magazine Medium Pistol E"}
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 5,
	Cost = 5,
	RoundCount = {15,18,22},
	Calibers = {{"46x30", Cost = 0}, {"45ACP", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Large Pistol D"
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {8},
	Calibers = "50AE",
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Very Large Pistol A"
}
-- Grip Straight
ScrappersSidearmData.Magazines[#ScrappersSidearmData.Magazines + 1] = {
	Frame = 4,
	Cost = 0,
	RoundCount = 12,
	Calibers = "45ACPSpecial",
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Large Pistol B"
}

ScrappersSidearmData.Barrels = {}

ScrappersSidearmData.BarrelMods = {}

function Create(self)

	
	self.Budget = ScrappersSidearmData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = true -- Force caliber sound picking function to only use semi sounds 
	
	local presetName = "Scrapper Sidearm"
	self.magazinePresetName = presetName.." Magazine"
	
	if math.random(0, 100) < 20 then
		ScrappersGunFunctions.PickReceiver(self, ScrappersSidearmData.ReceiversRevolvers)
	else
		ScrappersGunFunctions.PickReceiver(self, ScrappersSidearmData.ReceiversPistols)
	end
	ScrappersGunFunctions.PickMagazine(self, ScrappersSidearmData.Magazines)
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
	self:AddScript("Scrappers.rte/Devices/Weapons/Handheld/GunUpdate.lua")
	
end