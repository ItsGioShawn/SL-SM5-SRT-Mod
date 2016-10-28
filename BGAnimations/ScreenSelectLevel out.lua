local t = Def.ActorFrame{

	Def.Quad{
		OnCommand=cmd(sleep,0.0; accelerate,0.0; diffusealpha,0)
	},


	LoadActor("Hearts_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationz,0; diffusealpha,0; zoom,0; diffusealpha,0.9; linear,0.6; rotationz,0; zoom,1.1; diffusealpha,0)
	},
	LoadActor("Hearts_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationy,0; rotationz,0; diffusealpha,0; zoom,0.2; diffusealpha,0.8; decelerate,0.6; rotationz,0; zoom,1.3; diffusealpha,0)
	},
	LoadActor("Hearts_minisplode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.01; diffuse, GetCurrentColor(); Center; rotationz,0; diffusealpha,0; zoom,0; diffusealpha,1; decelerate,0.8; rotationz,0; zoom,0.9; diffusealpha,0)
	}
}

return t