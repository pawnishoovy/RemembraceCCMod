function OnAttach(self)

	self.Deploy = true
	self.reloadPhase = 0

end

function OnDetach(self)

	self.outroSound:Play(self.Pos);
	self.FrameLocal = 0;
	
end