
function Create(self)
	
end

function Update(self)
	
	if self.FiredFrame then
		if self.soundFireMech then
			self.soundFireMech:Play(self.Pos)
		end
		if self.soundFireAdd then
			self.soundFireAdd:Play(self.Pos)
		end
		if self.soundFireBass then
			self.soundFireBass:Play(self.Pos)
		end
	end
end