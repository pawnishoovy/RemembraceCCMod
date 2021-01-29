ScrappersData = {} -- INIT
ScrappersData.Module = "Scrappers.rte"

function ScrappersData.IndexToPrefix(index)
	--local iterations = math.ceil(index / 26)
	return string.upper(string.char(96 + math.min(index, 26)))
end


--- index: 1,2,3
--- prefix: A,B,C

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

local defaultNoiseMuffled = {}
defaultNoise["Outdoors"] = ""
defaultNoise["Indoors"] = ""
defaultNoise["BigIndoors"] = ""

defaultNoise["OutdoorsSemi"] = ""
defaultNoise["IndoorsSemi"] = ""
defaultNoise["BigIndoorsSemi"] = ""

local defaultReflectionSmall = ""
local defaultReflectionMedium = ""
local defaultReflectionBig = ""

--- EXAMPLE
name = "EXAMPLE"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "" -- The name of the particle shot upon firing
ScrappersData.Ammunition[name].ProjectileCount = 1 -- The amout of particles spawned per shot
ScrappersData.Ammunition[name].ProjectileSpread = 0 -- More than 0 for buckshot
ScrappersData.Ammunition[name].ProjectileVelocity = 50 -- THe base velocity of the projectile
--
ScrappersData.Ammunition[name].CasingPresetName = "" -- The name of the casing ejected upon firing
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "" -- Container name
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = ""
ScrappersData.Ammunition[name].FireSound["BassVariants"] = 1
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise -- Just set it to default noise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 1
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
---

--- 9x18

--- 9x18

--- 22LR

--- 45ACP

--- 46x30

--- 50AE

--- 50BMG

--- 458SOCOM

--- 545x39

--- 556x45

--- 762x39

--- 762x51

--- 762x54

--- 3006
