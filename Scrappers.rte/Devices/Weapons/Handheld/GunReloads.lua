ScrappersReloadsData = {}

function ScrappersReloadsData.NullToZero(value)
	if value == nil then
		return 0
	else
		return value
	end
end

-- Basic Magazine Fed Reload
function ScrappersReloadsData.BasicMagazineFedCreate(self, parent)
	-- phases:
	-- 0 magout
	-- 1 magin
	-- 2 maghit (optional)
	-- 3 boltback
	-- 4 boltforward
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.chamberOnReload = false;
	
	self.firedFrameFrame = self.Receiver.FiredFrameFrame and self.Receiver.FiredFrameFrame or self.FrameRange
	self.animatedBolt = true
end

-- AN94
function ScrappersReloadsData.AN94Create(self, parent)
	-- phases:
	-- 0 magout
	-- 1 magin
	-- 2 boltback
	-- 3 boltforward
	-- 4 shoulder
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.RateOfFire = 3000; -- wow!!
	
	self.shotCount = 0
	
	self.experimentalFullAutoMech = false
	self.experimentalFullAutoCutOffTime = 50
	
	self.firstMech = CreateSoundContainer("Reload Bolt Unique AN94 FirstMech", "Scrappers.rte")
	self.nullMech = CreateSoundContainer("Scrappers Dummy Silence", "Scrappers.rte")
	self.Mech = CreateSoundContainer("Reload Bolt Unique AN94 Mech", "Scrappers.rte")
	
	self.soundFireMech = CreateSoundContainer("Reload Bolt Unique AN94 FirstMech", "Scrappers.rte")
	
	self.shotCount = 0
	
	self.burstCoolDownDelay = (60000/self.RateOfFire)
	self.shotsPerBurst = 2
	self.burstShotCounter = 0
	
	self.chamberOnReload = false;
	
	self.firedFrameFrame = self.Receiver.FiredFrameFrame and self.Receiver.FiredFrameFrame or self.FrameRange
	self.animatedBolt = true
end

-- Opening (Normal) Revolver Reload
function ScrappersReloadsData.OpeningRevolverCreate(self, parent)
	-- phases:
	-- 0: cylinderopen
	-- 1: ejectshells
	-- 2: roundin (pick 1)
	-- 3: speedloaderin (pick 1)
	-- 4: speedloaderoff (optional)
	-- 5: cylinderclose
	-- 6: hammerback (optional if single-action)
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.spentShells = 0
	self.ammoCount = self.MaxRoundCount
	
	if self.boltRelease == true then
	
		if self.Receiver.PreDoubleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreDoubleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleDelay)
		end
		
	else
	
		if self.Receiver.PreSingleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreSingleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleDelay)
		end
		
	end
	
	self.ReloadCylinderFrameStart = self.Receiver.FrameOpenStart - self.Receiver.FrameStart
	self.ReloadCylinderFrameEnd = self.Receiver.FrameOpenEnd - self.Receiver.FrameStart
	self.ReloadEjectFrameStart = self.Receiver.FrameEjectStart - self.Receiver.FrameStart
	self.ReloadEjectFrameEnd = self.Receiver.FrameEjectEnd - self.Receiver.FrameStart
	
	self.firedFrameFrame = 0
	self.animatedBolt = false
end

-- Opening (Cool) Revolver Reload
function ScrappersReloadsData.MatebaRevolverCreate(self, parent)
	-- phases:
	-- 0: cylinderopen
	-- 1: ejectshells
	-- 2: roundin (pick 1)
	-- 3: speedloaderin (pick 1)
	-- 4: speedloaderoff (optional)
	-- 5: cylinderclose
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.spentShells = 0
	self.ammoCount = self.MaxRoundCount
	
	self.ReloadCylinderFrameStart = self.Receiver.FrameOpenStart - self.Receiver.FrameStart
	self.ReloadCylinderFrameEnd = self.Receiver.FrameOpenEnd - self.Receiver.FrameStart
	self.ReloadEjectFrameStart = self.Receiver.FrameEjectStart - self.Receiver.FrameStart
	self.ReloadEjectFrameEnd = self.Receiver.FrameEjectEnd - self.Receiver.FrameStart
	
	self.firedFrameFrame = 0
	self.animatedBolt = false
end

-- Break Action Revolver Reload
function ScrappersReloadsData.BreakActionRevolverCreate(self, parent)
	-- phases:
	-- 0: open
	-- 1: roundin (pick 1)
	-- 2: speedloaderin (pick 1)
	-- 3: speedloaderoff (optional)
	-- 4: close
	-- 5: hammerback (optional if single-action)
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.ammoCount = self.MagazineData.RoundCount
	
	if self.boltRelease == true then
	
		if self.Receiver.PreDoubleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreDoubleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleDelay)
		end
		
	else
	
		if self.Receiver.PreSingleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreSingleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleDelay)
		end
		
	end
	
	self.firedFrameFrame = 0
	self.animatedBolt = false
end

-- Single-Action Cowboy Style Revolver Reload
-- mind that it can be double action anyway, but it has that gated style of reloading system
function ScrappersReloadsData.GatedRevolverCreate(self, parent)
	-- phases:
	-- 0: gateopen
	-- 1: ejectshell
	-- 2: roundin
	-- 3: cylinderturn
	-- 4: gateclose
	-- 5: hammerback (optional if single-action)
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.ammoCount = self.MagazineData.RoundCount
	
	if self.boltRelease == true then
	
		if self.Receiver.PreDoubleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreDoubleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDoubleDelay)
		end
		
	else
	
		if self.Receiver.PreSingleSound then
			self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleSound), ScrappersData.Module)
		end
		
		if self.Receiver.PreSingleDelay then
			self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSingleDelay)
		end
		
	end
	
	self.ReloadGateFrameStart = self.Receiver.FrameOpenStart - self.Receiver.FrameStart
	self.ReloadGateFrameEnd = self.Receiver.FrameOpenEnd - self.Receiver.FrameStart
	self.ReloadEjectFrameStart = self.Receiver.FrameEjectStart - self.Receiver.FrameStart
	self.ReloadEjectFrameEnd = self.Receiver.FrameEjectEnd - self.Receiver.FrameStart
	
	self.firedFrameFrame = 0
	self.animatedBolt = false
end

-- Single-Action Army Style Revolver Reload
-- Ocelot would be proud
function ScrappersReloadsData.SingleActionArmyRevolverCreate(self, parent)
	-- phases:
	
	-- deploying! OnAttach
	-- 0: IntroFlairSelect
	-- 1: IntroFlair1Part1
	-- 2: IntroFlair1Part2
	-- 3: IntroFlair2Part1
	-- 4: IntroFlair3Part1
	-- 5: IntroFlair3Part2
	
	-- reload intro flair!
	-- 6: ReloadIntroFlairSelect
	-- 7: ReloadIntroFlair1
	-- 8: ReloadIntroFlair2
	-- 9: ReloadIntroFlair3
	
	-- 10: hammerdown
	-- 11: gateopen
	-- 12: ejectshell
	-- 13: cylinderturn
	-- 14: roundin
	-- 15: gateclose
	
	-- reload outro flair!
	-- 16: ReloadOutroFlairSelect
	-- 17: ReloadOutroFlair1
	-- 18: ReloadOutroFlair2
	-- 19: ReloadOutroFlair3
	
	-- 20: reloadhammerback
	-- 21: hammerback
	
	-- self:AddScript("Scrappers.rte/Devices/Weapons/Handheld/Pistol/Unique/SingleActionArmy.lua")
	
	-- this is so useless...
	
	self.Spinning = false;
	
	self.spinTimer = Timer();
	self.spinDelay = 50;
	self.maxSpinTime = 15000;
	
	self.spinRandomTimer = Timer();
	self.spinRandomDelay = 4000;
	
	self.spinCooldownTimer = Timer();
	self.spinCooldown = 600;
	
	self.spinStances = {Vector(8, 3), Vector(4, 13), Vector(-3, 10), Vector(8, -10)}
	
	self.beingThrownUp = false;
	self.beingCaught = false;
	self.fakeVel = 0;
	
	-- end of uselessness
	
	self.outroSound = CreateSoundContainer("Reload Bolt Unique Single Action Army OutroFlair", "Scrappers.rte");
	
	self.spinStartSound = CreateSoundContainer("Reload Bolt Unique Single Action Army SpinStart", "Scrappers.rte");
	self.spinLoopSound = CreateSoundContainer("Reload Bolt Unique Single Action Army SpinLoop", "Scrappers.rte");
	self.spinStopSound = CreateSoundContainer("Reload Bolt Unique Single Action Army SpinStop", "Scrappers.rte");
	self.spinThrowSound = CreateSoundContainer("Reload Bolt Unique Single Action Army SpinThrow", "Scrappers.rte");
	self.spinCatchSound = CreateSoundContainer("Reload Bolt Unique Single Action Army SpinCatch", "Scrappers.rte");
	
	self.reloadTimer = Timer();
	self.reloadPhase = 6;
	self.ReloadTime = 30000;
	
	self.ammoCount = self.MagazineData.RoundCount
	self.spentShells = 0
	
	self.ReloadGateFrameStart = self.Receiver.FrameOpenStart - self.Receiver.FrameStart
	self.ReloadGateFrameEnd = self.Receiver.FrameOpenEnd - self.Receiver.FrameStart
	self.ReloadEjectFrameStart = self.Receiver.FrameEjectStart - self.Receiver.FrameStart
	self.ReloadEjectFrameEnd = self.Receiver.FrameEjectEnd - self.Receiver.FrameStart
	
	self.firedFrameFrame = 0
	self.animatedBolt = false
