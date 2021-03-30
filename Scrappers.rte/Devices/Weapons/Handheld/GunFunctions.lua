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
	if self.Casing and self.Casing ~= "" then
		local casing = CreateMOSParticle(self.Casing, ScrappersData.Module)
		if casing then
			casing.Pos = self.Pos + Vector(self.EjectionOffset.X * self.FlipFactor, self.EjectionOffset.Y)
			casing.Vel = self.Vel + Vector(self.EjectionVelocity.X * self.FlipFactor * RangeRand(0.75, 1.25), self.EjectionVelocity.Y * RangeRand(0.9, 1.1)):RadRotate(self.RotAngle)
			MovableMan:AddParticle(casing)
		end
	end
end

function ScrappersGunFunctions.SpawnBullet(self, muzzlePos)
	local barrelSpread = math.max(1 - (self.BarrelLength / 21), 0) * 5
	local baseSpread = RangeRand(-math.rad(barrelSpread), math.rad(barrelSpread))
	for i = 1, self.Caliber.ProjectileCount do
		local roundSpread = self.Caliber.ProjectileSpread * 0.5
		local spread = baseSpread + RangeRand(-math.rad(roundSpread), math.rad(roundSpread))
		
		local bullet = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module)
		bullet.Pos = muzzlePos;
		bullet.Vel = self.Vel + Vector(self.fireVelocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread)
		bullet.Team = self.Team
		bullet.Sharpness = bullet.Sharpness * (0.85 + math.random(0,2) * 0.2)
		bullet.IgnoresTeamHits = true
		MovableMan:AddParticle(bullet);
	end
end

function ScrappersGunFunctions.MagazineIn(self)
	if not self.MagazineData.MO then
		local MagazineMO = CreateAttachable(self.magazinePresetName, ScrappersData.Module);
		if self.MagazineData.Internal then -- Invisible!
			MagazineMO.Scale = 0
			MagazineMO.ParentOffset = Vector(0,0)
			MagazineMO.Frame = 0
		else
			MagazineMO.ParentOffset = self.Receiver.MagazineOffset
			MagazineMO.Frame = self.MagazineData.Frame
			MagazineMO:SetStringValue("MagazineType", self.MagazineData.SoundType);
			
			if self.MagazineData.Topfed then
				MagazineMO.JointOffset = MagazineMO.JointOffset + Vector(0, 6)
			end
		end
		
		if self.Caliber then
			local bulletMass = CreateMOPixel(self.Caliber.ProjectilePresetName, ScrappersData.Module).Mass
			local mass = self.MagazineData.RoundCount * bulletMass
			MagazineMO.Mass = mass
		end
		
		self:AddAttachable(MagazineMO);
		self.MagazineData.MO = MagazineMO
	end
end

function ScrappersGunFunctions.MagazineOut(self)
	if self.MagazineData.MO then
		--self.MagazineData.MO.JointStrength = -1
		local addToSim = true
		if self.MagazineData.Internal then -- Delete internal magazine MO!
			addToSim = false
		end
		
		self:RemoveAttachable(self.MagazineData.MO, addToSim, false)
		if addToSim and self.MagazineData.EjectVelocity then
			self.MagazineData.MO.Vel = self.Vel + Vector(self.MagazineData.EjectVelocity.X * self.FlipFactor, self.MagazineData.EjectVelocity.Y):RadRotate(self.RotAngle)
		else
			self.MagazineData.MO.Vel = self.Vel + Vector(1 * self.FlipFactor, 2):RadRotate(self.RotAngle)
			self.MagazineData.MO.AngularVel = 1 * self.FlipFactor
		end
		self.MagazineData.MO = nil
	end
end

