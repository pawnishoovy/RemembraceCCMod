-- thanks to filipex and pawnis

function Create(self)

	self:SetNumberValue("Randomization", math.random(0, 4))
	
	if self.HFlipped then
		self.DefaultStanceOffset = Vector(-self.StanceOffset.X,self.StanceOffset.Y)
	else
		self.DefaultStanceOffset = self.StanceOffset
	end
	
	
	self.stabTimer = Timer();
	self.stabAngle = 0
	self.stabLasts = false
	self.stabDamages = true
	self.equippedByActor = false
	
	--self.canActivateTimer = Timer()
	--self.activationTime = 60000/self.RateOfFire
	
	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
	end
end

function Update(self)

	--check if flipped
	local negNum
	if self.HFlipped then
		negNum = -1;
	else
		negNum = 1;
	end
	
	--check user
	local actor = MovableMan:GetMOFromID(self.RootID);
	if actor and IsAHuman(actor) then
		self.parent = ToAHuman(actor);
		self.parent:GetController():SetState(Controller.AIM_SHARP, false);
		self.equippedByActor = true;
	else
		self.parent = nil;
		self.equippedByActor = false;
	end
	
	if self.disableFire == true and self.equippedByActor == true then
		if self.parent then
			self.parent:GetController():SetState(Controller.WEAPON_FIRE,false);	
		end
	end
	
	if self.parent then
			
		if self:IsActivated() or (self.stabTimer:IsPastSimMS(400) and self.stabLasts == true) then
		
			if self.parent then
				self.disableFire = true;
				self.parent:SetNumberValue("MeleedSmall", 1); -- tell the parent it just performed a melee attack, so it can react with a sound
			end
			
			if self.stabAngle >= 1.57 then
				self:Deactivate();
			else
				self:Activate();
			end
			
			self.StanceOffset = Vector(self.DefaultStanceOffset.X*2,self.DefaultStanceOffset.Y*0.5)
			if self.stabTimer:IsPastSimMS(200) and self.stabLasts == true then
				self.stabLasts = false
			end
			
			if self:IsActivated() then self.stabLasts = true end
			self.parent:GetController():SetState(Controller.AIM_SHARP, false)
			self.stabAngle = (self.stabAngle + math.pi*0.5)/2
			if self.stabTimer:IsPastSimMS(100) then
				
				if self.stabDamages then
					local Vector2 = (Vector(2,0):GetXFlipped(self.HFlipped)):RadRotate(self.RotAngle)

					self.ray = SceneMan:CastMORay(self.Pos+Vector(0, -4), Vector2, self.RootID, self.Team, 128, false, 2);

					if self.ray > 0 then								
						for i = 1, 1 do
							local Effect = CreateMOPixel("Particle Knife", "ScrapperFaction.rte")
							if Effect then
								Effect.Vel = self.Vel + (Vector(65, 0):GetXFlipped(self.HFlipped):RadRotate(self.RotAngle));
								Effect.Pos = self.Pos + (Vector(0, -1):RadRotate(self.RotAngle));
								Effect.Team = self.Team;
								Effect.IgnoresTeamHits = true;
								MovableMan:AddParticle(Effect);							
							end
						end
					end
					self.stabDamages = false
				end
			end
		else
			self.StanceOffset = self.DefaultStanceOffset
			self.stabDamages = true
			if self.stabAngle > 0.001 then
				self.stabAngle = self.stabAngle*0.5
			else
				self.disableFire = false;
			end
		end
		
		self.RotAngle = self.RotAngle-(self.stabAngle*negNum)
		self:SetNumberValue("RotAngle", self.RotAngle)
		self:SetNumberValue("AngularVel", self.AngularVel)
	else
		self:SetNumberValue("RotAngle", self.RotAngle)
		self:SetNumberValue("AngularVel", self.AngularVel)
	end
	
end