ScrappersData = {} -- INIT
ScrappersData.Module = "Scrappers.rte"

function ScrappersData.IndexToPrefix(index)
	--local iterations = math.ceil(index / 26)
	return string.upper(string.char(96 + math.min(index, 26)))
end

function ScrappersData.CopyTable(t, s)
	seen = s and s or {}
	if t == nil then return nil end
	if seen[t] then return seen[t] end
	
	local no
	if type(t) == 'table' then
		no = {}
		seen[t] = no
		
		for k, v in next, t, nil do
			no[ScrappersData.CopyTable(k, seen)] = ScrappersData.CopyTable(v, seen)
		end
		setmetatable(no, ScrappersData.CopyTable(getmetatable(t), seen))
	else -- number, string, boolean, etc
		no = t
	end
	return no
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
	"9x19",
	"22LR",
	"45ACP",
	"45ACPSpecial",
	"46x30",
	"50AE",
	"50BMG",
	"458SOCOM",
	"545x39",
	"545x39Special",
	"556x45",
	"792x33",
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
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 2
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 9x18"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 9x18"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 9x18"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 9x18"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.62
ScrappersData.Ammunition[name].BaseNoisePitch = 1.7
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.2
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 2
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 9x19
name = "9x19"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 9x19"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 85
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 2
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 9x19"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 3
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 9x19"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 3
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 9x19"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 9x19"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Very Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.68
ScrappersData.Ammunition[name].BaseNoisePitch = 1.6
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.3
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.9
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 22LR
name = "22LR"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 22LR"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 75
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 1
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 22LR"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] ="Fire Add Semi 22LR"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 22LR"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 22LR"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Very Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Very Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionVerySmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.45
ScrappersData.Ammunition[name].BaseNoisePitch = 1.9
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.1
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 2.1
--
ScrappersData.Ammunition[name].BaseBassVolume = 01
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 45ACP
name = "45ACP"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 45ACP"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 80
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 4
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 45ACP"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 45ACP"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 45ACP"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 45ACP"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionSmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.7
ScrappersData.Ammunition[name].BaseNoisePitch = 1.3
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.6
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.8
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 45ACPSpecial
name = "45ACPSpecial"
ScrappersData.Ammunition[name] = ScrappersData.CopyTable(ScrappersData.Ammunition["45ACP"], nil)
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 45ACPSpecial"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 45ACPSpecial"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 45ACPSpecial"
--- 357
name = "357"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 357"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 5
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 357"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 357"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 357"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionSmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.73
ScrappersData.Ammunition[name].BaseNoisePitch = 1.25
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.65
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.7
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 44
name = "44"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 44"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 7
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 44"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 44"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 44"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionSmall
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.8
ScrappersData.Ammunition[name].BaseNoisePitch = 1.15
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.75
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.5
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 454
name = "454"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 454"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 120
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 7
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 454"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 454"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 454"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 2
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium"
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
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 500SW
name = "500SW"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 500SW"
ScrappersData.Ammunition[name].ProjectileCount = 3
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 130
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 8
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 500SW"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 500SW"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 500SW"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 0.85
ScrappersData.Ammunition[name].BaseNoisePitch = 1.05
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.85
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.4
--
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 4570
name = "4570"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 4570"
ScrappersData.Ammunition[name].ProjectileCount = 3
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 130
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 14
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 4570"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 4570"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 4570"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium High"
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
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.2
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
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 5
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 46x30"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 46x30"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 46x30"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 46x30"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Small Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Low"
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
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 6
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 50AE"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 50AE"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 50AE"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 2
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium"
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
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 50BMG
name = "50BMG"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 50BMG"
ScrappersData.Ammunition[name].ProjectileCount = 6
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 145
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 50BMG"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 50BMG"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 50BMG"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Very Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic High"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].CasingPresetName = "Casing 458SOCOM"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 458SOCOM"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 458SOCOM"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium High"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 545x39
name = "545x39"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 545x39"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 545x39"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 545x39"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 2
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 545x39Special
name = "545x39Special"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 545x39Special"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 545x39"
--
ScrappersData.Ammunition[name].SmokeAmount = 8
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 545x39Special"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 545x39Special"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 545x39Special"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 2
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 556x45
name = "556x45"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 556x45"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 115
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 556x45"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 556x45"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 556x45"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Medium Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 2
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
--- 792x33
name = "792x33"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 792x33"
ScrappersData.Ammunition[name].ProjectileCount = 1
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 100
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 792x33"
--
ScrappersData.Ammunition[name].SmokeAmount = 9
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 792x33"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSound["AddSemi"] = ""
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 0
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 792x33"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 792x33"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium Low"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 2
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
--
ScrappersData.Ammunition[name].ReflectionSound = defaultReflectionMedium
--
--
ScrappersData.Ammunition[name].BaseNoiseVolume = 1
ScrappersData.Ammunition[name].BaseNoisePitch = 0.96
--
ScrappersData.Ammunition[name].BaseNoiseSemiVolume = 0.89
ScrappersData.Ammunition[name].BaseNoiseSemiPitch = 1.17
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
ScrappersData.Ammunition[name].CasingPresetName = "Casing 762x39"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 762x39"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 762x39"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 762x51
name = "762x51"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 762x51"
ScrappersData.Ammunition[name].ProjectileCount = 2
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 105
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 762x51"
--
ScrappersData.Ammunition[name].SmokeAmount = 12
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = "Fire Add 762x51"
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 5
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 762x51"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 3
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 762x51"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 762x51"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium High"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].CasingPresetName = "Casing 762x54"
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
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 762x54"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 762x54"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium High"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassPitch = 1
--- 3006
name = "3006"
ScrappersData.Ammunition[name] = {}
--
ScrappersData.Ammunition[name].ProjectilePresetName = "Particle Bullet 3006"
ScrappersData.Ammunition[name].ProjectileCount = 3
ScrappersData.Ammunition[name].ProjectileSpread = 0
ScrappersData.Ammunition[name].ProjectileVelocity = 135
--
ScrappersData.Ammunition[name].CasingPresetName = "Casing 3006"
--
ScrappersData.Ammunition[name].SmokeAmount = 15
--
--
ScrappersData.Ammunition[name].FireSound = {}
ScrappersData.Ammunition[name].FireSound["Add"] = ""
ScrappersData.Ammunition[name].FireSound["AddVariants"] = 0
ScrappersData.Ammunition[name].FireSound["AddSemi"] = "Fire Add Semi 3006"
ScrappersData.Ammunition[name].FireSound["AddSemiVariants"] = 1
--
ScrappersData.Ammunition[name].FireSound["Bass"] = "Fire Bass 3006"
ScrappersData.Ammunition[name].FireSound["BassSemi"] = "Fire Bass Semi 3006"
--
--
ScrappersData.Ammunition[name].FireSuppressedSound = {}
ScrappersData.Ammunition[name].FireSuppressedSound["Add"] = "Fire Add Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddVariants"] = 1
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemi"] = "Fire Add Semi Large Suppressed"
ScrappersData.Ammunition[name].FireSuppressedSound["AddSemiVariants"] = 2
--
ScrappersData.Ammunition[name].FireSuppressedSound["Bass"] = "Fire Bass Generic Medium High"
ScrappersData.Ammunition[name].FireSuppressedSound["BassVariants"] = 1
--
ScrappersData.Ammunition[name].NoiseSound = defaultNoise
--
ScrappersData.Ammunition[name].NoiseSuppressedSound = defaultNoiseMuffled
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
ScrappersData.Ammunition[name].BaseBassVolume = 1
ScrappersData.Ammunition[name].BaseBassPitch = 1

