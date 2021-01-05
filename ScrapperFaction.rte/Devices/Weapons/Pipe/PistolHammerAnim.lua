function Create(self)
	self.Frame = 0;
	self.parent = nil;
	self.boltMoveTimer = Timer();
	self.boltMoveTimerReset = false;
	self.boltMovement = false;
	
	self.boltLastMoveTimer = Timer();
	self.boltLastMoveTimerReset = false;
	self.boltLastMovement = false;
	
	self.boltBackMoveTimer = Timer();
	self.boltBackMoveTimerReset = false;
	self.boltBackMovement = false;
	
	self.boltStayForward = false;

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
			
		if self.parent:NumberValueExists("Fired") then		
			self.Frame = 2;	
		else
			self.Frame = 0;
		end
		
		if self.parent:NumberValueExists("LastShotFired") then
			self.boltLastMovement = true;
			self.boltLastMoveTimerReset = false;	
		end
		if self.boltLastMovement == true then		
			if self.boltLastMoveTimerReset == false then			
				self.boltLastMoveTimer:Reset();
				self.boltLastMoveTimerReset = true;		
			end			
			if self.boltLastMoveTimer:IsPastSimMS(30) then
				self.Frame = 2;
				self.boltLastMovement = false;
				self.boltStayForward = true;
			elseif self.boltLastMoveTimer:IsPastSimMS(0) then
				self.Frame = 1;
			end	
		end
		if self.boltStayForward == true then
			self.Frame = 2;
		end
		if self.parent:NumberValueExists("Chambering") then
			self.RotAngle = self.parent:GetNumberValue("ChamberRot");	
			if self.boltBackMoveTimerReset == false then			
				self.boltBackMoveTimer:Reset();
				self.boltBackMoveTimerReset = true;		
			end			
			if self.boltBackMoveTimer:IsPastSimMS(750) then
				self.Frame = 0;
				self.boltStayForward = false;
			elseif self.boltBackMoveTimer:IsPastSimMS(700) then
				self.Frame = 3;
			elseif self.boltBackMoveTimer:IsPastSimMS(650) then
				self.Frame = 4;
			elseif self.boltBackMoveTimer:IsPastSimMS(600) then
				self.Frame = 3;
			end	
		else
			self.boltBackMoveTimerReset = false;
		end
		self.RotAngle = self.parent:GetNumberValue("ChamberRot");	
	end
	
	if self.parentIdentified == true and IsHDFirearm(self.parent) == false then
		self.ToDelete = true;
	end
end



