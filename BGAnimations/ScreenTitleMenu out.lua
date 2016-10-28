local image = ThemePrefs.Get("VisualTheme")

local t = Def.ActorFrame{

	Def.Quad{
		InitCommand=cmd(diffuse,Color.Black; Center; FullScreen),
		OnCommand=cmd(sleep,1.0; accelerate,0.3; diffusealpha,1)
	},


	LoadActor(image.."_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetCurrentColor(); Center; rotationz,10; diffusealpha,0; zoom,0; diffusealpha,0.9; linear,0.6; rotationz,0; zoom,1.1; diffusealpha,0)
	},
	LoadActor(image.."_splode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetCurrentColor(); Center; rotationy,180; rotationz,-10; diffusealpha,0; zoom,0.2; diffusealpha,0.8; decelerate,0.6; rotationz,0; zoom,1.3; diffusealpha,0)
	},
	LoadActor(image.."_minisplode")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetCurrentColor(); Center; rotationz,10; diffusealpha,0; zoom,0; diffusealpha,1; decelerate,0.8; rotationz,0; zoom,0.9; diffusealpha,0)
	}
}

return t