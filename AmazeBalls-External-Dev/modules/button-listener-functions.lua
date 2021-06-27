local composer = require("composer")
local widget = require("widget")
widget.setTheme ( "widget_theme_ios" )
local t = {}
t.hookshotTransition = {}

--------- MAP DIRECTION BUTTONS-----------

-- local addBackButtonFunctionality = function (event)
--     mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1

--     mainFunc.allLevelSettings.pauseButtonsEnabled = true
-- end
--     t.addBackButtonFunctionality = addBackButtonFunctionality

local removeItemBagScreenEventListeners = function (mainFunc, levelVariables)
    --[[
    mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.buyMoreButton:removeEventListener("tap", levelVariables.openIAP)
    for a = 1, #mainFunc.allLevelSettings.showingToolsArray do
        mainFunc.allLevelSettings.showingToolsArray[a]:removeEventListener("tap", mainFunc.listener)
    end
    for key, val in pairs(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile) do
        if key == "dummyBall"
        or key == "superBall" then
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile[key]:removeEventListener("tap", mainFunc.listener)
        else
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile[key]:removeEventListener("tap", mainFunc.changeToolInnerScreen)
        end
    end
    ]]
end
    t.removeItemBagScreenEventListeners = removeItemBagScreenEventListeners

local addBackItemBagScreenEventListeners = function (mainFunc, levelVariables)
    --[[
    mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.buyMoreButton:addEventListener("tap", levelVariables.openIAP)
    for a = 1, #mainFunc.allLevelSettings.showingToolsArray do
        mainFunc.allLevelSettings.showingToolsArray[a]:addEventListener("tap", mainFunc.listener)
    end
    for key, val in pairs(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile) do
        if key == "dummyBall"
        or key == "superBall" then
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile[key]:addEventListener("tap", mainFunc.listener)
        else
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.tile[key]:addEventListener("tap", mainFunc.changeToolInnerScreen)
        end
    end
    ]]
end
    t.addBackItemBagScreenEventListeners = addBackItemBagScreenEventListeners

local removePauseScreenEventListeners = function (mainFunc, levelVariables)
--[[
    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:removeEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:removeEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:removeEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton:removeEventListener("tap", levelVariables.openIAP)
    mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton:removeEventListener("tap", levelVariables.openIAP)
    ]]
end
    t.removePauseScreenEventListeners = removePauseScreenEventListeners

local addBackPauseScreenEventListeners = function (mainFunc, levelVariables)
--[[
    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:addEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:addEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:addEventListener("touch", mainFunc.buttonListener)
    mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton:addEventListener("tap", levelVariables.openIAP)
    mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton:addEventListener("tap", levelVariables.openIAP)
    ]]
end
    t.addBackPauseScreenEventListeners = addBackPauseScreenEventListeners

local removeShapeListenersForPause = function (mainFunc, shapeArray, shapeArrayParameters)
    --[[
    if mainFunc.allLevelSettings.shouldBallMoveCounter == 0 then
        for c=1, #shapeArray do
            if shapeArrayParameters[c]["type"] == "manualFan" 
            or shapeArrayParameters[c]["type"] == "spitter" 
            or shapeArrayParameters[c]["type"] == "simple"
            or shapeArrayParameters[c]["type"] == "characterChangePoint" then
                shapeArray[c]:removeEventListener( "touch", mainFunc.listener )
                mainFunc.deactivateObjectsForPlay(mainFunc, shapeArray, c)
                if shapeArrayParameters[c]["type"] == "characterChangePoint" then
                    shapeArray[c]:removeEventListener("touch", mainFunc.listener)
                end
            end  
            for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
                if mainFunc.allLevelSettings.transitionArrayIndex[d][1][1] == shapeArrayParameters[c]["name"] then
                    shapeArray[c]:removeEventListener("touch", mainFunc.listener)
                end
            end
        end
    end
    ]]
end
    t.removeShapeListenersForPause = removeShapeListenersForPause

local removeEventListenersForPause = function (mainFunc, shapeArray, shapeArrayParameters)
    if mainFunc.thisLevelSettings.currentArrowTimer and mainFunc.thisLevelSettings.currentArrowTimer ~= nil then
        timer.pause(mainFunc.thisLevelSettings.currentArrowTimer)
    end
    if mainFunc.thisLevelSettings.currentArrowTimer2 and mainFunc.thisLevelSettings.currentArrowTimer2 ~= nil then
        timer.pause(mainFunc.thisLevelSettings.currentArrowTimer2)
    end

    for a = 1, #shapeArray do
        if shapeArray[a].triangleDummy then
            if shapeArray[a].triangleDummy.fadeTransition and shapeArray[a].triangleDummy.fadeTransition ~= nil then
                transition.pause(shapeArray[a].triangleDummy.fadeTransition)
            end
        end
        if shapeArray[a].isAutoSlideObject then
            if #shapeArray[a].autoSlideTransition > 0 then
                for z = 1, #shapeArray[a].autoSlideTransition do
                    transition.pause(shapeArray[a].autoSlideTransition[z])
                end
            end
            if #shapeArray[a].autoSlideTimer > 0 then
                for z = 1, #shapeArray[a].autoSlideTimer do
                    timer.pause(shapeArray[a].autoSlideTimer[z])
                end
            end
        end
    end

    if mainFunc.allLevelSettings.shouldBallMoveCounter == 0 then
        mainFunc.allLevelSettings.shouldBallMoveState = "false" 
        mainFunc.thisLevelSettings.bombsCanExplode = false

        if (mainFunc.allLevelSettings.isBallMovingState == "true") then
            mainFunc.tm["ball"][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:pauseAll()
        end
        if (mainFunc.allLevelSettings.bulletHasFired == true) then
            for a = 1, #shapeArrayParameters do
                if shapeArrayParameters[a]["type"] == "gun" then
                    timer.pause(shapeArray[a].createBulletTimer)
                end
            end
            if #mainFunc.tm["bullet"] > 0 then
                for a = 1, #mainFunc.tm["bullet"] do
                    if (mainFunc.tm["bullet"][a]
                    and mainFunc.tm["bullet"][a] ~= nil) then
                        mainFunc.tm["bullet"][a]:pauseAll()
                    end
                end
            end
            if #mainFunc.allLevelSettings.bullet > 0 then
                for a = 1, #mainFunc.allLevelSettings.bullet do
                    if mainFunc.allLevelSettings.bullet[a].readyToCollideTimer
                    and mainFunc.allLevelSettings.bullet[a].readyToCollideTimer ~= nil
                    and mainFunc.allLevelSettings.bullet[a].readyToCollideTimer.paused == false then
                        mainFunc.allLevelSettings.bullet[a].readyToCollideTimer.paused = true
                        timer.pause(mainFunc.allLevelSettings.bullet[a].readyToCollideTimer)
                    end
                end
            end
        end
        if #mainFunc.thisLevelSettings.bombArray > 0 then
            for a =1, #mainFunc.thisLevelSettings.bombArray do
                if (mainFunc.thisLevelSettings.bombArray[a] ~= nil) then
                    if mainFunc.thisLevelSettings.bombArray[a].timer
                    and mainFunc.thisLevelSettings.bombArray[a].timer ~= nil then
                        timer.pause(mainFunc.thisLevelSettings.bombArray[a].timer)
                    elseif mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer
                    and mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer ~= nil then
                        timer.pause(mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer)
                    end

                    if #mainFunc.thisLevelSettings.bombArray[a].explosions > 0 then
                        for b =1, #mainFunc.thisLevelSettings.bombArray[a].explosions do
                            --squarePopulatorTimer
                            mainFunc.thisLevelSettings.bombArray[a].explosions[b]:pause()
                            if mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition 
                            and mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition ~= nil then
                                timer.pause(mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition)
                            end
                            if mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject 
                            and mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject ~= nil then
                                transition.pause(mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject)
                            end
                            if mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition 
                            and mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition ~= nil then
                                timer.pause(mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition)
                            end
                            if mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject 
                            and mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject ~= nil then
                                transition.pause(mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject)
                            end
                        end
                    end
                    if mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer and mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer ~= nil then
                        timer.pause(mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer)
                    end
                end
            end
        end

        for key, val in pairs(mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray) do
            if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[key].active == true) then
                timer.pause(mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[key].timer)
            end
        end

        if mainFunc.allLevelSettings.pauseButtonsEnabled == true then
            Runtime:removeEventListener( "enterFrame", mainFunc.autoFanTransition)
        end
        if mainFunc.allLevelSettings.stillTransitioningCounter == 1 then
            Runtime:removeEventListener( "enterFrame", mainFunc.transitionMoveSomething)
        end
        
    end
end
    t.removeEventListenersForPause = removeEventListenersForPause

local removeItemButtonListenersForItemGained = function (mainFunc)
    script = mainFunc.ballAndButtonAndScreenCreateScript

    if mainFunc.thisLevelSettings.itemBagButtonsVisible then
        script.itemBtn.alpha = 0.3
        script.itemBagBtn.alpha = 0.3
        script.itemBtn:removeEventListener("tap", mainFunc.buttonListener)
        script.itemBagBtn:removeEventListener("tap", mainFunc.buttonListener)
    end
end
    t.removeItemButtonListenersForItemGained = removeItemButtonListenersForItemGained

local removeButtonListenersForItemGained = function (mainFunc)
    script = mainFunc.ballAndButtonAndScreenCreateScript

    script.randomBtn.alpha = 0.3
    if mainFunc.thisLevelSettings.mapObtained == true then
        script.playBtn.alpha = 0.3
    end

    script.randomBtn:removeEventListener("tap", mainFunc.buttonListener)
    script.playBtn:removeEventListener("tap", mainFunc.buttonListener)
