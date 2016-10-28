local gc = Var("GameCommand")
local index = gc:GetIndex()
local text = gc:GetName()

-- text description of each mode ("casual", "competitive", "stomperz", "marathon")
return LoadFont("_eurostile outline")..{
	Name="ModeName"..index,
	InitCommand=cmd( halign,1; maxwidth, 256 ),
	Text=THEME:GetString("ScreenSelectLevel", text),
	
	GainFocusCommand=cmd(stoptweening; linear,0.1; zoom,1.2; diffuse, PlayerColor(PLAYER_1) ),
	LoseFocusCommand=cmd(stoptweening; linear,0.1; zoom,0.8; diffuse, color("#888888")),
	OffCommand=function(self)
		self:linear(0.2):diffusealpha(0)
	end
}