local player = Var "Player"

if SL[ToEnumShortString(player)].ActiveModifiers.HideCombo then
	return Def.Actor{}

else

	local kids, PreviousComboType

	local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt")
	local NumberMinZoom = 0.75
	local NumberMaxZoom = 0.89
	local NumberMaxZoomAt = tonumber(THEME:GetMetric("Combo", "NumberMaxZoomAt"))

	return Def.ActorFrame {

		InitCommand=function(self)
			self:draworder(101)
			kids = self:GetChildren()
		end,


		ComboCommand=function(self, param)
			local CurrentCombo = param.Misses or param.Combo

			if not CurrentCombo or CurrentCombo < ShowComboAt then
				-- the combo isn't high enough to display, so hide the AF
				self:visible( false )
				return
			end

			-- the combo has reached (or surpassed) the threshold to be shown
			if CurrentCombo >= ShowComboAt then
				-- so, display the AF
				self:visible( true )
			end

			if (param.misses and PreviousComboType == "Combo") or (param.combo and PreviousComboType == "Misses") then
				if param.Combo then

					kids.Label:settext( "Combo" )

				elseif param.Misses then

					kids.Label:settext( "Misses" )
					kids.Number:stopeffect()
				end
				PreviousComboType = (param.misses and "Misses") or "Combo"
			end

			if CurrentCombo <= NumberMaxZoomAt then
				kids.Number:zoom( scale( CurrentCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom ) )
			end
			kids.Number:settext( CurrentCombo )

			if param.FullComboW1 then
				-- extreme combo
				kids.Number:playcommand("ChangeColor", {Color1="#00ff00", Color2="#ff4c00"})

			elseif param.FullComboW2 then
				-- cyan combo
				kids.Number:playcommand("ChangeColor", {Color1="#00c1c3", Color2="#00fcff"})

			elseif param.FullComboW3 then
				-- gold combo
				kids.Number:playcommand("ChangeColor", {Color1="#f6cf00", Color2="#f6ff00"})

			elseif param.Combo then
				-- normal (pink) combo
				kids.Number:playcommand("ChangeColor", {Color1="#ffc4ff", Color2="#ff63ff"})

			else
				-- miss (red) combo
				kids.Number:playcommand("ChangeColor", {Color1="#790000", Color2="#ff0000"})
			end
		end,

		-- load the milestones actors now and trigger them to display
		-- when then appropriate Milestone command is received from the engine
	 	LoadActor( THEME:GetPathG("Combo","100Milestone") )..{
			Name="OneHundredMilestone",
			HundredMilestoneCommand=cmd(queuecommand, "Milestone")
		},

	 	LoadActor( THEME:GetPathG("Combo","1000Milestone") )..{
			Name="OneThousandMilestone",
			ThousandMilestoneCommand=cmd(queuecommand, "Milestone")
		},


		LoadFont("_wendy monospace numbers")..{
			Name="Number",
			OnCommand=cmd(shadowlength,1; vertalign,middle ),
			ChangeColorCommand=function(self, params)
				self:diffuseshift():effectperiod(0.8)
				self:effectcolor1( color(params.Color1) )
				self:effectcolor2( color(params.Color2) )
			end
		},

		LoadFont("_wendy small")..{
			Name="Label",
			InitCommand=cmd(zoom,0.85 ),
			OnCommand=cmd(xy,0,0; shadowlength,1; vertalign,top )
		}
	}
end