-- Soundsets

ScrappersData.ReloadSoundSets = {}

-- Magazine SoundSets

ScrappersData.ReloadSoundSets.Magazine = {}
ScrappersData.ReloadSoundSets.Magazine["SmallPistolVariants"] = 1;
ScrappersData.ReloadSoundSets.Magazine["MediumPistolVariants"] = 3;
ScrappersData.ReloadSoundSets.Magazine["LargePistolVariants"] = 2;
ScrappersData.ReloadSoundSets.Magazine["VeryLargePistolVariants"] = 1;
ScrappersData.ReloadSoundSets.Magazine["MediumRifleVariants"] = 4;
ScrappersData.ReloadSoundSets.Magazine["LargeRifleVariants"] = 4;


name = "Reload Magazine Small Pistol A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 150
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 300
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Small Pistol A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 45

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Small Pistol A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Small Pistol A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 152

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Small Pistol A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 60

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 185

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 140

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 60

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 160

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 265

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 180

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 45

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 280

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 40

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 145

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 210

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol E"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol E MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 35

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol E MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 145

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol E MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 165

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol E MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Medium Pistol F"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 340

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 340
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol F MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 77

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Pistol F MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Pistol F MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Pistol F MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Pistol A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 375

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 375
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Pistol A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Pistol A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 140

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Pistol B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 375

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 375
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 70

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Pistol B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 210

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 235

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Pistol B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 180

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Pistol C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 375

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 375
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 95

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Pistol C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 165

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Pistol C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 160

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Pistol D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 375

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 375
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 145

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Pistol D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 235

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Pistol D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 205

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Pistol D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 215

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Very Large Pistol A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 300
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 400
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Large Pistol A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 115

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Large Pistol A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 260

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Large Pistol A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 215

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Large Pistol A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Very Small Rifle A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Small Rifle A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 70

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Small Rifle A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 140

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}

