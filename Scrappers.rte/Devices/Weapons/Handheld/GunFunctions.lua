ScrappersGunFunctions = {}


function ScrappersGunFunctions.PickProperty(self, var)
	if type(var) == "table" then
		local mode = 0
		for i, v in ipairs(var) do
			if type(v) == "table" and v.Cost then
				mode = 1
			end
		end
		if mode == 0 then
			return var[math.random(1, #var)]
		elseif mode == 1 then
			local tab = {}
			local tabCost = {}
			
			for i, v in ipairs(var) do
				if v.Cost <= self.Budget then
					for name, value in pairs(v) do
						if (name == "Cost") then
							table.insert(tabCost, value)
						else
							table.insert(tab, value)
						end
					end
				end
			end
			if #tab > 0 then
				local pickedI = math.random(1, #tab)
				self.Budget = self.Budget - tabCost[pickedI]
				return tab[pickedI]
			else
				return nil
			end
		end
	else
		return var
	end
end

function ScrappersGunFunctions.PickCaliber(self, magazine)
	calibers = magazine.Calibers
	if type(calibers) == "table" then
		local mode = 0
		for i, v in ipairs(calibers) do
			if v.Cost then
				mode = 1
			end
		end
		if mode == 0 then
			local pickedI = 1
			local valid = false
			while(not valid) do -- Dirty fix
				-- TO DO: COME WITH A BETTER FIX YOU LAZY ASS
				pickedI = math.random(1, #calibers)
				if type(self.Receiver.Calibers) == "table" then
					for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
						if receiverCaliber == calibers[pickedI] then
							valid = true
							break
						end
					end
				elseif self.Receiver.Calibers == calibers[pickedI] then
					valid = true
					break
				end
			end
			return calibers[pickedI]
		elseif mode == 1 then
			local tab = {}
			local tabCost = {}
			
			for i, v in ipairs(calibers) do
				
				if v.Cost <= self.Budget then
					for name, value in pairs(v) do
						if (name == "Cost") then
							table.insert(tabCost, value)
						else
							table.insert(tab, value)
						end
					end
				end
			end
			if #tab > 0 then
				local pickedI = 1
				local valid = false
				while(not valid) do -- Dirty fix
					-- TO DO: COME WITH A BETTER FIX YOU LAZY ASS
					pickedI = math.random(1, #tab)
					if type(self.Receiver.Calibers) == "table" then
						for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
							if receiverCaliber == tab[pickedI] then
								valid = true
								break
							end
						end
					elseif self.Receiver.Calibers == tab[pickedI] then
						valid = true
						break
					end
				end
				self.Budget = self.Budget - tabCost[pickedI]
				return tab[pickedI]
			else
				return nil
			end
		end
	else
		return calibers
	end
end
function ScrappersGunFunctions.SpawnCasing(self)
	local casing = CreateMOSParticle(self.Casing, ScrappersData.Module)
	casing.Pos = self.Pos + self.EjectionOffset
	casing.Vel = self.Vel + Vector((self.EjectionVelocity.X*self.FlipFactor)*(math.random(75, 125)/100), (self.EjectionVelocity.Y)*(math.random(90, 110)/100)):RadRotate(self.RotAngle)
	MovableMan:AddParticle(casing)
end

function ScrappersGunFunctions.MagazineIn(self)
	if not self.MagazineData.MO then
		local MagazineMO = CreateAttachable("Scrapper Assault Rifle Magazine", ScrappersData.Module);
		MagazineMO.ParentOffset = self.Receiver.MagazineOffset
		MagazineMO.Frame = self.MagazineData.Frame
		MagazineMO:SetStringValue("MagazineType", self.MagazineData.SoundType);
		
		if self.Caliber then
			local bulletMass = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module).Mass
			local mass = self.MagazineData.RoundCount * bulletMass
			MagazineMO.Mass = mass
		end
		
		if self.MagazineData.Topfed then
			MagazineMO.JointOffset = MagazineMO.JointOffset + Vector(0, 6)
		end
		
		self:AddAttachable(MagazineMO);
		self.MagazineData.MO = MagazineMO
	end
end

function ScrappersGunFunctions.MagazineOut(self)
	if self.MagazineData.MO then
		--self.MagazineData.MO.JointStrength = -1
		self:RemoveAttachable(self.MagazineData.MO, true, false)
		if self.MagazineData.EjectVelocity then
			self.MagazineData.MO.Vel = self.Vel + Vector(self.MagazineData.EjectVelocity.X * self.FlipFactor, self.MagazineData.EjectVelocity.Y):RadRotate(self.RotAngle)
		else
			self.MagazineData.MO.Vel = self.Vel + Vector(1 * self.FlipFactor, 2):RadRotate(self.RotAngle)
			self.MagazineData.MO.AngularVel = 1 * self.FlipFactor
		end
		self.MagazineData.MO = nil
	end
end