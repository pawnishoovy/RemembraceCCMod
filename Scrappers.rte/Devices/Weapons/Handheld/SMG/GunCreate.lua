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

ScrappersSMGData.Budget = 20


ScrappersSMGData.Receivers = {}

ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "K6-92 Borz",
	Cost = 5,
	Mass = 2,
	Mode = 0,
	RateOfFire = {{800, Cost = 0}, {1000, Cost = 1}, {1200, Cost = 2}},
	
	FrameStart = 1,
	FrameEnd = 3,
	
	Calibers = "9x19",
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
	
	GunRattleType = 2,
	
	MechSound = {"Fire Mech Very Small Rifle A", "Fire Mech Very Small Rifle B", "Fire Mech Very Small Rifle C"},
	PreSound = "Fire Pre Small Rifle B",
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Small Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}
ScrappersSMGData.Receivers[#ScrappersSMGData.Receivers + 1] = {
	Name = "GP10",
	Cost = 5,
	Mass = 3,
	Mode = 0,
	RateOfFire = {{700, Cost = 0}, {800, Cost = 1}, {900, Cost = 2}},
	
	FrameStart = 1,
	FrameEnd = 3,
	
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
	MagazineOffset = Vector(3, 0),
	ModOffset = Vector(5, 0),
	
	GunRattleType = 2,
	
	MechSound = {"Fire Mech Very Small Rifle C"},
	PreSound = "Fire Pre Small Rifle B",
	PreDelay = {0, 35},
	
	ReloadSoundSet = "Reload Bolt Small Rifle A",
	
	OnCreate = ScrappersReloadsData.BasicMagazineFedCreate,
	OnUpdate = ScrappersReloadsData.BasicMagazineFedUpdate
}

ScrappersSMGData.Magazines = {}
-- 
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 30,
	Calibers = "9x19",
	
	SoundType = "Small Metal",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}
-- 
ScrappersSMGData.Magazines[#ScrappersSMGData.Magazines + 1] = {
	Frame = 1,
	Cost = 3,
	RoundCount = 20,
	Calibers = "45ACP",
	
	SoundType = "Small Metal",
	Type = "Curved",
	
	ReloadSoundSet = "Reload Magazine Small Rifle A"
}



ScrappersSMGData.Barrels = {}
-- 000
ScrappersSMGData.Barrels[#ScrappersSMGData.Barrels + 1] = {
	Frame = 0,
	Length = 9,
	Density = ScrappersSMGData.BarrelAlloyMedium
}


ScrappersSMGData.BarrelMods = {}
-- 000
ScrappersSMGData.BarrelMods[#ScrappersSMGData.BarrelMods + 1] = {
	Frame = 0,
	Cost = 0,
	Length = 4,
	RecoilReduction = 0,
	MuzzleGFX = ScrappersGunFunctions.SpawnMuzzleGFXSide,
	MuzzleFlash = "Scrapper Muzzle Flash Side"
}


ScrappersSMGData.Foregrips = {}
-- 000
ScrappersSMGData.Foregrips[#ScrappersSMGData.Foregrips + 1] = {
	Frame = 0,
	Length = 7,
	Mass = ScrappersSMGData.GripMedium,
	Quality = ScrappersSMGData.QualityGood
}


ScrappersSMGData.Stocks = {}
-- 000
ScrappersSMGData.Stocks[#ScrappersSMGData.Stocks + 1] = {
	Frame = 0,
	Mass = ScrappersSMGData.StockLight,
	Quality = ScrappersSMGData.QualityBad
}


ScrappersSMGData.Sights = {}
-- 000
ScrappersSMGData.Sights[#ScrappersSMGData.Sights + 1] = {
	Frame = 0,
	Cost = 2,
	SharpLength = 200
}

function Create(self)

	self.experimentalFullAutoMech = false
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
	ScrappersGunFunctions.PickForegrip(self, ScrappersSMGData.Foregrips, presetName.." Foregrip")
	ScrappersGunFunctions.PickStock(self, ScrappersSMGData.Stocks, presetName.." Stock")
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
	
end