name = "Reload Magazine Very Small Rifle B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Small Rifle B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 70

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Small Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 140

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Very Small Rifle C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 175

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Small Rifle C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 100

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Small Rifle C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Very Small Rifle D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 280

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Small Rifle D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 280

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Small Rifle D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Very Small Rifle E"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 600
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle E MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 275

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Very Small Rifle E MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Very Small Rifle E MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 355

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Very Small Rifle E MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 210

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Small Rifle A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle A MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 195

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Small Rifle A MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle A MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 70

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Small Rifle A MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 140

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}

name = "Reload Magazine Small Rifle B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 450

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle B MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Small Rifle B MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 245

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle B MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 240

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Small Rifle B MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Small Rifle C"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 550

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle C MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Small Rifle C MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle C MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 440

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Small Rifle C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 80

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}

name = "Reload Magazine Small Rifle D"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 400
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 400
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 350

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle D MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Small Rifle D MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 180

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Small Rifle D MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 310

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Small Rifle D MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 235

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


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
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 200

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle E MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 60

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle E MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 190

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle E MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 185

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle E MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["SoundContainer"] = "Reload Magazine Medium Rifle E MagHit"
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["Length"] = 200

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound", "MagHitPrepareSound", "MagHitSound"}


name = "Reload Magazine Medium Rifle F"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 400
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 500
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 200

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitPrepareDelay = 200
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagHitAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle F MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 225

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Medium Rifle F MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Medium Rifle F MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Medium Rifle F MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["SoundContainer"] = "Reload Magazine Medium Rifle F MagHit"
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound", "MagHitPrepareSound", "MagHitSound"}


name = "Reload Magazine Unique AN94"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 450
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 450
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 300

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Bolt Unique AN94 MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Bolt Unique AN94 MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Bolt Unique AN94 MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 450

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Bolt Unique AN94 MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}

name = "Reload XMagazine Unique AN94"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 700
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 700

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 700
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Bolt Unique AN94 XMagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 700

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Bolt Unique AN94 XMagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Bolt Unique AN94 XMagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 700

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Bolt Unique AN94 XMagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 130

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


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

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
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
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle C MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 420

ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].MagHitPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagHitSound["SoundContainer"] = "Reload Magazine Large Rifle C MagHit"
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


name = "Reload Magazine Large Rifle F"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 685
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1250
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle F MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 685

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle F MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle F MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 245

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle F MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 350

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}


name = "Reload Magazine Large Rifle G"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutPrepareDelay = 650
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagOutAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInPrepareDelay = 1000
ScrappersData.ReloadSoundSets.Magazine[name].BaseMagInAfterDelay = 500

ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle G MagOutPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutPrepareSound["Length"] = 650

ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["SoundContainer"] = "Reload Magazine Large Rifle G MagOut"
ScrappersData.ReloadSoundSets.Magazine[name].MagOutSound["Length"] = 400

ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["SoundContainer"] = "Reload Magazine Large Rifle G MagInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].MagInPrepareSound["Length"] = 365

ScrappersData.ReloadSoundSets.Magazine[name].MagInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["SoundContainer"] = "Reload Magazine Large Rifle G MagIn"
ScrappersData.ReloadSoundSets.Magazine[name].MagInSound["Length"] = 250

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"MagOutPrepareSound", "MagOutSound", "MagInPrepareSound", "MagInSound"}

