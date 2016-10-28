if SL.Global.GameMode == "Casual" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "Competitive" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "StomperZ" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "Marathon" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
end