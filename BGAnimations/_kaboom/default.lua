local file = THEME:GetPathB("", "_kaboom/" .. ThemePrefs.Get("VisualTheme") .. ".png")

-- this variable will be used within the scope of this file like (index+1) and (index-1)
-- to continue to diffuse each sprite as we shift through the colors available in SL.Colors
local index = SL.Global.ActiveColorIndex

-- time in seconds for the first NewColor (which is triggered from AF's InitCommand)
-- should be 0 so that children sprites get colored properly immediately; we'll
-- change this variable in the AF's OnCommand so that color-shifts tween appropriately
local delay = 0

local af = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():Center():diffuse( ThemePrefs.Get("RainbowMode") and Color.White or Color.Black ) end,
		BackgroundImageChangedMessageCommand=function(self)
			THEME:ReloadMetrics()
			SL.Global.ActiveColorIndex = 3
			self:linear(1):diffuse( ThemePrefs.Get("RainbowMode") and Color.White or Color.Black )
		end,
	}
}

-- --------------------------------------------------------
-- non-RainbowMode (normal) background

local file_info = {
	ColorRGB = {0,0,0,0,0,0,0,0,0,0},
	diffusealpha = {0.05,0.2,0.1,0.1,0.1,0.1,0.1,0.05,0.1,0.1},
	xy = {0,100,240,520,800,1000,1560,2400,3480,4560},
	texcoordvelocity = {{0,0.1},{0,0.05},{0,0.2},{0.0,0.03},{0,0.05},{0.0,0.1},{0,0.25},{0,0.04},{0,0.5},{0,0.2}}
}

local t = Def.ActorFrame {
	InitCommand=function(self)
		if ThemePrefs.Get("RainbowMode") then
			self:visible(false)
		else
			self:diffusealpha(0)
		end
	end,
	OnCommand=cmd(accelerate,0.8; diffusealpha,1),
	BackgroundImageChangedMessageCommand=function(self)
		if not ThemePrefs.Get("RainbowMode") then
			self:visible(true):linear(0.6):diffusealpha(1)
		else
			self:linear(0.6):diffusealpha(0):queuecommand("Hide")
		end
	end,
	HideCommand=function(self) self:visible(false) end,
}



for i=1,10 do
	t[#t+1] = Def.Sprite {
		Texture=file,
		InitCommand=cmd(diffuse, ColorRGB( file_info.ColorRGB[i] ) ),
		ColorSelectedMessageCommand=cmd(linear, 0.5; diffuse, ColorRGB( file_info.ColorRGB[i] ); diffusealpha, file_info.diffusealpha[i] ),
		OnCommand=cmd(zoom,1.3; xy, file_info.xy[i], file_info.xy[i]; customtexturerect,0,0,1,1;
			texcoordvelocity, file_info.texcoordvelocity[i][1], file_info.texcoordvelocity[i][2]; diffusealpha, file_info.diffusealpha[i] ),
			BackgroundImageChangedMessageCommand=function(self)
			local new_file = THEME:GetPathB("", "_kaboom/" .. ThemePrefs.Get("VisualTheme") .. ".png")
			self:Load(new_file)
		end
	}
end

af[#af+1] = t

-- --------------------------------------------------------
-- RainbowMode background

af[#af+1] = Def.ActorFrame{
	InitCommand=function(self)
		if not ThemePrefs.Get("RainbowMode") then
			self:visible(false)
		end
	end,
	OnCommand=cmd(Center; bob; effectmagnitude,0,50,0; effectperiod,8),
	BackgroundImageChangedMessageCommand=function(self)
		if ThemePrefs.Get("RainbowMode") then
			self:visible(true):linear(0.6):diffusealpha(1)
		else
			self:linear(0.6):diffusealpha(0):queuecommand("Hide")
		end
	end,
	HideCommand=function(self) self:visible(false) end,


	Def.ActorFrame{
		OnCommand=cmd(bob; effectmagnitude,0,0,50; effectperiod,12),

		Def.ActorFrame{
			InitCommand=cmd(diffusealpha,0; queuecommand, "Appear"),
			OnCommand=function(self)
				delay = 0.7
			end,

			AppearCommand=cmd(linear,1; diffusealpha, 1; queuecommand, "Loop"),
			-- OffCommand=cmd(linear,1; diffusealpha,0),

			LoopCommand=function(self)
				self:sleep(delay)
				self:queuecommand('Loop')
			end,

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom,1.3; x,000; y,-000; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,100; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,400; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,200; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,00; y,300; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-0; y,350; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,150; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,500; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,00; y,800; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-0; y,250; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,50; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,450; z,-000),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,30; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-0; y,90; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,880; z,-000),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,000; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,00; y,20; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-0; y,555; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,666; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,420; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,00; y,320; z,-0),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,170; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,0; y,70; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,-00; y,700; z,-00),
				
			},

			Def.Sprite{
				Texture=file,
				InitCommand=cmd(zoom, 1.3; x,00; y,600; z,-00),
				
			}
		}
	}
}

return af