end
    t.removeButtonListenersForItemGained = removeButtonListenersForItemGained

local addBackShapeListenersForPause = function (mainFunc, shapeArray, shapeArrayParameters)
--[[
    if (mainFunc.allLevelSettings.shouldBallMoveCounter == 0) then
        for c=1, #shapeArray do
            if shapeArrayParameters[c]["type"] == "manualFan" 
            or shapeArrayParameters[c]["type"] == "spitter" 
            or shapeArrayParameters[c]["type"] == "simple"
            or shapeArrayParameters[c]["type"] == "characterChangePoint" then
                mainFunc.activateObjectsForPlay(mainFunc, shapeArray, c)
                if shapeArrayParameters[c]["type"] == "characterChangePoint" then
                    shapeArray[c]:addEventListener("touch", mainFunc.listener)
                end
            end
            
            for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
                if mainFunc.allLevelSettings.transitionArrayIndex[d][1][1] == shapeArrayParameters[c]["name"] then
                    shapeArray[c]:addEventListener("touch", mainFunc.listener)
                end
            end
            if mainFunc.thisLevelSettings.fullMapObtained == true then
                if (shapeArrayParameters[c]["name"] == "mystery-block") then
                    shapeArray[c]:addEventListener("tap", mainFunc.mysteryBlockTouch)
                end
            end
        end
    end
    ]]
end
    t.addBackShapeListenersForPause = addBackShapeListenersForPause

local addBackEventListenersForPause = function (mainFunc, shapeArray, shapeArrayParameters)
    if mainFunc.thisLevelSettings.currentArrowTimer and mainFunc.thisLevelSettings.currentArrowTimer ~= nil then
        timer.resume(mainFunc.thisLevelSettings.currentArrowTimer)
    end
    if mainFunc.thisLevelSettings.currentArrowTimer2 and mainFunc.thisLevelSettings.currentArrowTimer2 ~= nil then
        timer.resume(mainFunc.thisLevelSettings.currentArrowTimer2)
    end

    for a = 1, #shapeArray do
        if shapeArray[a].triangleDummy then
            if shapeArray[a].triangleDummy.fadeTransition and shapeArray[a].triangleDummy.fadeTransition ~= nil then
                transition.resume(shapeArray[a].triangleDummy.fadeTransition)
            end
        end
        if shapeArray[a].isAutoSlideObject then
            if #shapeArray[a].autoSlideTransition > 0 then
                for z = 1, #shapeArray[a].autoSlideTransition do
                    transition.resume(shapeArray[a].autoSlideTransition[z])
                end
            end
            if #shapeArray[a].autoSlideTimer > 0 then
                for z = 1, #shapeArray[a].autoSlideTimer do
                    timer.resume(shapeArray[a].autoSlideTimer[z])
                end
            end
        end
    end

    if (mainFunc.allLevelSettings.shouldBallMoveCounter == 0) then
        mainFunc.allLevelSettings.isScreenPausedState = false
        mainFunc.thisLevelSettings.bombsCanExplode = true

        if (mainFunc.allLevelSettings.isBallMovingState == "true") then
            if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.isWaitingForMovement
            and mainFunc.ballAndButtonAndScreenCreateScript.instance2.isWaitingForMovement == true) then
                mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballAndButtonAndScreenCreateScript.instance2, mainFunc)
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.isWaitingForMovement = false
            else 
                mainFunc.tm["ball"][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:resumeAll()
            end
        end

        if (mainFunc.allLevelSettings.bulletHasFired == true) then
            -- STILL HAVE TO ADD CLAUSE TO CHECK WHETHER IT WAS IN THIS BALL SCREEN
            for a = 1, #shapeArrayParameters do
                if shapeArrayParameters[a]["type"] == "gun" then
                    timer.resume(shapeArray[a].createBulletTimer)
                end
            end
            if #mainFunc.tm["bullet"] > 0 then
                for a = 1, #mainFunc.tm["bullet"] do
                    if (mainFunc.tm["bullet"][a]
                    and mainFunc.tm["bullet"][a] ~= nil) then
                        mainFunc.tm["bullet"][a]:resumeAll()
                    end
                end
            end

            if #mainFunc.allLevelSettings.bullet > 0 then
                for a = 1, #mainFunc.allLevelSettings.bullet do
                    if (mainFunc.allLevelSettings.bullet[a].isWaitingForMovement 
                    and mainFunc.allLevelSettings.bullet[a].isWaitingForMovement == true) then
                        mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.allLevelSettings.bullet[a], mainFunc)
                        mainFunc.allLevelSettings.bullet[a].isWaitingForMovement = false
                    end

                    if mainFunc.allLevelSettings.bullet[a].readyToCollideTimer
                    and mainFunc.allLevelSettings.bullet[a].readyToCollideTimer ~= nil
                    and mainFunc.allLevelSettings.bullet[a].readyToCollideTimer.paused == true then
                        mainFunc.allLevelSettings.bullet[a].readyToCollideTimer.paused = false
                        timer.pause(mainFunc.allLevelSettings.bullet[a].readyToCollideTimer)
                    end
                end
            end
        end

        if #mainFunc.thisLevelSettings.bombArray > 0 then
            for a =1, #mainFunc.thisLevelSettings.bombArray do
                if (mainFunc.thisLevelSettings.bombArray[a] ~= nil) then
                    if mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer and mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer ~= nil then
                        timer.resume(mainFunc.thisLevelSettings.bombArray[a].finalRemoveBombTimer)
                    end
                    if mainFunc.thisLevelSettings.bombArray[a].timer
                    and mainFunc.thisLevelSettings.bombArray[a].timer ~= nil then
                        timer.resume(mainFunc.thisLevelSettings.bombArray[a].timer)
                    elseif mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer
                    and mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer ~= nil then
                        timer.resume(mainFunc.thisLevelSettings.bombArray[a].squarePopulatorTimer)
                    end

                    if #mainFunc.thisLevelSettings.bombArray[a].explosions > 0 then
                        for b =1, #mainFunc.thisLevelSettings.bombArray[a].explosions do
                            --squarePopulatorTimer
                            if mainFunc.thisLevelSettings.bombArray[a].explosions[b] ~= nil then
                                mainFunc.thisLevelSettings.bombArray[a].explosions[b]:play()
                                if mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition 
                                and mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition ~= nil then
                                    timer.resume(mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransition)
                                end
                                if mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject 
                                and mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject ~= nil then
                                    transition.resume(mainFunc.thisLevelSettings.bombArray[a].explosions[b].rotateTransitionObject)
                                end

                                if mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition 
                                and mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition ~= nil then
                                    timer.resume(mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransition)
                                end
                                if mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject 
                                and mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject ~= nil then
                                    transition.resume(mainFunc.thisLevelSettings.bombArray[a].explosions[b].fadeTransitionObject)
                                end
                                if mainFunc.thisLevelSettings.bombArray[a].squarePopulatorParams ~= nil and #mainFunc.thisLevelSettings.bombArray[a].squarePopulatorParams > 0 then
                                    local params = mainFunc.thisLevelSettings.bombArray[a].squarePopulatorParams
                                    for c = 1, #thisBomb.props["properties"]["directions"] do
                                        if thisBomb.props["properties"]["directions"][c] == "up" then
                                            mainFunc.objectFunctionsScript.squarePopulator("vert", -1, -2, c, mainFunc, shapeArray, shapeArrayParameters, params[8], params[9], params[10])
                                        elseif thisBomb.props["properties"]["directions"][c] == "down" then
                                            mainFunc.objectFunctionsScript.squarePopulator("vert", 1, 0, c, mainFunc, shapeArray, shapeArrayParameters, params[8], params[9], params[10])
                                            
                                        elseif thisBomb.props["properties"]["directions"][c] == "right" then
                                            mainFunc.objectFunctionsScript.squarePopulator("horz", 1, 0, c, mainFunc, shapeArray, shapeArrayParameters, params[8], params[9], params[10])
                                            
                                        elseif thisBomb.props["properties"]["directions"][c] == "left" then
                                            mainFunc.objectFunctionsScript.squarePopulator("horz", -1, -2, c, mainFunc, shapeArray, shapeArrayParameters, params[8], params[9], params[10])
                                            
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        for key, val in pairs(mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray) do
            if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[key].active == true) then
                timer.resume(mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[key].timer)
            end
        end


        if mainFunc.allLevelSettings.pauseButtonsEnabled == true then
            Runtime:addEventListener( "enterFrame", mainFunc.autoFanTransitionListener)
        end
        if mainFunc.allLevelSettings.stillTransitioningCounter == 1 then
            Runtime:addEventListener( "enterFrame", mainFunc.transitionMoveSomething)
        end

        mainFunc.allLevelSettings.shouldBallMoveState = "true"
    end
end
    t.addBackEventListenersForPause = addBackEventListenersForPause

local addBackItemButtonListenersForItemGained = function (mainFunc)
    script = mainFunc.ballAndButtonAndScreenCreateScript
    if mainFunc.thisLevelSettings.itemBagButtonsVisible then
        script.itemBtn.alpha = 1
        script.itemBagBtn.alpha = 1
        script.itemBtn:addEventListener("tap", mainFunc.buttonListener)
        script.itemBagBtn:addEventListener("tap", mainFunc.buttonListener)
    end
end
    t.addBackItemButtonListenersForItemGained = addBackItemButtonListenersForItemGained

local addBackButtonListenersForItemGained = function (mainFunc)
    script = mainFunc.ballAndButtonAndScreenCreateScript

    script.randomBtn.alpha = 1
    if mainFunc.thisLevelSettings.mapObtained == true then
        transition.to(script.playBtn, {alpha = 1, time = 300})
    end

    script.randomBtn:addEventListener("tap", mainFunc.buttonListener)
    script.playBtn:addEventListener("tap", mainFunc.buttonListener)
