function Create(self)
	self.Frame = 0;
	self.parent = nil;
	self.boltMoveTimer = Timer();
	self.boltMoveTimerReset = false;
	self.boltMoveForwardTimer = Timer();
	self.boltMoveForwardTimerReset = false;

	self.negNum = 0;
end

function Update(self)

	if self.parent == nil then   -- if self.parent isn't defined
		mo = MovableMan:GetMOFromID(self.RootID);
			if mo then
				if IsHDFirearm(mo) then   -- if root ID is the gun
					self.parent = ToHDFirearm(mo);
			elseif IsAHuman(mo) then   -- if root ID is the actor holding the gun
				if ToAHuman(mo).EquippedItem and IsHDFirearm(ToAHuman(mo).EquippedItem) then
					self.parent = ToHDFirearm(ToAHuman(mo).EquippedItem);
					self.parentIdentified = true
				end
			end
		end

	elseif IsHDFirearm(self.parent) then
	
		self:ClearForces();
		self:ClearImpulseForces();
		
		self:RemoveWounds(self.WoundCount);
			
		if self.parent:IsReloading() then
		
			self.Frame = 1;
		
			if self.parent:NumberValueExists("BoltBack") then
			
				self.RotAngle = self.parent:GetNumberValue("ChamberRot")			
			
				if self.boltMoveTimerReset == false then
					self.boltMoveTimer:Reset();
					self.boltMoveTimerReset = true;
				end
				
				if self.boltMoveTimer:IsPastSimMS(150) then
					self.Frame = 3;
				elseif self.boltMoveTimer:IsPastSimMS(50) then
					self.Frame = 2;
				end
			end
				
		elseif self.parent:NumberValueExists("BoltForward") then
		
			self.Frame = 3;
			
			if self.boltMoveForwardTimerReset == false then
				self.boltMoveForwardTimer:Reset();
				self.boltMoveForwardTimerReset = true;
			end
			
			if self.boltMoveForwardTimer:IsPastSimMS(150) then
				self.Frame = 1;
			elseif self.boltMoveForwardTimer:IsPastSimMS(50) then
				self.Frame = 2;
			end
		else
			self.boltMoveTimerReset = false;
			self.boltMoveForwardTimerReset = false;
			if self.parent.FiredFrame then
				self.Frame = 3;	
			else
				self.Frame = 1;
			end
		end	
		self.RotAngle = self.parent:GetNumberValue("ChamberRot")			
	end
	
	if self.parentIdentified == true and IsHDFirearm(self.parent) == false then
		self.ToDelete = true;
	end
end



