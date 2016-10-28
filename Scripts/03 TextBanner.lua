function TextBannerAfterSet(self)

	local Title = self:GetChild("Title");
	local Subtitle = self:GetChild("Subtitle");	
	
	if Subtitle:GetText() ~= "" then
		( cmd(zoom,0.55; y,-6; x, WideScale(-85, -100); maxwidth, WideScale(300,400); ))(Title);
		( cmd(zoom,0.3;  y, 6; x, WideScale(-85, -100); maxwidth, WideScale(300,400); ))(Subtitle);
	else                      
		( cmd(zoom,0.55; y, 0; x, WideScale(-85, -100); maxwidth, WideScale(300,400); ))(Title);
	end
	
end