end
    t.addBackButtonListenersForItemGained = addBackButtonListenersForItemGained

local prepareMapButtonResponse = function (thisScreenRelevantValue, otherScreenRelevantValue, lessThanThreshold, moreThanThreshold, screenRelevantValueDifference, mainScreenChangeSpeedMultiple, screenChangeDirection, mainFunc)
    if thisScreenRelevantValue < lessThanThreshold
    and thisScreenRelevantValue > moreThanThreshold then
        mainFunc.screenChangingScript.changeToRightScreen(mainFunc, shapeArray, shapeArrayParameters, "manual", screenChangeDirection)

    end
end
	t.prepareMapButtonResponse = prepareMapButtonResponse
	
local mapButtonFunctionArray = {
    mapUpButton = function (mainFunc) prepareMapButtonResponse(mainFunc.thisLevelSettings.thisScreenVertValue, mainFunc.thisLevelSettings.thisScreenHorzValue, mainFunc.thisLevelSettings.screenVertTotal + 1,   1, -1,  1, "up", mainFunc) end,
    mapRightButton = function (mainFunc) prepareMapButtonResponse(mainFunc.thisLevelSettings.thisScreenHorzValue,  mainFunc.thisLevelSettings.thisScreenVertValue, mainFunc.thisLevelSettings.screenHorzTotal,    0,  1,  1, "right", mainFunc) end,
    mapDownButton = function (mainFunc) prepareMapButtonResponse(mainFunc.thisLevelSettings.thisScreenVertValue, mainFunc.thisLevelSettings.thisScreenHorzValue, mainFunc.thisLevelSettings.screenVertTotal,     0,  1,  1, "down", mainFunc) end,
    mapLeftButton = function (mainFunc) prepareMapButtonResponse(mainFunc.thisLevelSettings.thisScreenHorzValue, mainFunc.thisLevelSettings.thisScreenVertValue, mainFunc.thisLevelSettings.screenHorzTotal + 1, 0, -1, -1, "left", mainFunc) end
}
    t.mapButtonFunctionArray = mapButtonFunctionArray


local buttonListenerBeganFunctionArray = {
    play = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.beganPlayPressedFunction(mainFunc, shapeArray, shapeArrayParameters) end,
    map = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.mapButtonPressedFunction(mainFunc, shapeArray, shapeArrayParameters) end,
    random = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.pauseButtonPressedFunction(mainFunc, shapeArray, shapeArrayParameters, levelVariables) end,
    backToPlay = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.backToPlayButtonPressedFunction(mainFunc, shapeArray, shapeArrayParameters, levelVariables) end,
    reset = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.resetButtonPressedFunction(mainFunc) end,
    backToMain = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.backToMainButtonPressedFunction(composer, mainFunc) end,
    item = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.buttonListenerScript.itemBtnFunction(mainFunc, shapeArray, shapeArrayParameters) end,
    itemBag = function (mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables) mainFunc.globalFunctions.globalOpenItemBagFunction(mainFunc, shapeArray, shapeArrayParameters, levelVariables, "inGame", mainFunc.ballAndButtonAndScreenCreateScript) end
}
    t.buttonListenerBeganFunctionArray = buttonListenerBeganFunctionArray

local beganPlayPressedFunction = function (mainFunc, shapeArray, shapeArrayParameters)

    if mainFunc.thisLevelSettings.thisScreenHorzValue == mainFunc.allLevelSettings.ballScreenHorzValue and mainFunc.thisLevelSettings.thisScreenVertValue == mainFunc.allLevelSettings.ballScreenVertValue then
		if mainFunc.allLevelSettings.pressCount == 0 then

		    mainFunc.allLevelSettings.pressCount = 1
		    if mainFunc.allLevelSettings.moveSomethingCounter == 0 then
			--Runtime:addEventListener( "enterFrame", moveSomething )
                mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballAndButtonAndScreenCreateScript.instance2, mainFunc)
                --Runtime:addEventListener( "enterFrame", edgesTransitions )
                transition.to(mainFunc.ballAndButtonAndScreenCreateScript.backBtn, {alpha = 0, time = 200})

            end
                    
            Runtime:addEventListener( "enterFrame", mainFunc.doorTransition )
            Runtime:addEventListener( "enterFrame", mainFunc.tunnelTransitionListener )
            Runtime:addEventListener( "enterFrame", mainFunc.autoFanTransitionListener )

            if mainFunc.allLevelSettings.levelFirstStarted == 0 then
                mainFunc.allLevelSettings.levelFirstStarted = 1
                mainFunc.projectileMovementRemoveAndRespawnScript.bulletFire(mainFunc, shapeArray, shapeArrayParameters)
            end

            mainFunc.allLevelSettings.isBallMovingState = "true"
            mainFunc.allLevelSettings.shouldBallMoveState = "true"

            if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
                if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onGoPress"] then
                    mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onGoPress"](mainFunc, shapeArray)
                end
            end
		else

	        if mainFunc.allLevelSettings.ballActivateButtonSet == false then
	            mainFunc.allLevelSettings.ballActivateButtonSet = true
	        end
		end
	end


end
	t.beganPlayPressedFunction = beganPlayPressedFunction

local movedPlayPressedFunction = function (event, mainFunc, shapeArray)
        
    --event.target.isFocus = true
    display.getCurrentStage():setFocus( event.target , event.target.name )
    
    if event.x > event.target.x + (event.target.contentWidth/2 - 10)
    or event.y < event.target.y - (event.target.contentHeight/2 - 10) then
        if mainFunc.allLevelSettings.ballActivateButtonSet == true then
            mainFunc.allLevelSettings.ballActivateButtonSet = false
            for a = 1, #shapeArray do
                if shapeArray[a].objectType == "manualFan"
                and shapeArray[a].sequence ==  "on" then
                    shapeArray[a]:setSequence("off")
                end
            end
        end
    elseif event.x < event.target.x + event.target.contentWidth/2
    and event.y > event.target.y - event.target.contentHeight/2 then
        if mainFunc.allLevelSettings.ballActivateButtonSet == false then
            mainFunc.allLevelSettings.ballActivateButtonSet = true
        end
    end

end
	t.movedPlayPressedFunction = movedPlayPressedFunction

local endedPlayPressedFunction = function (mainFunc, shapeArray)

    if mainFunc.allLevelSettings.ballActivateButtonSet == true then
        for a = 1, #shapeArray do
            if shapeArray[a].objectType == "manualFan"
            and shapeArray[a].sequence ==  "on" then
                shapeArray[a]:setSequence("off")
            end
        end
        mainFunc.allLevelSettings.ballActivateButtonSet = false
        --event.target.isFocus = false
        display.getCurrentStage():setFocus( nil )
    end
end
	t.endedPlayPressedFunction = endedPlayPressedFunction

local mapButtonPressedFunction = function (mainFunc, shapeArray, shapeArrayParameters)

	if mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.state == "mapHidden"
    and mainFunc.allLevelSettings.mapShowCounter == 0
    and mainFunc.allLevelSettings.pauseButtonsEnabled == true then
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.alpha = 0.05
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen:addEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen:addEventListener("touch", mainFunc.dummyListener)
        mainFunc.allLevelSettings.ballActivateButtonSet = false
        mainFunc.allLevelSettings.isScreenPausedState = true
        display.getCurrentStage():setFocus( nil )
        mainFunc.allLevelSettings.mapShowCounter = 1
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.state = "mapShowing"
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapScreen, {alpha=0.11, time=150})
        --something to show maps and compass

        mainFunc.ballAndButtonAndScreenCreateScript.playBtn:toFront()
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel, {alpha=1, time=150})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.map, {alpha=1, time=150})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.compass, {alpha=1, time=150})

        removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter + 1
        
        mainFunc.ballAndButtonAndScreenCreateScript.playBtn:setSequence("over")
        
        if mainFunc.thisLevelSettings.compassObtained == false then
            removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        end
        
        mainFunc.screenChangingScript.mapButtonStateCheck(mainFunc)

        if mainFunc.thisLevelSettings.itemBagButtonsVisible then
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.alpha = 0.3
            if (mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img
            and mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img ~= nil) then
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img.alpha = 0.3
            end
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:removeEventListener("tap", mainFunc.buttonListener)

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn.alpha = 0.3
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn:removeEventListener("tap", mainFunc.buttonListener)
        end
        
        mainFunc.ballAndButtonAndScreenCreateScript.rightBtn:addEventListener("tap", mainFunc.mapButtonListener)
        mainFunc.ballAndButtonAndScreenCreateScript.leftBtn:addEventListener("tap", mainFunc.mapButtonListener)
        mainFunc.ballAndButtonAndScreenCreateScript.downBtn:addEventListener("tap", mainFunc.mapButtonListener)
        mainFunc.ballAndButtonAndScreenCreateScript.upBtn:addEventListener("tap", mainFunc.mapButtonListener)
        mainFunc.allLevelSettings.mapShowCounter = 1
    elseif mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.state == "mapShowing"
    and mainFunc.allLevelSettings.mapShowCounter == 1 then
        
        mainFunc.ballAndButtonAndScreenCreateScript.rightBtn:removeEventListener("tap", mainFunc.mapButtonListener )
        mainFunc.ballAndButtonAndScreenCreateScript.leftBtn:removeEventListener("tap", mainFunc.mapButtonListener )
        mainFunc.ballAndButtonAndScreenCreateScript.upBtn:removeEventListener("tap", mainFunc.mapButtonListener )
        mainFunc.ballAndButtonAndScreenCreateScript.downBtn:removeEventListener("tap", mainFunc.mapButtonListener )
        
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.rightBtn, {alpha=0, time=200})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.leftBtn, {alpha=0, time=200})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.upBtn, {alpha=0, time=200})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.downBtn, {alpha=0, time=200})


        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.map, {alpha=0, time=150})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.compass, {alpha=0, time=150})
        transition.to (mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel, {alpha=0, time=150})

        if mainFunc.thisLevelSettings.itemBagButtonsVisible then
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.alpha = 1
            if (mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img
            and mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img ~= nil) then
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img.alpha = 1
            end
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:addEventListener("tap", mainFunc.buttonListener)

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn.alpha = 1
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn:addEventListener("tap", mainFunc.buttonListener)
        end

        mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter - 1

        if (mainFunc.allLevelSettings.shouldBallMoveCounter == 0) then
            mainFunc.screenChangingScript.initialReturnToBallScreen(mainFunc, "returnFromMap", shapeArray, shapeArrayParameters)
        end
        
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen.state = "mapHidden"
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen:removeEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballAndButtonAndScreenCreateScript.mapScreen:removeEventListener("touch", mainFunc.dummyListener)

        mainFunc.allLevelSettings.mapShowCounter = 0
        
    end

    timer.performWithDelay(300, function () mainFunc.ballAndButtonAndScreenCreateScript.playBtn:addEventListener("tap", mainFunc.buttonListener) end)

