function OnCollideWithTerrain(self, terrainID)
	
	if self.playSound == true then
	
		self.playSound = false;
	
		if self.dirtHit.IDs[terrainID] ~= nil then
			self.dirtHit.Container:Play(self.Pos);
		elseif self.sandHit.IDs[terrainID] ~= nil then
			self.sandHit.Container:Play(self.Pos);
		elseif self.concreteHit.IDs[terrainID] ~= nil then
			self.concreteHit.Container:Play(self.Pos);
		elseif self.solidMetalHit.IDs[terrainID] ~= nil then
			self.solidMetalHit.Container:Play(self.Pos);
		else -- default to concrete
			self.concreteHit.Container:Play(self.Pos);
		end

	end
	
	self:DisableScript("Scrappers.rte/Devices/Weapons/Handheld/GunDropPhysics.lua"); -- guns stick around, don't want them running this every frame

end