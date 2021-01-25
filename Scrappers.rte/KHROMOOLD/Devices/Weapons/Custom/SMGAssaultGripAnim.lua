function Create(self)
	self.Frame = 0;
	self.parent = nil;

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
			
		if self.parent:NumberValueExists("Assault Grip") then
			self.Frame = 1;
		end

		self.RotAngle = self.parent:GetNumberValue("ChamberRot");	
	end
	
	if self.parentIdentified == true and IsHDFirearm(self.parent) == false then
		self.ToDelete = true;
	end
end



