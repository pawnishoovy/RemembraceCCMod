--package.path = package.path..";"..ScrappersData.Module .."/?.lua";
--require("Devices/Weapons/Handheld/GunReloads")

ScrappersPistolData = {}

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
ScrappersPistolData.BarrelAlloyLight = 0.075
ScrappersPistolData.BarrelAlloyMedium = 0.2
ScrappersPistolData.BarrelAlloyHeavy = 0.4

ScrappersPistolData.StockLight = 0.6
ScrappersPistolData.StockMedium = 1.25
ScrappersPistolData.StockHeavy = 2.15

ScrappersPistolData.GripLight = 0.5
ScrappersPistolData.GripMedium = 1.0
ScrappersPistolData.GripHeavy = 2.5

ScrappersPistolData.QualityBad = 1
ScrappersPistolData.QualityAverage = 2
ScrappersPistolData.QualityGood = 3

ScrappersPistolData.Budget = 15


ScrappersPistolData.Receivers = {}

ScrappersPistolData.Receivers[#ScrappersPistolData.Receivers + 1] = {
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
	
	GunRattleType = 1,
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = "Fire Pre Large Pistol A",
	PreDelay = 50,
	
	ReloadSoundSet = "Reload Bolt Large Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersPistolData.Receivers[#ScrappersPistolData.Receivers + 1] = {
	Name = "Glock Semi",
	Cost = 8,
	Mass = 1.0,
	Mode = 1,
	RateOfFire = 800,
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
	
	GunRattleType = 1,
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol C",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersPistolData.Receivers[#ScrappersPistolData.Receivers + 1] = {
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
	
	GunRattleType = 1,
	
	MechSound = {"Fire Mech Medium Pistol A", "Fire Mech Medium Pistol B"},
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Medium Pistol C",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersPistolData.Receivers[#ScrappersPistolData.Receivers + 1] = {
	Name = "Custom A",
	Cost = 9,
	Mass = 1.0,
	Mode = 2,
--	BurstCount = {},
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
	
	GunRattleType = 1,
	
	MechSound = "Fire Mech Medium Pistol C",
	PreSound = nil,
	PreDelay = 0,
	
	ReloadSoundSet = "Reload Bolt Large Pistol B",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersPistolData.Receivers[#ScrappersPistolData.Receivers + 1] = {
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
	
	GunRattleType = 1,
	
	MechSound = "Fire Mech Very Large Pistol A",
	PreSound = "Fire Pre Very Large Pistol A",
	PreDelay = {50, 75, 100},
	
	ReloadSoundSet = "Reload Bolt Very Large Pistol A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersPistolData.Magazines = {}
-- -- Grip Straight
-- ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	-- Frame = 1,
	-- Cost = 0,
	-- RoundCount = 6,
	-- Calibers = ScrappersData.Ammunition.List,
	
	-- SoundType = "Pistol Metal",
	-- Type = "GripStraight",
	
	-- ReloadSoundSet = "Reload Magazine Medium Pistol A"
-- }
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {7,8,9},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Small Pistol A"
}
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {7},
	Calibers = {{"46x30", Cost = 0}, {"45ACP", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Large Pistol B"
}
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 3,
	Cost = 3,
	RoundCount = {14,16,18},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Medium Pistol C"
}
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 4,
	Cost = 1,
	RoundCount = {10,11,12},
	Calibers = {{"9x18", Cost = 0}, {"9x19", Cost = 0}, {"22LR", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Medium Pistol B"
}
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 5,
	Cost = 5,
	RoundCount = {15,18,22},
	Calibers = {{"46x30", Cost = 0}, {"45ACP", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Large Pistol B"
}
-- Grip Straight
ScrappersPistolData.Magazines[#ScrappersPistolData.Magazines + 1] = {
	Frame = 2,
	Cost = 0,
	RoundCount = {8},
	Calibers = {{"50AE", Cost = 0}},
	
	SoundType = "Pistol Metal",
	Type = "GripStraight",
	
	ReloadSoundSet = "Reload Magazine Very Large Pistol A"
}

ScrappersPistolData.Barrels = {}

ScrappersPistolData.BarrelMods = {}

function Create(self)

	
	self.Budget = ScrappersPistolData.Budget + math.random(0,7)
	
	---- Randomization
	self.soundFireForceFullAuto = false -- Force caliber sound picking function to only use full auto sounds 
	self.soundFireForceSemi = true -- Force caliber sound picking function to only use semi sounds 
	
	local presetName = "Scrapper Pistol"
	self.magazinePresetName = presetName.." Magazine"
	
	ScrappersGunFunctions.PickReceiver(self, ScrappersPistolData.Receivers)
	ScrappersGunFunctions.PickMagazine(self, ScrappersPistolData.Magazines)
	ScrappersGunFunctions.SetupReloadSoundSets(self)
	
	-- Final tacticoolness
	if (not self.Receiver.ReleaseNotAllowed) and self.Budget > 0 and math.random(0, 100) < 50 then
		self.boltRelease = true;
	end
	
end