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
name = "9x18"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 9x18"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 80
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.5
ScrappersData.Ammunition[name].BaseNoisePitch = 1.5
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.2
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.8
--
ScrappersData.Ammunition[name].BaseBassVolume = 0.8
ScrappersData.Ammunition[name].BaseBassPitch = 1.2
--- 9x19
name = "9x19"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 9x19"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 85
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.6
ScrappersData.Ammunition[name].BaseNoisePitch = 1.4
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.3
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.7
--
ScrappersData.Ammunition[name].BaseBassVolume = 0.9
ScrappersData.Ammunition[name].BaseBassPitch = 1.1
--- 22LR
name = "22LR"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 22LR"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 75
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.3
ScrappersData.Ammunition[name].BaseNoisePitch = 1.7
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.15
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.85
--
ScrappersData.Ammunition[name].BaseBassVolume = 0.7
ScrappersData.Ammunition[name].BaseBassPitch = 1.3
--- 45ACP
name = "45ACP"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 45ACP"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 80
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.7
ScrappersData.Ammunition[name].BaseNoisePitch = 1.3
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.7
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.5
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 46x30
name = "46x30"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 46x30"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 120
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.8
ScrappersData.Ammunition[name].BaseNoisePitch = 1.3
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.6
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.6
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 50AE
name = "50AE"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 50AE"
ScrappersData.Ammunition[name].ProjectileCount = 3
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 100
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 1
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.9
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.9
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 0.9
--- 50BMG
name = "50BMG"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 50BMG"
ScrappersData.Ammunition[name].ProjectileCount = 6
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 135
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1.1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.7
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1.1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.7
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 458SOCOM
name = "458SOCOM"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 458SOCOM"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 110
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.9
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.8
--
ScrappersData.Ammunition[name].BaseBassVolume = 1.1
ScrappersData.Ammunition[name].BaseBassPitch = 0.9
--- 545x39
name = "545x39"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 545x39"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.9
ScrappersData.Ammunition[name].BaseNoisePitch = 1.1
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.8
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.3
--
ScrappersData.Ammunition[name].BaseBassVolume = 0.95
ScrappersData.Ammunition[name].BaseBassPitch = 1.05
--- 556x45
name = "556x45"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 556x45"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 556x45"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 4
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic Medium"
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 1
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.85
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.2
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 762x39
name = "762x39"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 762x39"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 105
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 762x39"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 762x39"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic Medium High"
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.95
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.9
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.15
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 0.95
--- 762x51
name = "762x51"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 762x51"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 105
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.85
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.95
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 762x54
name = "762x54"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 762x54"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 105
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.82
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.90
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 0.95
--- 3006
name = "3006"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 3006"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 125
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
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
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.8
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 0.9
--
ScrappersData.Ammunition[name].BaseBassVolume = 1.05
ScrappersData.Ammunition[name].BaseBassPitch = 0.9