end
	t.mapButtonPressedFunction = mapButtonPressedFunction

local pauseButtonPressedFunction = function (mainFunc, shapeArray, shapeArrayParameters, levelVariables)

    mainFunc.allLevelSettings.isScreenPausedState = true

    removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

    if mainFunc.allLevelSettings.itemBagIsOpen == true then
        removeItemBagScreenEventListeners(mainFunc, levelVariables)
    end
    
	mainFunc.screenShowingScript.showPauseScreen(mainFunc)
    
    mainFunc.ballAndButtonAndScreenCreateScript.playBtn:removeEventListener( "tap", mainFunc.buttonListener )
    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:addEventListener( "tap", mainFunc.buttonListener )
    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:addEventListener( "tap", mainFunc.buttonListener )
    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:addEventListener( "tap", mainFunc.buttonListener )

    if mainFunc.allLevelSettings.mysteryBlockBagIsOpen then
        for a = 1, #mainFunc.allLevelSettings.showingObjectsArray do
            mainFunc.allLevelSettings.showingObjectsArray[a]:removeEventListener("touch", mainFunc.listener)
        end
    end
    
    removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

    mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter + 1

end
	t.pauseButtonPressedFunction = pauseButtonPressedFunction

local backToPlayButtonPressedFunction = function (mainFunc, shapeArray, shapeArrayParameters, levelVariables)

	if mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen.state == "paused" then
    	mainFunc.screenShowingScript.showPauseScreen(mainFunc)
        mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:addEventListener( "tap", mainFunc.buttonListener )
        if mainFunc.allLevelSettings.itemBagIsOpen == false then
            mainFunc.ballAndButtonAndScreenCreateScript.playBtn:addEventListener( "tap", mainFunc.buttonListener )
        end

        mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:removeEventListener( "tap", mainFunc.buttonListener )
        mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:removeEventListener( "tap", mainFunc.buttonListener )
        mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:removeEventListener( "tap", mainFunc.buttonListener )

        if mainFunc.allLevelSettings.itemBagIsOpen then
            if mainFunc.allLevelSettings.itemBagIsOpen == true then
                addBackItemBagScreenEventListeners(mainFunc, levelVariables)
            end
        end

        if mainFunc.allLevelSettings.mysteryBlockBagIsOpen then
            for a = 1, #mainFunc.allLevelSettings.showingObjectsArray do
                mainFunc.allLevelSettings.showingObjectsArray[a]:addEventListener("touch", mainFunc.listener)
            end
        end

        mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter - 1

        addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        
        addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.allLevelSettings.pauseButtonsEnabled = true
    end

end
	t.backToPlayButtonPressedFunction = backToPlayButtonPressedFunction

local resetButtonPressedFunction = function (mainFunc)

    Runtime:removeEventListener( "enterFrame", mainFunc.doorTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.tunnelTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.autoFanTransitionListener )

	mainFunc.allLevelSettings.direction = "up"
	timer.performWithDelay(100, mainFunc.resetLevel())
    return true
end
	t.resetButtonPressedFunction = resetButtonPressedFunction

local backToMainButtonPressedFunction = function (composer, mainFunc)
	--purge level

    Runtime:removeEventListener( "enterFrame", mainFunc.doorTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.tunnelTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.autoFanTransitionListener )

    timer.performWithDelay(100, composer.gotoScene("backToHome", "fade", 10))
    return true
end
	t.backToMainButtonPressedFunction = backToMainButtonPressedFunction

local cancelHookshotTrans = function (mainFunc, hookshot)
    transition.cancel(mainFunc.buttonListenerScript.hookshotTransition)
    transition.to(hookshot, {x = hookshot.x, y = hookshot.y, time = 10, onComplete = function ()
        transition.to(hookshot, {alpha = 0.5, time = 900, onComplete = function ()
            physics.removeBody(hookshot)
            hookshot:removeSelf()
            end})
    end})
end
    t.cancelHookshotTrans = cancelHookshotTrans

local bombDirectionArrowArray = {
    up = function (bombDirectionLabelCounter, showType, tool) tool.displayObjects["directionLabel"][bombDirectionLabelCounter].rotation = 0  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y - 12 end,
    right = function (bombDirectionLabelCounter, showType, tool) tool.displayObjects["directionLabel"][bombDirectionLabelCounter].rotation = 90  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x + 11 end,
    down = function (bombDirectionLabelCounter, showType, tool) tool.displayObjects["directionLabel"][bombDirectionLabelCounter].rotation = 180  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y + 12 end,
    left = function (bombDirectionLabelCounter, showType, tool) tool.displayObjects["directionLabel"][bombDirectionLabelCounter].rotation = 270  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x - 12 end
}
    t.bombDirectionArrowArray = bombDirectionArrowArray

local itemsImageSheet = graphics.newImageSheet( "images/objects/items.png", {width = 60, height = 52, numFrames = 12, sheetContentWidth = 720, sheetContentHeight = 52})
t.itemsImageSheet = itemsImageSheet
local itemsSequenceData = {
    { name = "bomb", start=1, count=1,   loopCount=1 },
    { name = "hook", start=2, count=1, loopCount=1 },
    { name = "jet", start=3, count=1, loopCount=1 },
    { name = "clock", start=4, count=1, loopCount=1 },
    { name = "dummyBall", start=5, count=1, loopCount=1 },
    { name = "superBall", start=6, count=1, loopCount=1 },
    { name = "fireCape", start=7, count=1, loopCount=1 },
    { name = "iceCape", start=8, count=1, loopCount=1 },
    { name = "bulletVest", start=9, count=1, loopCount=1 },
    { name = "characterSpecial", start=10, count=1, loopCount=1 },
    { name = "small-present", start=11, count=1, loopCount=1 },
    { name = "mystery-block", start=12, count=1, loopCount=1 }
}
t.itemsSequenceData = itemsSequenceData