end

-- HK Slap-style Magazine Fed Reload
function ScrappersReloadsData.HKMagazineFedCreate(self, parent)
	-- phases:
	-- 0 boltback
	-- 1 boltlock
	-- 2 magout
	-- 3 magin
	-- 4 maghit (optional)
	-- 5 boltforward
	
	self.reloadTimer = Timer();
	self.reloadPhase = 0;
	self.ReloadTime = 15000;
	
	self.chamberOnReload = false;
	
	self.firedFrameFrame = self.Receiver.FiredFrameFrame and self.Receiver.FiredFrameFrame or (self.FrameIntermediate)
	self.animatedBolt = true
end

-- Open Bolt Magazine Fed Reload
function ScrappersReloadsData.OpenBoltMagazineFedCreate(self, parent)

	-- lord have mercy

	if self.Receiver.BoltSound then
		self.boltSound = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.BoltSound), "Scrappers.rte")
	end
	if self.Receiver.BoltDropSound then
		self.boltDropSound = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.BoltDropSound), "Scrappers.rte")
	end

	-- phases:
	-- 0 magout
	-- 1 magin
	-- 2 maghit (optional)
	-- 3 boltback
	-- 4 boltforward (optional)
	
	self.reloadTimer = Timer()
	self.reloadPhase = 0
	self.ReloadTime = 15000
	
	self.chamberOnReload = false;
	
	self.ChargeFrameRange = self.Receiver.FrameChargeEnd - self.Receiver.FrameStart
	self.ChargeFrameIntermediate = self.Receiver.FrameChargeIntermediate - self.Receiver.FrameStart
	self.ChargeFrameStart = self.Receiver.FrameChargeStart - self.Receiver.FrameStart
	
	self.fireTime = 1 / (self.RateOfFire / 60) * 1000
	
	self.ROFNum = self.fireTime * 0.65
	self.ROFNum2 = self.fireTime * 0.13
	self.boltDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.BoltDelay)
	
	--self.boltSpeedShotFirst = 0.625
	--self.boltSpeedShot = 1.5
	
	self.boltDelayNum = self.boltDelay
	
	self.delayedFiring = false
	self.delayedFireTimer = Timer()
	self.delayedFireDelay = self.boltDelay
	self.triggerPulled = false
	
	self.boltAnimTimer = Timer()
	self.miscTimer = Timer() -- i know, not descriptive :(
	
end

function ScrappersReloadsData.BasicMagazineFedUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	local controller = parent and parent:GetController() or nil
	if self:IsReloading() then
		if controller then
			controller:SetState(Controller.AIM_SHARP,false);
		end
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
		
		if self.boltRelease and self.chamberOnReload then
			self.FrameLocal = self.FrameRange;
		else
			self.FrameLocal = 0;
		end
		
		if self.reloadPhase == 0 then
			local prepare = "MagOutPrepareSound"
			local after = "MagOutSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagOutPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagOutAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
			local prepare = "MagInPrepareSound"
			local after = "MagInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "MagHitPrepareSound"
			local after = "MagHitSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagHitAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then
			local prepare = "BoltBackPrepareSound"
			local after = "BoltBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 4 then
		
			self.FrameLocal = self.FrameRange;
		
			local prepare = "BoltForwardPrepareSound"
			local after = "BoltForwardSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltForwardPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltForwardAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.FrameLocal = (self.FrameRange);
			self.horizontalAnim = 0.5
			self.rotationTarget = 7-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
				self:SetNumberValue("MagRemoved", 1)
			elseif self.reloadPhase == 1 then
				self:RemoveNumberValue("MagRemoved")
			elseif self.reloadPhase == 3 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = math.floor(factor * (self.FrameRange) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor
			elseif self.reloadPhase == 4 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 0.5)
				
				self.FrameLocal = math.floor((1 - factor) * (self.FrameRange) + 0.5)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * ((1 - factor) - 0.5)), 122);
				
				self.rotationTarget = -15 - -10 * factor
			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;
					
					self.verticalAnim = self.verticalAnim + 1
				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;
					
					
					self.verticalAnim = self.verticalAnim - 0.3
				elseif self.reloadPhase == 2 then		
					if self.chamberOnReload then
						self.phaseOnStop = 3;
					else
						self.phaseOnStop = nil;
					end				
					self.verticalAnim = self.verticalAnim - 1						
				else
					self.phaseOnStop = nil;
				end
				
				if self.reloadPhase == 3 then	
					self.horizontalAnim = self.horizontalAnim - 1
				elseif self.reloadPhase == 4 then	
					self.horizontalAnim = self.horizontalAnim + 1
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				local magEndPhase = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay and 2 or 1;
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				if self.chamberOnReload and self.reloadPhase == magEndPhase then
					if self.boltRelease then
						self.reloadPhase = 4;
					else
						self.reloadPhase = 3;
					end
					
				elseif self.reloadPhase == 2 then
					if self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay == nil then
						self.reloadPhase = 3
					elseif self.chamberOnReload == false then
						self.ReloadTime = 0
						self.reloadPhase = 0
					end
					
				elseif self.reloadPhase == magEndPhase or self.reloadPhase == 4 then
					self.ReloadTime = 0;
					self.reloadPhase = 0;
					
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		if not (self.boltRelease and self.chamberOnReload) then
			self.FrameLocal = 0;
		end
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		if self.reloadPhase == 4 then
			self.reloadPhase = 3;
		end
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 9999;
	end
	
	if self:DoneReloading() == true and self.chamberOnReload then
		self.Magazine.RoundCount = self.Magazine.RoundCount - 1
		self.chamberOnReload = false
	elseif self:DoneReloading() then
		self.chamberOnReload = false
	end
	
	if self.FiredFrame then
		--self.FrameLocal = self.firedFrameFrame
		ScrappersGunFunctions.SpawnCasing(self)
		
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
			else
				self.chamberOnReload = true;
			end
		end
		
	end
end