-- RoundLoad SoundSets

ScrappersData.ReloadSoundSets.Magazine["MediumRevolverVariants"] = 2;

-- note that it's still the Magazine table

name = "Reload RoundLoad Medium Revolver Speedloader A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderInPrepareDelay = 300
ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderInAfterDelay = 150

ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderOffPrepareDelay = 150
ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderOffAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound["SoundContainer"] = "Reload RoundLoad Medium Revolver A SpeedLoaderInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound["Length"] = 155

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound["SoundContainer"] = "Reload RoundLoad Medium Revolver A SpeedLoaderIn"
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound["Length"] = 150

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffSound["SoundContainer"] = "Reload RoundLoad Medium Revolver A SpeedLoaderOff"
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderOffSound["Length"] = 230

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"SpeedLoaderInPrepareSound", "SpeedLoaderInSound", "SpeedLoaderOffPrepareSound", "SpeedLoaderOffSound"}


name = "Reload RoundLoad Medium Revolver Single Round A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInPrepareDelay = 170
ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInAfterDelay = 180

ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["SoundContainer"] = "Reload RoundLoad Medium Revolver A RoundInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["Length"] = 170

ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["SoundContainer"] = "Reload RoundLoad Medium Revolver A RoundIn"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["Length"] = 220 -- varies actually for some reason but yknow whatever

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"RoundInPrepareSound", "RoundInSound"}


name = "Reload RoundLoad Large Revolver Speedloader A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderInPrepareDelay = 600
ScrappersData.ReloadSoundSets.Magazine[name].BaseSpeedLoaderInAfterDelay = 400

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound["SoundContainer"] = "Reload RoundLoad Large Revolver A SpeedLoaderIn"
ScrappersData.ReloadSoundSets.Magazine[name].SpeedLoaderInSound["Length"] = 300

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"SpeedLoaderInPrepareSound", "SpeedLoaderInSound"}


name = "Reload RoundLoad Large Revolver Single Round A"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInPrepareDelay = 170
ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInAfterDelay = 180

ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["SoundContainer"] = "Reload RoundLoad Large Revolver A RoundInPrepare"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["Length"] = 90

ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["SoundContainer"] = "Reload RoundLoad Large Revolver A RoundIn"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["Length"] = 160 -- varies actually for some reason but yknow whatever

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"RoundInPrepareSound", "RoundInSound"}


name = "Reload RoundLoad Large Revolver Single Round B"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInPrepareDelay = 170
ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInAfterDelay = 180

ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["SoundContainer"] = "Reload RoundLoad Large Revolver A RoundIn"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["Length"] = 160

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"RoundInPrepareSound", "RoundInSound"}


name = "Reload RoundLoad Unique Single Action Army Single Round"
ScrappersData.ReloadSoundSets.Magazine[name] = {}

ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInPrepareDelay = 150
ScrappersData.ReloadSoundSets.Magazine[name].BaseRoundInAfterDelay = 250

ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Magazine[name].RoundInPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound = {}
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["SoundContainer"] = "Reload RoundLoad Unique Single Action Army RoundIn"
ScrappersData.ReloadSoundSets.Magazine[name].RoundInSound["Length"] = 160

ScrappersData.ReloadSoundSets.Magazine[name].SoundList = {"RoundInPrepareSound", "RoundInSound"}


-- Bolt SoundSets

ScrappersData.ReloadSoundSets.Bolt = {}
ScrappersData.ReloadSoundSets.Bolt["SmallPistolVariants"] = 1;
ScrappersData.ReloadSoundSets.Bolt["MediumPistolVariants"] = 3;
ScrappersData.ReloadSoundSets.Bolt["LargePistolVariants"] = 2;
ScrappersData.ReloadSoundSets.Bolt["VeryLargePistolVariants"] = 1;
ScrappersData.ReloadSoundSets.Bolt["MediumRifleVariants"] = 3;
ScrappersData.ReloadSoundSets.Bolt["LargeRifleVariants"] = 4;


name = "Reload Bolt Small Pistol A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 75
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 80

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 80
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Small Pistol A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 110

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Small Pistol A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 110

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}