local createObjectImage = function (toolIndex, bombIndex, mainFunc, itemTransactionType, objectType, itemLabel)

    if toolIndex ~= nil
    and objectType == "toolItem" then

        if (mainFunc.thisLevelSettings.objectArray[toolIndex]["quantity"] > 0) then

            local createObjectImageVisuals = function (toolIndex)
                
                local manualFanImageSheet = graphics.newImageSheet( "images/objects/manualFan.png", {width = 60, height = 52, numFrames = 2, sheetContentWidth = 120, sheetContentHeight = 52})
                local manualFanSequenceData = {
                    { name = "off", start=1, count=1,   loopCount=1 },
                    { name = "on", start=2, count=1, loopCount=1 }
                }
                    
                    
                local function spawn (toolIndex)
                    if mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "autoFan"
                    or mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "simple"
                    or mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "backFire" then
                        object = display.newImageRect("images/objects/"..mainFunc.thisLevelSettings.objectArray[toolIndex]["name"]..".png", 60, 52)
                    elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "spitter" then
                        -- local spitterImageSheet = graphics.newImageRect( "images/objects/" .. mainFunc.thisLevelSettings.objectArray[toolIndex][1][1] .. ".png", 60, 52)
                        -- local spitterSequenceData = {
                        --     { name = "normal", start=1, count=1,   loopCount=1 },
                        --     { name = "ballCentering", start=2, count=1, loopCount=1 }
                        -- }
                        object = display.newImageRect( "images/objects/" .. mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] .. ".png", 60, 52)
                        --object:setSequence("normal")
                    elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "manualFan" then
                        object = display.newSprite(manualFanImageSheet, manualFanSequenceData)
                        object:play()
                    elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "shape" then
                        if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["breakable"] then
                            if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleTopRightShape" then
                                local shapeString = string.sub(mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"], 1, #mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] - 5)
                                local breakableTriangleImageSheet = graphics.newImageSheet( "images/objects/" .. shapeString .. "-breakable.png", {width = 60, height = 65, numFrames = 4})
                                local breakableTriangleSequenceData = {
                                    { name = "normal", start=1, count=1,   loopCount=1 },
                                    { name = "breaking", start=1, count=3, loopCount=1 }
                                }
                                object = display.newSprite(breakableTriangleImageSheet, breakableTriangleSequenceData)
                                object:setSequence("normal")
                                --object = display.newImage("images/objects/triangleTopRight-breakable.png")
                            end
                        else
                            if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleTopRightShape" then
                                object = display.newImageRect("images/objects/triangleTopRight.png", 50, 51)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleBottomRightShape" then
                                object = display.newImageRect("images/objects/triangleBottomRight.png", 50, 51)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleBottomLeftShape" then
                                object = display.newImageRect("images/objects/triangleBottomLeft.png", 50, 51)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleTopLeftShape" then
                                object = display.newImageRect("images/objects/triangleTopLeft.png", 50, 51)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleLeftAndRightShape" then
                                object = display.newImageRect("images/objects/triangle.png", 52, 96)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "triangleTopAndBottomShape" then
                                object = display.newImageRect("images/objects/triangle.png", 52, 96)
                            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["shape"] == "bar" then
                                object = display.newImageRect("images/objects/bar.png", 26, 49)
                            end
                            
                        end
                    end
                    return object
                end

                spawn(toolIndex)
            end

            createObjectImageVisuals(toolIndex)

            if itemTransactionType == "itemGained" then
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object )
                --object:toBack()
            elseif itemTransactionType == "itemUsed" then
                mainFunc.allLevelSettings.midScreenObjectsGroup:insert( object )

                mainFunc.ballAndButtonAndScreenCreateScript.instance2:toFront()
                for a = 1, #mainFunc.allLevelSettings.bullet do
                    mainFunc.allLevelSettings.bullet[a]:toFront()
                end
            end
            object.objectType = mainFunc.thisLevelSettings.objectArray[toolIndex]["name"]

            if (itemTransactionType == "itemGained") then
                itemBagScreenArrayCounter = 0
                for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.itemGainedScreen.itemArray do
                    itemBagScreenArrayCounter = itemBagScreenArrayCounter + 1
                end

                mainFunc.ballAndButtonAndScreenCreateScript.itemGainedScreen.itemArray[itemBagScreenArrayCounter + 1] = object
            end

            if itemTransactionType == "itemGained" then
                -- Create function to position Images accordingly

                object.x = screen.itemXVal
                object.y = screen.itemYVal

            end

            object.relevantArrayIndex = toolIndex
            object.itemType = mainFunc.thisLevelSettings.objectArray[toolIndex]["name"]

            if mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "manualFan"
            or mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "autoFan" then
                if mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "manualFan" then
                    object.directionIndicatorArrow = display.newImageRect("images/objects/manualFan-arrow.png", 35, 11)
                else
                    object.directionIndicatorArrow = display.newImageRect("images/objects/autoFan-arrow.png", 35, 11)
                end
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object.directionIndicatorArrow )
                object.directionIndicatorArrow:toFront()
                object.directionIndicatorArrow.x = object.x
                object.directionIndicatorArrow.y = object.y
                object.directionIndicatorArrow.xScale = 0.9
                object.directionIndicatorArrow.yScale = 0.9
                
                local directionIndicatorArrowArray = {
                    {0, -16},
                    {19, 0},
                    {0, 16},
                    {-19, 0}
                }
                
                for a = 1, #mainFunc.shapeRelatedArrays.directionArray do
                    if mainFunc.shapeRelatedArrays.directionArray[a] == mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"][a] then
                        object.directionIndicatorArrow.x = object.directionIndicatorArrow.x + directionIndicatorArrowArray[a][1]
                        object.directionIndicatorArrow.y = object.directionIndicatorArrow.y + directionIndicatorArrowArray[a][2]
                        object.directionIndicatorArrow.rotation = (90 * (a - 1))
                    end
                end
                
                
            elseif mainFunc.thisLevelSettings.objectArray[toolIndex]["name"] == "spitter" then

                object.upEnabled = false
                object.rightEnabled = false
                object.downEnabled = false
                object.leftEnabled = false

                for a = 1, #mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"] do
                    if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"][a] == "up" then
                        object.upEnabled = true
                        object.upArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
                        --object.upArrow:setReferencePoint(display.TopLeftReferencePoint);
                        object.upArrow.anchorX = 0
                        object.upArrow.anchorY = 0
                        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object.upArrow )
                        object.upArrow.x = (object.x - 7)
                        object.upArrow.y = (object.y - 21.5)
                    end
                    if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"][a] == "right" then
                        object.rightEnabled = true
                        object.rightArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
                        --object.rightArrow:setReferencePoint(display.TopLeftReferencePoint);
                        object.rightArrow.anchorX = 0
                        object.rightArrow.anchorY = 0
                        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object.rightArrow )
                        object.rightArrow.rotation = 90
                        object.rightArrow.x = (object.x + 22.5)
                        object.rightArrow.y = (object.y - 6)
                    end
                    if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"][a] == "down" then
                        object.downEnabled = true
                        object.downArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
                        --object.downArrow:setReferencePoint(display.TopLeftReferencePoint);
                        object.downArrow.anchorX = 0
                        object.downArrow.anchorY = 0
                        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object.downArrow )
                        object.downArrow.rotation = 180
                        object.downArrow.x = (object.x + 7.5)
                        object.downArrow.y = (object.y + 22.5)
                    end
                    if mainFunc.thisLevelSettings.objectArray[toolIndex]["properties"]["directions"][a] == "left" then
                        object.leftEnabled = true
                        object.leftArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
                        --object.leftArrow:setReferencePoint(display.TopLeftReferencePoint);
                        object.leftArrow.anchorX = 0
                        object.leftArrow.anchorY = 0
                        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( object.leftArrow )
                        object.leftArrow:toFront()
                        object.leftArrow.rotation = 270
                        object.leftArrow.x = (object.x - 22.5)
                        object.leftArrow.y = (object.y + 9)
                    end
                end

            end

            mainFunc.allLevelSettings.itemScreenObjectsGroup:toFront()
        end
    end

    return object
end
    t.createObjectImage = createObjectImage

