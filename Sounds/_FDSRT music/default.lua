if SL.Global.GameMode == "LV1" then
		audio_file = "Cafe Rain (loop).ogg"
elseif SL.Global.GameMode == "LV2" then
	 audio_file = "new gym (loop).ogg"
elseif SL.Global.GameMode == "LV3" then
	 audio_file = "hospital (loop).ogg"
elseif SL.Global.GameMode == "LV4" then
	 audio_file = "master hand (loop).ogg"
	end

return THEME:GetPathS("", "_FDSRT music/" .. audio_file)

--Music starts over whenever the player chooses a different course in the ScreenSelectCourse menu (via MenuLeft/MenuRight)
--However, specific mode plays specific music and it works fine expcept the changing courses.