
dofile("Base.rte/Constants.lua")
require("AI/NativeHumanAI")  --dofile("Base.rte/AI/NativeHumanAI.lua")
package.path = package.path .. ";Scrappers.rte/?.lua";
require("Actors/Infantry/Light/LightAIBehaviours")

function Create(self)
	self.AI = NativeHumanAI:Create(self)
	--You can turn features on and off here
	self.armSway = true;
	self.automaticEquip = false;
	self.alternativeGib = true;
	self.visibleInventory = false;
	
	-- Start modded code --
	
	self.RTE = "Scrappers.rte";
	self.baseRTE = "Scrappers.rte";
	
	-- IDENTITY AND VOICE
	
	self.IdentityPrimary = "Raider";
	self:SetStringValue("IdentityPrimary", self.IdentityPrimary);
	
	self.secondaryIdentities = {"FemaleA", "MaleA", "MaleB"}
	self.IdentitySecondary = self.secondaryIdentities[math.random(1, #self.secondaryIdentities)];
	self:SetStringValue("IdentitySecondary", self.IdentitySecondary);
	
	if self.IdentitySecondary == "FemaleA" then
		self.Gender = 1;
	else
		self.Gender = 0;
	end
	
	self.voiceSounds = {
	combatExit = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " CombatExit", "Scrappers.rte"),
	Death = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Death", "Scrappers.rte"),
	Incapacitated = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Incapacitated", "Scrappers.rte"),
	maleDown = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " MaleDown", "Scrappers.rte"),
	femaleDown = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " FemaleDown", "Scrappers.rte"),
	minorPain = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " MinorPain", "Scrappers.rte"),
	Pain = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Pain", "Scrappers.rte"),
	seriousPain = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " SeriousPain", "Scrappers.rte"),
	farSpot = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " FarSpot", "Scrappers.rte"),
	nearSpot = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " NearSpot", "Scrappers.rte"),
	Spot = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Spot", "Scrappers.rte"),
	minorSuppressedAngry = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " MinorSuppressed Angry", "Scrappers.rte"),
	minorSuppressedScared = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " MinorSuppressed Scared", "Scrappers.rte"),
	minorSuppressedSmug = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " MinorSuppressed Smug", "Scrappers.rte"),
	seriousSuppressedAngry = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " SeriousSuppressed Angry", "Scrappers.rte"),
	seriousSuppressedScared = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " SeriousSuppressed Scared", "Scrappers.rte"),
	seriousSuppressedSmug = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " SeriousSuppressed Smug", "Scrappers.rte"),
	suppressedAngry = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Suppressed Angry", "Scrappers.rte"),
	suppressedScared = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Suppressed Scared", "Scrappers.rte"),
	suppressedSmug = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Suppressed Smug", "Scrappers.rte"),
	Suppressing = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " Suppressing", "Scrappers.rte"),
	throwGrenade = CreateSoundContainer("VO " .. self.IdentityPrimary .. " " .. self.IdentitySecondary .. " ThrowGrenade", "Scrappers.rte")};
	
	-- IDENTITY-SPECIFIC CHATS, EMOTION CHANCES AND HEAD MANAGEMENT
	
	-- frame 0 idle
    -- frame 1 idle eyes closed
    -- frame 2 angry
    -- frame 3 angry smug
    -- frame 4 angry mouth open
    -- frame 5 scared
	
	-- for the chances: 1 = angry, 2 = smug, 3 = scared
	
	local headFrames = 6;
	
	local ident = "" .. self.IdentityPrimary .. " " .. self.IdentitySecondary
	if ident == "Raider FemaleA" then
	
		self.baseHeadFrame = headFrames * math.random(0, 1);
		if self.Head then
			self.Head.Frame = self.baseHeadFrame;
		end
	
		self.identityChats = {[1] = 
		{validTargets = {"Raider FemaleA", "Raider MaleA", "Raider MaleB"},
		chatContainerString = "RaiderLetsEat",
		selfChatTimes = 5,
		targetChatTimes = 4},
		[2] = 
		{validTargets = {"Raider MaleB"},
		chatContainerString = "SharingIsCaring",
		selfChatTimes = 5,
		targetChatTimes = 5}};
		
		self.minorSuppressedEmotionChances = {[1] = 9, [2] = 101, [3] = 0};
		self.seriousSuppressedEmotionChances = {[1] = 35, [2] = 0, [3] = 101};
		self.suppressedEmotionChances = {[1] = 64, [2] = 97, [3] = 101};
		
	
	elseif ident == "Raider MaleA" then
	
		self.baseHeadFrame = headFrames * math.random(0, 0);
		if self.Head then
			self.Head.Frame = self.baseHeadFrame;
		end
	
		self.identityChats = {[1] = 
		{validTargets = {"Raider FemaleA", "Raider MaleA", "Raider MaleB"},
		chatContainerString = "RaiderLetsEat",
		selfChatTimes = 5,
		targetChatTimes = 4},
		[2] = 
		{validTargets = {"Raider FemaleA"},
		chatContainerString = "MattressKid",
		selfChatTimes = 6,
		targetChatTimes = 5},
		[3] = 
		{validTargets = {"Raider MaleB"},
		chatContainerString = "PlaceUpNorth",
		selfChatTimes = 6,
		targetChatTimes = 6}};
		
		self.minorSuppressedEmotionChances = {[1] = 0, [2] = 101, [3] = 0};
		self.seriousSuppressedEmotionChances = {[1] = 81, [2] = 91, [3] = 101};
		self.suppressedEmotionChances = {[1] = 51, [2] = 101, [3] = 0};

	
	elseif ident == "Raider MaleB" then
	
		self.baseHeadFrame = headFrames * math.random(1, 1);
		if self.Head then
			self.Head.Frame = self.baseHeadFrame;
		end
	
		self.identityChats = {[1] = 
		{validTargets = {"Raider FemaleA", "Raider MaleA", "Raider MaleB"},
		chatContainerString = "RaiderLetsEat",
		selfChatTimes = 5,
		targetChatTimes = 4}};
		
		self.minorSuppressedEmotionChances = {[1] = 0, [2] = 101, [3] = 0};
		self.seriousSuppressedEmotionChances = {[1] = 75, [2] = 81, [3] = 101};
		self.suppressedEmotionChances = {[1] = 75, [2] = 101, [3] = 0};

	
	end
	
	-- TERRAIN SOUNDS
	
	-- have to specify every material ID like this
	-- this way we can cut down on an extra "if" or two which would be needed for the logic of selecting from several tables
	-- trading table beauty for performance... ahhh, smells like coding.	
	
	self.terrainSounds = {
	Crawl = {[12] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Crawl Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("Crawl Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("Crawl SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Crawl SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Crawl SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Crawl SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Crawl SolidMetal", "Scrappers.rte")},
	Prone = {[12] = CreateSoundContainer("Prone Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Prone Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Prone Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Prone Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Prone Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Prone Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Prone Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Prone Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("Prone Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("Prone SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Prone SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Prone SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Prone SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Prone SolidMetal", "Scrappers.rte")},
	TerrainImpactLight = {[12] = CreateSoundContainer("TerrainImpact Light Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("TerrainImpact Light Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("TerrainImpact Light Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("TerrainImpact Light Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("TerrainImpact Light Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("TerrainImpact Light Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("TerrainImpact Light Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("TerrainImpact Light Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("TerrainImpact Light Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("TerrainImpact Light SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("TerrainImpact Light SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("TerrainImpact Light SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("TerrainImpact Light SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("TerrainImpact Light SolidMetal", "Scrappers.rte")},
	TerrainImpactHeavy = {[12] = CreateSoundContainer("TerrainImpact Heavy Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("TerrainImpact Heavy Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("TerrainImpact Heavy Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("TerrainImpact Heavy Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("TerrainImpact Heavy Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("TerrainImpact Heavy Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("TerrainImpact Heavy Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("TerrainImpact Heavy Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("TerrainImpact Heavy Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("TerrainImpact Heavy SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("TerrainImpact Heavy SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("TerrainImpact Heavy SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("TerrainImpact Heavy SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("TerrainImpact Heavy SolidMetal", "Scrappers.rte")},
	FootstepJump = {[12] = CreateSoundContainer("Footstep Jump Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Footstep Jump Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Footstep Jump Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Footstep Jump Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Footstep Jump Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Footstep Jump Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Footstep Jump Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Footstep Jump Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("Footstep Jump Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("Footstep Jump SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Footstep Jump SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Footstep Jump SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Footstep Jump SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Footstep Jump SolidMetal", "Scrappers.rte")},
	FootstepLand = {[12] = CreateSoundContainer("Footstep Land Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Footstep Land Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Footstep Land Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Footstep Land Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Footstep Land Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Footstep Land Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Footstep Land Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Footstep Land Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("Footstep Land Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("Footstep Land SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Footstep Land SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Footstep Land SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Footstep Land SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Footstep Land SolidMetal", "Scrappers.rte")},
	FootstepWalk = {[12] = CreateSoundContainer("Footstep Walk Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Footstep Walk Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Footstep Walk Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Footstep Walk Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Footstep Walk Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Footstep Walk Dirt", "Scrappers.rte"),
			[128] = CreateSoundContainer("Footstep Walk Dirt", "Scrappers.rte"),
			[6] = CreateSoundContainer("Footstep Walk Sand", "Scrappers.rte"),
			[8] = CreateSoundContainer("Footstep Walk Sand", "Scrappers.rte"),
			[178] = CreateSoundContainer("Footstep Walk SolidMetal", "Scrappers.rte"),
			[179] = CreateSoundContainer("Footstep Walk SolidMetal", "Scrappers.rte"),
			[180] = CreateSoundContainer("Footstep Walk SolidMetal", "Scrappers.rte"),
			[181] = CreateSoundContainer("Footstep Walk SolidMetal", "Scrappers.rte"),
			[182] = CreateSoundContainer("Footstep Walk SolidMetal", "Scrappers.rte")},
	};
	
	-- EVERYTHING ELSE
	
	self.movementSounds = {
	Land = CreateSoundContainer("Base Cloth Light Land", "Scrappers.rte"),
	Jump = CreateSoundContainer("Base Cloth Light Jump", "Scrappers.rte"),
	Crouch = CreateSoundContainer("Base Cloth Light Crouch", "Scrappers.rte"),
	Stand = CreateSoundContainer("Base Cloth Light Stand", "Scrappers.rte"),
	Step = CreateSoundContainer("Base Cloth Light Walk", "Scrappers.rte"),
	Prone = CreateSoundContainer("Base Cloth Light Prone", "Scrappers.rte"),
	Crawl = CreateSoundContainer("Base Cloth Light Crawl", "Scrappers.rte")};
	
	-- self.voiceSounds = {
	-- Pain = CreateSoundContainer("VO Pain Heat", "Scrappers.rte")};
	
	self.voiceSound = CreateSoundContainer("Base Cloth Light Walk", "Scrappers.rte");
	-- MEANINGLESS! this is just so we can do voiceSound.Pos without an if check first! it will be overwritten first actual VO play
	
	
	-- ARMOR SELECTION
	
	-- 1 = LightTactical
	-- 2 = LightMetallic
	-- 3 = MediumTactical
	-- 4 = MediumMetallic
	-- 5 = HeavyTactical
	-- 6 = HeavyMetallic
	
	self.armorType = math.random(0, 6)
	print(self.armorType)
	
	self.armorFoleyLongSounds = {[1] = CreateSoundContainer("Add Foley Light Tactical Long", "Scrappers.rte"),
	[2] = CreateSoundContainer("Add Foley Light Metallic Long", "Scrappers.rte"),
	[3] = CreateSoundContainer("Add Foley Medium Tactical Long", "Scrappers.rte"),
	[4] = CreateSoundContainer("Add Foley Medium Metallic Long", "Scrappers.rte"),
	[5] = CreateSoundContainer("Add Foley Heavy Tactical Long", "Scrappers.rte"),
	[6] = CreateSoundContainer("Add Foley Heavy Metallic Long", "Scrappers.rte")};
	
	self.armorFoleyShortSounds = {[1] = CreateSoundContainer("Add Foley Light Tactical Short", "Scrappers.rte"),
	[2] = CreateSoundContainer("Add Foley Light Metallic Short", "Scrappers.rte"),
	[3] = CreateSoundContainer("Add Foley Medium Tactical Short", "Scrappers.rte"),
	[4] = CreateSoundContainer("Add Foley Medium Metallic Short", "Scrappers.rte"),
	[5] = CreateSoundContainer("Add Foley Heavy Tactical Short", "Scrappers.rte"),
	[6] = CreateSoundContainer("Add Foley Heavy Metallic Short", "Scrappers.rte")};
	
	self.armorPathSpeeds = {[1] = 0.9,
	[2] = 0.9,
	[3] = 0.85,
	[4] = 0.85,
	[5] = 0.7,
	[6] = 0.7};
	
	if self.armorType ~= 0 then
	
		local limbPathDefaultSpeed0 = self:GetLimbPathSpeed(0) * 0.8
		local limbPathDefaultSpeed1 = self:GetLimbPathSpeed(1) * 0.8
		local limbPathDefaultSpeed2 = self:GetLimbPathSpeed(2) * 0.8
		local limbPathDefaultPushForce = self.LimbPathPushForce
		
		self:SetLimbPathSpeed(0, limbPathDefaultSpeed0 * self.armorPathSpeeds[self.armorType]);
		self:SetLimbPathSpeed(1, limbPathDefaultSpeed1 * self.armorPathSpeeds[self.armorType]);
		self:SetLimbPathSpeed(2, limbPathDefaultSpeed2 * self.armorPathSpeeds[self.armorType]);
		self.LimbPathPushForce = limbPathDefaultPushForce * (1/self.armorPathSpeeds[self.armorType])
		
	end
	
	self.altitude = 0;
	self.wasInAir = false;
	
	self.moveSoundTimer = Timer();
	self.moveSoundWalkTimer = Timer();
	self.wasCrouching = false;
	self.wasMoving = false;

	self.healthUpdateTimer = Timer();
	self.oldHealth = self.Health;
	
	self.Suppression = 0;
	self.Suppressed = false;	
	
	self.suppressionUpdateTimer = Timer();
	self.suppressedVoicelineTimer = Timer();
	self.suppressedVoicelineDelay = 15000;
	
	self.gunShotCounter = 0;
	self.suppressingVoicelineTimer = Timer();
	self.suppressingVoicelineDelay = 15000;
	
	self.blinkTimer = Timer();
	self.blinkDelay = math.random(5000, 11000);
	
	self.emotionTimer = Timer();
	self.emotionDuration = 0;
	
	-- experimental method for enhanced dying - don't let the actor actually die until we want him to.
	-- reason for this is because when the actor IsDead he will really want to settle and there's not much we can do about it.
	self.allowedToDie = false;	
	
	-- chance upon any non-headshot death to be incapacitated for a while before really dying
	self.incapacitationChance = 10;
	
	self.friendlyDownTimer = Timer();
	self.friendlyDownDelay = 5000;
	
	self.spotVoiceLineTimer = Timer();
	self.spotVoiceLineDelay = 15000;
	
	 -- in pixels
	self.spotDistanceClose = 175;
	self.spotDistanceMid = 520;
	--spotDistanceFar -- anything further than distanceMid
	
	 -- in MS
	self.spotDelayMin = 4000;
	self.spotDelayMax = 8000;
	
	 -- in percent
	self.spotIgnoreDelayChance = 10;
	self.spotNoVoicelineChance = 15;
	
	 -- burst fire
	self.burstFireDelayTimer = Timer()
	self.burstFireDelayMin = 150
	self.burstFireDelayMax = 300
	self.burstFireDelay = math.random(self.burstFireDelayMin,self.burstFireDelayMax)
	
	self.ragdollTerrainImpactTimer = Timer();
	self.ragdollTerrainImpactDelay = math.random(200, 500);
	
	-- chatting stuff. also extremely epic
	
	self.chatTimer = Timer();
	self.chatDelay = math.random(20000, 120000);
	
	-- extremely epic, 2000-tier combat/idle mode system
	self.inCombat = false;
	self.combatExitTimer = Timer();
	self.combatExitDelay = 10000;
	
	self.passiveSuppressionTimer = Timer();
	self.passiveSuppressionDelay = 1000;
	self.passiveSuppressionAmountLower = 5;
	self.passiveSuppressionAmountUpper = 10;

	
	-- leg Collision Detection system
    self.feetContact = {false, false}
    self.feetTimers = {Timer(), Timer()}
	self.footstepTime = 100 -- 2 Timers to avoid noise
	
	-- custom Jumping
	self.isJumping = false
	self.jumpTimer = Timer();
	self.jumpDelay = 500;
	self.jumpStop = Timer();
	
	self.lastVel = Vector(0, 0)
	
	-- gun rattles
	
	self.gunRattles = {["Heavy"] = CreateSoundContainer("GunRattle Heavy", "Scrappers.rte"),
	["Large"] = CreateSoundContainer("GunRattle Large", "Scrappers.rte"),
	["Launcher"] = CreateSoundContainer("GunRattle Launcher", "Scrappers.rte"),
	["MediumMetal"] = CreateSoundContainer("GunRattle MediumMetal", "Scrappers.rte"),
	["MediumPoly"] = CreateSoundContainer("GunRattle MediumPoly", "Scrappers.rte"),
	["SmallMetal"] = CreateSoundContainer("GunRattle SmallMetal", "Scrappers.rte"),
	["SmallPoly"] = CreateSoundContainer("GunRattle SmallPoly", "Scrappers.rte"),
	["VerySmallMetal"] = CreateSoundContainer("GunRattle VerySmallMetal", "Scrappers.rte"),
	["VerySmallPoly"] = CreateSoundContainer("GunRattle VerySmallPoly", "Scrappers.rte")};
	
	self.hardGunRattles = {["Heavy"] = CreateSoundContainer("GunRattle Heavy Hard", "Scrappers.rte"),
	["Large"] = CreateSoundContainer("GunRattle Large Hard", "Scrappers.rte"),
	["Launcher"] = CreateSoundContainer("GunRattle Launcher Hard", "Scrappers.rte"),
	["MediumMetal"] = CreateSoundContainer("GunRattle MediumMetal Hard", "Scrappers.rte"),
	["MediumPoly"] = CreateSoundContainer("GunRattle MediumPoly Hard", "Scrappers.rte"),
	["SmallMetal"] = CreateSoundContainer("GunRattle SmallMetal Hard", "Scrappers.rte"),
	["SmallPoly"] = CreateSoundContainer("GunRattle SmallPoly Hard", "Scrappers.rte"),
	["VerySmallMetal"] = CreateSoundContainer("GunRattle VerySmallMetal Hard", "Scrappers.rte"),
	["VerySmallPoly"] = CreateSoundContainer("GunRattle VerySmallPoly Hard", "Scrappers.rte")};
	
	-- End modded code
end

function OnCollideWithTerrain(self, terrainID)
	
	-- if self.impulse.Magnitude > self.ImpulseDamageThreshold then
		-- if self.impactSoundTimer:IsPastSimMS(700) then
			-- print("heavy")
			-- if self.terrainSounds.TerrainImpactHeavy[terrainID] ~= nil then
				-- self.terrainSounds.TerrainImpactHeavy[terrainID]:Play(self.Pos);
			-- else -- default to concrete
				-- self.terrainSounds.TerrainImpactHeavy[177]:Play(self.Pos);
			-- end
			-- self.impactSoundTimer:Reset();
		-- end
	-- elseif self.impulse.Magnitude > self.ImpulseDamageThreshold/5 then
		-- if self.impactSoundTimer:IsPastSimMS(700) then
			-- print("light")
			-- if self.terrainSounds.TerrainImpactLight[terrainID] ~= nil then
				-- self.terrainSounds.TerrainImpactLight[terrainID]:Play(self.Pos);
			-- else -- default to concrete
				-- self.terrainSounds.TerrainImpactLight[177]:Play(self.Pos);
			-- end
			-- self.impactSoundTimer:Reset();
		-- end
	-- end
	
	self.terrainCollided = true;
	self.terrainCollidedWith = terrainID;
end

function OnStride(self)

	if self.BGFoot and self.FGFoot then
	
		-- if math.random(0, 100) < 30 then
			-- if self.EquippedItem and IsHDFirearm(self.EquippedItem) then
				-- local gun = ToHDFirearm(self.EquippedItem)
				-- if gun:NumberValueExists("Gun Rattle Type") then
					-- if self.gunRattles[gun:GetNumberValue("Gun Rattle Type")] then
						-- self.gunRattles[gun:GetNumberValue("Gun Rattle Type")]:Play(gun.Pos);
					-- end
				-- end
			-- end	
		-- end

		local startPos = self.foot == 0 and self.BGFoot.Pos or self.FGFoot.Pos
		self.foot = (self.foot + 1) % 2
		
		local pos = Vector(0, 0);
		SceneMan:CastObstacleRay(startPos, Vector(0, 9), pos, Vector(0, 0), self.ID, self.Team, 0, 3);				
		local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
		
		if terrPixel ~= 0 then -- 0 = air
			if self.terrainSounds.FootstepWalk[terrPixel] ~= nil then
				self.terrainSounds.FootstepWalk[terrPixel]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.FootstepWalk[177]:Play(self.Pos);
			end
		end
		
	elseif self.BGFoot then
	
		-- if math.random(0, 100) < 30 then
			-- if self.EquippedItem and IsHDFirearm(self.EquippedItem) then
				-- local gun = ToHDFirearm(self.EquippedItem)
				-- if gun:NumberValueExists("Gun Rattle Type") then
					-- if self.gunRattles[gun:GetNumberValue("Gun Rattle Type")] then
						-- self.gunRattles[gun:GetNumberValue("Gun Rattle Type")]:Play(gun.Pos);
					-- end
				-- end
			-- end	
		-- end
	
		local startPos = self.BGFoot.Pos
		
		local pos = Vector(0, 0);
		SceneMan:CastObstacleRay(startPos, Vector(0, 9), pos, Vector(0, 0), self.ID, self.Team, 0, 3);				
		local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
		
		if terrPixel ~= 0 then -- 0 = air
			if self.terrainSounds.FootstepWalk[terrPixel] ~= nil then
				self.terrainSounds.FootstepWalk[terrPixel]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.FootstepWalk[177]:Play(self.Pos);
			end
		end
		
	elseif self.FGFoot then
	
		-- if math.random(0, 100) < 30 then
			-- if self.EquippedItem and IsHDFirearm(self.EquippedItem) then
				-- local gun = ToHDFirearm(self.EquippedItem)
				-- if gun:NumberValueExists("Gun Rattle Type") then
					-- if self.gunRattles[gun:GetNumberValue("Gun Rattle Type")] then
						-- self.gunRattles[gun:GetNumberValue("Gun Rattle Type")]:Play(gun.Pos);
					-- end
				-- end
			-- end	
		-- end
	
		local startPos = self.FGFoot.Pos
		
		local pos = Vector(0, 0);
		SceneMan:CastObstacleRay(startPos, Vector(0, 9), pos, Vector(0, 0), self.ID, self.Team, 0, 3);				
		local terrPixel = SceneMan:GetTerrMatter(pos.X, pos.Y)
		
		if terrPixel ~= 0 then -- 0 = air
			if self.terrainSounds.FootstepWalk[terrPixel] ~= nil then
				self.terrainSounds.FootstepWalk[terrPixel]:Play(self.Pos);
			else -- default to concrete
				self.terrainSounds.FootstepWalk[177]:Play(self.Pos);
			end
		end
		
	end
	
	if self.armorFoleyShortSounds[self.armorType] then
		self.armorFoleyShortSounds[self.armorType].Pitch = 1.05
		self.armorFoleyShortSounds[self.armorType].Volume = 1
		self.armorFoleyShortSounds[self.armorType]:Play(self.Pos);
	end
	
end

function Update(self)

	self.controller = self:GetController();
	

	
	-- Start modded code--
	
	if (UInputMan:KeyPressed(26)) and self:IsPlayerControlled() then
		self.Health = self.Health -26
	end
	
	if UInputMan:KeyPressed(3) and self:IsPlayerControlled() then
		self.Health = self.Health -51
	end
	
	if (UInputMan:KeyPressed(24)) and self:IsPlayerControlled() then
		self.Health = self.Health -6
	end
	
	self.impulse = (self.Vel - self.lastVel) / TimerMan.DeltaTimeSecs * self.Vel.Magnitude * 0.1
	self.lastVel = Vector(self.Vel.X, self.Vel.Y)
	
	self.voiceSound.Pos = self.Pos;
	
	if (self.Dying ~= true) then
		
		LightAIBehaviours.handleMovement(self);
		
		LightAIBehaviours.handleHealth(self);
		
		LightAIBehaviours.handleSuppression(self);
		
		LightAIBehaviours.handleAITargetLogic(self);
		
		LightAIBehaviours.handleVoicelines(self);
		
		LightAIBehaviours.handleChatting(self);
		
		LightAIBehaviours.handleHeadFrames(self);

	else
	
		LightAIBehaviours.handleDying(self);
	
		LightAIBehaviours.handleHeadLoss(self);
	
		LightAIBehaviours.handleMovement(self);
		
	end

	if self.Status == 1 or self.Dying then
		LightAIBehaviours.handleRagdoll(self)
	end

	-- clear terrain stuff after we did everything that used em
	
	self.terrainCollided = false;
	self.terrainCollidedWith = nil;

end
-- End modded code --

function UpdateAI(self)
	self.AI:Update(self)

end

function Destroy(self)
	self.AI:Destroy(self)
	
	-- Start modded code --

	if not self.ToSettle then -- we have been gibbed
		self.voiceSound:Stop(-1);		
	end
	
	-- End modded code --
	
end