local createToolImage = function (thisBombProps, toolIndex, bombIndex, mainFunc, itemTransactionType, itemType, itemLabel, textToShow)
    local item

    if toolIndex ~= nil
    and itemType == "toolItem" then

        if (itemLabel) == "bomb"
        and itemTransactionType == "itemUsed" then
            mainFunc.thisLevelSettings.bombArray[bombIndex] = display.newSprite(itemsImageSheet, itemsSequenceData)
            item = mainFunc.thisLevelSettings.bombArray[bombIndex]
            item.props = thisBombProps
        else
            item = display.newSprite(itemsImageSheet, itemsSequenceData)
        end

        -- if itemTransactionType == "itemUsed" then
        --     mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen:toBack()
        -- end

        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( item )

        mainFunc.ballAndButtonAndScreenCreateScript.instance2:toFront()
        for a = 1, #mainFunc.allLevelSettings.bullet do
            mainFunc.allLevelSettings.bullet[a]:toFront()
        end

        item.itemType = itemLabel

        item:play()
        item:setSequence(itemLabel)

        item.relevantArrayIndex = toolIndex

        item.displayObjects = {}

        local handleItemVisuals = function ()

            local itemDirectionArrowArray = {
                up = function () item.displayObjects["directionLabel"][1].y = item.displayObjects["directionLabel"][1].y - 12 end,
                right = function () item.displayObjects["directionLabel"][1].x = item.displayObjects["directionLabel"][1].x + 11 end,
                down = function () item.displayObjects["directionLabel"][1].y = item.displayObjects["directionLabel"][1].y + 12 end,
                left = function () item.displayObjects["directionLabel"][1].x = item.displayObjects["directionLabel"][1].x - 12 end
            }

            if (thisBombProps["name"] == "bomb") then
                bombDirectionLabelCounter = 0
                for z = 1, #thisBombProps["properties"]["directions"] do
                    bombDirectionArrowArray[thisBombProps["properties"]["directions"][z]](z, "in-game", item)
                end
            elseif (thisBombProps["name"] == "hook")
            or (thisBombProps["name"] == "jet") then

                item.displayObjects["directionLabel"][1]:toFront()
                itemDirectionArrowArray[thisBombProps["properties"]["directions"][1]]()
            end

            mainFunc.allLevelSettings.itemScreenObjectsGroup:toFront()
        end

        local function handleItemVisualCreation ()

            if (textToShow ~= nil) then
                item.displayObjects["text"] = {}
                if textToShow < 10 then
                    item.displayObjects["text"][1] = display.newImage("images/objects/bomb-number-"..textToShow..".png")
                else
                    textToShow = math.floor(textToShow / 10)
                    textToShow2 = textToShow % 10
                    item.displayObjects["text"][1] = display.newImage("images/objects/bomb-number-"..textToShow..".png")
                    item.displayObjects["text"][2] = display.newImage("images/objects/bomb-number-1.png")
                    mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["text"][2])
                    item.displayObjects["text"][2].alpha = 0
                    item.displayObjects["text"][2]:toFront()
                    item.displayObjects["text"][2].xScale = 0.55
                    item.displayObjects["text"][2].yScale = 0.55
                end
                if itemTransactionType == "itemGained"
                or itemTransactionType == "medalScreen" then
                    mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( item.displayObjects["text"][1] )
                elseif itemTransactionType == "itemUsed" then
                    mainFunc.allLevelSettings.midScreenObjectsGroup:insert( item.displayObjects["text"][1] )
                    item.displayObjects["text"][1]:toBack()
                end

                item.displayObjects["text"][1].alpha = 0
                item.displayObjects["text"][1]:toFront()
                item.displayObjects["text"][1].xScale = 0.55
                item.displayObjects["text"][1].yScale = 0.55

                if (itemTransactionType == "itemGained")
                or itemTransactionType == "medalScreen" then
                    item.displayObjects["text"][1].x = item.x
                    item.displayObjects["text"][1].y = item.y + 4
                    item.displayObjects["text"][1].alpha = 1

                    if (item.displayObjects["text"][2]
                    and item.displayObjects["text"][2] ~= nil) then
                        item.displayObjects["text"][2].x = item.x - 2
                        item.displayObjects["text"][2].x = item.x + 6
                        item.displayObjects["text"][2].y = item.y
                        item.displayObjects["text"][2].alpha = 1
                    end
                end
            end

            local itemDirectionArrowArrayCreate = {
                up = function (i) item.displayObjects["directionLabel"][i].rotation = 0 end,
                right = function (i) item.displayObjects["directionLabel"][i].rotation = 90 end,
                down = function (i) item.displayObjects["directionLabel"][i].rotation = 180 end,
                left = function (i) item.displayObjects["directionLabel"][i].rotation = 270 end
            }

            if (thisBombProps["name"] == "bomb")
            or (thisBombProps["name"] == "hook")
            or (thisBombProps["name"] == "jet") then
                item.displayObjects["directionLabel"] = {}
            end

            if (thisBombProps["name"] == "bomb") then
                bombDirectionLabelCounter = 0
                for z = 1, #thisBombProps["properties"]["directions"] do
                    item.displayObjects["directionLabel"][z] = display.newImageRect("images/objects/bomb-arrow.png", 20, 13)

                    -- if statement to find out ifit's item gained or item using

                    if itemTransactionType == "itemGained"
                    or itemTransactionType == "medalScreen" then
                        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( item.displayObjects["directionLabel"][z] )
                    elseif itemTransactionType == "itemUsed" then
                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( item.displayObjects["directionLabel"][z] )
                        item.displayObjects["directionLabel"][z]:toBack()
                    end

                    item.displayObjects["directionLabel"][z]:toFront()
                    item.displayObjects["directionLabel"][z].direction = thisBombProps["properties"]["directions"][z]
                    item.displayObjects["directionLabel"][z].xScale = 0.8
                    item.displayObjects["directionLabel"][z].yScale = 0.8
                    item.displayObjects["directionLabel"][z].alpha = 0
                    if (itemTransactionType == "itemGained")
                    or itemTransactionType == "medalScreen" then
                        item.displayObjects["directionLabel"][z].x = item.x
                        item.displayObjects["directionLabel"][z].y = item.y + 4
                        item.displayObjects["directionLabel"][z].alpha = 1
                    end
                end
            elseif (thisBombProps["name"] == "hook")
            or (thisBombProps["name"] == "jet") then
                item.displayObjects["directionLabel"][1] = display.newImageRect("images/objects/bomb-arrow.png", 20, 13)
                item.displayObjects["directionLabel"][1].alpha = 0
                if itemTransactionType == "itemUsed" then
                    mainFunc.allLevelSettings.midScreenObjectsGroup:insert( item.displayObjects["directionLabel"][1] )
                elseif itemTransactionType == "itemGained"
                or itemTransactionType == "medalScreen" then
                    mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( item.displayObjects["directionLabel"][1] )
                end

                item.displayObjects["directionLabel"][1].xScale = 0.8
                item.displayObjects["directionLabel"][1].yScale = 0.8
                if (itemTransactionType == "itemGained")
                or itemTransactionType == "medalScreen" then
                    item.displayObjects["directionLabel"][1].x = item.x
                    item.displayObjects["directionLabel"][1].y = item.y + 4
                end
                item.displayObjects["directionLabel"][1]:toFront()

                itemDirectionArrowArrayCreate[thisBombProps["properties"]["directions"][1]](1)
            end

            handleItemVisuals()
        end

        if (thisBombProps["name"] == "bomb")
        or (thisBombProps["name"] == "hook")
        or (thisBombProps["name"] == "jet")
        or (thisBombProps["name"] == "clock") then
            handleItemVisualCreation()
        end
    elseif itemType == "levelItem" then
        local levelItemsImageSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItemsImageSheet, mainFunc.allLevelSettings.levelItemsImageSheetSettings)
        local levelItemsSequenceData = mainFunc.allLevelSettings.levelItemsSequenceData

        item = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
        item.itemType = "levelItem"

        itemBagScreenArrayCounter = 0
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.itemGainedScreen.itemArray do
            itemBagScreenArrayCounter = itemBagScreenArrayCounter + 1
        end

        mainFunc.ballAndButtonAndScreenCreateScript.itemGainedScreen.itemArray[itemBagScreenArrayCounter + 1] = item

        item:setSequence(itemLabel)

        --mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( item )

        item:toFront()

        item.x = 50
        item.y = 100
        item.xScale = 2
        item.yScale = 2
    end

    return item
end
    t.createToolImage = createToolImage

