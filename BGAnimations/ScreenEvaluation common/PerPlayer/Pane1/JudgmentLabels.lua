local player = ...
local pn = ToEnumShortString(player)

local mode = ""
if SL.Global.GameMode == "StomperZ" then mode = "StomperZ" end

-- tap note types
-- Iterating through the enum isn't worthwhile because the sequencing is so bizarre...
local TNSNames = {
	THEME:GetString("TapNoteScore" .. mode, "W1"),
	THEME:GetString("TapNoteScore" .. mode, "W2"),
	THEME:GetString("TapNoteScore" .. mode, "W3"),
	THEME:GetString("TapNoteScore" .. mode, "W4"),
	THEME:GetString("TapNoteScore" .. mode, "W5"),
	THEME:GetString("TapNoteScore" .. mode, "Miss")
}

local StomperZColors = {
	color("#FFFFFF"),	-- blue
	color("#FFFFFF"),	-- white
	color("#FFFFFF"),	-- gold
	color("#FFFFFF"),	-- green
	color("#FFFFFF"),	-- purple
	color("#FFFFFF")	-- red
}


local RadarCategories = {
	THEME:GetString("ScreenEvaluation", 'Holds'),
	THEME:GetString("ScreenEvaluation", 'Mines'),
	THEME:GetString("ScreenEvaluation", 'Hands'),
	THEME:GetString("ScreenEvaluation", 'Rolls')
}


local t = Def.ActorFrame{
	InitCommand=cmd(xy, 50, _screen.cy-24),
	OnCommand=function(self)
		if player == PLAYER_2 then
			self:x( self:GetX() * -1.25)
			self:y( self:GetY() * 1)
		end
	end
}


--  labels: W1 ---> Miss
for index, label in ipairs(TNSNames) do
	t[#t+1] = LoadFont("_eurostile outline")..{
		Text=label:upper(),
		InitCommand=cmd(zoom,0.403; horizalign,right ),
		BeginCommand=function(self)
			self:x( (player == PLAYER_1 and 18) or -26 )
			self:y((index-1)*28 -10)

			-- if StomperZ, color the JudgmentLabel
			if SL.Global.GameMode == "StomperZ" then
				self:diffuse( StomperZColors[index] )

			-- for all other modes, check for Decents/Way Offs
			else
				local gmods = SL.Global.ActiveModifiers

				-- if Way Offs were turned off
				if gmods.DecentsWayOffs == "Decents Only" and label == THEME:GetString("TapNoteScore", "W5") then
					self:visible(true)

				-- if both Decents and WayOffs were turned off
				--elseif gmods.DecentsWayOffs == "Off" and (label == THEME:GetString("TapNoteScore", "W4") or label == THEME:GetString("TapNoteScore", "W5")) then
				--	self:visible(false)
				end
			end

		end
	}
end

-- labels: holds, mines, hands, rolls
for index, label in ipairs(RadarCategories) do
	t[#t+1] = LoadFont("_eurostile outline")..{
		Text=label,
		InitCommand=cmd(NoStroke;zoom,0.403; horizalign,right ),
		BeginCommand=function(self)
			self:x( (player == PLAYER_1 and -155) or 95 )
			self:y((index-1)*28 + 45)
		end
	}
end

return t