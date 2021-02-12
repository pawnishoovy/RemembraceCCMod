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

ScrappersData.Ammunition.List = {
	"9x18",
	"9x18",
	"22LR",
	"45ACP",
	"46x30",
	"50AE",
	"50BMG",
	"458SOCOM",
	"545x39",
	"556x45",
	"762x39",
	"762x51",
	"762x54",
	"3006"
}

local name

-- Default settings
local defaultCasing = ""
local defaultParticle = ""

local defaultNoise = {}
defaultNoise["Outdoors"] = "Fire Noise Outdoors"
defaultNoise["Indoors"] = "Fire Noise Indoors"
defaultNoise["BigIndoors"] = "Fire Noise BigIndoors"

defaultNoise["OutdoorsSemi"] = "Fire Noise Semi Outdoors"
defaultNoise["IndoorsSemi"] = "Fire Noise Semi Indoors"
defaultNoise["BigIndoorsSemi"] = "Fire Noise Semi BigIndoors"

local defaultNoiseMuffled = {}
defaultNoiseMuffled["Outdoors"] = "Fire Noise Outdoors Suppressed"
defaultNoiseMuffled["Indoors"] = "Fire Noise Indoors Suppressed"
defaultNoiseMuffled["BigIndoors"] = "Fire Noise BigIndoors Suppressed"

defaultNoiseMuffled["OutdoorsSemi"] = "Fire Noise Outdoors Suppressed"
defaultNoiseMuffled["IndoorsSemi"] = "Fire Noise Indoors Suppressed"
defaultNoiseMuffled["BigIndoorsSemi"] = "Fire Noise BigIndoors Suppressed"

local defaultReflectionVerySmall = "Fire Reflection Very Small A"
local defaultReflectionSmall = "Fire Reflection Small A"
local defaultReflectionMedium = "Fire Reflection Medium A"
local defaultReflectionLarge = "Fire Reflection Large A"
local defaultReflectionVeryLarge = "Fire Reflection Very Large A"

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
ScrappersData.Ammunition[name].SmokeAmount = 0 -- "smoke power" to give to smoke spawning functions
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
ScrappersData.Ammunition[name].SmokeAmount = 2
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
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
ScrappersData.Ammunition[name].SmokeAmount = 2
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
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
ScrappersData.Ammunition[name].SmokeAmount = 1
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
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
ScrappersData.Ammunition[name].SmokeAmount = 4
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionSmall
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
ScrappersData.Ammunition[name].SmokeAmount = 5
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionSmall
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
ScrappersData.Ammunition[name].SmokeAmount = 6
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
ScrappersData.Ammunition[name].SmokeAmount = 25
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 50BMG"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 50BMG"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic Very High"
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVeryLarge
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1.0
ScrappersData.Ammunition[name].BaseNoisePitch = 0.9
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
ScrappersData.Ammunition[name].SmokeAmount = 13
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 458SOCOM"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic High"
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionLarge
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
ScrappersData.Ammunition[name].SmokeAmount = 8
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 545x39"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 2
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
ScrappersData.Ammunition[name].SmokeAmount = 9
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 556x45"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 7
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
ScrappersData.Ammunition[name].SmokeAmount = 10
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
ScrappersData.Ammunition[name].SmokeAmount = 12
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 762x51"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 5
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 762x51"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic High"
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionLarge
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
ScrappersData.Ammunition[name].SmokeAmount = 13
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 762x54"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic High"
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionLarge
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
ScrappersData.Ammunition[name].ProjectileCount = 3
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 125
--
ScrappersData.Ammunition[name].CasingPresetName = ""
--
ScrappersData.Ammunition[name].SmokeAmount = 15
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass Generic High"
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
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionLarge
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

-- Soundsets

ScrappersData.ReloadSoundSets = {}

-- Magazine SoundSets

ScrappersData.ReloadSoundSets.Magazine = {}
ScrappersData.ReloadSoundSets.Magazine["MediumRifleVariants"] = 4;
ScrappersData.ReloadSoundSets.Magazine["LargeRifleVariants"] = 4;


name = "Reload Magazine Medium Rifle A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 230

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 600

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Rifle B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 230

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Rifle C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 255

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 285

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 600

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Rifle D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 90

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 165

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 450

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Rifle E"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 400
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 300
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 200

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 60

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 185

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["SoundContainer"] = "Reload Magazine Medium Rifle B MagHit"
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound", "MagHitPrepareSound", "MagHitSound"}


name = "Reload Magazine Large Rifle A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 325

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 280

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Rifle B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Rifle C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 100

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 260

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 175

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 420

ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["SoundContainer"] = "Reload Magazine Large Rifle B MagHit"
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["Length"] = 280

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound", "MagHitPrepareSound", "MagHitSound"}


name = "Reload Magazine Large Rifle D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 66

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 255

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Rifle E"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle E MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 175

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle E MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle E MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 225

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle E MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 120

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


-- Bolt SoundSets

ScrappersData.ReloadSoundSets.Bolt = {}
ScrappersData.ReloadSoundSets.Bolt["MediumRifleVariants"] = 4;
ScrappersData.ReloadSoundSets.Bolt["LargeRifleVariants"] = 3;


name = "Reload Bolt Medium Rifle A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 92

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 92
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle B BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle B BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 125

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 125
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 450

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle C BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 220

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle C BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle D"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle D BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 215

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle D BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 220

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle E"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 125

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 125
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 450

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle E BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 270

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle E BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 220

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle F"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltLockPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltLockAfterDelay = 200

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 450

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle F BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].BoltLockPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltLockPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltLockPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltLockSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltLockSound["SoundContainer"] = "Reload Bolt Medium Rifle F BoltLock"
ScrappersData.ReloadSoundSets.Bolt[name].BoltLockSound["Length"] = 160

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle F BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 320

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltLockPrepareSound", "BoltLockSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle G"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle G BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 230

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle G BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 180

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Large Rifle A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Rifle A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Rifle A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Large Rifle B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 92

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 92
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Rifle B BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Rifle B BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Large Rifle C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 125

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 125
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 450

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Rifle C BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 220

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Rifle C BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}

name = "Reload Bolt Large Rifle D"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 200

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Rifle D BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 280

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Rifle D BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 280

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}