function ScrappersReloadsData.AN94Update(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	local controller = parent and parent:GetController() or nil
	if self:IsReloading() then
		if controller then
			controller:SetState(Controller.AIM_SHARP,false);
		end
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
		
		if self.boltRelease and self.chamberOnReload then
			self.FrameLocal = self.FrameRange;
		else
			self.FrameLocal = 0;
		end
		
		if self.reloadPhase == 0 then
			local prepare = "MagOutPrepareSound"
			local after = "MagOutSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagOutPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagOutAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
			local prepare = "MagInPrepareSound"
			local after = "MagInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)

		elseif self.reloadPhase == 2 then
			local prepare = "BoltBackPrepareSound"
			local after = "BoltBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then
		
			local prepare = "BoltForwardPrepareSound"
			local after = "BoltForwardSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltForwardPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltForwardAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.FrameLocal = (self.FrameRange);
			self.horizontalAnim = 0.5
			self.rotationTarget = 7-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)

		elseif self.reloadPhase == 4 then
		
			self.FrameLocal = 0
		
			local prepare = "ShoulderPrepareSound"
			local after = "ShoulderSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseShoulderPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseShoulderAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--

			self.rotationTarget = -3-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
				self:SetNumberValue("MagRemoved", 1)
			elseif self.reloadPhase == 1 then
				self:RemoveNumberValue("MagRemoved")
			elseif self.reloadPhase == 2 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = math.floor(factor * (self.FrameRange) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor
			elseif self.reloadPhase == 3 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 0.5)
				
				self.FrameLocal = math.floor((1 - factor) * (self.FrameRange) + 0.5)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * ((1 - factor) - 0.5)), 122);
				
				self.rotationTarget = -15 - -10 * factor
			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;
					
					self.verticalAnim = self.verticalAnim + 1
				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;
					
					
					self.verticalAnim = self.verticalAnim - 0.3		
					
				elseif self.reloadPhase == 2 then	
				
					self.horizontalAnim = self.horizontalAnim - 1
					
				elseif self.reloadPhase == 3 then	
				
					self.horizontalAnim = self.horizontalAnim + 1
					
				elseif self.reloadPhase == 3 then	
				
					self.horizontalAnim = self.horizontalAnim - 2
				else
				
					self.phaseOnStop = nil;
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				if self.chamberOnReload and self.reloadPhase == 1 then
					if self.boltRelease then
						self.reloadPhase = 3;
					else
						self.reloadPhase = 2;
					end
					
				elseif self.reloadPhase == 1 then
					self.reloadPhase = 4
					
				elseif self.reloadPhase == 3 then
					self.FrameLocal = 0
					self.reloadPhase = 4
	
				elseif self.reloadPhase == 4 then
					self.horizontalAnim = self.horizontalAnim + 3
					self.verticalAnim = self.verticalAnim + 1
					self.ReloadTime = 0;
					self.reloadPhase = 0;
					
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		
		if not (self.boltRelease and self.chamberOnReload) then
			self.FrameLocal = 0;
		end
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		if self.reloadPhase == 3 then
			self.reloadPhase = 2;
		end
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 9999;
	end
	
	if self:DoneReloading() == true and self.chamberOnReload then
		self.Magazine.RoundCount = self.Magazine.RoundCount - 1
		self.chamberOnReload = false
	elseif self:DoneReloading() then
		self.chamberOnReload = false
	end
	
	
	if self.FiredFrame then
		if self.shotCount == 1 then
			self.soundFireMech = self.nullMech
			self.RateOfFire = 625
			self.shotCount = self.shotCount + 1
		elseif self.shotCount == 0 then
			self.experimentalFullAutoSounds = false
			self.shotCount = self.shotCount + 1
		else
			self.experimentalFullAutoSounds = true
			self.soundFireMech = self.Mech
		end
		
		--self.FrameLocal = self.firedFrameFrame
		
		ScrappersGunFunctions.SpawnCasing(self)
		
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
			else
				self.chamberOnReload = true;
			end
		end
	elseif not self:IsActivated() then
		self.RateOfFire = 3000
		self.soundFireMech = self.firstMech
		self.shotCount = 0
	end
end

