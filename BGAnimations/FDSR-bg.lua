if SL.Global.GameMode == "LV1" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "LV2" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "LV3" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
elseif SL.Global.GameMode == "LV4" then
	return LoadActor( THEME:GetPathG("", "bgs.png") )..{
		InitCommand=function(self) self:Center():zoom(0.630) end,
}
end