local t = {}

-------- SCREENS AFTER INITIALISATION  ----------

local showPauseScreen = function (mainFunc)
    if mainFunc.ballBtnScreenCreate.pauseScreen.state == "unpaused" then
        mainFunc.ballBtnScreenCreate.pauseScreenOverlay.alpha = 0.25
        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("touch", mainFunc.dummyListener)
        if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
            timer.pause(mainFunc.levelTimerUpdateTimer)
        end
        mainFunc.globalImageCreateFunctions.createLevelTimeString(mainFunc.ballBtnScreenCreate.levelTimeSeconds, mainFunc.ballBtnScreenCreate.levelTimeMinutes, mainFunc.ballBtnScreenCreate.timeCounter, false)
    	transition.to(mainFunc.ballBtnScreenCreate.pauseScreen, {time = 100, y = 0, onComplete = function () mainFunc.ballBtnScreenCreate.pauseScreen.state = "paused" end})
    	for a = 1, mainFunc.allLevelSettings.pauseScreenObjectsGroup.numChildren do
    		transition.to(mainFunc.allLevelSettings.pauseScreenObjectsGroup[a], {time = 100, y = mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue})
    	end
    else
    	for a = 2, mainFunc.allLevelSettings.pauseScreenObjectsGroup.numChildren do
            if mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue then
    		  transition.to(mainFunc.allLevelSettings.pauseScreenObjectsGroup[a], {time = 100, y = display.contentHeight + mainFunc.allLevelSettings.pauseScreenObjectsGroup[a].yValue})
            end
    	end
    	transition.to(mainFunc.ballBtnScreenCreate.pauseScreen, {time = 100, y = display.contentHeight, onComplete = function () 
    		if mainFunc.allLevelSettings.isBallMovingState == "true"
	        and mainFunc.ballBtnScreenCreate.mapScreen.state == "mapHidden" then

		    end
		    mainFunc.allLevelSettings.shouldBallMoveState = "true"
		    mainFunc.ballBtnScreenCreate.pauseScreen.state = "unpaused"

            mainFunc.ballBtnScreenCreate.pauseScreenOverlay.alpha = 0
            mainFunc.ballBtnScreenCreate.pauseScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
            mainFunc.ballBtnScreenCreate.pauseScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)

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
