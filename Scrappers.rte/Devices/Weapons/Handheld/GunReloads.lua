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
	-- 4: hammerback (optional if single-action)
	
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
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = math.floor(factor * (self.FrameRange) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor
			elseif self.reloadPhase == 4 then
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 0.5)
				
				self.FrameLocal = math.floor((1 - factor) * (self.FrameRange) + 0.5)
				
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
						self.ReloadTime = 0; -- done! no after delay if non-chambering reload.
						self.reloadPhase = 0;
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
				elseif self.reloadPhase == 2 and self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay == nil then
					self.reloadPhase = 3;
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

function ScrappersReloadsData.OpeningRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	
	if parent and (self:IsReloading() or self.Chamber == true) then
		local controller = parent:GetController()
		controller:SetState(Controller.AIM_SHARP,false);
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		self:Deactivate();
		self.preFireTimer:IsPastSimMS(self.preDelay)
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 1 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = 0
			self.Chamber = true
		end
		
		if self.reloadPhase == 0 then
			
			self.FrameLocal = 0
		
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
			self.rotationTarget = 5-- * self.reloadTimer.ElapsedSimTimeMS / (self.reloadDelay + self.afterDelay)
			
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
			
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor(factor * (self.ReloadCylinderFrameEnd))
				
			elseif self.reloadPhase == 1 then
	
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local midTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
				self.FrameLocal = self.ReloadEjectFrameStart + math.floor(factor * (self.ReloadEjectFrameEnd))
				
				if self.reloadTimer:IsPastSimMS(midTime) then				
					self.FrameLocal = self.ReloadEjectFrameStart + math.floor((1 - factor) * (self.ReloadEjectFrameEnd))				
				end
				
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = self.ReloadCylinderFrameEnd
				end
			
			elseif self.reloadPhase == 2 then
			
			if controller:IsState(Controller.WEAPON_FIRE) then
				self.breakReload = true;
				PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
			end
				
			elseif self.reloadPhase == 3 then

			elseif self.reloadPhase == 4 then
			
			elseif self.reloadPhase == 5 then
			
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
				self.FrameLocal = self.ReloadCylinderFrameStart + math.floor((1 - factor) * (self.ReloadCylinderFrameEnd))

			
			elseif self.reloadPhase == 6 then
				
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
			
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = 1
				end

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;

				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;

					self.ammoCount = 0;
					
				elseif self.reloadPhase == 2 then
					self.ammoCount = self.ammoCount + 1
					
					if self.ammoCount == self.MagazineData.RoundCount then
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
				
				if self.reloadPhase == 1 then
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
		self.FrameLocal = 1
	end
	
	if self.FiredFrame then
		self.FrameLocal = 0
		self.ammoCount = self.ammoCount - 1
		
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
		
	end
end

function ScrappersReloadsData.BreakActionRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	
	if parent and (self:IsReloading() or self.Chamber == true) then
		local controller = parent:GetController()
		controller:SetState(Controller.AIM_SHARP,false);
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		self:Deactivate();
		self.preFireTimer:IsPastSimMS(self.preDelay)
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 1 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = 0
			self.Chamber = true
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
			
			elseif self.reloadPhase == 2 then
				
			elseif self.reloadPhase == 3 then

			elseif self.reloadPhase == 4 then
			
			elseif self.reloadPhase == 5 then	
			
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
			
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = 1
				end

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;
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
		self.FrameLocal = 1
	end
	
	if self.FiredFrame then
		self.FrameLocal = 0
		self.ammoCount = self.ammoCount - 1
		
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
		
	end
end

function ScrappersReloadsData.GatedRevolverUpdate(self, parent, activated)
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
	--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);
	
	if parent and (self:IsReloading() or self.Chamber == true) then
		local controller = parent:GetController()
		controller:SetState(Controller.AIM_SHARP,false);
		local screen = ActivityMan:GetActivity():ScreenOfPlayer(controller.Player);
		
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -25), tostring(self.reloadPhase), false, 0);
		--PrimitiveMan:DrawTextPrimitive(parent.Pos + Vector(0, -18), self.chamberOnReload and "CHAMBER" or "---", false, 0);'
		self:Deactivate();
		self.preFireTimer:IsPastSimMS(self.preDelay)
		
		if self.Chamber == false and self:IsReloading() and self.FrameLocal == 1 then
			self.soundFirePre:Play(self.Pos)
			self.FrameLocal = 0
			self.Chamber = true
		end
		
		if self.reloadPhase == 0 then
			
			self.FrameLocal = 0
		
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

				
			elseif self.reloadPhase == 1 then
	
			
			elseif self.reloadPhase == 2 then
				
				if controller:IsState(Controller.WEAPON_FIRE) then
					self.breakReload = true;
					PrimitiveMan:DrawTextPrimitive(screen, self.parent.AboveHUDPos + Vector(0, 30), "Interrupting...", true, 1);
				end
				
			elseif self.reloadPhase == 3 then

			elseif self.reloadPhase == 4 then
			
			elseif self.reloadPhase == 5 then
			
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
			
				if self.reloadTimer:IsPastSimMS(maxTime) then
					self.FrameLocal = 1
				end

			end
			
			if self.afterSoundPlayed ~= true then
			
				if self.reloadPhase == 0 then
					self.phaseOnStop = 1;

				elseif self.reloadPhase == 1 then
					self.phaseOnStop = 2;
					
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
		self.FrameLocal = 1
	end
	
	if self.FiredFrame then
		self.FrameLocal = 0
		self.ammoCount = self.ammoCount - 1
		
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
			
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
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
			
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 0.5)
				
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
						self.ReloadTime = 0; -- done! no after delay if non-chambering reload.
						self.reloadPhase = 0;
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
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 2)
				
				PrimitiveMan:DrawLinePrimitive(parent.Pos + Vector(0, -25), parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (factor - 0.5)), 122);
				
				self.FrameLocal = self.ChargeFrameStart +  math.floor((factor) * (self.ChargeFrameIntermediate - self.ChargeFrameStart) + 0.5)
				
				self.rotationTarget = -5 + -15 * factor
			elseif self.reloadPhase == 4 then
				local minTime = self.reloadDelay + ((self.afterDelay/5)*0)
				local maxTime = self.reloadDelay + ((self.afterDelay/5)*2)
				
				local factor = math.pow(math.min(math.max(self.reloadTimer.ElapsedSimTimeMS - minTime, 0) / maxTime, 1), 0.5)
				
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
						self.ReloadTime = 0; -- done! no after delay if non-chambering reload.
						self.reloadPhase = 0;
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
				elseif self.reloadPhase == 2 and self.ReloadMagazineSoundSet.BaseMagHitPrepareDelay == nil then
					self.reloadPhase = 3
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