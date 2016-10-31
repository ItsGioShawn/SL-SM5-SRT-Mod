return Def.ActorFrame{
	
	Def.Quad{ OnCommand=cmd(sleep,1000;visible,false), },
	
	--LoadActor("../Sweet Rain-bg.png")..{ OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;), },
	
	Def.ActorFrame{ OnCommand=function(self) self:visible(true); space_bg = self end, ShowCommand=cmd(visible,true;), HideCommand=cmd(visible,false;),
		LoadActor("sky.png")..{ OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5;), },
		LoadActor("back.png")..{ OnCommand=cmd(zoom,4;blend,Blend.Add;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;
		customtexturerect,4,4,0,0;texcoordvelocity,0,-0.08;),},		
		
	},
	
	
}