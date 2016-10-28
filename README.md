This is a modded version of Dan Guzek's Simply Love theme for StepMania 5.0.12, this is currently a WIP. My main goal is to have a fully functional SRT theme inside of the Simply Love theme without harming any of the regular theme elements.

THINGS TO FIX/DO:

-ScreenSelectCourseLevelOne
This completely takes over the ScreenSelectCourse menu, since selecting Marathon mode (CRS Mode) will bring you to the SRT Title Screen [ScreenTestInput]. The main issue is the separate music experiment, in which selecting a different "LV" (level) will play a certain background music for whichever one is selected. So far this has worked, but the real issue is where the player changes a song via MenuLeft or MenuRight, for some reason whenever that happens; the music starts over.

-ScreenTakingABreak
This shouldn't be the hardest thing in the world to deal with, but I have run into an issue where having this screen as the "NextScreen=" will cause the game to freeze. However it does not crash it, simply holding F3 and F6 and pressing 2 will reload the screen and everything will be back to normal. It's that easy to escape the freezing, but I have yet to figure out why it does that. The ScreenTakingABreak was copied from the {ScreenTestInput].
