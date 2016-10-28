if SL.Global.GameMode == "Marathon" then
	return LoadActor( THEME:GetPathG("", "srt.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
	}
end