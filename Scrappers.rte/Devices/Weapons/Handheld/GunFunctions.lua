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

function ScrappersGunFunctions.PickReceiver(self, data)
	--- Pick the Receiver
	if #data < 1 then return end
	
	local randI = math.random(1, #data)
	self.Receiver = data[randI]
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
				self.MagazineData = magazine
				roundCountCurrent = roundCount
			end
		end
		
		self.Budget = self.Budget - self.MagazineData.Cost -- Sold!
		
		self.ReloadMagazineSoundSet = ScrappersData.ReloadSoundSets.Magazine[ScrappersGunFunctions.PickProperty(self, self.MagazineData.ReloadSoundSet)]
		
		-- messy system to check if we should have a "one in the chamber" compatible roundcount
		-- TODO: standardize somehow
		
		local roundCount = ScrappersGunFunctions.PickProperty(self, self.MagazineData.RoundCount) + 0
		
		if self.Receiver.OnCreate == ScrappersReloadsData.BasicMagazineFedCreate 
		or self.Receiver.OnCreate == ScrappersReloadsData.HKMagazineFedCreate then
			self.MagazineData.RoundCount = roundCount + 1
		else		
			self.MagazineData.RoundCount = roundCount		
		end
		
		--- Caliber
		self.Caliber = ScrappersData.Ammunition[ScrappersGunFunctions.PickCaliber(self, self.MagazineData)]
		
		-- Casing stuff
		self.Casing = self.Caliber.CasingPresetName
		
		ScrappersGunFunctions.MagazineIn(self)
		
		-- Sounds
		local bass = ""
		local add = ""
		local fireSound = self.Caliber.FireSound
		local noiseSound = self.Caliber.NoiseSound
		
		-- Add
		if self.FullAuto then
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
		
		self.soundFireAdd = CreateSoundContainer(add, ScrappersData.Module)
		self.soundFireAddBasePitch = RangeRand(0.95, 1.05)
		self.soundFireAddBaseVolume = self.soundFireAdd.Volume
		
		self.soundFireAdd.Pitch = self.soundFireAddBasePitch
		self.soundFireAdd.Volume = self.soundFireAddBaseVolume
		
		-- Bass
		if fireSound["BassVariants"] > 1 then
			bass = fireSound["Bass"].." "..ScrappersData.IndexToPrefix(math.random(1,fireSound["BassVariants"]))
		else
			bass = fireSound["Bass"]
		end
		
		self.soundFireBass = CreateSoundContainer(bass, ScrappersData.Module)
		self.soundFireBassBasePitch = self.Caliber.BaseBassPitch * RangeRand(0.975, 1.025)
		self.soundFireBassBaseVolume = self.Caliber.BaseBassVolume
		
		self.soundFireBass.Pitch = self.soundFireBassBasePitch
		self.soundFireBass.Volume = self.soundFireBassBaseVolume
		
		
		-- Noise
		self.soundFireNoiseOutdoors = CreateSoundContainer(noiseSound["Outdoors"], ScrappersData.Module)
		self.soundFireNoiseOutdoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseOutdoors.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireNoiseIndoors = CreateSoundContainer(noiseSound["Indoors"], ScrappersData.Module)
		self.soundFireNoiseIndoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseIndoors.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireNoiseBigIndoors = CreateSoundContainer(noiseSound["BigIndoors"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseVolume


		self.soundFireNoiseSemiOutdoors = CreateSoundContainer(noiseSound["OutdoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		self.soundFireNoiseSemiIndoors = CreateSoundContainer(noiseSound["IndoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		self.soundFireNoiseSemiBigIndoors = CreateSoundContainer(noiseSound["BigIndoorsSemi"], ScrappersData.Module)
		self.soundFireNoiseBigIndoors.Pitch = self.Caliber.BaseNoiseSemiPitch
		self.soundFireNoiseBigIndoors.Volume = self.Caliber.BaseNoiseSemiVolume
		
		-- Reflection
		self.soundFireReflection = CreateSoundContainer(self.Caliber.ReflectionSound, ScrappersData.Module)
		self.soundFireReflection.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireReflection.Volume = self.Caliber.BaseNoiseVolume
		
		self.soundFireReflectionSemi = CreateSoundContainer(self.Caliber.ReflectionSound .. " Semi", ScrappersData.Module)
		self.soundFireReflectionSemi.Pitch = self.Caliber.BaseNoisePitch
		self.soundFireReflectionSemi.Volume = self.Caliber.BaseNoiseVolume
		
		self.reflectionSound = self.soundFireReflection -- default
		self.reflectionSemiSound = self.soundFireReflectionSemi -- default
		
		self:SetNextMagazineName("Scrapper Magazine "..self.MagazineData.RoundCount)
		self:RemoveAttachable(self.Magazine)
		self.Magazine = CreateMagazine("Scrapper Magazine "..self.MagazineData.RoundCount, ScrappersData.Module)
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
				self.Barrel = barrel
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
		self.Foregrip = potentialForegrips[randI]
		
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
		self.Stock = potentialStocks[randI]
		
		self.Budget = self.Budget - self.Stock.Cost -- Sold!
		
		local StockMO = CreateAttachable(presetName, ScrappersData.Module);
		
		StockMO.ParentOffset = self.Receiver.StockOffset
		StockMO.Mass = self.Stock.Mass
		StockMO.Frame = self.Stock.Frame
		
		self:AddAttachable(StockMO)
		self.Stock.MO = StockMO
	end
end

function ScrappersGunFunctions.SetupReloadSoundSets(self)
	self.soundReloadSet = {}
	for i, sound in ipairs(self.ReloadBoltSoundSet.SoundList) do
		local soundPresetName = self.ReloadBoltSoundSet[sound]["SoundContainer"]
		if soundPresetName and soundPresetName ~= "" then
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