
function Create(self)
	self.ReceiverCreate = true
	
	self.parent = nil
	self.parentSet = false;
	
	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end
end

function Update(self)
	if not self.Receiver then return end
	
	if self.ID == self.RootID then
		self.parent = nil;
		self.parentSet = false;
	elseif self.parentSet == false then
		local actor = MovableMan:GetMOFromID(self.RootID);
		if actor and IsAHuman(actor) then
			self.parent = ToAHuman(actor);
			self.parentSet = true;
		end
	end
	
	
	local firedFrame = self.FiredFrame
	local activated = self:IsActivated()
	
	self.Frame = math.min(self.Receiver.FrameStart + self.FrameLocal, self.Receiver.FrameEnd)
	
	if self.ReceiverCreate and self.Receiver.OnCreate then
		self.Receiver.OnCreate(self, self.parent)
		self.ReceiverCreate = false
	end
	if self.Receiver.OnUpdate then
		self.Receiver.OnUpdate(self, self.parent, firedFrame, activated)
	end
	
	
	if firedFrame then
		if self.soundFireMech then
			self.soundFireMech:Play(self.Pos)
		end
		if self.soundFireAdd then
			self.soundFireAdd:Play(self.Pos)
		end
		if self.soundFireBass then
			self.soundFireBass:Play(self.Pos)
		end
		
		self.soundFireNoiseOutdoors:Stop(-1)
		self.soundFireNoiseIndoors:Stop(-1)
		self.soundFireNoiseBigIndoors:Stop(-1)
		
		self.soundFireNoiseSemiOutdoors:Stop(-1)
		self.soundFireNoiseSemiIndoors:Stop(-1)
		self.soundFireNoiseSemiBigIndoors:Stop(-1)

		local outdoorRays = 0;
		local indoorRays = 0;
		local bigIndoorRays = 0;

		if self.parent:IsPlayerControlled() then
			self.rayThreshold = 2; -- this is the first ray check to decide whether we play outdoors
			local Vector2 = Vector(0,-700); -- straight up
			local Vector2Left = Vector(0,-700):RadRotate(45*(math.pi/180));
			local Vector2Right = Vector(0,-700):RadRotate(-45*(math.pi/180));			
			local Vector2SlightLeft = Vector(0,-700):RadRotate(22.5*(math.pi/180));
			local Vector2SlightRight = Vector(0,-700):RadRotate(-22.5*(math.pi/180));		
			local Vector3 = Vector(0,0); -- dont need this but is needed as an arg
			local Vector4 = Vector(0,0); -- dont need this but is needed as an arg

			self.ray = SceneMan:CastObstacleRay(self.Pos, Vector2, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.rayRight = SceneMan:CastObstacleRay(self.Pos, Vector2Right, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.rayLeft = SceneMan:CastObstacleRay(self.Pos, Vector2Left, Vector3, Vector4, self.RootID, self.Team, 128, 7);			
			self.raySlightRight = SceneMan:CastObstacleRay(self.Pos, Vector2SlightRight, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			self.raySlightLeft = SceneMan:CastObstacleRay(self.Pos, Vector2SlightLeft, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			
			self.rayTable = {self.ray, self.rayRight, self.rayLeft, self.raySlightRight, self.raySlightLeft};
		else
			self.rayThreshold = 1; -- has to be different for AI
			local Vector2 = Vector(0,-700); -- straight up
			local Vector3 = Vector(0,0); -- dont need this but is needed as an arg
			local Vector4 = Vector(0,0); -- dont need this but is needed as an arg		
			self.ray = SceneMan:CastObstacleRay(self.Pos, Vector2, Vector3, Vector4, self.RootID, self.Team, 128, 7);
			
			self.rayTable = {self.ray};
		end
		
		for _, rayLength in ipairs(self.rayTable) do
			if rayLength < 0 then
				outdoorRays = outdoorRays + 1;
			elseif rayLength > 170 then
				bigIndoorRays = bigIndoorRays + 1;
			else
				indoorRays = indoorRays + 1;
			end
		end
		
		if outdoorRays >= self.rayThreshold then
			self.soundFireNoiseOutdoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiOutdoors:Play(self.Pos)
			end
		elseif math.max(outdoorRays, bigIndoorRays, indoorRays) == indoorRays then
			self.soundFireNoiseIndoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiIndoors:Play(self.Pos)
			end
		else -- bigIndoor
			self.soundFireNoiseBigIndoors:Play(self.Pos)
			if not self.FullAuto then
				self.soundFireNoiseSemiBigIndoors:Play(self.Pos)
			end
		end
	end
end