function ScrappersReloadsData.OpeningRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);

	local controller = parent and parent:GetController() or nil
	if parent and (self:IsReloading() or self.Chamber == true) then
		if controller and self:IsReloading() then controller:SetState(Controller.AIM_SHARP,false) end
		
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		--self:Deactivate();
		self.preFireTimer:Reset();
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 0 and self.reloadPhase ~= 6 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = self.FrameRange
		end
		
		if self.reloadPhase == 0 then
		
			local prepare = "CylinderOpenPrepareSound"
			local after = "CylinderOpenSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseCylinderOpenPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCylinderOpenAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
		
			self.FrameLocal = self.ReloadCylinderFrameEnd
		
			local prepare = "EjectShellsPrepareSound"
			local after = "EjectShellsSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseEjectShellsPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseEjectShellsAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "RoundInPrepareSound"
			local after = "RoundInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseRoundInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = -10 * math.max((self.reloadDelay/0.8), self.reloadTimer.ElapsedSimTimeMS) / (self.reloadDelay)
			
		elseif self.reloadPhase == 3 then
			local prepare = "SpeedLoaderInPrepareSound"
			local after = "SpeedLoaderInSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 4 then		
			local prepare = "SpeedLoaderOffPrepareSound"
			local after = "SpeedLoaderOffSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			
		elseif self.reloadPhase == 5 then		
			local prepare = "CylinderClosePrepareSound"
			local after = "CylinderCloseSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseCylinderClosePrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCylinderCloseAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			
		elseif self.reloadPhase == 6 then
			local prepare = "HammerBackPrepareSound"
			local after = "HammerBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseHammerBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseHammerBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--			
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*3)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor(factor * (self.ReloadCylinderFrameEnd - self.ReloadCylinderFrameStart))
				
			elseif self.reloadPhase == 1 then
				
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*4)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 1)
				factor = math.sin(factor * math.pi) -- goes back and forth
				
				self.FrameLocal = self.ReloadEjectFrameStart + math.floor(factor * (self.ReloadEjectFrameEnd - self.ReloadEjectFrameStart))
			elseif self.reloadPhase == 2 then
			
				if controller:IsState(Controller.WEAPON_FIRE) then
					self.breakReload = true;
					PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
				end
				
			elseif self.reloadPhase == 3 then
				self.FrameLocal = self.ReloadCylinderFrameEnd
			elseif self.reloadPhase == 4 then
				self.FrameLocal = self.ReloadCylinderFrameEnd
			elseif self.reloadPhase == 5 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*3)
				
				local factor = math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1)
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor((1 - factor) * (self.ReloadCylinderFrameEnd - self.ReloadCylinderFrameStart))
			
			elseif self.reloadPhase == 6 then
				
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*3)
				
				local factor = math.sqrt(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1))
				
				self.FrameLocal = math.floor((1 - factor) * (self.FrameRange))

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;

				elseif self.reloadPhase == 1 then
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.phaseOnStop = 2;
					else
						self.phaseOnStop = 3;
					end
					
					self.ammoCount = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay and 0 or (self.ammoCount - self.spentShells);
					local casingsToSpawn = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay and self.MaxRoundCount or self.spentShells;
					
					for i = 1, casingsToSpawn do
						ScrappersGunFunctions.SpawnCasing(self)
					end
					
					self.spentShells = 0;
					
				elseif self.reloadPhase == 2 then
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MaxRoundCount then
						self.phaseOnStop = 5;
					else
						self.phaseOnStop = 2;
					end
					
				elseif self.reloadPhase == 3 then						
					self.phaseOnStop = 4;
					
					self.ammoCount = self.MaxRoundCount
				
				elseif self.reloadPhase == 4 then						
					self.phaseOnStop = 5;	
					
				elseif self.reloadPhase == 5 then						
					self.phaseOnStop = 6;
					
				else
					self.phaseOnStop = nil;
					
					self.rotation = self.rotation + 5
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if self.reloadPhase == 0 then
					if self.spentShells == 0 and self.ammoCount < self.MaxRoundCount and self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.reloadPhase = 2;
					else
						self.reloadPhase = 1;
					end
					
				elseif self.reloadPhase == 1 then
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.reloadPhase = 2;
					else
						self.reloadPhase = 3;
					end
					
				elseif self.reloadPhase == 2 then
					if self.ammoCount == self.MaxRoundCount or self.breakReload == true then
						self.reloadPhase = 5;
						self.breakReload = false;
					else
						self.reloadPhase = 2; -- the ride never ends (until we're at max)
					end
					
				elseif self.reloadPhase == 3 and self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay == nil then
					self.reloadPhase = 5;
					
				elseif self.reloadPhase == 5 then
					if self.boltRelease == true then
						self.Chamber = false
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					elseif self.Chamber == true then
						self.reloadPhase = 6;
					else
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					end
					
				elseif self.reloadPhase == 6 then
					self.Chamber = false;
					if self.reChamber == true and self:IsReloading() then
						self.reChamber = false;
						self.reloadPhase = 0;
					else
						self.reChamber = false;
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					end
					
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 15000;
	end
	
	if self:DoneReloading() then
		self.Magazine.RoundCount = self.ammoCount;
	end
	
	if self.preFire == true then
		self.FrameLocal = 0
	end
	
	if self.FiredFrame then
		self.FrameLocal = self.FrameRange
		self.spentShells = self.spentShells + 1
		
		self.aboutToChamber = true
	end
	
	if self.aboutToChamber and (self:IsReloading() or (controller and not controller:IsState(Controller.WEAPON_FIRE))) then
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
				if self.boltRelease ~= true then
					self.Chamber = true
					self.reChamber = true
					self.reloadPhase = 6
				end
			else
				self.reloadPhase = 0
			end
		end
		self.aboutToChamber = false
	end
end

function ScrappersReloadsData.MatebaRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);

	local controller = parent and parent:GetController() or nil
	if parent and self:IsReloading() then
		if controller and self:IsReloading() then controller:SetState(Controller.AIM_SHARP,false) end
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		--self:Deactivate();
		self.preFireTimer:Reset();
		
		if self.reloadPhase == 0 then
		
			local prepare = "CylinderOpenPrepareSound"
			local after = "CylinderOpenSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseCylinderOpenPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCylinderOpenAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = 15 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
		
			self.FrameLocal = self.ReloadCylinderFrameEnd
		
			local prepare = "EjectShellsPrepareSound"
			local after = "EjectShellsSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseEjectShellsPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseEjectShellsAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 45-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "RoundInPrepareSound"
			local after = "RoundInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseRoundInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = -20 * math.max((self.reloadDelay/0.8), self.reloadTimer.ElapsedSimTimeMS) / (self.reloadDelay)
			
		elseif self.reloadPhase == 3 then
			local prepare = "SpeedLoaderInPrepareSound"
			local after = "SpeedLoaderInSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = -20 * math.max((self.reloadDelay/0.6), self.reloadTimer.ElapsedSimTimeMS) / (self.reloadDelay)
			
		elseif self.reloadPhase == 4 then		
			local prepare = "SpeedLoaderOffPrepareSound"
			local after = "SpeedLoaderOffSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = -10
			
		elseif self.reloadPhase == 5 then		
			local prepare = "CylinderClosePrepareSound"
			local after = "CylinderCloseSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseCylinderClosePrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCylinderCloseAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = -5
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*3)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor(factor * (self.ReloadCylinderFrameEnd - self.ReloadCylinderFrameStart))
				
			elseif self.reloadPhase == 1 then
				
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*4)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 1)
				factor = math.sin(factor * math.pi) -- goes back and forth
				
				self.FrameLocal = self.ReloadEjectFrameStart + math.floor(factor * (self.ReloadEjectFrameEnd - self.ReloadEjectFrameStart))
			elseif self.reloadPhase == 2 then
			
				if controller:IsState(Controller.WEAPON_FIRE) then
					self.breakReload = true;
					PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
				end
				
			elseif self.reloadPhase == 3 then
				self.FrameLocal = self.ReloadCylinderFrameEnd
			elseif self.reloadPhase == 4 then
				self.FrameLocal = self.ReloadCylinderFrameEnd
			elseif self.reloadPhase == 5 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*3)
				
				local factor = math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1)
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor((1 - factor) * (self.ReloadCylinderFrameEnd - self.ReloadCylinderFrameStart))

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;

				elseif self.reloadPhase == 1 then
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.phaseOnStop = 2;
					else
						self.phaseOnStop = 3;
					end
					
					self.ammoCount = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay and 0 or (self.ammoCount - self.spentShells);
					local casingsToSpawn = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay and self.MaxRoundCount or self.spentShells;
					
					for i = 1, casingsToSpawn do
						ScrappersGunFunctions.SpawnCasing(self)
					end
					
					self.spentShells = 0;
					
				elseif self.reloadPhase == 2 then
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MaxRoundCount then
						self.phaseOnStop = 5;
					else
						self.phaseOnStop = 2;
					end
					
					
				elseif self.reloadPhase == 3 then						
					self.phaseOnStop = 4;
					
					self.ammoCount = self.MagazineData.RoundCount
				
				elseif self.reloadPhase == 4 then						
					self.phaseOnStop = 5;	
					
				elseif self.reloadPhase == 5 then						
					self.phaseOnStop = 6;
					
				else
					self.phaseOnStop = nil;

				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if self.reloadPhase == 0 then
					if self.spentShells == 0 and self.ammoCount < self.MaxRoundCount and self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.reloadPhase = 2;
					else
						self.reloadPhase = 1;
					end				
				
				elseif self.reloadPhase == 1 then
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.reloadPhase = 2;
					else
						self.reloadPhase = 3;
					end
					
				elseif self.reloadPhase == 2 then
					if self.ammoCount == self.MagazineData.RoundCount or self.breakReload == true then
						self.reloadPhase = 5;
						self.breakReload = false;
					else
						self.reloadPhase = 2; -- the ride never ends (until we're at max)
					end
					
				elseif self.reloadPhase == 3 and self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay == nil then
					self.reloadPhase = 5;
					
				elseif self.reloadPhase == 5 then

					self.FrameLocal = 0
					self.ReloadTime = 0;
					self.reloadPhase = 0;
					
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 15000;
	end
	
	if self:DoneReloading() then
		self.Magazine.RoundCount = self.ammoCount;
	end
	
	if self.preFire == true then
		self.FrameLocal = self.FrameRange
	end
	
	if self.FiredFrame then
		self.FrameLocal = 0
		self.spentShells = self.spentShells + 1
	end
end

function ScrappersReloadsData.BreakActionRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);

	local controller = parent and parent:GetController() or nil
	if parent and (self:IsReloading() or self.Chamber == true) then
		if controller and self:IsReloading() then controller:SetState(Controller.AIM_SHARP,false) end
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		--self:Deactivate();
		self.preFireTimer:Reset();
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 0 and self.reloadPhase ~= 5 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = self.FrameRange
		end
		
		if self.reloadPhase == 0 then
		
			local prepare = "OpenPrepareSound"
			local after = "OpenSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseOpenPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseOpenAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
			local prepare = "RoundInPrepareSound"
			local after = "RoundInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseRoundInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "SpeedLoaderInPrepareSound"
			local after = "SpeedLoaderInSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then		
			local prepare = "SpeedLoaderOffPrepareSound"
			local after = "SpeedLoaderOffSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseSpeedLoaderOffAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			
		elseif self.reloadPhase == 4 then		
			local prepare = "ClosePrepareSound"
			local after = "CloseSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseClosePrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCloseAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			
		elseif self.reloadPhase == 5 then		
			local prepare = "HammerBackPrepareSound"
			local after = "HammerBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseHammerBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseHammerBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--			
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
			
				
			elseif self.reloadPhase == 1 then

				if controller:IsState(Controller.WEAPON_FIRE) then
					self.breakReload = true;
					PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
				end
			
			-- elseif self.reloadPhase == 2 then
				
			-- elseif self.reloadPhase == 3 then

			-- elseif self.reloadPhase == 4 then
			
			elseif self.reloadPhase == 5 then	
			
				self.phaseOnStop = 5
			
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
			
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = 0
				end

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
				
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.phaseOnStop = 1;
					else
						self.phaseOnStop = 2;
					end
					
					for i = 1, self.MaxRoundCount do
						ScrappersGunFunctions.SpawnCasing(self)
					end
					self.ammoCount = 0;
					
				elseif self.reloadPhase == 1 then
					
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MagazineData.RoundCount then
						self.phaseOnStop = 4;
					else
						self.phaseOnStop = 1;
					end
					
				elseif self.reloadPhase == 2 then						
					self.phaseOnStop = 3;
					
					self.ammoCount = self.MagazineData.RoundCount
				
				elseif self.reloadPhase == 3 then						
					self.phaseOnStop = 4;	
					
				elseif self.reloadPhase == 4 then						
					self.phaseOnStop = 5;
					
				else
					self.phaseOnStop = nil;
					
					self.rotation = self.rotation + 5
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if self.reloadPhase == 0 then
					if self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay ~= nil then
						self.reloadPhase = 1;
					else
						self.reloadPhase = 2;
					end
					
				elseif self.reloadPhase == 1 then
					if self.ammoCount == self.MagazineData.RoundCount or self.breakReload == true then
						self.reloadPhase = 4;
						self.breakReload = false;
					else
						self.reloadPhase = 1; -- the ride never ends (until we're at max)
					end
					
				elseif self.reloadPhase == 2 and self.ReloadMagazineSoundSet.BaseSpeedLoaderOffPrepareDelay == nil then
					self.reloadPhase = 4;
					
				elseif self.reloadPhase == 4 then
					if self.boltRelease == true then
						self.Chamber = false
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					else
						self.reloadPhase = 5;
					end
					
				elseif self.reloadPhase == 5 then
					self.Chamber = false;
					if self.reChamber == true and self:IsReloading() then
						self.reChamber = false;
						self.reloadPhase = 0;
					else
						self.reChamber = false;
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					end
					
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 15000;
	end
	
	if self:DoneReloading() then
		self.Magazine.RoundCount = self.ammoCount;
	end
	
	if self.preFire == true then
		self.FrameLocal = 0
	end
	
	if self.FiredFrame then
		self.FrameLocal = self.FrameRange
		
		self.aboutToChamber = true
	end
	
	if self.aboutToChamber and (self:IsReloading() or (controller and not controller:IsState(Controller.WEAPON_FIRE))) then
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
				if self.boltRelease ~= true then
					self.Chamber = true
					self.reChamber = true
					self.reloadPhase = 5
				end
			else
				self.reloadPhase = 0
			end
		end
		self.aboutToChamber = false
	end
	
end

function ScrappersReloadsData.GatedRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);

	
	local controller = parent and parent:GetController() or nil
	if parent and (self:IsReloading() or self.Chamber == true) then
		if controller and self:IsReloading() then controller:SetState(Controller.AIM_SHARP,false) end
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		if not self:IsReloading() and self.reloadPhase ~= 5 then
			self:Reload()
		end
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		--self:Deactivate();
		self.preFireTimer:Reset();
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 0 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = self.FrameRange
			self.Chamber = true
		end
		
		if self.reloadPhase == 0 then
			
			self.FrameLocal = self.FrameRange
		
			local prepare = "GateOpenPrepareSound"
			local after = "GateOpenSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseGateOpenPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseGateOpenAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
		
			self.FrameLocal = self.ReloadGateFrameEnd
		
			local prepare = "EjectShellPrepareSound"
			local after = "EjectShellSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseEjectShellPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseEjectShellAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "RoundInPrepareSound"
			local after = "RoundInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseRoundInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then
			local prepare = "CylinderTurnPrepareSound"
			local after = "CylinderTurnSound"
			
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseCylinderTurnPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseCylinderTurnAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 4 then		
			local prepare = "GateClosePrepareSound"
			local after = "GateCloseSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseGateClosePrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseGateCloseAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			--
			
		elseif self.reloadPhase == 5 then		
			local prepare = "HammerBackPrepareSound"
			local after = "HammerBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseHammerBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseHammerBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--			
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then

				
			-- elseif self.reloadPhase == 1 then
	
			
			elseif self.reloadPhase == 2 then
				
				if controller:IsState(Controller.WEAPON_FIRE) then
					self.breakReload = true;
					PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
				end
				
			-- elseif self.reloadPhase == 3 then

			-- elseif self.reloadPhase == 4 then
			
			elseif self.reloadPhase == 5 then
			
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
			
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = self.FrameRange
				end

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;

				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;
					
					ScrappersGunFunctions.SpawnCasing(self)
					
				elseif self.reloadPhase == 2 then
					self.phaseOnStop = 3;
					
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MagazineData.RoundCount then
						self.phaseOnStop = 3;
					end
					
				elseif self.reloadPhase == 3 then						
					self.phaseOnStop = 1;

					if self.ammoCount == self.MagazineData.RoundCount then
						self.phaseOnStop = 4;
					end
					
				elseif self.reloadPhase == 4 then						
					self.phaseOnStop = 5;	
					
				elseif self.reloadPhase == 5 then						
					self.phaseOnStop = 6;
					
				else
					self.phaseOnStop = nil;
					
					self.rotation = self.rotation + 5
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if self.reloadPhase == 3 then
					if self.ammoCount == self.MagazineData.RoundCount or self.breakReload == true then
						self.reloadPhase = 4;
						self.breakReload = false;
					else
						self.reloadPhase = 1; -- the ride never ends (until we're at max)
					end
				elseif self.reloadPhase == 4 then
					if self.boltRelease == true then
						self.Chamber = false
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					elseif self.Chamber == true then
						self.reloadPhase = 5;
					else
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					end
				elseif self.reloadPhase == 5 then
					self.Chamber = false;
					if self.reChamber == true and self:IsReloading() then
						self.reChamber = false;
						self.reloadPhase = 0;
					else
						self.reChamber = false;
						self.ReloadTime = 0;
						self.reloadPhase = 0;
					end
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 15000;
	end
	
	if self:DoneReloading() then
		self.Magazine.RoundCount = self.ammoCount;
	end
	
	if self.preFire == true then
		self.FrameLocal = 0
	end
	
	if self.FiredFrame then
		self.FrameLocal = self.FrameRange
		
		self.ammoCount = self.ammoCount - 1
		
		self.aboutToChamber = true
	end
	
	if self.aboutToChamber and (self:IsReloading() or (controller and not controller:IsState(Controller.WEAPON_FIRE))) then
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
				if self.boltRelease ~= true then
					self.Chamber = true
					self.reChamber = true
					self.reloadPhase = 5
				end
			else
				self.reloadPhase = 0
			end
		end
		self.aboutToChamber = false
	end
end

function ScrappersReloadsData.SingleActionArmyRevolverDetach(self, parent)
	if self.Reloading ~= true and self.Chamber ~= true then
		self.SupportOffset = Vector(0, -5)
		self.Chamber = false
		self.reChamber = false
		self.outroSound:Play(self.Pos);
		self.FrameLocal = self.FrameRange;
	end
end

function ScrappersReloadsData.SingleActionArmyRevolverAttach(self, parent)
	if self.Reloading ~= true then
		self.SupportOffset = Vector(0, -5)
		self.Chamber = false
		self.reChamber = false
		self.Deploy = true
		self.reloadPhase = 0
	end
end

function ScrappersReloadsData.SingleActionArmyRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);

	local controller = parent and parent:GetController() or nil
	if parent and (self:IsReloading() or self.Chamber == true or self.Deploy == true) then
		if controller and self:IsReloading() then controller:SetState(Controller.AIM_SHARP,false) end
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		--self:Deactivate();
		self.preFireTimer:Reset();
		
		if self.Spinning == true then
			self.originalStanceOffset.X = Vector(8, 8).X
			self.originalStanceOffset.Y = Vector(8, 8).Y
			self.originalSharpStanceOffset.X = Vector(10, 7).X
			self.originalSharpStanceOffset.Y = Vector(10, 7).Y
			self.rotation = self.rotation % 360*self.FlipFactor
			self.Spinning = false;
			self.spinLoopSound:Stop(-1);
			
			self.fakeVel = 0;
			self.beingThrownUp = false;		
			self.beingCaught = false;			
			
		end
		
		if self:IsReloading() then
			self.Reloading = true
			if self.Deploy == true then
				self.Deploy = false
				self.reloadPhase = 6
			end
		end
		
		if self.reloadPhase == 0 then
			-- select flair randomly
			-- can do this smoother probably but w/e
			
			local randomValue = math.random(1, 3)
			
			if randomValue == 1 then
				self.reloadPhase = 1
			elseif randomValue == 2 then
				self.reloadPhase = 3
			else
				self.reloadPhase = 4
			end
			
			self.phaseOnStop = 6
			
		elseif self.reloadPhase == 1 then

			local prepare = "IntroFlair1Part1PrepareSound"
			local after = "IntroFlair1Part1Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseIntroFlair1Part1PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseIntroFlair1Part1AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 2 then

			local prepare = "IntroFlair1Part2PrepareSound"
			local after = "IntroFlair1Part2Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseIntroFlair1Part2PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseIntroFlair1Part2AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 3 then

			local prepare = "IntroFlair2Part1PrepareSound"
			local after = "IntroFlair2Part1Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseIntroFlair2Part1PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseIntroFlair2Part1AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 4 then

			local prepare = "IntroFlair3Part1PrepareSound"
			local after = "IntroFlair3Part1Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseIntroFlair3Part1PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseIntroFlair3Part1AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 5 then

			local prepare = "IntroFlair3Part2PrepareSound"
			local after = "IntroFlair3Part2Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseIntroFlair3Part2PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseIntroFlair3Part2AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 6 then
		
			self.reloadPhase = math.random(7, 9)
			
			self.phaseOnStop = 10;
					
		elseif self.reloadPhase == 7 then
		
			local prepare = "ReloadIntroFlair1PrepareSound"
			local after = "ReloadIntroFlair1Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair1PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair1AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 8 then
		
			local prepare = "ReloadIntroFlair2PrepareSound"
			local after = "ReloadIntroFlair2Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair2PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair2AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 9 then
		
			local prepare = "ReloadIntroFlair3PrepareSound"
			local after = "ReloadIntroFlair3Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair3PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadIntroFlair3AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 10 then
		
			if self.FrameLocal == self.FrameRange then
				self.reloadPhase = 11;
			end
		
			local prepare = "HammerDownPrepareSound"
			local after = "HammerDownSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseHammerDownPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseHammerDownAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 11 then
		
			local prepare = "GateOpenPrepareSound"
			local after = "GateOpenSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseGateOpenPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseGateOpenAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 12 then
		
			local prepare = "EjectShellPrepareSound"
			local after = "EjectShellSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseEjectShellPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseEjectShellAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 13 then
		
			local prepare = "CylinderTurnPrepareSound"
			local after = "CylinderTurnSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseCylinderTurnPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseCylinderTurnAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
	
		elseif self.reloadPhase == 14 then
		
			local prepare = "RoundInPrepareSound"
			local after = "RoundInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseRoundInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseRoundInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 15 then
		
			local prepare = "GateClosePrepareSound"
			local after = "GateCloseSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseGateClosePrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseGateCloseAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 16 then
		
			self.reloadPhase = math.random(17, 19)
			
		elseif self.reloadPhase == 17 then
		
			local prepare = "ReloadOutroFlair1PrepareSound"
			local after = "ReloadOutroFlair1Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair1PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair1AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 18 then
		
			local prepare = "ReloadOutroFlair2PrepareSound"
			local after = "ReloadOutroFlair2Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair2PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair2AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 19 then
		
			local prepare = "ReloadOutroFlair3PrepareSound"
			local after = "ReloadOutroFlair3Sound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair3PrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadOutroFlair3AfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 20 then
		
			local prepare = "ReloadHammerBackPrepareSound"
			local after = "ReloadHammerBackSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseReloadHammerBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseReloadHammerBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		elseif self.reloadPhase == 21 then
			
			self.SupportOffset = Vector(-4, -1)
		
			local prepare = "HammerBackPrepareSound"
			local after = "HammerBackSound"
		
			self.reloadDelay = self.ReloadBoltSoundSet.BaseHammerBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseHammerBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
		end
		
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		-- if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			-- self.prepareSoundPlayed = true;
			-- if self.prepareSound then
				-- self.prepareSound:Play(self.Pos)
			-- end
		-- end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 1 then
			
				self.FrameLocal = 0

				self.rotationTarget = -720
				
			elseif self.reloadPhase == 2 then
	
				self.rotationTarget = 720
				
			elseif self.reloadPhase == 3 then
			
				self.FrameLocal = 0
	
				self.rotationTarget = -720
			
			elseif self.reloadPhase == 4 then
	
				self.rotationTarget = -720
				
			elseif self.reloadPhase == 5 then
	
				self.rotationTarget = 720
				
			elseif self.reloadPhase == 7 then
	
				self.rotationTarget = 90
				
			elseif self.reloadPhase == 8 then
	
				self.rotationTarget = 45
				
			elseif self.reloadPhase == 9 then
	
				self.rotationTarget = -90
				
			-- elseif self.reloadPhase == 10 then
	
			-- elseif self.reloadPhase == 11 then
			
			-- elseif self.reloadPhase == 12 then
			
			-- elseif self.reloadPhase == 13 then
			
			-- elseif self.reloadPhase == 14 then
			
			-- elseif self.reloadPhase == 15 then
			
			elseif self.reloadPhase == 17 then
	
				self.rotationTarget = 90
				
			elseif self.reloadPhase == 18 then
	
				self.rotationTarget = 45
				
			elseif self.reloadPhase == 19 then
	
				self.rotationTarget = -90
				
			-- elseif self.reloadPhase == 20 then
			
			-- elseif self.reloadPhase == 21 then

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 1 then
					
				-- elseif self.reloadPhase == 2 then

				-- elseif self.reloadPhase == 3 then
				
				-- elseif self.reloadPhase == 4 then
					
				elseif self.reloadPhase == 5 then
				
					self.FrameLocal = 0
					
				-- elseif self.reloadPhase == 7 then

				-- elseif self.reloadPhase == 8 then
					
				-- elseif self.reloadPhase == 9 then
				
				elseif self.reloadPhase == 10 then
				
					self.FrameLocal = self.FrameRange
		
				-- elseif self.reloadPhase == 11 then
				
				elseif self.reloadPhase == 12 then
				
					self.phaseOnStop = 13;
					
					self.spentShells = self.spentShells - 1
					self.ammoCount = self.ammoCount - 1
					
					ScrappersGunFunctions.SpawnCasing(self)
				
				-- elseif self.reloadPhase == 13 then
				
				elseif self.reloadPhase == 14 then
				
					self.phaseOnStop = 13;
					
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MagazineData.RoundCount then
						self.phaseOnStop = 15;
					end
				
				-- elseif self.reloadPhase == 15 then
				
				-- elseif self.reloadPhase == 17 then
					
				-- elseif self.reloadPhase == 18 then
					
				-- elseif self.reloadPhase == 19 then
					
				elseif self.reloadPhase == 20 then
				
					self.FrameLocal = 0
				
				elseif self.reloadPhase == 21 then
				
					self.FrameLocal = 0
				
				else
				
					self.phaseOnStop = nil;
					
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if self.reloadPhase == 1 or self.reloadPhase == 3 or self.reloadPhase == 5 then
					self.Deploy = false;
					self.ReloadTime = 0;
					self.reloadPhase = 6;
					
				elseif self.reloadPhase == 7 or self.reloadPhase == 8 or self.reloadPhase == 9 then
					self.reloadPhase = 10;
					
				elseif self.reloadPhase == 12 then
					if self.spentShells > 0 then
						self.reloadPhase = 13
					else
						self.reloadPhase = 14
					end
				
				elseif self.reloadPhase == 13 then
					if self.spentShells > 0 then
						self.reloadPhase = 12
					else
						self.reloadPhase = 14
					end
				
				elseif self.reloadPhase == 14 then
					if self.ammoCount == self.MaxRoundCount or self.breakReload == true then
						self.reloadPhase = 15;
						self.breakReload = false;
					else
						self.reloadPhase = 13; -- the ride never ends (until we're at max)
					end
					
				elseif self.reloadPhase == 17 or self.reloadPhase == 18 or self.reloadPhase == 19 then
					self.reloadPhase = 20;
			
				elseif self.reloadPhase == 20 then
					self.SupportOffset = Vector(0, -5)
					self.Chamber = false;
					self.ReloadTime = 0;
					self.Reloading = false;
					self.reloadPhase = 6;
					
				elseif self.reloadPhase == 21 then
					self.Chamber = false;
					if self.reChamber == true and self:IsReloading() then
						self.SupportOffset = Vector(0, -5)
						self.reChamber = false;
						self.reloadPhase = 6;
					else
						self.SupportOffset = Vector(0, -5)
						self.reChamber = false;
						self.Reloading = false;
						self.ReloadTime = 0;
						self.reloadPhase = 6;
					end
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		
		if (parent and parent:IsPlayerControlled()) and (((UInputMan:KeyPressed(15) or UInputMan:KeyHeld(15)) and self.spinCooldownTimer:IsPastSimMS(self.spinCooldown)) or (self.beingThrownUp or self.beingCaught)) then
			if controller then
				controller:SetState(Controller.AIM_SHARP,false);
			end
			self:Deactivate();
			self.preFireTimer:Reset();
			if self.Spinning == false then
				self.spinStartSound:Play(self.Pos)
				self.spinRandomTimer:Reset();
				self.Spinning = true
				self.spinDown = false
				self.initialRandomDirection = math.random(0, 100) < 50 and 1 or -1;
				self.randomDirection = self.initialRandomDirection
			else
			
				if self.beingThrownUp == true then
				
					self.fakeGravity = self.fakeGravity + 0.02
				
					self.fakeVel = (math.sin(self.fakeGravity * math.pi) * 31) * -1
					
					self.Pos = Vector(self.Pos.X, self.Pos.Y + self.fakeVel)
					if self.fakeGravity > 0.5 then
						self.beingThrownUp = false;
						self.beingCaught = true;
						self.fakeGravity = 0.5
					end
					
				elseif self.beingCaught then
					self.fakeGravity = self.fakeGravity - 0.025
				
					self.fakeVel = (math.sin(self.fakeGravity * math.pi) * 31) * -1
				
					self.Pos = Vector(self.Pos.X, self.Pos.Y + self.fakeVel)
					
					if self.fakeGravity < 0 then
					
						self.spinLoopSound:Play(self.Pos)
						self.spinCatchSound:Play(self.Pos);
						self.originalStanceOffset.Y = self.originalStanceOffset.Y + 3
						self.originalSharpStanceOffset.Y = self.originalSharpStanceOffset.Y + 3
						self.fakeVel = 0
						self.beingCaught = false;
					end
				end
				
				if self.spinTimer:IsPastSimMS(self.maxSpinTime) then
					self.spinCooldownTimer:Reset();
					
				elseif self.spinTimer:IsPastSimMS(self.spinDelay) then
				
					if self.spinRandomTimer:IsPastSimMS(self.spinRandomDelay) then
						self.spinRandomTimer:Reset();
						self.spinRandomDelay = math.random(2500, 6000);

						if math.random(1, 2) == 1 then
							-- random stance change
							self.spinStartSound:Play(self.Pos);
							self.originalStanceOffset.X = self.spinStances[math.random(#self.spinStances)].X
							self.originalStanceOffset.Y = self.spinStances[math.random(#self.spinStances)].Y
							self.originalSharpStanceOffset.X = self.spinStances[math.random(#self.spinStances)].X
							self.originalSharpStanceOffset.Y = self.spinStances[math.random(#self.spinStances)].Y
						else
							self.fakeGravity = 0
							self.fakeVel = 0
							self.spinThrowSound:Play(self.Pos);
							self.spinLoopSound:Stop(-1)
							self.beingThrownUp = true;
							self.originalStanceOffset.Y = self.originalStanceOffset.Y - 3
							self.originalSharpStanceOffset.Y = self.originalSharpStanceOffset.Y - 3
						end


							
					end
					
					if not self.spinLoopSound:IsBeingPlayed() and not (self.beingCaught or self.beingThrownUp) then
						self.spinLoopSound:Play(self.Pos)
					end
					self.spinLoopSound.Pos = self.Pos;
					self.rotationTarget = self.rotationTarget + self.randomDirection
					self.randomDirection = self.randomDirection + self.initialRandomDirection*30
				end
			end
		else
			if self.Spinning == true then
				self.originalStanceOffset.X = Vector(8, 8).X
				self.originalStanceOffset.Y = Vector(8, 8).Y
				self.originalSharpStanceOffset.X = Vector(10, 7).X
				self.originalSharpStanceOffset.Y = Vector(10, 7).Y
				self.spinCooldownTimer:Reset();
				if self.spinDown ~= true then
					self.spinDown = true;
					self.spinStopSound:Play(self.Pos);
					self.spinLoopSound:Stop(-1)
				end
				local rot = self.rotation % 360*self.FlipFactor
				if controller then
					controller:SetState(Controller.AIM_SHARP,false);
				end
				self:Deactivate();
				self.preFireTimer:Reset();
				if rot < 20 and rot > -20 then
					self.Spinning = false;
					self.rotation = self.rotation % 360*self.FlipFactor
				else
					self.rotationTarget = self.rotationTarget + self.randomDirection
					self.randomDirection = self.randomDirection + self.initialRandomDirection*30
				end
			end
			self.spinTimer:Reset();
		end
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			
			self.Deploy = false
			self.Chamber = false
			self.reChamber = false
			
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 15000;
	end
	
	if self:DoneReloading() then
		self.Magazine.RoundCount = self.ammoCount;
	end
	
	if self.preFire then
		self.FrameLocal = self.FrameRange
	end
	
	if self.FiredFrame then
		self.FrameLocal = self.FrameRange
		self.spentShells = self.spentShells + 1
		
		self.aboutToChamber = true
		
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
				self.Chamber = true
				self.reChamber = true
				self.reloadPhase = 21
			else
				self.reloadPhase = 6
			end
		end
	end
	
end

function ScrappersReloadsData.HKMagazineFedUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	local controller = parent and parent:GetController() or nil
	if self:IsReloading() then
		if controller then
			controller:SetState(Controller.AIM_SHARP,false);
		end
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
		
		if self.boltRelease and self.chamberOnReload then
			self.FrameLocal = self.FrameRange;
		else
			self.FrameLocal = 0
		end
		
		if self.reloadPhase == 0 then

			local prepare = "BoltBackPrepareSound"
			local after = "BoltBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
		
			self.FrameLocal = self.FrameIntermediate

			local prepare = "BoltLockPrepareSound"
			local after = "BoltLockSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltLockPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltLockAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)	
	
		elseif self.reloadPhase == 2 then
		
			if self.chamberOnReload then
				self.FrameLocal = self.FrameRange
			end

			local prepare = "MagOutPrepareSound"
			local after = "MagOutSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagOutPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagOutAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then
		
			if self.chamberOnReload then
				self.FrameLocal = self.FrameRange
			end
		
			local prepare = "MagInPrepareSound"
			local after = "MagInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 4 then
		
			if self.chamberOnReload then
				self.FrameLocal = self.FrameRange
			end
		
			local prepare = "MagHitPrepareSound"
			local after = "MagHitSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagHitAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)		
		
		elseif self.reloadPhase == 5 then
			
			self.FrameLocal = self.FrameRange;
		
			local prepare = "BoltForwardPrepareSound"
			local after = "BoltForwardSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltForwardPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltForwardAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.FrameLocal = (self.FrameRange);
			self.horizontalAnim = 0.5
			self.rotationTarget = 7-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)			
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			local magEndPhase = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay and 4 or 3;
		
			if self.reloadPhase == 0 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = math.floor(factor * (self.FrameIntermediate) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor	
				
			elseif self.reloadPhase == 1 then
			
				self.FrameLocal = self.FrameRange
				self.boltLocked = true;
				
			elseif self.reloadPhase == 2 then
			
				self:SetNumberValue("MagRemoved", 1)
				
			elseif self.reloadPhase == 3 then
			
				self:RemoveNumberValue("MagRemoved")
			
			elseif self.reloadPhase == 5 then
			
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 0.5)
				
				self.FrameLocal = math.floor((1 - factor) * (self.FrameRange) + 0.5)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * ((1 - factor) - 0.5)), 122);
				
				self.rotationTarget = -15 - -10 * factor
				
				self.boltLocked = false;
				
			end
			
			if self.afterSoundPlayed ~= true then
			
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 0
					
				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2
			
				elseif self.reloadPhase == 2 then
					self.phaseOnStop = 3;
					--
					
					--
					
					self.verticalAnim = self.verticalAnim + 1
				elseif self.reloadPhase == 3 then
					self.phaseOnStop = 4;
					
					
					self.verticalAnim = self.verticalAnim - 0.3
				elseif self.reloadPhase == 4 then		
					if self.chamberOnReload then
						self.phaseOnStop = 3;
					else
						self.phaseOnStop = nil;
					end				
					self.verticalAnim = self.verticalAnim - 1						
				else
					self.phaseOnStop = nil;
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				self.phaseOnStop = nil;
				self.reloadTimer:Reset();
				self.prepareSoundPlayed = false;
				self.afterSoundPlayed = false;
				
				if ((not self.chamberOnReload) and self.reloadPhase == magEndPhase) or self.reloadPhase == 5 then
					self.ReloadTime = 0;
					self.reloadPhase = 0;
				else
					self.reloadPhase = self.reloadPhase + 1;
				end
			end
		end
		
	else
		self.rotationTarget = 0
		
		if self.boltLocked == true then
			self.FrameLocal = self.FrameRange
		else
			self.FrameLocal = 0
		end
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 9999;
	end
	
	if self:DoneReloading() == true and self.chamberOnReload then
		self.Magazine.RoundCount = self.Magazine.RoundCount - 1
		self.chamberOnReload = false
	elseif self:DoneReloading() then
		self.chamberOnReload = false
	end
	
	if self.FiredFrame then
		--self.FrameLocal = self.firedFrameFrame
		
		ScrappersGunFunctions.SpawnCasing(self)
		
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
				self.reloadPhase = 2
			else
				self.reloadPhase = 0
				self.chamberOnReload = true;
				if self.boltRelease then
					self.boltLocked = true;
					self.reloadPhase = 2
				end
			end
		end
	end
	
end

function ScrappersReloadsData.OpenBoltMagazineFedUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	local controller = parent and parent:GetController() or nil
	if self.boltFire then
		self:Activate()
		self.firingAnim = true
	end
	
	if (not self.backFrame) and (not self.delayedFiring) and (not self.firingAnim) and (not self:IsReloading()) then
		if self.boltFire == true then
			self.firingAnim = true
		else
			self.FrameLocal = self.FrameRange
		end
	end
	
	if self:IsReloading() then
		if controller then
			controller:SetState(Controller.AIM_SHARP,false);
		end
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
		
		if self.boltFire then
			self.boltFire = false
			if self.boltDropSound then
				self.boltDropSound:Play(self.Pos)
			end
			self.chamberOnReload = true
		end
		
		if (not self.chamberOnReload) and (not self.firstShot) and (not self.boltFire) and activated and self.miscTimer:IsPastSimMS(self.ROFNum) then
			self.firingAnim = true
			self.boltAnimTimer:Reset()
			self.boltFire = true
		end
		
		if self.chamberOnReload and (not self.firingAnim) then
			self.FrameLocal = 0
		end
		
		if self.reloadPhase == 0 then
			local prepare = "MagOutPrepareSound"
			local after = "MagOutSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagOutPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagOutAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			
			self.rotationTarget = -5 * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 1 then
			local prepare = "MagInPrepareSound"
			local after = "MagInSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagInPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagInAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 2 then
			local prepare = "MagHitPrepareSound"
			local after = "MagHitSound"
		
			self.reloadDelay = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay
			self.afterDelay = self.ReloadMagazineSoundSet.BaseMagHitAfterDelay
			
			self.reloadSoundLength = self.ReloadMagazineSoundSet[prepare] and self.ReloadMagazineSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadMagazineSoundSet[after] and self.ReloadMagazineSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 3 then
			local prepare = "BoltBackPrepareSound"
			local after = "BoltBackSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltBackPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltBackAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.rotationTarget = 15-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		elseif self.reloadPhase == 4 then
		
			self.FrameLocal = self.ChargeFrameIntermediate;
		
			local prepare = "BoltForwardPrepareSound"
			local after = "BoltForwardSound"
			
			self.reloadDelay = self.ReloadBoltSoundSet.BaseBoltForwardPrepareDelay
			self.afterDelay = self.ReloadBoltSoundSet.BaseBoltForwardAfterDelay
			
			self.reloadSoundLength = self.ReloadBoltSoundSet[prepare] and self.ReloadBoltSoundSet[prepare].Length or 0
			self.afterSoundLength = self.ReloadBoltSoundSet[after] and self.ReloadBoltSoundSet[after].Length or 0
			
			self.afterSound = self.soundReloadSet[after]
			self.prepareSound = self.soundReloadSet[prepare]
			--
			self.horizontalAnim = 0.5
			self.rotationTarget = 7-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
		end
		self.reloadDelay = ScrappersReloadsData.NullToZero(self.reloadDelay) -- FIX
		self.afterDelay = ScrappersReloadsData.NullToZero(self.afterDelay)
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay - self.reloadSoundLength) and self.prepareSoundPlayed ~= true then
			self.prepareSoundPlayed = true;
			if self.prepareSound then
				self.prepareSound:Play(self.Pos)
			end
		end
		
		if self.reloadTimer:IsPastSimMS(self.reloadDelay) then
		
			if self.reloadPhase == 0 then
				self:SetNumberValue("MagRemoved", 1)
			elseif self.reloadPhase == 1 then
				self:RemoveNumberValue("MagRemoved")
			elseif self.reloadPhase == 3 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = self.ChargeFrameStart +  math.floor((factor) * (self.ChargeFrameIntermediate - self.ChargeFrameStart) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor
			elseif self.reloadPhase == 4 then
				local minTime = self.reloadDelay
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / (maxTime - minTime), 1), 0.5)
				
				self.FrameLocal = self.ChargeFrameIntermediate + math.floor((factor) * (self.ChargeFrameRange - self.ChargeFrameIntermediate) + 0.5)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * ((1 - factor) - 0.5)), 122);
				
				self.rotationTarget = -15 - -10 * factor
			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;
					--
					
					--
					
					self.verticalAnim = self.verticalAnim + 1
				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;
					
					
					self.verticalAnim = self.verticalAnim - 0.3
				elseif self.reloadPhase == 2 then		
					if self.chamberOnReload then
						self.phaseOnStop = 3;
					else
						self.phaseOnStop = nil;
					end				
					self.verticalAnim = self.verticalAnim - 1						
				else
					self.phaseOnStop = nil;
				end
			
				self.afterSoundPlayed = true;
				if self.afterSound then
					self.afterSound:Play(self.Pos)
				end
			end
			
			if self.reloadTimer:IsPastSimMS(self.reloadDelay + self.afterDelay) then
				local magEndPhase = self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay and 2 or 1
				self.phaseOnStop = nil
				self.reloadTimer:Reset()
				self.prepareSoundPlayed = false
				self.afterSoundPlayed = false
				if self.chamberOnReload and self.reloadPhase == magEndPhase then
					self.reloadPhase = 3
					
				elseif self.reloadPhase == 2 then
					if self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay == nil then
						self.reloadPhase = 3
					elseif self.chamberOnReload == false then
						self.ReloadTime = 0
						self.reloadPhase = 0
					end
					
				elseif self.reloadPhase == 3 and self.ReloadBoltSoundSet.BaseBoltForwardPrepareDelay == nil then
					self.ReloadTime = 0
					self.reloadPhase = 0
					
				elseif self.reloadPhase == magEndPhase or self.reloadPhase == 4 then
					self.ReloadTime = 0
					self.reloadPhase = 0
					
				else
					self.reloadPhase = self.reloadPhase + 1
				end
			end
		end
	else
		self.rotationTarget = 0
		
		if self.chamberOnReload then
			self.FrameLocal = 0
		elseif (not self.backFrame) and (not self.firingAnim) then
			self.FrameLocal = self.FrameRange
		end
		
		self.reloadTimer:Reset();
		self.prepareSoundPlayed = false;
		self.afterSoundPlayed = false;
		if self.reloadPhase == 4 then
			self.reloadPhase = 3;
		end
		if self.phaseOnStop then
			self.reloadPhase = self.phaseOnStop;
			self.phaseOnStop = nil;
		end
		self.ReloadTime = 9999;
	end
	
	if self:DoneReloading() == true then
		self.chamberOnReload = false
	end
	
	if self.delayedFiring == true then
		if self.delayedFireTimer:IsPastSimMS(self.delayedFireDelay) then   
			self:Activate()
			self.delayedFiring = false
		else            
			self:Deactivate()
		end
	elseif self.Magazine and self.Magazine.RoundCount > 0 and activated and (not self:IsReloading()) and self.firstShot == true then      
		if self.triggerPulled == false then        
			self:Deactivate()     
			self.delayedFiring = true       
			self.triggerPulled = true   
			self.delayedFireTimer:Reset()  
			self.firingAnim = true
			self.boltDelayNum = self.delayedFireDelay--self.boltDelay / self.boltSpeedShotFirst
			self.boltAnimTimer:Reset()
			if self.boltSound then
				self.boltSound:Play(self.Pos)
			end
		end
	else    
		self.triggerPulled = false;
	end
	
	if self.backFrame == true then
		self.firingAnim = false;
		--[[
		if self.boltAnimTimer:IsPastSimMS(self.ROFNum2) then
			self.FrameLocal = self.FrameLocal + 1
			if self.FrameLocal >= self.FrameRange then
				self.backFrame = false
			end
			self.boltAnimTimer:Reset()
		end]]
		local minTime = 0
		local maxTime = self.ROFNum2 * self.FrameRange
		
		local factor = math.pow(math.min(math.max(self.boltAnimTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 1)
		
		--PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
		
		self.FrameLocal = 0 + math.floor((factor) * self.FrameRange + 0.5)
		
		if self.FrameLocal >= self.FrameRange then
			self.backFrame = false
			ScrappersGunFunctions.SpawnCasing(self)
			if activated then
				self.firingAnim = true
				self.boltFire = true
			end
			self.boltAnimTimer:Reset()
		end
	end
	
	if self.FiredFrame then
	
		self.boltDelayNum = self.fireTime * 0.6--self.boltDelay / self.boltSpeedShot
	
		self.FrameLocal = 0
		
		self.boltFire = false
		self.miscTimer:Reset()
		self.boltAnimTimer:Reset()
		
		self.backFrame = true
		
	end
	
	if not activated and self.miscTimer:IsPastSimMS(100) then
		self.firstShot = true;
	elseif (not self.chamberOnReload) and (not self.firstShot) and (not self.boltFire) and activated and self.miscTimer:IsPastSimMS(self.ROFNum) then
		self.boltFire = true;
		self.firingAnim = true;
		self.boltAnimTimer:Reset();
	else
		self.firstShot = false;
	end
	if self.firingAnim == true and (not self.backFrame) then
		--[[
		if self.boltAnimTimer:IsPastSimMS(self.boltDelayNum) then
			self.FrameLocal = self.FrameLocal - 1
			if self.FrameLocal == 0 then
				self.firingAnim = false
			end
			self.boltAnimTimer:Reset()
		end]]
		local minTime = 0
		local maxTime = self.boltDelayNum
		
		local factor = math.pow(math.min(math.max(self.boltAnimTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 1)
		
		--PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
		
		--self.FrameLocal = self.FrameRange - math.floor((factor) * self.FrameRange + 0.5)
		self.FrameLocal = 0 + math.floor((1 - factor) * self.FrameRange + 0.5)
		--self.FrameLocal = math.floor((1 - factor) * (self.FrameRange) + 0.5)
		
		if self.FrameLocal == 0 then
			self.firingAnim = false
			self.boltAnimTimer:Reset()
		end
	end
	
	if not self.backFrame and not self.firingAnim then
		self.boltAnimTimer:Reset()
	end
	
end