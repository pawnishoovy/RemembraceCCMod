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
		self.FrameLocal = self.FrameRange
		
		if self.Magazine then
			if self.Magazine.RoundCount > 0 then
			else
				self.chamberOnReload = true;
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
		self.FrameLocal = self.FrameIntermediate
		
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