
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
	
	-- TERRAIN SOUNDS
	
	self.terrainSounds = {
	Crawl = {[12] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[164] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[177] = CreateSoundContainer("Crawl Concrete", "Scrappers.rte"),
			[9] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[10] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
			[11] = CreateSoundContainer("Crawl Dirt", "Scrappers.rte"),
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

	self.altitude = 0;
	self.wasInAir = false;
	
	self.moveSoundTimer = Timer();
	self.moveSoundWalkTimer = Timer();
	self.wasCrouching = false;
	self.wasMoving = false;

	self.healthUpdateTimer = Timer();
	self.oldHealth = self.Health;
	
	self.ragdollTerrainImpactTimer = Timer();
	self.ragdollTerrainImpactDelay = math.random(200, 500);

	-- fil jump
	
	-- Leg Collision Detection system
    self.feetContact = {false, false}
    self.feetTimers = {Timer(), Timer()}
	self.footstepTime = 100 -- 2 Timers to avoid noise
	
	-- Custom Jumping
	self.isJumping = false
	self.jumpTimer = Timer();
	self.jumpDelay = 500;
	self.jumpStop = Timer();
	
	self.lastVel = Vector(0, 0)
	
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

function Update(self)

	self.controller = self:GetController();
	
	if self.alternativeGib then
		HumanFunctions.DoAlternativeGib(self);
	end
	if self.automaticEquip then
		HumanFunctions.DoAutomaticEquip(self);
	end
	if self.armSway then
		HumanFunctions.DoArmSway(self, (self.Health/self.MaxHealth));	--Argument: shove strength
	end
	if self.visibleInventory then
		HumanFunctions.DoVisibleInventory(self, false);	--Argument: whether to show all items
	end
	
	-- Start modded code--
	
	self.impulse = (self.Vel - self.lastVel) / TimerMan.DeltaTimeSecs * self.Vel.Magnitude * 0.1
	self.lastVel = Vector(self.Vel.X, self.Vel.Y)
	
	self.voiceSound.Pos = self.Pos;
	
	if (self:IsDead() ~= true) then
		
		LightAIBehaviours.handleMovement(self);
		
		LightAIBehaviours.handleHealth(self);

	else
	
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