local itemBtnFunction = function (mainFunc, shapeArray, shapeArrayParameters, levelVariables)
    if mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.relevantShapeArrayCounterForItem ~= nil
    and mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive == true then
        showingToolsArray = mainFunc.allLevelSettings.showingToolsArray
        toolArray = mainFunc.thisLevelSettings.toolArray
        toolArrayCounter = mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.relevantShapeArrayCounterForItem
        local removeItemImg = function (mainFunc)
            if mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img
            and mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img ~= nil then
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img:removeSelf()
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img = nil          
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg:removeSelf()
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg = nil
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.relevantShapeArrayCounterForItem = nil
            end

        end

        local removeItemFromToolArray = function (counter, mainFunc)
            local thisToolArray = mainFunc.thisLevelSettings.toolArray
            local thisToolName = thisToolArray[counter]["name"]
            local thisToolProps = thisToolArray[counter]["properties"]
            thisToolArray[counter]["quantity"] = thisToolArray[counter]["quantity"] - 1

            if thisToolArray[counter]["quantity"] == 0 then
                removeItemImg(mainFunc)

                table.remove(thisToolArray, counter)

            else
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg:removeSelf()
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg = nil

                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg = display.newImage("images/objects/imageNumber" .. thisToolArray[counter]["quantity"] .. ".png")
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg)
                itemBtnCounterImage = mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.counterImg
                itemBtnCounterImage.x = mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.x
                itemBtnCounterImage.y = mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.y - 10
                itemBtnCounterImage.xScale = 0.5
                itemBtnCounterImage.yScale = 0.5   


            end

            local itemBtnDelay = 100
            if (thisToolName == "hook") then
                itemBtnDelay = (250 * thisToolProps["squares"])
            end
            timer.performWithDelay(itemBtnDelay, function () mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = true 
                                                                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:addEventListener( "tap", mainFunc.buttonListener ) end)

            saveTable(thisToolArray, "myTotalToolArray.json")
        end

        -- so they cannot use certain items when they're too close to an a physical shape
        local function checkForShapeSquare (mainFunc, shapeArray)
            local centreOfSquareCords = {}
            xFig = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x - ( (mainFunc.allLevelSettings.ballScreenHorzValue - 1) * display.contentWidth)
            xFig = (xFig - mainFunc.allLevelSettings.gutterWidth) / mainFunc.allLevelSettings.squareWidth
            yFig = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y - ( (mainFunc.allLevelSettings.ballScreenVertValue - 1) * display.contentHeight)
            yFig = (yFig - mainFunc.allLevelSettings.gutterHeight) / mainFunc.allLevelSettings.squareHeight
            xFig = math.floor(xFig)
            yFig = math.floor(yFig)

            mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantHorzScreen = mainFunc.allLevelSettings.ballScreenHorzValue
            mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantVertScreen = mainFunc.allLevelSettings.ballScreenVertValue
            mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantHorzSquare = xFig + 1
            mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantVertSquare = yFig + 1

            for a = 1, #shapeArray do
                if shapeArrayParameters[a]["type"] == "shape" then
                    if shapeArray[a].relevantHorzScreen == mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantHorzScreen
                    and shapeArray[a].relevantVertScreen == mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantVertScreen
                    and shapeArray[a].relevantHorzSquare == mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantHorzSquare
                    and shapeArray[a].relevantVertSquare == mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantVertSquare then
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.isInShapeSquare = true
                    end
                end
            end

            centreOfSquareCords.xVal = (xFig * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth + ( (mainFunc.allLevelSettings.ballScreenHorzValue - 1) * display.contentWidth) + (mainFunc.allLevelSettings.squareWidth /2)
            centreOfSquareCords.yVal = (yFig * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight + ( (mainFunc.allLevelSettings.ballScreenVertValue - 1) * display.contentHeight) + (mainFunc.allLevelSettings.squareHeight /2)

            return centreOfSquareCords
        end

        local followBall = function (event)
            if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "right") then
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x + ( (6/480) * display.contentWidth)
            elseif (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "left") then
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x - ( (6/480) * display.contentWidth)
            else
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
            end

            if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "up") then
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y - ( (4/320) * display.contentHeight)
            elseif (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "down") then
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y + ( (4/320) * display.contentHeight)
            else
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
            end
        end

        local addBackListenerForItemBtn = function ()
            timer.performWithDelay(100, function ()
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = true
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:addEventListener("tap", mainFunc.buttonListener)
            end)
        end

        if mainFunc.allLevelSettings.specialBallActive == true then
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false

            local prevImageSheet = graphics.newImageSheet( mainFunc.allLevelSettings.characterInLevelImageSheet[mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.character], mainFunc.allLevelSettings.normalCharacterInLevelSequenceData)

            --mainFunc.ballAndButtonAndScreenCreateScript.instance2:removeSelf()
            --mainFunc.ballAndButtonAndScreenCreateScript.instance2 = nil

            mainFunc.oldInstance2 = mainFunc.ballAndButtonAndScreenCreateScript.instance2

            transition.to(mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy, {alpha = 1, x = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.x + ( (10/480) * display.contentWidth), time = 80, onComplete = function ()
                mainFunc.ballAndButtonAndScreenCreateScript.instance2 = display.newSprite(prevImageSheet, prevSequenceData)
                physics.addBody( mainFunc.ballAndButtonAndScreenCreateScript.instance2, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
                mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballAndButtonAndScreenCreateScript.instance2 )
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType = "ball"
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.direction
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex = 0
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.transitionId = mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.gravityScale = 0
                -- instance2.xScale = 0.6
                -- instance2.yScale = 0.6
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.x
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.y
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.isFixedRotation = true
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.autoFanCounter = 0
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.fanCenteringCounter = 0
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.movementSpeed = 100
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.transitioning = false
                mainFunc.ballAndButtonAndScreenCreateScript.instance2:play()
                mainFunc.ballAndButtonAndScreenCreateScript.instance2:toFront()
                mainFunc.ballAndButtonAndScreenCreateScript.instance2:setSequence(mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.direction)
                mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray = {}

                mainFunc.ballAndButtonAndScreenCreateScript.instance2.character = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.character

                mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy:removeSelf()
                mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy = nil

                mainFunc.oldInstance2:removeSelf()
                mainFunc.oldInstance2 = nil

                timer.performWithDelay(200, function ()
                    mainFunc.allLevelSettings.specialBallActive = false
                    mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = true
                end)
            end})

        else
            if toolArray[toolArrayCounter]["name"] == "clock" then
                if mainFunc.thisLevelSettings.levelHasTimer == true then
                    removeItemFromToolArray(toolArrayCounter, mainFunc)
                    -- add number of seconds to timer based on clock settings
                else
                    -- show exclamationmark image above button
                    addBackListenerForItemBtn()
                end
            elseif toolArray[toolArrayCounter]["name"] == "fireCape"
            or toolArray[toolArrayCounter]["name"] == "characterSpecial"
            or toolArray[toolArrayCounter]["name"] == "iceCape" 
            or toolArray[toolArrayCounter]["name"] == "bulletVest" then
                local toolName = toolArray[toolArrayCounter]["name"]
                mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false

                local addSuit = function (suitName, suitTime, index)
                    mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[suitName].active = true


                    if suitName ~= "characterSpecial" and suitName ~= "bulletVest" then
                        local suitImageSheet = graphics.newImageSheet( "images/objects/" .. suitName .. "Sprite.png", {width = 31, height = 34, numFrames = 4, sheetContentWidth = 124, sheetContentHeight = 34})
                        local suitSequenceData = {
                            { name = "up", start=1, count=1,   loopCount=1 },
                            { name = "right", start=2, count=1, loopCount=1 },
                            { name = "down", start=3, count=1, loopCount=1 },
                            { name = "left", start=4, count=1, loopCount=1 }
                        }
                    
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit = display.newSprite(suitImageSheet, suitSequenceData)
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.anchorX = 0.5
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit.anchorY = 0.5
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit:setSequence(mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction)

                        Runtime:addEventListener("enterFrame", followBall)

                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit )
                    else
                        local label
                        if suitName == "characterSpecial" then
                            label = "-special"
                        else
                            label = "-bullet"
                        end

                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:setSequence(mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction .. label)
                    end


                    mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[suitName].timer = timer.performWithDelay(
                        1000 * suitTime,
                        function ()
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[suitName].active = false
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2:setSequence(mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction)
                            if mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit then
                                Runtime:removeEventListener("enterFrame", followBall)
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit:removeSelf()
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.suit = nil
                            end
                        end
                    )

                    removeItemFromToolArray(index, mainFunc)
                end

                if mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[toolName]
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[toolName].active == true then
                    --nothing happens, they can´t apply the same thing twice at same time
                    addBackListenerForItemBtn()
                    mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = true
                elseif mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[toolName]
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[toolName].active == false then
                    --nothing happens, they can´t apply the same thing twice at same time
                    addSuit(toolArray[toolArrayCounter]["name"], toolArray[toolArrayCounter]["properties"]["seconds"], toolArrayCounter)
                else
                    mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray[toolName] = {}
                    addSuit(toolArray[toolArrayCounter]["name"], toolArray[toolArrayCounter]["properties"]["seconds"], toolArrayCounter)
                end
            elseif toolArray[toolArrayCounter]["name"] == "bomb" then
                if mainFunc.allLevelSettings.isBallMovingState == "true"
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > (mainFunc.allLevelSettings.leftScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < (mainFunc.allLevelSettings.rightScreenEdge - 60)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > (mainFunc.allLevelSettings.topScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < (mainFunc.allLevelSettings.bottomScreenEdge - 60) then
                    local thisBombProps = toolArray[toolArrayCounter]

                    removeItemFromToolArray(toolArrayCounter, mainFunc)

                    mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false
                    mainFunc.thisLevelSettings.bombIsInUse = true
                    mainFunc.thisLevelSettings.bombInUseCounter = mainFunc.thisLevelSettings.bombInUseCounter + 1

                    
                    local centreOfSquareCords = checkForShapeSquare(mainFunc, shapeArray, ballIsInShapeSquare)

                    bombArrayCounter = 0
                    for a = 1, #mainFunc.thisLevelSettings.bombArray do
                        bombArrayCounter = bombArrayCounter + 1
                    end

                    local item = createToolImage(thisBombProps, toolArrayCounter, (bombArrayCounter + 1), mainFunc, "itemUsed", "toolItem", "bomb", thisBombProps["properties"]["squares"])

                    item.bombExplodeCounter = {}
                    item.explosions = {}
                    item.active = true
                    item.relevantHorzScreen = mainFunc.allLevelSettings.ballScreenHorzValue
                    item.relevantVertScreen = mainFunc.allLevelSettings.ballScreenVertValue
                    item.relevantHorzSquare = xFig + 1
                    item.relevantVertSquare = yFig + 1
                    for a = 1, #shapeArray do
                        if shapeArrayParameters[a]["type"] ~= "item"
                        and shapeArrayParameters[a]["type"] ~= "gem"
                        and shapeArray[a].relevantHorzScreen == item.relevantHorzScreen
                        and shapeArray[a].relevantVertScreen == item.relevantVertScreen
                        and shapeArray[a].relevantHorzSquare == item.relevantHorzSquare
                        and shapeArray[a].relevantVertSquare == item.relevantVertSquare then
                            item.isInFrontScreenGroup = true

                            if shapeArray[a].objectType == "shape" then

                                mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(item)
                                mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(item.displayObjects["text"][1])
                                for b = 1, #item.displayObjects["directionLabel"] do
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(item.displayObjects["directionLabel"][b])
                                end

                            elseif shapeArray[a].objectType ~= "shape" then
                                item.displayObjects["text"][1]:toBack()
                                for b = 1, #item.displayObjects["directionLabel"] do
                                    item.displayObjects["directionLabel"][b]:toBack()
                                end
                                item:toBack()
                            end
                        end
                    end
                    item.xScale = 0.7
                    item.yScale = 0.7
                    item.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
                    transition.to(item, {x = centreOfSquareCords.xVal, time = 60})
                    item.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
               
                    transition.to(item, {y = centreOfSquareCords.yVal, time = 60, onComplete = function ()
                        local scaleBombUp = function ()
                            transition.to(item, {xScale = 0.9, yScale = 0.9, time =35, onComplete = function ()
                                if (item.isInFrontScreenGroup ~= true) then
                                    item.displayObjects["text"][1]:toBack()
                                end
                                item.displayObjects["text"][1].x = item.x
                                item.displayObjects["text"][1].y = item.y + 4
                                for a = 1, #item.displayObjects["directionLabel"] do
                                    if (item.isInFrontScreenGroup ~= true) then
                                        item.displayObjects["directionLabel"][a]:toBack()
                                    end
                                    item.displayObjects["directionLabel"][a].x = item.x
                                    item.displayObjects["directionLabel"][a].y = item.y
                                    item.displayObjects["directionLabel"][a].xScale = 0.8
                                    item.displayObjects["directionLabel"][a].yScale = 0.8
                                    bombDirectionArrowArray[item.displayObjects["directionLabel"][a].direction](a, "in-game", item)
                                    item.displayObjects["directionLabel"][a].y = item.displayObjects["directionLabel"][a].y + 4
                                    transition.to(item.displayObjects["directionLabel"][a], {alpha = 1, time = 20})
                                end
                                transition.to(item.displayObjects["text"][1], {alpha = 1, time = 20})
                                if (item.isInFrontScreenGroup ~= true) then
                                    item:toBack()
                                end
                            end})
                        end
                        timer.performWithDelay(100, scaleBombUp)
                    end})

                    mainFunc.objectFunctionsScript.bombExplode(toolArrayCounter, (bombArrayCounter + 1), mainFunc, shapeArray, shapeArrayParameters)
                    
                else
                    addBackListenerForItemBtn()
                end
            elseif toolArray[toolArrayCounter]["name"] == "jet" then

                if (mainFunc.allLevelSettings.isBallMovingState == "true")
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > (mainFunc.allLevelSettings.leftScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < (mainFunc.allLevelSettings.rightScreenEdge - 60)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > (mainFunc.allLevelSettings.topScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < (mainFunc.allLevelSettings.bottomScreenEdge - 60) then

                    local jetFollowBall = function (event)
                        if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "right") then
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x - ( (14/480) * display.contentWidth)
                        elseif (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "left") then
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x + ( (14/480) * display.contentWidth)
                        else
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
                        end

                        if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "up") then
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y + ( (10/320) * display.contentHeight)
                        elseif (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "down") then
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y - ( (10/320) * display.contentHeight)
                        else
                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
                        end
                    end

                    mainFunc.ballAndButtonAndScreenCreateScript.instance2.isInShapeSquare = false
                    local centreOfSquareCords = checkForShapeSquare(mainFunc, shapeArray, ballIsInShapeSquare)

                    if mainFunc.ballAndButtonAndScreenCreateScript.instance2.isInShapeSquare == false then
                        mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false

                        mainFunc.tm[mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:cancelAll()

                        transition.to(mainFunc.ballAndButtonAndScreenCreateScript.instance2, {
                            x = centreOfSquareCords.xVal,
                            y = centreOfSquareCords.yVal, 
                            time = 300, 
                            onComplete = function ()
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction = toolArray[toolArrayCounter]["properties"]["directions"][1]
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2:setSequence(mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction)
                                mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballAndButtonAndScreenCreateScript.instance2, mainFunc)

                                local jetSuitImageSheet = graphics.newImageSheet( "images/objects/jetSprite.png", {width = 44, height = 44, numFrames = 4, sheetContentWidth = 176, sheetContentHeight = 44})
                                local jetSuitSequenceData = {
                                    { name = "main", start=1, count=4,   loopCount=0 }
                                }
                            
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit = display.newSprite(jetSuitImageSheet, jetSuitSequenceData)
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.anchorX = 0.5
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.anchorY = 0.5
                                local direction = {
                                                up = 0, right = 90, down = 180, left = 270
                                            }

                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.rotation = direction[mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction]
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit:setSequence("main")
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit.timeScale = 0.05
                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit:play()

                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"] = {}

                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"].active = true

                                mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"].timer = timer.performWithDelay(
                                    1000 * 5,
                                    function ()
                                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"].active = false
                                        if mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit then
                                            Runtime:removeEventListener("enterFrame", jetFollowBall)
                                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit:removeSelf()
                                            mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit = nil
                                        end
                                    end
                                )

                                Runtime:addEventListener("enterFrame", jetFollowBall)

                                mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballAndButtonAndScreenCreateScript.instance2.jetSuit )

                                removeItemFromToolArray(toolArrayCounter, mainFunc)
                            end })
                    else
                        addBackListenerForItemBtn()
                    end
                else
                    addBackListenerForItemBtn()
                end
            elseif toolArray[toolArrayCounter]["name"] == "hook" then
                if (mainFunc.allLevelSettings.isBallMovingState == "true")
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > (mainFunc.allLevelSettings.leftScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < (mainFunc.allLevelSettings.rightScreenEdge - 60)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > (mainFunc.allLevelSettings.topScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < (mainFunc.allLevelSettings.bottomScreenEdge - 60) then
                    local toolDirection = toolArray[toolArrayCounter]["properties"]["directions"][1]
                    local toolCounter = toolArray[toolArrayCounter]["quantity"]
                    local toolSquares = toolArray[toolArrayCounter]["properties"]["squares"]
                    mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false

                    mainFunc.ballAndButtonAndScreenCreateScript.instance2.isInShapeSquare = false
                    local centreOfSquareCords = checkForShapeSquare(mainFunc, shapeArray, ballIsInShapeSquare)

                    if mainFunc.ballAndButtonAndScreenCreateScript.instance2.isInShapeSquare == false then

                        mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.prevDirection = mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction 
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction = nil

                        transition.to(mainFunc.ballAndButtonAndScreenCreateScript.instance2, {x = centreOfSquareCords.xVal, y = centreOfSquareCords.yVal, time = 70, onComplete = function ()
                            mainFunc.tm[mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:pauseAll()
                            
                            local mask = graphics.newMask("images/objects/hookshot-mask.png" )
                            local tG = display.newGroup()
                            --local dummy = display.newRect(tG, display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
                            --dummy.alpha = 0
                            hookshot = display.newImage("images/objects/hookshot.png")
                            --tG:insert(hookshot)
                            tG:setMask( mask )
                            mainFunc.allLevelSettings.midScreenObjectsGroup:insert(hookshot)
                            physics.addBody(hookshot, { density = 1, friction = 1, bounce = 0, radius = 2 })
                            if toolDirection == "up" or toolDirection == "down" then
                                hookshot.rotation = 90
                            end
                            hookshot.gravityScale = 0
                            hookshot.projectileType = "hookshot"
                            hookshot.relevantArrayIndex = 1
                            hookshot.moevementSpeed = 100
                            hookshot.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
                            hookshot.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
                            hookshot.direction = toolDirection
                            hookshot.counter = toolCounter

                            if hookshot.direction == "up" then
                                hookshot.anchorY = 0
                                hookshot.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
                            elseif hookshot.direction == "right" then
                                hookshot.anchorX = 1
                                hookshot.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
                            elseif hookshot.direction == "down" then
                                hookshot.anchorY = 1
                                hookshot.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y
                            elseif hookshot.direction == "left" then
                                hookshot.anchorX = 0
                                hookshot.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x
                            end
                            if hookshot.direction == "left" or hookshot.direction == "right" then
                                --hookshot.maskRotation = 90
                            end
                            --[[
                            mask.anchorX = 0.5
                            mask.anchorY = 0.5
                            if hookshot.direction == "up" then
                                mask.anchorY = 0
                            elseif hookshot.direction == "right" then
                                mask.anchorX = 1
                            elseif hookshot.direction == "down" then
                                mask.anchorY = 1
                            elseif hookshot.direction == "left" then
                                mask.anchorX = 0
                            end
                            ]]

                            mainFunc.tm["hookshot"][1] = mainFunc.tManager.new()
                            mainFunc.projectileMovementRemoveAndRespawnScript.moveHookshotArray[hookshot.direction](hookshot, mainFunc, toolSquares)
                                
                        end })

                        removeItemFromToolArray(toolArrayCounter, mainFunc)
                    else
                        addBackListenerForItemBtn()
                    end
                else
                    addBackListenerForItemBtn()
                end
            elseif toolArray[toolArrayCounter]["name"] == "dummyBall"
            or toolArray[toolArrayCounter]["name"] == "superBall" then
                if (mainFunc.allLevelSettings.isBallMovingState == "false")
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > (mainFunc.allLevelSettings.leftScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < (mainFunc.allLevelSettings.rightScreenEdge - 60)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > (mainFunc.allLevelSettings.topScreenEdge + 30)
                and mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < (mainFunc.allLevelSettings.bottomScreenEdge - 60) then
                    if mainFunc.ballAndButtonAndScreenCreateScript.instance2.character ~= "dummyBall"
                    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.character ~= "superBall" then
                        mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = false
                        local ballImageSheet, ballSequenceData
                        local oldBallImageSheet = graphics.newImageSheet( "images/objects/ballSprite.png", {width = 31, height = 34, numFrames = 8, sheetContentWidth = 124, sheetContentHeight = 68})
                        ballSequenceData = {
                            { name = "up", start=1, count=1,   loopCount=1 },
                            { name = "right", start=2, count=1, loopCount=1 },
                            { name = "down", start=3, count=1, loopCount=1 },
                            { name = "left", start=4, count=1, loopCount=1 }
                        }
                        if toolArray[toolArrayCounter][1] == "dummyBall" then
                            ballImageSheet = graphics.newImageSheet( "images/objects/dummyBallSprite.png", {width = 31, height = 34, numFrames = 4, sheetContentWidth = 124, sheetContentHeight = 34})
                        else
                            ballImageSheet = graphics.newImageSheet( "images/objects/superBallSprite.png", {width = 31, height = 34, numFrames = 4, sheetContentWidth = 124, sheetContentHeight = 34})
                        end

                        --if theres a jetpack or some kind of suit active, get rid of it

                        local currentBall = mainFunc.ballAndButtonAndScreenCreateScript.instance2
                        local prevX = currentBall.x
                        
                        local prevY = currentBall.y
                        local prevDirection = currentBall.direction
                        local prevCharacter = currentBall.character
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:removeSelf()
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2 = nil

                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy = display.newSprite(oldBallImageSheet, ballSequenceData)
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy:setSequence(prevDirection)
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.alpha = 0.5
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.x = currentBall.x
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.y = prevY
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.character = prevCharacter
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.direction = prevDirection
                        for a = 1, #shapeArray do
                            if shapeArray[a].isBallPresent == true then
                                 mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.fanIndex = a
                            end
                        end
                       
                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy)
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy:toFront()
                        if mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.direction == "left" then
                            transition.to(mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy, {alpha = 0.5, x = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.x + ( (10/480) * display.contentWidth), time = 80})
                        else
                            transition.to(mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy, {alpha = 0.5, x = mainFunc.ballAndButtonAndScreenCreateScript.instance2Dummy.x - ( (10/480) * display.contentWidth), time = 80})
                        end

                        mainFunc.ballAndButtonAndScreenCreateScript.instance2 = display.newSprite(ballImageSheet, ballSequenceData)
                        physics.addBody( mainFunc.ballAndButtonAndScreenCreateScript.instance2, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballAndButtonAndScreenCreateScript.instance2 )
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType = "ball"
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction = prevDirection
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex = 0
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.transitionId = mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.gravityScale = 0
                        -- instance2.xScale = 0.6
                        -- instance2.yScale = 0.6
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = prevX
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = prevY
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.isFixedRotation = true
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.autoFanCounter = 0
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.fanCenteringCounter = 0
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.movementSpeed = 100
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.transitioning = false
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:play()
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:toFront()
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:setSequence(prevDirection)
                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray = {}

                        mainFunc.ballAndButtonAndScreenCreateScript.instance2.character = toolArray[toolArrayCounter][1]

                        mainFunc.allLevelSettings.specialBallActive = true

                        removeItemFromToolArray(toolArrayCounter, mainFunc)
                        timer.performWithDelay(200, function ()
                            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.isActive = true
                        end)
                    end
                else
                    addBackListenerForItemBtn()
                end
            end
        end
    else
        timer.performWithDelay(100, function ()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:addEventListener("tap", mainFunc.buttonListener)
        end)
    end
end
    t.itemBtnFunction = itemBtnFunction

return t
