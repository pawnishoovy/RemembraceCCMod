-- thanks to pawnis for this script
function Create(self)

	-- lord forgive me for this code
 
 	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	else
		self.parent = nil;
	end
	
	if self.parent then
		if self.parent.Team == 0 then -- red?
			self.Frame = math.random(0, 5);
		elseif self.parent.Team == 1 then -- green?
			self.Frame = math.random(6, 11);
		elseif self.parent.Team == 2 then -- the one after green?
			self.Frame = math.random(12, 17);
		elseif self.parent.Team == 3 then -- the one after the one after green?
			self.Frame = math.random(18, 23);
		end
	end

end