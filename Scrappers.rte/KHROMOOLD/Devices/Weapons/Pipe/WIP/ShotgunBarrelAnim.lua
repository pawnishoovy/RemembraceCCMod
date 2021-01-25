function Create(self)
	self.Frame = 0;
	self.parentIdentified = false;
	
	self.animTimer = Timer();
	self.animCurrentRot = 0
	self.animTargetRot = 0
	self.animIsDone = false
end

function Update(self)
	
	if self.parent == nil and self.parentIdentified == false then   -- if self.parent isn't defined
		
		mo = MovableMan:GetMOFromID(self.RootID);
		if mo then
			if IsHDFirearm(mo) then   -- if root ID is the gun
				self.parent = ToHDFirearm(mo);
				self.parentIdentified = true
			elseif IsAHuman(mo) then   -- if root ID is the actor holding the gun
				if ToAHuman(mo).EquippedItem and IsHDFirearm(ToAHuman(mo).EquippedItem) then
					self.parent = ToHDFirearm(ToAHuman(mo).EquippedItem);
					self.parentIdentified = true
				end
			end
		end
	
	elseif IsHDFirearm(self.parent) then
		self.GetsHitByMOs = false
		
		--[[
		if self.parent:IsReloading() then
			if self.reloadTimerReset == false then
				self.reloadTimer:Reset();
				self.reloadTimerReset = true;
			end
			if self.reloadTimer:IsPastSimMS(150) then
				self.Frame = 1;
			end
		else
			self.Frame = 0;
			self.reloadTimerReset = false;
		end
		]]
		
		if self.parent:IsReloading() then
			self.animIsDone = false
			self.animTargetRot = 3
			if self.parent.openTimer:IsPastSimMS(2500) then
				local sfx = CreateAEmitter("Open Pipe Shotgun");
				sfx.Pos = self.Pos;
				MovableMan:AddParticle(sfx);
			end
		else
			self.parent.openTimer:Reset();
			local animIsPastTime = self.animTimer:IsPastSimMS(150)
			if self.animIsDone == false and animIsPastTime then
				self.parent:Deactivate();
				self.animTargetRot = 0
				
				if self.animCurrentRot < 0.4 then
					self.animIsDone = true
					
					local sfx = CreateAEmitter("Close Pipe Shotgun");
					sfx.Pos = self.Pos;
					MovableMan:AddParticle(sfx);
				end
			elseif self.animIsDone == true then
				self.Frame = 0
				self.animTargetRot = 0
				self.animCurrentRot = 0
			end
		end
		
		if self.animIsDone ~= true then
			self.animCurrentRot = (self.animCurrentRot*4 + self.animTargetRot)/5
			--print("Rot:"..self.animCurrentRot)
			--print("Frame:"..math.floor(self.animCurrentRot+0.5)+1)
			self.Frame = math.floor(self.animCurrentRot+0.5)
		end
	end
	if self.parentIdentified == true and IsHDFirearm(self.parent) == false then
		self.ToDelete = true;
	end
end



