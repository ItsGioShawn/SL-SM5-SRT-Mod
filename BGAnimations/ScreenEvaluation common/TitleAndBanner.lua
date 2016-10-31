local banner_directory = ThemePrefs.Get("VisualTheme")

return Def.ActorFrame{

	

	-- song/course title text
	LoadFont("_eurostile outline")..{
		InitCommand=cmd(xy,_screen.cx,121.5; zoom, 0.8),
		OnCommand=function(self)
			local songtitle = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetDisplayFullTitle()) or GAMESTATE:GetCurrentSong():GetDisplayFullTitle()

			if songtitle then
				self:settext(songtitle)
			end
		end
	}
}