name = "Reload Bolt Medium Pistol A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 75

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 75
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 350

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 145

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 115

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Pistol B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 115

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 115
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol B BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol B BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Pistol C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol C BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 75

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol C BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Pistol D"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 105

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 105
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol D BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 75

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol D BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Pistol E"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 130

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 130
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 270

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol E BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 75

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol E BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Pistol F"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 55

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 55
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 350

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Pistol F BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 75

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Pistol F BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Revolver A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenPrepareDelay = 180
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenAfterDelay = 210

ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsPrepareDelay = 350
ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderClosePrepareDelay = 315
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderCloseAfterDelay = 200

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver A CylinderOpenPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["Length"] = 180

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["SoundContainer"] = "Reload Bolt Medium Revolver A CylinderOpen"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver A EjectShellsPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["Length"] = 350

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["SoundContainer"] = "Reload Bolt Medium Revolver A EjectShells"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["Length"] = 350

ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver A CylinderClosePrepare"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["Length"] = 315

ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["SoundContainer"] = "Reload Bolt Medium Revolver A CylinderClose"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["Length"] = 175

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Medium Revolver A HammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"CylinderOpenPrepareSound", "CylinderOpenSound", "EjectShellsPrepareSound", "EjectShellsSound", "CylinderClosePrepareSound", "CylinderCloseSound", "HammerBackPrepareSound", "HammerBackSound"}


name = "Reload Bolt Medium Revolver C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenPrepareDelay = 180
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenAfterDelay = 210

ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsPrepareDelay = 350
ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderClosePrepareDelay = 315
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderCloseAfterDelay = 200

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver C CylinderOpenPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["Length"] = 63

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["SoundContainer"] = "Reload Bolt Medium Revolver C CylinderOpen"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["Length"] = 110

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver C EjectShellsPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["Length"] = 350

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["SoundContainer"] = "Reload Bolt Medium Revolver C EjectShells"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["Length"] = 400

ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["SoundContainer"] = "Reload Bolt Medium Revolver C CylinderClosePrepare"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["Length"] = 75

ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["SoundContainer"] = "Reload Bolt Medium Revolver C CylinderClose"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["Length"] = 135

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Medium Revolver A HammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"CylinderOpenPrepareSound", "CylinderOpenSound", "EjectShellsPrepareSound", "EjectShellsSound", "CylinderClosePrepareSound", "CylinderCloseSound", "HammerBackPrepareSound", "HammerBackSound"}


name = "Reload Bolt Large Revolver B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseOpenPrepareDelay = 460
ScrappersData.ReloadSoundSets.Bolt[name].BaseOpenAfterDelay = 550

ScrappersData.ReloadSoundSets.Bolt[name].BaseClosePrepareDelay = 500
ScrappersData.ReloadSoundSets.Bolt[name].BaseCloseAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].OpenPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].OpenPrepareSound["SoundContainer"] = "Reload Bolt Large Revolver B OpenPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].OpenPrepareSound["Length"] = 460

ScrappersData.ReloadSoundSets.Bolt[name].OpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].OpenSound["SoundContainer"] = "Reload Bolt Large Revolver B Open"
ScrappersData.ReloadSoundSets.Bolt[name].OpenSound["Length"] = 650

ScrappersData.ReloadSoundSets.Bolt[name].ClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ClosePrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ClosePrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].CloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CloseSound["SoundContainer"] = "Reload Bolt Large Revolver B Close"
ScrappersData.ReloadSoundSets.Bolt[name].CloseSound["Length"] = 185

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Large Revolver A HammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"OpenPrepareSound", "OpenSound", "ClosePrepareSound", "CloseSound", "HammerBackPrepareSound", "HammerBackSound"}


name = "Reload Bolt Large Revolver C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseGateOpenPrepareDelay = 580
ScrappersData.ReloadSoundSets.Bolt[name].BaseGateOpenAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellPrepareDelay = 225
ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderTurnPrepareDelay = 400
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderTurnAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseGateClosePrepareDelay = 500
ScrappersData.ReloadSoundSets.Bolt[name].BaseGateCloseAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].GateOpenPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenPrepareSound["SoundContainer"] = "Reload Bolt Large Revolver C GateOpenPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenPrepareSound["Length"] = 570

ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound["SoundContainer"] = "Reload Bolt Large Revolver C GateOpen"
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound["SoundContainer"] = "Reload Bolt Large Revolver C EjectShell"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound["SoundContainer"] = "Reload Bolt Large Revolver C CylinderTurn"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound["Length"] = 165

ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound["SoundContainer"] = "Reload Bolt Large Revolver C GateClose"
ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound["Length"] = 760

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Medium Revolver A HammerBack" -- sad reusal but so it is
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"GateOpenPrepareSound", "GateOpenSound", "EjectShellPrepareSound", "EjectShellSound", "CylinderTurnPrepareSound", "CylinderTurnSound", "GateClosePrepareSound", "GateCloseSound", "HammerBackPrepareSound", "HammerBackSound"}