function ScrappersGunFunctions.SetupFireSoundSets(self, supressed)
	local bass = ""
	local add = ""
	local fireSound = self.Caliber.FireSound
	local noiseSound = self.Caliber.NoiseSound
	if supressed then
		fireSound = self.Caliber.FireSuppressedSound
		noiseSound = self.Caliber.NoiseSuppressedSound
	end
	
	local baseBassVolume = 1
	local baseAddVolume = 1
	local baseNoiseVolume = 1
	local baseReflectionVolume = 1
	if supressed then
		baseBassVolume = 0.9
		baseReflectionVolume = 0.05
		-- Add
		if (self.FullAuto or self.soundFireForceFullAuto) and not self.soundFireForceSemi then
			if fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			end
		else
			if fireSound["AddSemiVariants"] < 1 then
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			elseif fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				local total = fireSound["AddSemiVariants"] + fireSound["AddVariants"]
				--if math.random() < (fireSound["AddSemiVariants"] / total) then
				if (true) then
					add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				else
					add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				end
			end
		end
		
		-- Bass
		if fireSound["BassVariants"] > 1 then
			bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["BassVariants"]))
		else
			bass = fireSound["Bass"]
		end
	else
	
		-- Add
		if (self.FullAuto or self.soundFireForceFullAuto) and not self.soundFireForceSemi then
			if fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				bass = fireSound["BassSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			end
		else
			if fireSound["AddSemiVariants"] < 1 then
				add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
			elseif fireSound["AddVariants"] < 1 then
				add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				bass = fireSound["BassSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
			else
				local total = fireSound["AddSemiVariants"] + fireSound["AddVariants"]
				--if math.random() < (fireSound["AddSemiVariants"] / total) then
				if (true) then
					add = fireSound["AddSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
					bass = fireSound["BassSemi"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddSemiVariants"]))
				else
					add = fireSound["Add"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
					bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["AddVariants"]))
				end
			end
		end
	end
	
	self.soundFireAdd = CreateSoundContainer(add, ScrappersData.Module)
	self.soundFireAddBasePitch = RangeRand(0.95, 1.05)
	self.soundFireAddBaseVolume = self.soundFireAdd.Volume * baseAddVolume
	
	self.soundFireAdd.Pitch = self.soundFireAddBasePitch
	self.soundFireAdd.Volume = self.soundFireAddBaseVolume
	
	
	self.soundFireBass = CreateSoundContainer(bass, ScrappersData.Module)
	self.soundFireBassBasePitch = self.Caliber.BaseBassPitch * RangeRand(0.975, 1.025)
	self.soundFireBassBaseVolume = self.Caliber.BaseBassVolume * baseBassVolume
	
	self.soundFireBass.Pitch = self.soundFireBassBasePitch
	self.soundFireBass.Volume = self.soundFireBassBaseVolume
	
	
	-- Noise
	self.soundFireNoiseOutdoors = CreateSoundContainer(noiseSound["Outdoors"], ScrappersData.Module)
	self.soundFireNoiseOutdoors.Pitch = self.Caliber.BaseNoisePitch
	self.soundFireNoiseOutdoors.Volume = self.Caliber.BaseNoiseVolume * baseNoiseVolume
	
	self.soundFireNoiseIndoors = CreateSoundContainer(noiseSound["Indoors"], ScrappersData.Module)
	self.soundFireNoiseIndoors.Pitch = self.Caliber.BaseNoisePitch
	self.soundFireNoiseIndoors.Volume = self.Caliber.BaseNoiseVolume * baseNoiseVolume
	
	self.soundFireNoiseBigIndoors = CreateSoundContainer(noiseSound["BigIndoors"], ScrappersData.Module)
	self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoisePitch
	self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseVolume * baseNoiseVolume


	self.soundFireNoiseSemiOutdoors = CreateSoundContainer(noiseSound["OutdoorsSemi"], ScrappersData.Module)
	self.soundFireNoiseSemiOutdoors.Pitch = self.Caliber.BaseNoiseSemiPitch
	self.soundFireNoiseSemiOutdoors.Volume = self.Caliber.BaseNoiseSemiVolume * baseNoiseVolume
	
	self.soundFireNoiseSemiIndoors = CreateSoundContainer(noiseSound["IndoorsSemi"], ScrappersData.Module)
	self.soundFireNoiseSemiIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
	self.soundFireNoiseSemiIndoors.Volume = self.Caliber.BaseNoiseSemiVolume * baseNoiseVolume
	
	self.soundFireNoiseSemiBigIndoors = CreateSoundContainer(noiseSound["BigIndoorsSemi"], ScrappersData.Module)
	self.soundFireNoiseSemiBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
	self.soundFireNoiseSemiBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume * baseNoiseVolume
	
	-- Reflection
	self.soundFireReflection = CreateSoundContainer(self.Caliber.ReflectionSound, ScrappersData.Module)
	self.soundFireReflection.Pitch = self.Caliber.BaseNoisePitch
	self.soundFireReflection.Volume = self.Caliber.BaseNoiseVolume * baseReflectionVolume
	
	self.soundFireReflectionSemi = CreateSoundContainer(self.Caliber.ReflectionSound .. " Semi", ScrappersData.Module)
	self.soundFireReflectionSemi.Pitch = self.Caliber.BaseNoisePitch
	self.soundFireReflectionSemi.Volume = self.Caliber.BaseNoiseVolume * baseReflectionVolume
	
	self.reflectionSound = self.soundFireReflection -- default
	self.reflectionSemiSound = self.soundFireReflectionSemi -- default
end

function ScrappersGunFunctions.PickReceiver(self, data)
	--- Pick the Receiver
	if #data < 1 then return end
	
	local randI = math.random(1, #data)
	self.Receiver = ScrappersData.CopyTable(data[randI])
	if self.Receiver.Cost > self.Budget then
		print("Receiver MUST NOT be more expensive than maximum budget!")
		--print("Maximum Budget: "..ScrappersRifleData.Budget)
		print("Receiver Cost: "..self.Receiver.Cost)
		print("Receiver Index: "..randI)
		return
	end
	self.Budget = self.Budget - self.Receiver.Cost -- Sold!
	
	-- Copy the variables
	self.Mass = self.Receiver.Mass
	self.RateOfFire = ScrappersGunFunctions.PickProperty(self, self.Receiver.RateOfFire)
	if self.Receiver.Mode then self.FireMode = ScrappersGunFunctions.PickProperty(self, self.Receiver.Mode) else self.FireMode = 0 end
	
	if self.Receiver.JointOffset then self.JointOffset = self.Receiver.JointOffset end
	if self.Receiver.SupportOffset then self.SupportOffset = self.Receiver.SupportOffset end
	if self.Receiver.StanceOffset then self.StanceOffset = self.Receiver.StanceOffset end
	if self.Receiver.SharpStanceOffset then self.SharpStanceOffset = self.Receiver.SharpStanceOffset end
	if self.Receiver.EjectionOffset then self.EjectionOffset = self.Receiver.EjectionOffset end
	if self.Receiver.GunRattleType then self:SetNumberValue("Gun Rattle Type", self.Receiver.GunRattleType) end
	
	self.MuzzleOffset = self.Receiver.BarrelOffset
	
	self.Frame = self.Receiver.FrameStart
	self.FrameLocal = 0
	if self.Receiver.FrameIntermediate then
		self.FrameIntermediate = self.Receiver.FrameIntermediate - self.Receiver.FrameStart
	end
	self.FrameRange = self.Receiver.FrameEnd - self.Receiver.FrameStart
	
	if self.FireMode == 1 then
		self.FullAuto = false
	else
		self.FullAuto = true
	end
	
	self.BarrelLength = 0
	if self.Receiver.IntegratedBarrelLength then
		self.BarrelLength = self.BarrelLength + self.Receiver.IntegratedBarrelLength
	end
	
	-- Casing stuff
	self.EjectionVelocity = self.Receiver.EjectionVelocity
	
	-- Sounds
	self.ReloadBoltSoundSet = ScrappersData.ReloadSoundSets.Bolt[ScrappersGunFunctions.PickProperty(self, self.Receiver.ReloadSoundSet)]
	
	self.soundFireMech = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.MechSound), ScrappersData.Module)
	self.soundFireMechBasePitch = 1
	self.soundFireMechBaseVolume = 1
	
	self.soundFireMech.Pitch = self.soundFireMechBasePitch
	self.soundFireMech.Volume = self.soundFireMechBaseVolume
	
	if self.Receiver.PreSound then
		self.soundFirePre = CreateSoundContainer(ScrappersGunFunctions.PickProperty(self, self.Receiver.PreSound), ScrappersData.Module)
	end
	
	if self.Receiver.PreDelay then
		self.preDelay = ScrappersGunFunctions.PickProperty(self, self.Receiver.PreDelay)
		--print(self.preDelay)
	end
end

function ScrappersGunFunctions.PickMagazine(self, data)
	--- Pick the Magazine
	local potentialMagazines = {}
	for i, magazine in ipairs(data) do
		local validType = false
		if type(self.Receiver.MagazineType) == "table" then
			for i, magType in ipairs(self.Receiver.MagazineType) do
				if magazine.Type == magType then
					validType = true
					break
				end
			end
		elseif magazine.Type == self.Receiver.MagazineType then
			validType = true
		end
		if validType and magazine.Cost <= self.Budget then
			local valid = false
			if type(magazine.Calibers) == "table" then
				for _, magazineCaliber in ipairs(magazine.Calibers) do
					
					if type(magazineCaliber) == "table" then
						if #magazineCaliber > 0 and type(magazineCaliber[1]) == "string" then
							magazineCaliber = magazineCaliber[1]
						elseif #magazineCaliber > 1 and type(magazineCaliber[2]) == "string" then
							magazineCaliber = magazineCaliber[2]
						end
					end
					
					if type(self.Receiver.Calibers) == "table" then
						for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
							if receiverCaliber == magazineCaliber then
								valid = true
								break
							end
						end
					elseif self.Receiver.Calibers == magazineCaliber then
						valid = true
						break
					end
				end
			else
				if type(self.Receiver.Calibers) == "table" then
					for _, receiverCaliber in ipairs(self.Receiver.Calibers) do
						if receiverCaliber == magazine.Calibers then
							valid = true
							break
						end
					end
				elseif self.Receiver.Calibers == magazine.Calibers then
					valid = true
				end
			end
			
			if valid then
				table.insert(potentialMagazines, magazine)
			end
		end
	end
	if #potentialMagazines > 0 then
		--randI = math.random(1, #potentialMagazines)
		--self.MagazineData = potentialMagazines[randI]
		for i = 1, 3 do -- Roll 3 times and pick the largest magazine
			randI = math.random(1, #potentialMagazines)
			local magazine = potentialMagazines[randI]
			local roundCount = 0
			local roundCountCurrent = 0
			
			if type(magazine.RoundCount) == "table" then
				if type(magazine.RoundCount[1]) == "table" then -- that's fucked up
					for j = 1, #magazine.RoundCount do
						roundCount = math.max(roundCount, magazine.RoundCount[j][1])
					end
				else
					for j = 1, #magazine.RoundCount do
						roundCount = math.max(roundCount, magazine.RoundCount[j])
					end
				end
			else
				roundCount = magazine.RoundCount
			end
			if not self.MagazineData or roundCount > roundCountCurrent then
				--print(roundCount)
				self.MagazineData = ScrappersData.CopyTable(magazine)
				roundCountCurrent = roundCount
			end
		end
		
		self.Budget = self.Budget - self.MagazineData.Cost -- Sold!
		
		self.ReloadMagazineSoundSet = ScrappersData.ReloadSoundSets.Magazine[ScrappersGunFunctions.PickProperty(self, self.MagazineData.ReloadSoundSet)]
		
		-- messy system to check if we should have a "one in the chamber" compatible roundcount
		-- TODO: standardize somehow
		
		local roundCount = ScrappersGunFunctions.PickProperty(self, self.MagazineData.RoundCount) + 0
		
		if self.Receiver.OnCreate == ScrappersReloadsData.BasicMagazineFedCreate 
		or self.Receiver.OnCreate == ScrappersReloadsData.HKMagazineFedCreate
		or self.Receiver.OnCreate == ScrappersReloadsData.AN94Create then
			roundCount = roundCount + 1
		else		
			roundCount = roundCount		
		end
		self.MaxRoundCount = roundCount
		self.MagazineData.RoundCount = roundCount 
		
		--- Caliber
		self.Caliber = ScrappersData.Ammunition[ScrappersGunFunctions.PickCaliber(self, self.MagazineData)]
		
		-- Casing stuff
		self.Casing = self.Caliber.CasingPresetName
		
		ScrappersGunFunctions.MagazineIn(self)
		
		-- Sounds
		ScrappersGunFunctions.SetupFireSoundSets(self, false)
		
		self:SetNextMagazineName("Scrapper Magazine "..self.MagazineData.RoundCount)
		if self.Magazine then
			self:RemoveAttachable(self.Magazine)
		end
		local newMagazine = CreateMagazine("Scrapper Magazine "..self.MagazineData.RoundCount, ScrappersData.Module)
		if newMagazine then
			self.Magazine = newMagazine
		else
			print("Couldn't find find such magazine: " .. "Scrapper Magazine "..self.MagazineData.RoundCount .. " !!!")
			print("Magazine frame: "..self.MagazineData.Frame)
		end
		--self.ReloadTime = 0
		--self:Reload()
		
	else
		print("SOMETHING WENT WRONG!")
		print("Couldn't afford any magazine!")
		return
	end
end

function ScrappersGunFunctions.PickBarrel(self, data, presetName)
	--- Pick the Barrel
	local potentialBarrels = {}
	for i, barrel in ipairs(data) do
		local ignore = false
		
		
		if not barrel.Mass and barrel.Density then
			barrel.Mass = barrel.Length * barrel.Density
		end
		
		if not barrel.Cost then
			if barrel.Mass then
				barrel.Cost = math.ceil((math.pow(barrel.Length, 2) / (barrel.Mass)) * 0.075)
			else
				barrel.Cost = 0
			end
		end
		if not ignore and barrel.Cost <= self.Budget then
			table.insert(potentialBarrels, barrel)
		end
	end
	if #potentialBarrels > 0 then
		for i = 1, 3 do -- Roll 3 times and pick the longest barrel
			local randI = math.random(1, #potentialBarrels)
			local barrel = potentialBarrels[randI]
			if not self.Barrel or barrel.Length > self.Barrel.Length then
				self.Barrel = ScrappersData.CopyTable(barrel)
			end
		end
		self.Budget = self.Budget - self.Barrel.Cost -- Sold!
		
		local BarrelMO = CreateAttachable(presetName, ScrappersData.Module);
		
		BarrelMO.ParentOffset = self.Receiver.BarrelOffset
		--BarrelMO.JointOffset = self.Receiver.BarrelOffset * -1
		BarrelMO.Mass = self.Barrel.Mass
		BarrelMO.Frame = self.Barrel.Frame
		
		self:AddAttachable(BarrelMO);
		self.Barrel.MO = BarrelMO
		
		self.MuzzleOffset = self.MuzzleOffset + Vector(self.Barrel.Length, 0)
		self.BarrelLength = self.BarrelLength + self.Barrel.Length
	end
end

function ScrappersGunFunctions.PickForegrip(self, data, presetName)
	--- Pick the Foregrip
	local potentialForegrips = {}
	for i, foregrip in ipairs(data) do
		
		if not foregrip.Cost then
			foregrip.Cost = math.ceil(foregrip.Quality * 1 / (foregrip.Mass)) - math.random(0,1)
		end
		
		if foregrip.Length <= self.Barrel.Length and foregrip.Cost <= self.Budget then
			table.insert(potentialForegrips, foregrip)
		end
	end
	if #potentialForegrips > 0 then
		local randI = math.random(1, #potentialForegrips)
		self.Foregrip = ScrappersData.CopyTable(potentialForegrips[randI])
		
		self.Budget = self.Budget - self.Foregrip.Cost -- Sold!
		
		local ForegripMO = CreateAttachable(presetName, ScrappersData.Module);
		
		ForegripMO.ParentOffset = self.Receiver.BarrelOffset
		ForegripMO.Mass = self.Foregrip.Mass
		ForegripMO.Frame = self.Foregrip.Frame
		
		self:AddAttachable(ForegripMO)
		self.Foregrip.MO = ForegripMO
	end
end

function ScrappersGunFunctions.PickStock(self, data, presetName)
	--- Pick the Stock
	local potentialStocks = {}
	for i, stock in ipairs(data) do
		
		if not stock.Cost then
			stock.Cost = math.ceil(stock.Quality * 0.5 / (stock.Mass))
		end
		
		if stock.Cost <= self.Budget then
			table.insert(potentialStocks, stock)
		end
	end
	if #potentialStocks > 0 then
		local randI = math.random(1, #potentialStocks)
		self.Stock = ScrappersData.CopyTable(potentialStocks[randI])
		
		self.Budget = self.Budget - self.Stock.Cost -- Sold!
		
		local StockMO = CreateAttachable(presetName, ScrappersData.Module);
		
		StockMO.ParentOffset = self.Receiver.StockOffset
		StockMO.Mass = self.Stock.Mass
		StockMO.Frame = self.Stock.Frame
		
		self:AddAttachable(StockMO)
		self.Stock.MO = StockMO
	end
end

function ScrappersGunFunctions.PickSight(self, data, presetName)
	--- Pick the Sights
	local potentialSights = {}
	for i, sight in ipairs(data) do
		
		if not sight.Cost then
			sight.Cost = 0
		end
		
		if sight.Cost <= self.Budget then
			table.insert(potentialSights, sight)
		end
	end
	if #potentialSights > 0 then
		local randI = math.random(1, #potentialSights)
		self.Sight = ScrappersData.CopyTable(potentialSights[randI])
		
		self.Budget = self.Budget - self.Sight.Cost -- Sold!
		
		local SightMO = CreateAttachable(presetName, ScrappersData.Module);
		
		SightMO.ParentOffset = self.Receiver.SightOffset
		SightMO.Frame = self.Sight.Frame
		
		self:AddAttachable(SightMO)
		self.Sight.MO = SightMO
		
		self.SharpLength = self.SharpLength + self.Sight.SharpLength
	end
end

function ScrappersGunFunctions.PickBarrelMod(self, data, presetName)
	--- Pick the Sights
	local potentialBarrelMods = {}
	for i, sight in ipairs(data) do
		
		if not sight.Cost then
			sight.Cost = 0
		end
		
		if sight.Cost <= self.Budget then
			table.insert(potentialBarrelMods, sight)
		end
	end
	if #potentialBarrelMods > 0 and self.Barrel and self.Barrel.MO then
		local randI = math.random(1, #potentialBarrelMods)
		self.BarrelMod = ScrappersData.CopyTable(potentialBarrelMods[randI])
		
		self.Budget = self.Budget - self.BarrelMod.Cost -- Sold!
		
		if self.BarrelMod.IsSupressor then
			ScrappersGunFunctions.SetupFireSoundSets(self, true)
			self.Loudness = 0.0
		end
		
		if self.BarrelMod.MuzzleFlash then
			local newFlash = CreateAttachable(self.BarrelMod.MuzzleFlash, ScrappersData.Module)
			if newFlash then
				self.Flash = newFlash
			end
		end
		
		local BarrelModMO = CreateAttachable(presetName, ScrappersData.Module);
		
		BarrelModMO.ParentOffset = Vector(self.Barrel.Length, 0)
		BarrelModMO.Frame = self.BarrelMod.Frame
		
		self.Barrel.MO:AddAttachable(BarrelModMO)
		self.BarrelMod.MO = BarrelModMO
		
		self.MuzzleOffset = self.MuzzleOffset + Vector(self.BarrelMod.Length, 0)
	end
end

function ScrappersGunFunctions.SetupReloadSoundSets(self)
	self.soundReloadSet = {}
	for i, sound in ipairs(self.ReloadBoltSoundSet.SoundList) do
		local soundPresetName = self.ReloadBoltSoundSet[sound]["SoundContainer"]
		if soundPresetName and soundPresetName ~= "" and soundPresetName ~= nil then
			self.soundReloadSet[sound] = CreateSoundContainer(soundPresetName, ScrappersData.Module)
		end
	end
	for i, sound in ipairs(self.ReloadMagazineSoundSet.SoundList) do
		local soundPresetName = self.ReloadMagazineSoundSet[sound]["SoundContainer"]
		if soundPresetName and soundPresetName ~= "" then
			self.soundReloadSet[sound] = CreateSoundContainer(soundPresetName, ScrappersData.Module)
		end
	end
end

function ScrappersGunFunctions.SpawnMuzzleGFXDefault(self, muzzlePos)
	
	-- Muzzle GFX
	local xSpread = 0
	if self.BarrelMod and not self.BarrelMod.IsSupressor then
		xSpread = self.BarrelMod.Length
	end
	
	local smokeAmount = self.Caliber.SmokeAmount
	local particleSpread = 25
	
	local smokeLingering = math.sqrt(smokeAmount / 8) * (self.FullAuto == false and 1.5 or 1.0)
	local smokeVelocity = (1 + math.sqrt(smokeAmount / 8) ) * 0.5
	
	-- Muzzle main smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local spread = math.pi * RangeRand(-1, 1) * 0.05
		local velocity = self.fireVelocity * RangeRand(0.1, 0.9) * 0.4;
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle((math.random() * particleSpread) < 6.5 and "Tiny Smoke Ball 1" or "Small Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle side smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local vel = Vector(self.fireVelocity * self.FlipFactor,0):RadRotate(self.RotAngle)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Tiny Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		-- oh LORD
		particle.Vel = self.Vel + ((Vector(vel.X, vel.Y):RadRotate(math.pi * (math.random(0,1) * 2.0 - 1.0) * 0.5 + math.pi * RangeRand(-1, 1) * 0.15) * RangeRand(0.1, 0.9) * 0.3 + Vector(vel.X, vel.Y):RadRotate(math.pi * RangeRand(-1, 1) * 0.15) * RangeRand(0.1, 0.9) * 0.2) * 0.5) * smokeVelocity;
		-- have mercy
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle flash-smoke
	particleSpread = 25
	for i = 1, math.ceil(smokeAmount / (math.random(5,10) * 0.5)) do
		local spread = RangeRand(-math.rad(particleSpread), math.rad(particleSpread)) * (1 + math.random(0,3) * 0.3)
		local velocity = self.fireVelocity * 0.6 * RangeRand(0.9,1.1)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Flame Smoke 1 Micro")
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Team = self.Team
		particle.Lifetime = particle.Lifetime * RangeRand(0.9,1.2) * 0.75 * smokeLingering
		particle.AirResistance = particle.AirResistance * 2.5 * RangeRand(0.9,1.1)
		particle.IgnoresTeamHits = true
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	--
end

function ScrappersGunFunctions.SpawnMuzzleGFXUpDown(self, muzzlePos)
	
	-- Muzzle GFX
	local xSpread = 0
	if self.BarrelMod and not self.BarrelMod.IsSupressor then
		xSpread = self.BarrelMod.Length
	end
	
	local smokeAmount = self.Caliber.SmokeAmount
	local particleSpread = 25
	
	local smokeLingering = math.sqrt(smokeAmount / 8) * (self.FullAuto == false and 1.5 or 1.0)
	local smokeVelocity = (1 + math.sqrt(smokeAmount / 8) ) * 0.3
	
	-- Muzzle main smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local spread = math.pi * RangeRand(-1, 1) * 0.05 + math.pi * (math.random(0,1) - 0.5) + math.pi * RangeRand(-1, 1) * 0.10
		local velocity = self.fireVelocity * RangeRand(0.1, 0.9) * 0.4;
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle((math.random() * particleSpread) < 6.5 and "Tiny Smoke Ball 1" or "Small Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle side smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local vel = Vector(self.fireVelocity * self.FlipFactor,0):RadRotate(self.RotAngle)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Tiny Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		-- oh LORD
		particle.Vel = self.Vel + (Vector(vel.X, vel.Y):RadRotate(math.pi * (math.random(0,1) - 0.5) + math.pi * RangeRand(-1, 1) * 0.10) * RangeRand(0.1, 0.9) * 0.15) * smokeVelocity;
		-- have mercy
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle flash-smoke
	particleSpread = 25
	for i = 1, math.ceil(smokeAmount / (math.random(5,10) * 0.35)) do
		local spread = RangeRand(-math.rad(particleSpread), math.rad(particleSpread)) * (1 + math.random(0,3) * 0.3)
		local velocity = self.fireVelocity * 0.6 * RangeRand(0.9,1.1)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Flame Smoke 1 Micro")
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Team = self.Team
		particle.Lifetime = particle.Lifetime * RangeRand(0.9,1.2) * 0.75 * smokeLingering
		particle.AirResistance = particle.AirResistance * 2.5 * RangeRand(0.9,1.1)
		particle.IgnoresTeamHits = true
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	--
end


function ScrappersGunFunctions.SpawnMuzzleGFXUp(self, muzzlePos)
	
	-- Muzzle GFX
	local xSpread = 0
	if self.BarrelMod and not self.BarrelMod.IsSupressor then
		xSpread = self.BarrelMod.Length
	end
	
	local smokeAmount = self.Caliber.SmokeAmount
	local particleSpread = 25
	
	local smokeLingering = math.sqrt(smokeAmount / 8) * (self.FullAuto == false and 1.5 or 1.0)
	local smokeVelocity = (1 + math.sqrt(smokeAmount / 8) ) * 0.3
	
	-- Muzzle main smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local spread = math.pi * RangeRand(-1, 1) * 0.05 + math.pi * self.FlipFactor * 0.5 + math.pi * RangeRand(-1, 1) * 0.10
		local velocity = self.fireVelocity * RangeRand(0.1, 0.9) * 0.4;
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle((math.random() * particleSpread) < 6.5 and "Tiny Smoke Ball 1" or "Small Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle side smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local vel = Vector(self.fireVelocity * self.FlipFactor,0):RadRotate(self.RotAngle)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Tiny Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		-- oh LORD
		particle.Vel = self.Vel + (Vector(vel.X, vel.Y):RadRotate(math.pi * self.FlipFactor * 0.5 + math.pi * RangeRand(-1, 1) * 0.10) * RangeRand(0.1, 0.9) * 0.15) * smokeVelocity;
		-- have mercy
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle flash-smoke
	particleSpread = 25
	for i = 1, math.ceil(smokeAmount / (math.random(5,10) * 0.35)) do
		local spread = RangeRand(-math.rad(particleSpread), math.rad(particleSpread)) * (1 + math.random(0,3) * 0.3)
		local velocity = self.fireVelocity * 0.6 * RangeRand(0.9,1.1)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Flame Smoke 1 Micro")
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Team = self.Team
		particle.Lifetime = particle.Lifetime * RangeRand(0.9,1.2) * 0.75 * smokeLingering
		particle.AirResistance = particle.AirResistance * 2.5 * RangeRand(0.9,1.1)
		particle.IgnoresTeamHits = true
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	--
end

function ScrappersGunFunctions.SpawnMuzzleGFXSide(self, muzzlePos)
	
	-- Muzzle GFX
	local xSpread = 0
	if self.BarrelMod and not self.BarrelMod.IsSupressor then
		xSpread = self.BarrelMod.Length
	end
	
	local smokeAmount = self.Caliber.SmokeAmount
	local particleSpread = 25
	
	local smokeLingering = math.sqrt(smokeAmount / 8) * (self.FullAuto == false and 1.5 or 1.0)
	local smokeVelocity = (1 + math.sqrt(smokeAmount / 8) ) * 0.25
	
	-- Muzzle main smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local spread = math.pi * RangeRand(-1, 1) * 0.05 + math.pi * (math.random(0,1) - 0.5) + math.pi * RangeRand(-1, 1) * 0.10
		local velocity = self.fireVelocity * RangeRand(0.1, 0.9) * 0.05;
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle((math.random() * particleSpread) < 6.5 and "Tiny Smoke Ball 1" or "Small Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle side smoke
	for i = 1, math.ceil(smokeAmount / (math.random(4,6))) do
		local vel = Vector(self.fireVelocity * self.FlipFactor,0):RadRotate(self.RotAngle)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Tiny Smoke Ball 1");
		particle.Pos = muzzlePos + xSpreadVec
		-- oh LORD
		particle.Vel = self.Vel + (Vector(vel.X, vel.Y):RadRotate(math.pi * (math.random(0,1) - 0.5) + math.pi * RangeRand(-1, 1) * 0.10) * RangeRand(0.1, 0.9) * 0.01) * smokeVelocity;
		-- have mercy
		particle.Lifetime = particle.Lifetime * RangeRand(0.9, 1.6) * 0.3 * smokeLingering
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	
	-- Muzzle flash-smoke
	particleSpread = 25
	for i = 1, math.ceil(smokeAmount / (math.random(5,10) * 0.35)) do
		local spread = RangeRand(-math.rad(particleSpread), math.rad(particleSpread)) * (1 + math.random(0,3) * 0.3)
		local velocity = self.fireVelocity * 0.6 * RangeRand(0.9,1.1)
		
		local xSpreadVec = Vector(xSpread * self.FlipFactor * math.random() * -1, 0):RadRotate(self.RotAngle)
		
		local particle = CreateMOSParticle("Flame Smoke 1 Micro")
		particle.Pos = muzzlePos + xSpreadVec
		particle.Vel = self.Vel + Vector(velocity * self.FlipFactor,0):RadRotate(self.RotAngle + spread) * smokeVelocity
		particle.Team = self.Team
		particle.Lifetime = particle.Lifetime * RangeRand(0.9,1.2) * 0.75 * smokeLingering
		particle.AirResistance = particle.AirResistance * 2.5 * RangeRand(0.9,1.1)
		particle.IgnoresTeamHits = true
		particle.AirThreshold = particle.AirThreshold * 0.5
		MovableMan:AddParticle(particle);
	end
	--
end

function ScrappersGunFunctions.AnimateBolt(self, firedFrameFrame)
	if self.fireTimerFired then
		local fireDuration = 60000/self.RateOfFire
		
		local factor = math.min(self.fireTimer.ElapsedSimTimeMS / fireDuration, 1)
		-- factor = math.sin(factor * math.pi)
		-- factor = math.pow(factor, 0.5)
		-- self.FrameLocal = math.floor(firedFrameFrame * factor + 0.5)
		local middleFactor = 0.2
		local backwardFactor = 0.7
		if factor < (backwardFactor + middleFactor) then
			local f = math.sqrt(math.min(factor / middleFactor, 1), 2)
			self.FrameLocal = math.floor(firedFrameFrame * f + 0.5)
			PrimitiveMan:DrawLinePrimitive(self.parent.Pos + Vector(0, -25), self.parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (f - 0.5)), 122);
		elseif self.boltRelease and self.chamberOnReload then
			self.FrameLocal = firedFrameFrame
			PrimitiveMan:DrawLinePrimitive(self.parent.Pos + Vector(0, -25), self.parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * (0.5)), 122);
		else
			local f = math.sqrt(math.min((factor - middleFactor - backwardFactor) / (1 - middleFactor - backwardFactor), 1))
			self.FrameLocal = firedFrameFrame - math.floor(firedFrameFrame * f + 0.5)
			PrimitiveMan:DrawLinePrimitive(self.parent.Pos + Vector(0, -25), self.parent.Pos + Vector(0, -25) + Vector(0, -25):RadRotate(math.pi * ((1 - f) - 0.5)), 122);
		end
		
		if self.fireTimer:IsPastSimMS(fireDuration) then
			self.fireTimerFired = false
		end
	end
end