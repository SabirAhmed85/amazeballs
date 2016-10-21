local t = {}

-------- SCREENS AFTER INITIALISATION  ----------

local showPauseScreen = function (mainFunc)
    if mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen.state == "unpaused" then
        mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay.alpha = 0.25
        mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay:addEventListener("touch", mainFunc.dummyListener)
        if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
            timer.pause(mainFunc.levelTimerUpdateTimer)
        end
        mainFunc.globalImageCreateFunctions.createLevelTimeString(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds, mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes, mainFunc.ballAndButtonAndScreenCreateScript.timeCounter, false)
    	transition.to(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen, {time = 100, y = 0, onComplete = function () mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen.state = "paused" end})
    	for a = 1, mainFunc.allLevelSettings.pauseScreenObjectsGroup.numChildren do
    		transition.to(mainFunc.allLevelSettings.pauseScreenObjectsGroup[a], {time = 100, y = mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue})
    	end
    else
    	for a = 2, mainFunc.allLevelSettings.pauseScreenObjectsGroup.numChildren do
            if mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue then
    		  transition.to(mainFunc.allLevelSettings.pauseScreenObjectsGroup[a], {time = 100, y = display.contentHeight + mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue})
            end
    	end
    	transition.to(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen, {time = 100, y = display.contentHeight, onComplete = function () 
    		if mainFunc.allLevelSettings.isBallMovingState == "true"
	        and mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.state == "mapHidden" then

		    end
		    mainFunc.allLevelSettings.shouldBallMoveState = "true"
		    mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen.state = "unpaused"

            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay.alpha = 0
            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)

            if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
                timer.resume(mainFunc.levelTimerUpdateTimer)
            end
    	end})
        mainFunc.allLevelSettings.pauseButtonsEnabled = true
    end
end
t.showPauseScreen = showPauseScreen


--------- SCREENS USED FOR INITIALISING ----------

return t