name = "Reload Bolt Very Large Revolver A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenPrepareDelay = 500
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderOpenAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsPrepareDelay = 835
ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellsAfterDelay = 800

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderClosePrepareDelay = 400
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderCloseAfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 300
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 600

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["SoundContainer"] = "Reload Bolt Very Large Revolver A CylinderOpenPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenPrepareSound["Length"] = 500

ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["SoundContainer"] = "Reload Bolt Very Large Revolver A CylinderOpen"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderOpenSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["SoundContainer"] = "Reload Bolt Very Large Revolver A EjectShellsPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsPrepareSound["Length"] = 835

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["SoundContainer"] = "Reload Bolt Very Large Revolver A EjectShells"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellsSound["Length"] = 350

ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].CylinderClosePrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["SoundContainer"] = "Reload Bolt Very Large Revolver A CylinderClose"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderCloseSound["Length"] = 175

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Very Large Revolver A HammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 500

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"CylinderOpenPrepareSound", "CylinderOpenSound", "EjectShellsPrepareSound", "EjectShellsSound", "CylinderClosePrepareSound", "CylinderCloseSound", "HammerBackPrepareSound", "HammerBackSound"}


name = "Reload Bolt Unique Single Action Army"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair1Part1PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair1Part1AfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair1Part2PrepareDelay = 400
ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair1Part2AfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair2Part1PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair2Part1AfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair3Part1PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair3Part1AfterDelay = 250

ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair3Part2PrepareDelay = 250
ScrappersData.ReloadSoundSets.Bolt[name].BaseIntroFlair3Part2AfterDelay = 100


ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair1PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair1AfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair2PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair2AfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair3PrepareDelay = 50
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadIntroFlair3AfterDelay = 700


ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerDownPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerDownAfterDelay = 250

ScrappersData.ReloadSoundSets.Bolt[name].BaseGateOpenPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseGateOpenAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseEjectShellAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderTurnPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseCylinderTurnAfterDelay = 30

ScrappersData.ReloadSoundSets.Bolt[name].BaseGateClosePrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseGateCloseAfterDelay = 100


ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair1PrepareDelay = 80
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair1AfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair2PrepareDelay = 80
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair2AfterDelay = 500

ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair3PrepareDelay = 80
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadOutroFlair3AfterDelay = 500


ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadHammerBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseReloadHammerBackAfterDelay = 200

ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackPrepareDelay = 120
ScrappersData.ReloadSoundSets.Bolt[name].BaseHammerBackAfterDelay = 150

