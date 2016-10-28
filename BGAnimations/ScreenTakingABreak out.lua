--You know, that nice explosion transition. :P

local t = Def.ActorFrame{

	Def.Quad{
		OnCommand=cmd(sleep,5.0; accelerate,1; diffuse,Color.Black)
	},


	LoadActor("Hearts_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationz,0; diffusealpha,1; zoom,0; diffusealpha,0.8; linear,0.8; rotationz,0; zoom,3.3; diffusealpha,0)
	},
	LoadActor("Hearts_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationy,0; rotationz,0; diffusealpha,1; zoom,0.0; diffusealpha,0.8; decelerate,1.8; rotationz,0; zoom,3.3; diffusealpha,0)
	},
	LoadActor("Hearts_minisplode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationz,0; diffusealpha,0; zoom,0; diffusealpha,1; decelerate,0.8; rotationz,0; zoom,1.3; diffusealpha,0)
	}
}

return t