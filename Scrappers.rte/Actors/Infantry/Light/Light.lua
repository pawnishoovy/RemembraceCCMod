
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
	
	self.movementSounds = {
	Land = CreateSoundContainer("Base Cloth Light Land", "Scrappers.rte"),
	Jump = CreateSoundContainer("Base Cloth Light Jump", "Scrappers.rte"),
	Crouch = CreateSoundContainer("Base Cloth Light Crouch", "Scrappers.rte"),
	Stand = CreateSoundContainer("Base Cloth Light Stand", "Scrappers.rte"),
	Step = CreateSoundContainer("Base Cloth Light Walk", "Scrappers.rte")};
	
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
	
	-- End modded code
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
	
	self.voiceSound.Pos = self.Pos;
	
	if (self:IsDead() ~= true) then
		
		LightAIBehaviours.handleMovement(self);
		
		LightAIBehaviours.handleHealth(self);

	else
	
		LightAIBehaviours.handleHeadLoss(self);
	
		LightAIBehaviours.handleMovement(self);
		
	end

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