-- NOTE!!!!
-- as we have no prepare sounds, none of these need any correct lengths
-- it's a lot of sounds so i've taken the liberty of just setting all lengths to 0


ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army IntroFlair1Part1"
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part1Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army IntroFlair1Part2"
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair1Part2Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army IntroFlair2Part1"
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair2Part1Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army IntroFlair3Part1"
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part1Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army IntroFlair3Part2"
ScrappersData.ReloadSoundSets.Bolt[name].IntroFlair3Part2Sound["Length"] = 0


ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadIntroFlair1"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair1Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadIntroFlair2"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair2Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadIntroFlair3"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadIntroFlair3Sound["Length"] = 0


ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerDownSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownSound["SoundContainer"] = "Reload Bolt Unique Single Action Army HammerDown"
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerDownPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound["SoundContainer"] = "Reload Bolt Unique Single Action Army GateOpen"
ScrappersData.ReloadSoundSets.Bolt[name].GateOpenSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound["SoundContainer"] = "Reload Bolt Unique Single Action Army EjectShell"
ScrappersData.ReloadSoundSets.Bolt[name].EjectShellSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound["SoundContainer"] = "Reload Bolt Unique Single Action Army CylinderTurn"
ScrappersData.ReloadSoundSets.Bolt[name].CylinderTurnSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].GateClosePrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound["SoundContainer"] = "Reload Bolt Unique Single Action Army GateClose"
ScrappersData.ReloadSoundSets.Bolt[name].GateCloseSound["Length"] = 0


ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadOutroFlair1"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair1Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadOutroFlair2"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair2Sound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3PrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3PrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3PrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3Sound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3Sound["SoundContainer"] =  "Reload Bolt Unique Single Action Army ReloadOutroFlair3"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadOutroFlair3Sound["Length"] = 0


ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackSound["SoundContainer"] = "Reload Bolt Unique Single Action Army ReloadHammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].ReloadHammerBackSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["SoundContainer"] = "Reload Bolt Unique Single Action Army HammerBack"
ScrappersData.ReloadSoundSets.Bolt[name].HammerBackSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"IntroFlair1Part1Sound", "IntroFlair1Part2Sound", "IntroFlair2Part1Sound", "IntroFlair3Part1Sound", "IntroFlair3Part2Sound", "ReloadIntroFlair1Sound", "ReloadIntroFlair2Sound", "ReloadIntroFlair3Sound", "HammerDownSound", "GateOpenSound", "EjectShellSound", "CylinderTurnSound", "GateCloseSound", "ReloadOutroFlair1Sound", "ReloadOutroFlair2Sound", "ReloadOutroFlair3Sound", "ReloadHammerBackSound", "HammerBackSound"}


name = "Reload Bolt Large Pistol A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 375

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Pistol A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 165

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Pistol A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 140

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Large Pistol B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 375

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Pistol B BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 120

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Pistol B BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 115

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Large Pistol C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 95

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 95
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 375

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Pistol C BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 120

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Pistol C BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 115

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Very Large Pistol A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 130

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 130
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 400

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Very Large Pistol A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 170

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Very Large Pistol A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 115

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}

name = "Reload Bolt Very Small Rifle B"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 95

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 95
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Very Small Rifle B BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 210

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Very Small Rifle B BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Very Small Rifle C"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 120

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 120
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Very Small Rifle C BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 230

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Very Small Rifle C BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 150

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Very Small Rifle D"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Very Small Rifle D BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 230

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Very Small Rifle D BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Small Rifle A"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 70

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 80
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Small Rifle A BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Small Rifle A BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 300

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


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


name = "Reload Bolt Medium Rifle H"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 90

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 90
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 550

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle H BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle H BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}


name = "Reload Bolt Medium Rifle I"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 300
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Medium Rifle I BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 230

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound"}


name = "Reload Bolt Unique AN94"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 150

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 150
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 250

ScrappersData.ReloadSoundSets.Bolt[name].BaseShoulderPrepareDelay = 250
ScrappersData.ReloadSoundSets.Bolt[name].BaseShoulderAfterDelay = 100

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Unique AN94 BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 200

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Medium Rifle H BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].ShoulderPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ShoulderPrepareSound["SoundContainer"] = "Reload Bolt Unique AN94 ShoulderPrepare"
ScrappersData.ReloadSoundSets.Bolt[name].ShoulderPrepareSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].ShoulderSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].ShoulderSound["SoundContainer"] = "Reload Bolt Unique AN94 Shoulder"
ScrappersData.ReloadSoundSets.Bolt[name].ShoulderSound["Length"] = 130

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound", "ShoulderPrepareSound", "ShoulderSound"}


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

name = "Reload Bolt Large Rifle E"
ScrappersData.ReloadSoundSets.Bolt[name] = {}

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackPrepareDelay = 100
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltBackAfterDelay = 275

ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardPrepareDelay = 200
ScrappersData.ReloadSoundSets.Bolt[name].BaseBoltForwardAfterDelay = 320

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["SoundContainer"] = "Reload Bolt Large Rifle E BoltBack"
ScrappersData.ReloadSoundSets.Bolt[name].BoltBackSound["Length"] = 360

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["SoundContainer"] = nil
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardPrepareSound["Length"] = 0

ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound = {}
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["SoundContainer"] = "Reload Bolt Large Rifle E BoltForward"
ScrappersData.ReloadSoundSets.Bolt[name].BoltForwardSound["Length"] = 250

ScrappersData.ReloadSoundSets.Bolt[name].SoundList = {"BoltBackPrepareSound", "BoltBackSound", "BoltForwardPrepareSound", "BoltForwardSound"}