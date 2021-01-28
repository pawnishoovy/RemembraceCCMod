ScrappersData = {} -- INIT
ScrappersData.Module = "Scrappers.rte"

ScrappersData.AlphabeticalIndexing

---- Weapons

--- Ammunition
ScrappersData.Ammunition = {}

ScrappersData.Ammunition.Global = {}
ScrappersData.Ammunition.Global.DamageMultiplier = 1
ScrappersData.Ammunition.Global.SharpnessMultiplier = 1
ScrappersData.Ammunition.Global.MassMultiplier = 1
ScrappersData.Ammunition.Global.VelocityMultiplier = 1

local name

-- Default settings
local defaultCasing = ""
local defaultParticle = ""

local defaultNoise = {}
defaultNoise["Outdoors"] = ""
defaultNoise["Indoors"] = ""
defaultNoise["BigIndoors"] = ""

defaultNoise["OutdoorsSemi"] = ""
defaultNoise["IndoorsSemi"] = ""
defaultNoise["BigIndoorsSemi"] = ""


-- EXAMPLE
name = "EXAMPLE"
ScrappersData.Ammunition[name].ProjectilePresetName = "" -- The name of the particle shot upon firing
ScrappersData.Ammunition[name].ProjectileCount = 1 -- The amout of particles spawned per shot
ScrappersData.Ammunition[name].ProjectileSpread = 0 -- More than 0 for buckshot
ScrappersData.Ammunition[name].ProjectileVelocity = 50 -- THe base velocity of the projectile

ScrappersData.Ammunition[name].CasingPresetName = "" -- The name of the casing ejected upon firing

ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "" -- Container name
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["Bass"] = ""
ScrappersData.Ammunition[name].FireSound["BassVariants"] = 1

ScrappersData.Ammunition[name].NoiseSound = defaultNoise -- Just set it to default noise

ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 1

ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1
]]

-- 9x18

-- 9x18

-- 22LR

-- 45ACP

-- 46x30

-- 50AE

-- 50BMG

-- 458SOCOM

-- 545x39

-- 556x45

-- 762x39

-- 762x51

-- 762x54

-- 3006
