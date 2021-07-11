local widget = require("widget")
local t = {}

--------- MAP SCREEN FUNCTIONS -----------
local mapButtonTransparencyCheck = function (mainFunc)
    if mainFunc.ballBtnScreenCreate.rightBtn.isVisibleState == true then
        transition.to (mainFunc.ballBtnScreenCreate.rightBtn, {alpha=1, time=150})
    else
        transition.to (mainFunc.ballBtnScreenCreate.rightBtn, {alpha=0, time=150})
    end
    
    if mainFunc.ballBtnScreenCreate.leftBtn.isVisibleState == true then
        transition.to (mainFunc.ballBtnScreenCreate.leftBtn, {alpha=1, time=150})
    else
        transition.to (mainFunc.ballBtnScreenCreate.leftBtn, {alpha=0, time=150})
    end
    
    if mainFunc.ballBtnScreenCreate.upBtn.isVisibleState == true then
        transition.to (mainFunc.ballBtnScreenCreate.upBtn, {alpha=1, time=150})
    else
        transition.to (mainFunc.ballBtnScreenCreate.upBtn, {alpha=0, time=150})
    end

    if mainFunc.ballBtnScreenCreate.downBtn.isVisibleState == true then
        transition.to (mainFunc.ballBtnScreenCreate.downBtn, {alpha=1, time=150})
    else
        transition.to (mainFunc.ballBtnScreenCreate.downBtn, {alpha=0, time=150})
    end
end
	t.mapButtonTransparencyCheck = mapButtonTransparencyCheck

local mapButtonStateCheck = function (mainFunc)

    nextHorzScreenNeedsPartialMap = false
    nextVertScreenNeedsPartialMap = false
    prevHorzScreenNeedsPartialMap = false
    prevVertScreenNeedsPartialMap = false

    nextHorzScreenNeedsFullMap = false
    nextVertScreenNeedsFullMap = false
    prevHorzScreenNeedsFullMap = false
    prevVertScreenNeedsFullMap = false

    local sortThroughMapsArray = function (relevantArray)

        local screenMapStatusUpdate = function (relevantArray, dir, dir2)
            relevantPartialCheck = false
            relevantFullCheck = false
            
            if relevantArray == mainFunc.thisLevelSettings.partialMapScreensArray then
                relevantPartialCheck = true
            else
                relevantFullCheck = true
            end

            if (dir == "horz") then
                if (dir2 == "prev") then
                    prevHorzScreenNeedsPartialMap = relevantPartialCheck
                    prevHorzScreenNeedsFullMap = relevantFullCheck
                else
                    nextHorzScreenNeedsPartialMap = relevantPartialCheck
                    nextHorzScreenNeedsFullMap = relevantFullCheck
                end
            else
                if (dir2 == "prev") then
                    prevVertScreenNeedsPartialMap = relevantPartialCheck
                    prevVertScreenNeedsFullMap = relevantFullCheck
                else
                    nextVertScreenNeedsPartialMap = relevantPartialCheck
                    nextVertScreenNeedsFullMap = relevantFullCheck
                end
            end

        end

        local mapScreenNumCheck = function (relevantArray, a, dir, dir2)
            if (dir == "horz") then
                arrayNum = 2
                relevantValue = mainFunc.thisLevelSettings.thisScreenVertValue
            else
                arrayNum = 1
                relevantValue = mainFunc.thisLevelSettings.thisScreenHorzValue
            end
            if relevantArray[a][arrayNum] == relevantValue then
                screenStatusUpdate = screenMapStatusUpdate(relevantArray, dir, dir2)
            end
        end

        for a = 1, #relevantArray do
            if relevantArray[a][1] == mainFunc.thisLevelSettings.thisScreenHorzValue + 1 then
                mapScreenNumCheck(relevantArray, a, "horz", "next")
            end

            if relevantArray[a][1] == mainFunc.thisLevelSettings.thisScreenHorzValue - 1 then
                mapScreenNumCheck(relevantArray, a, "horz", "prev")
            end

            if relevantArray[a][2] == mainFunc.thisLevelSettings.thisScreenVertValue + 1 then
                mapScreenNumCheck(relevantArray, a, "vert", "next")
            end

            if relevantArray[a][2] == mainFunc.thisLevelSettings.thisScreenVertValue - 1 then
                mapScreenNumCheck(relevantArray, a, "vert", "prev")
            end

        end
    end

    if mainFunc.thisLevelSettings.partialMapNecessary == true then
        sortThroughMapsArray(mainFunc.thisLevelSettings.partialMapScreensArray)
    end

    if mainFunc.thisLevelSettings.fullMapNecessary == true then
        sortThroughMapsArray(mainFunc.thisLevelSettings.fullMapScreensArray)
    end

    mainFunc.ballBtnScreenCreate.leftBtn.isVisibleState = false
    mainFunc.ballBtnScreenCreate.rightBtn.isVisibleState = false
    mainFunc.ballBtnScreenCreate.upBtn.isVisibleState = false
    mainFunc.ballBtnScreenCreate.downBtn.isVisibleState = false

    local prepareVisibility = function (button, dir, dir2)
        button.isVisibleState = false
        if (dir == "next") then
            if (dir2 == "horz") then
                relevantScreenFullCheck = nextHorzScreenNeedsFullMap
                relevantScreenPartialCheck = nextHorzScreenNeedsPartialMap
            else
                relevantScreenFullCheck = nextVertScreenNeedsFullMap
                relevantScreenPartialCheck = nextVertScreenNeedsPartialMap
            end
        else
            if (dir2 == "horz") then
                relevantScreenFullCheck = prevHorzScreenNeedsFullMap
                relevantScreenPartialCheck = prevHorzScreenNeedsPartialMap
            else
                relevantScreenFullCheck = prevVertScreenNeedsFullMap
                relevantScreenPartialCheck = prevVertScreenNeedsPartialMap
            end
        end
        if relevantScreenPartialCheck == true then
            if mainFunc.thisLevelSettings.mapObtained == true then
                button.isVisibleState = true
            else
                --show other hidden down button
            end
        elseif relevantScreenFullCheck == true then
            if mainFunc.thisLevelSettings.mapObtained == true then
                button.isVisibleState = true
            else
                --show other hidden down button
            end
        else
            button.isVisibleState = true
        end

        return {button = button}
    end

    if mainFunc.thisLevelSettings.thisScreenHorzValue > 1 then
        visibility = prepareVisibility(mainFunc.ballBtnScreenCreate.leftBtn, "prev", "horz")
        mainFunc.ballBtnScreenCreate.leftBtn.isVisibleState = true
    end
    
    if mainFunc.thisLevelSettings.thisScreenHorzValue < mainFunc.thisLevelSettings.screenHorzTotal then
        visibility = prepareVisibility(mainFunc.ballBtnScreenCreate.rightBtn, "next", "horz")
        mainFunc.ballBtnScreenCreate.rightBtn.isVisibleState = true
    end
    
    if mainFunc.thisLevelSettings.thisScreenVertValue > 1 then
        visibility = prepareVisibility(mainFunc.ballBtnScreenCreate.upBtn, "prev", "vert")
        mainFunc.ballBtnScreenCreate.upBtn.isVisibleState = true
    end
    
    if mainFunc.thisLevelSettings.thisScreenVertValue < mainFunc.thisLevelSettings.screenVertTotal then
        visibility = prepareVisibility(mainFunc.ballBtnScreenCreate.downBtn, "next", "vert")
        mainFunc.ballBtnScreenCreate.downBtn.isVisibleState = true
    end
    
    if mainFunc.ballBtnScreenCreate.mapScreen.state == "mapShowing" then
        mainFunc.screenChangingScript.mapButtonTransparencyCheck(mainFunc)
    end

end
    t.mapButtonStateCheck = mapButtonStateCheck

--------------

local resettingScreenChangeCounter = function (mainFunc)
    mainFunc.allLevelSettings.manualScreenChangeCounter = 0
end
    t.resettingScreenChangeCounter = resettingScreenChangeCounter

local resettingScreenTimer = function (mainFunc)
    mainFunc.allLevelSettings.screenTimer = 0
end
    t.resettingScreenTimer = resettingScreenTimer

local changeToRightScreen = function (mainFunc, shapeArray, shapeArrayParameters, screenChangeType, thisChangeScreenDirection)

    local lastScreenHorzValue = mainFunc.thisLevelSettings.thisScreenHorzValue
    local lastScreenVertValue = mainFunc.thisLevelSettings.thisScreenVertValue

    local function finishScreenChange ()
        if screenChangeType == "auto" then
            timer.performWithDelay(400, function () t.resettingScreenTimer(mainFunc) end, 1)
            mainFunc.ballBtnScreenCreate.ball.x = mainFunc.ballBtnScreenCreate.ball.x
            mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballBtnScreenCreate.ball, mainFunc)

            for c = 1, #shapeArray do
                for d = 1, #mainFunc.allLevelSettings.transitionArrayIndex do
                    local transition = mainFunc.allLevelSettings.transitionArrayIndex[d];
                    if transition["shapeName"] == shapeArrayParameters[c]["name"]
                    and (transition["transitionType"] == "autoSlide"
                        or (transition["transitionType"] == "switchSlide" and transition["props"]["isEnabledByDefault"]) )
                    and shapeArrayParameters[c]["location"]["xScreen"] == mainFunc.thisLevelSettings.thisScreenHorzValue
                    and shapeArrayParameters[c]["location"]["yScreen"] == mainFunc.thisLevelSettings.thisScreenVertValue
                    and shapeArray[c].mainFuncListenerAdded == false then
                        if shapeArray[c].isAutoSlideObject then
                            if #shapeArray[c].autoSlideTransition > 0 then
                                for z = 1, #shapeArray[c].autoSlideTransition do
                                    transition.resume(shapeArray[c].autoSlideTransition[z])
                                end
                            end
                            if #shapeArray[c].autoSlideTimer > 0 then
                                for z = 1, #shapeArray[c].autoSlideTimer do
                                    timer.resume(shapeArray[c].autoSlideTimer[z])
                                end
                            end
                        else
                            mainFunc.activateAutoSlideObject(mainFunc, shapeArray, c, d)
                        end
                    elseif transition["shapeName"] == shapeArrayParameters[c]["name"]
                    and (transition["transitionType"] == "autoSlide"
                        or (transition["transitionType"] == "switchSlide" and transition["props"]["isEnabledByDefault"]) )
                    and shapeArrayParameters[c]["location"]["xScreen"] == lastScreenHorzValue
                    and shapeArrayParameters[c]["location"]["yScreen"] == lastScreenVertValue then
                        if #shapeArray[c].autoSlideTransition > 0 then
                            for z = 1, #shapeArray[c].autoSlideTransition do
                                transition.pause(shapeArray[c].autoSlideTransition[z])
                            end
                        end
                        if #shapeArray[c].autoSlideTimer > 0 then
                            for z = 1, #shapeArray[c].autoSlideTimer do
                                timer.pause(shapeArray[c].autoSlideTimer[z])
                            end
                        end
                    end
                end
            end
        end

        mainFunc.screenChangingScript.mapButtonStateCheck(mainFunc)
        timer.performWithDelay(100, function () t.resettingScreenChangeCounter(mainFunc) end, 1)

    end
    
    if screenChangeType == "auto" then
        screenChangeTime = 400    
    else
        screenChangeTime = 275
    end

    thisNewScreenChangeXTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.x
    thisNewScreenChangeYTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.y


    if thisChangeScreenDirection == "left" then
        thisNewScreenChangeXTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.x + display.contentWidth
        mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.thisLevelSettings.thisScreenHorzValue - 1
    elseif thisChangeScreenDirection == "right" then
        thisNewScreenChangeXTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.x - display.contentWidth
        mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.thisLevelSettings.thisScreenHorzValue + 1
    elseif thisChangeScreenDirection == "up" then
        thisNewScreenChangeYTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.y + display.contentHeight
        mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.thisLevelSettings.thisScreenVertValue - 1
    elseif thisChangeScreenDirection == "down" then
        thisNewScreenChangeYTarget = mainFunc.allLevelSettings.backgroundObjectsGroup.y - display.contentHeight
        mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.thisLevelSettings.thisScreenVertValue + 1
    end

    if screenChangeType == "auto" then
        if (thisChangeScreenDirection == "up"
        or thisChangeScreenDirection == "down") then
            if thisChangeScreenDirection == "up" then
                doorTransitionFactor = -1
            elseif thisChangeScreenDirection == "down" then
                doorTransitionFactor = 1
            end
            mainFunc.allLevelSettings.ballScreenVertValue = mainFunc.allLevelSettings.ballScreenVertValue + (doorTransitionFactor)
            mainFunc.allLevelSettings.bottomScreenEdge = mainFunc.allLevelSettings.bottomScreenEdge + (doorTransitionFactor * display.contentHeight)
            mainFunc.allLevelSettings.topScreenEdge = mainFunc.allLevelSettings.topScreenEdge + (doorTransitionFactor * display.contentHeight)
        else
            if thisChangeScreenDirection == "left" then
                doorTransitionFactor = -1
            elseif thisChangeScreenDirection == "right" then
                doorTransitionFactor = 1
            end

            mainFunc.allLevelSettings.ballScreenHorzValue = mainFunc.allLevelSettings.ballScreenHorzValue + (doorTransitionFactor)
            mainFunc.allLevelSettings.rightScreenEdge = mainFunc.allLevelSettings.rightScreenEdge + (doorTransitionFactor * display.contentWidth)
            mainFunc.allLevelSettings.leftScreenEdge = mainFunc.allLevelSettings.leftScreenEdge + (doorTransitionFactor * display.contentWidth)
        end
    end
    
    transition.to(mainFunc.backgroundGrids, {x=thisNewScreenChangeXTarget, y=thisNewScreenChangeYTarget, time=screenChangeTime})
    transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {x=thisNewScreenChangeXTarget, y=thisNewScreenChangeYTarget, time=screenChangeTime})
    transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {x=thisNewScreenChangeXTarget, y=thisNewScreenChangeYTarget, time=screenChangeTime})
    transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {x=thisNewScreenChangeXTarget, y=thisNewScreenChangeYTarget, time=screenChangeTime})
    transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {x=thisNewScreenChangeXTarget, y=thisNewScreenChangeYTarget, time=screenChangeTime, onComplete=finishScreenChange})

        
end
    t.changeToRightScreen = changeToRightScreen


---  SCREEN INITIALISERS ---

local activateObjectsForPlay = function (mainFunc, shapeArray, shapeArrayParameters)


    for c=1, #shapeArray do

        if shapeArrayParameters[c]["type"] == "shape"
        or shapeArrayParameters[c]["type"] == "gun" then
            shapeArray[c]:addEventListener("collision", mainFunc.on_Triangle_Collision)
        elseif shapeArrayParameters[c]["type"] == "manualFan" 
        or shapeArrayParameters[c]["type"] == "spitter" 
        or shapeArrayParameters[c]["type"] == "simple"
        or shapeArrayParameters[c]["type"] == "backFire"
        or shapeArrayParameters[c]["type"] == "characterChangePoint" then
            mainFunc.activateObjectsForPlay(mainFunc, shapeArray, c)
            if shapeArrayParameters[c]["type"] == "characterChangePoint" then
                --shapeArray[c].button:addEventListener("touch", mainFunc.listener)
                --shapeArray[c].button.mainFuncListenerAdded = true
            end
        end
        
        for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
            local transition = mainFunc.allLevelSettings.transitionArrayIndex[d];
            
            if transition["shapeName"] == shapeArrayParameters[c]["name"]
            and transition["transitionType"] ~= "autoSlide"
            and transition["transitionType"] ~= "switchSlide"
            and shapeArray[c].mainFuncListenerAdded == false then
                shapeArray[c]:addEventListener("touch", mainFunc.listener)
                shapeArray[c].mainFuncListenerAdded = true
            elseif transition["shapeName"] == shapeArrayParameters[c]["name"]
            and (transition["transitionType"] == "autoSlide"
                or (transition["transitionType"] == "switchSlide" and transition["props"]["isEnabledByDefault"]) )
            and shapeArrayParameters[c]["location"]["xScreen"] == mainFunc.thisLevelSettings.thisScreenHorzValue
            and shapeArrayParameters[c]["location"]["yScreen"] == mainFunc.thisLevelSettings.thisScreenVertValue
            and shapeArray[c].mainFuncListenerAdded == false then
                mainFunc.activateAutoSlideObject(mainFunc, shapeArray, c, d)
            end
        end
    end

    if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
        if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onLevelStart"] then
            mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onLevelStart"](mainFunc, shapeArray)
        end    
    end

    if #mainFunc.thisLevelSettings.tutorialsToDo > 0 then
        mainFunc.tutorialPopUp = {}
        mainFunc.popUpTimer = {}

        mainFunc.popUpIntroTutorial(mainFunc, 1, mainFunc.thisLevelSettings.tutorialsToDo[1], mainFunc.allLevelSettings.tutorialPopUpParams[mainFunc.thisLevelSettings.tutorialsToDo[1]], true)

    end

end

local initialReturnToBallScreen = function (mainFunc, returnType, shapeArray, shapeArrayParameters)
    function endReturnToBallScreenTransition ()
        
        mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.allLevelSettings.ballScreenHorzValue
        mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.allLevelSettings.ballScreenVertValue
        
        mainFunc.ballBtnScreenCreate.backBtn:addEventListener( "tap", mainFunc.buttonListener )

        if (returnType == "initialReturn") then
            transition.to(mainFunc.ballBtnScreenCreate.randomBtn, {alpha=1, time=400})
            transition.to(mainFunc.ballBtnScreenCreate.backBtn, {alpha=1, time=400})
            transition.to(mainFunc.ballBtnScreenCreate.playBtn, {alpha=1, time=400})
            transition.to(mainFunc.ballBtnScreenCreate.mapShowAndClockLabel, {alpha=1, time=400})

            mainFunc.ballBtnScreenCreate.randomBtn:addEventListener( "tap", mainFunc.buttonListener )
            mainFunc.ballBtnScreenCreate.playBtn:addEventListener( "tap", mainFunc.buttonListener )

            activateObjectsForPlay(mainFunc, shapeArray, shapeArrayParameters)
        elseif (returnType == "returnFromMap") then

            local function addButtonsBack ()
                transition.to (mainFunc.ballBtnScreenCreate.mapScreen, {alpha=0, time=100, onComplete= function ()
                    mainFunc.ballBtnScreenCreate.playBtn:setSequence("default")
                    end
                })
                
                if mainFunc.allLevelSettings.isBallMovingState == "true" then
                    -- mainFunc.allLevelSettings.shouldBallMoveState = "true"
                    if (mainFunc.ballBtnScreenCreate.ball.isWaitingForMovement
                    and mainFunc.ballBtnScreenCreate.ball.isWaitingForMovement == true) then
                        mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballBtnScreenCreate.ball, mainFunc)
                        mainFunc.ballBtnScreenCreate.ball.isWaitingForMovement = false
                    else 
                        mainFunc.tm["ball"][mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex]:resumeAll()
                    end
                end

                if (mainFunc.allLevelSettings.bulletHasFired == true) then
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
                        end
                    end
                end

                if #mainFunc.thisLevelSettings.bombArray > 0 then
                    for a =1, #mainFunc.thisLevelSettings.bombArray do
                        timer.resume(mainFunc.thisLevelSettings.bombArray[a].timer)
                    end
                end

                mainFunc.allLevelSettings.isScreenPausedState = false
                
                if mainFunc.allLevelSettings.pauseButtonsEnabled == true then
                    Runtime:addEventListener( "enterFrame", mainFunc.autoFanTransitionListener)
                end
                
                if mainFunc.allLevelSettings.stillTransitioningCounter == 1 then
                    Runtime:addEventListener( "enterFrame", mainFunc.transitionMoveSomething) 
                end
            
                if (mainFunc.thisLevelSettings.compassObtained == false) then
                    --mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
                    for c=1, #shapeArray do
                        if (shapeArrayParameters[c]["type"] == "manualFan" or shapeArrayParameters[c]["type"] == "spitter")
                        and shapeArray[c].mainFuncListenerAdded == false then
                            shapeArray[c]:addEventListener( "touch", mainFunc.listener )
                            shapeArray[c].mainFuncListenerAdded = true
                        end    
                        
                        -- for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
                        --     if transition["shapeName"] == mainFunc.allLevelSettings.shapeArrayParameters[c]["name"] then
                        --         mainFunc.allLevelSettings.shapeArray[c]:addEventListener("touch", mainFunc.listener)
                        --     end
                        -- end
                    end
                end
            
            end
            timer.performWithDelay(150, addButtonsBack, 1)
        end
        
        mainFunc.screenChangingScript.mapButtonStateCheck(mainFunc)
    end

    if (mainFunc.thisLevelSettings.thisScreenHorzValue ~= mainFunc.allLevelSettings.ballScreenHorzValue
    or mainFunc.thisLevelSettings.thisScreenVertValue ~= mainFunc.allLevelSettings.ballScreenVertValue) then

        if mainFunc.thisLevelSettings.thisScreenHorzValue > mainFunc.allLevelSettings.ballScreenHorzValue then
            totalReturnToBallHorzTransition = (mainFunc.thisLevelSettings.thisScreenHorzValue - mainFunc.allLevelSettings.ballScreenHorzValue) * display.contentWidth
        else
            totalReturnToBallHorzTransition = (mainFunc.allLevelSettings.ballScreenHorzValue - mainFunc.thisLevelSettings.thisScreenHorzValue) * display.contentWidth
        end

        totalReturnToBallVertTransition = (mainFunc.thisLevelSettings.thisScreenVertValue - mainFunc.allLevelSettings.ballScreenVertValue ) * display.contentHeight

        transition.to(mainFunc.backgroundGrids, {time = 300, x = mainFunc.backgroundGrids.x + totalReturnToBallHorzTransition, y = mainFunc.backgroundGrids.y + totalReturnToBallVertTransition})
        transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.backgroundObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.backgroundObjectsGroup.y + totalReturnToBallVertTransition})
        transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.screenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.screenObjectsGroup.y + totalReturnToBallVertTransition})
        transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.midScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.midScreenObjectsGroup.y + totalReturnToBallVertTransition})
        transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.frontScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.frontScreenObjectsGroup.y + totalReturnToBallVertTransition, onComplete = endReturnToBallScreenTransition})

    else
        endReturnToBallScreenTransition()
    end
            
end
    t.initialReturnToBallScreen = initialReturnToBallScreen


local toolArrayCounterCheck = function (mainFunc)
    toolArrayCounter = 0
    for a = 1, #mainFunc.thisLevelSettings.toolArray do
        toolArrayCounter = toolArrayCounter + 1
    end
    if toolArrayCounter > 0 then
        --mainFunc.ballBtnScreenCreate.itemBtn:addEventListener( "touch", mainFunc.buttonListener )
        mainFunc.thisLevelSettings.hasToolArray = true
    else
        mainFunc.thisLevelSettings.hasToolArray = false
    end
end

local screenInitialiserInTransition = function (nextScreenInitialiserTransition, screenInitialiserHorzTransition, screenInitialiserVertTransition, relevantHorzScreen, relevantHorzScreenFactor, numberOfHorzScreens, mainFunc, shapeArray, shapeArrayParameters)
    
    if t.nextScreenInitialiserTransition == "horizontal"
    and t.screenInitialiserHorzTransition == "incomplete" then
        function endHorzScreenInitialiserTrans()
            --t.screenInitialiserHorzValue = relevantHorzScreen
            t.screenInitialiserHorzTransition = "complete"
            
            if mainFunc.thisLevelSettings.thisScreenVertValue < mainFunc.thisLevelSettings.screenVertTotal then
                mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.thisLevelSettings.thisScreenVertValue + 1
                t.screenInitialiserVertTransition = "incomplete"
                t.nextScreenInitialiserTransition = "vertical"
            end
            t.screenInitialiserInTransition(t.nextScreenInitialiserTransition, t.screenInitialiserHorzTransition, t.screenInitialiserVertTransition, t.relevantHorzScreen, t.relevantHorzScreenFactor, t.numberOfHorzScreens, mainFunc, shapeArray, shapeArrayParameters)
        end

        transition.to(mainFunc.backgroundGrids, {time = (600 * t.numberOfHorzScreens), x = mainFunc.backgroundGrids.x + (relevantHorzScreenFactor * display.contentWidth * t.numberOfHorzScreens)})
        transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {time = (600 * t.numberOfHorzScreens), x = mainFunc.allLevelSettings.backgroundObjectsGroup.x + (relevantHorzScreenFactor * display.contentWidth * t.numberOfHorzScreens)})
        transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {time = (600 * t.numberOfHorzScreens), x = mainFunc.allLevelSettings.screenObjectsGroup.x + (relevantHorzScreenFactor * display.contentWidth * t.numberOfHorzScreens)})
        transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {time = (600 * t.numberOfHorzScreens), x = mainFunc.allLevelSettings.midScreenObjectsGroup.x + (relevantHorzScreenFactor * display.contentWidth * t.numberOfHorzScreens)})
        transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {time = (600 * t.numberOfHorzScreens), x = mainFunc.allLevelSettings.frontScreenObjectsGroup.x + (relevantHorzScreenFactor * display.contentWidth * t.numberOfHorzScreens), onComplete = endHorzScreenInitialiserTrans})

    end
    
    if t.nextScreenInitialiserTransition == "vertical"
    and t.screenInitialiserVertTransition == "incomplete" then
        function endVertScreenInitialiserTrans ()
            if mainFunc.thisLevelSettings.thisScreenVertValue < mainFunc.thisLevelSettings.screenVertTotal + 1 then
                t.screenInitialiserHorzTransition = "incomplete"
            end
            if mainFunc.thisLevelSettings.thisScreenVertValue % 2 == 0 then
                t.relevantHorzScreen = 1
                t.relevantHorzScreenFactor = 1
                mainFunc.thisLevelSettings.thisScreenHorzValue = 1
            else
                t.relevantHorzScreen = mainFunc.thisLevelSettings.screenHorzTotal
                t.relevantHorzScreenFactor = -1
                mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.thisLevelSettings.screenHorzTotal
            end
            
            t.nextScreenInitialiserTransition = "horizontal"
            t.screenInitialiserVertTransition = "complete"
            t.screenInitialiserInTransition(t.nextScreenInitialiserTransition, t.screenInitialiserHorzTransition, t.screenInitialiserVertTransition, t.relevantHorzScreen, t.relevantHorzScreenFactor, t.numberOfHorzScreens, mainFunc, shapeArray, shapeArrayParameters)
            
        end
        
        transition.to(mainFunc.backgroundGrids, {time = 600, y = mainFunc.backgroundGrids.y - display.contentHeight})
        transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {time = 600, y = mainFunc.allLevelSettings.backgroundObjectsGroup.y - display.contentHeight})
        transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {time = 600, y = mainFunc.allLevelSettings.screenObjectsGroup.y - display.contentHeight})
        transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {time = 600, y = mainFunc.allLevelSettings.midScreenObjectsGroup.y - display.contentHeight})
        transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {time = 600, y = mainFunc.allLevelSettings.frontScreenObjectsGroup.y - display.contentHeight, onComplete = endVertScreenInitialiserTrans})

    end
    
    if t.screenInitialiserHorzTransition == "complete"
    and t.screenInitialiserVertTransition == "complete" then
        --mapButtonStateCheck()

        toolArrayCounterCheck(mainFunc)
        myGameSettings[currentWorld]["levels"][currentLevel]["intro_complete"] = true
        returnType = "initialReturn"
        saveTable(myGameSettings, "myGameSettings.json")

        t.initialReturnToBallScreen(mainFunc, returnType, shapeArray, shapeArrayParameters)
        --t.screenInitialiserInTransition(screenInitialiserInTransition, nextScreenInitialiserTransition, screenInitialiserHorzTransition, mainFunc)
    end
end
    t.screenInitialiserInTransition = screenInitialiserInTransition

local screenInitialiser = function (mainFunc, shapeArray, shapeArrayParameters)           

    t.screenInitialiserHorzTransition = "incomplete"
    t.screenInitialiserVertTransition = "complete"
    t.nextScreenInitialiserTransition = "horizontal"
    t.screenInitialiserVertValue = 1
    t.relevantHorzScreen = mainFunc.thisLevelSettings.screenHorzTotal - 1
    t.relevantHorzScreenFactor = -1
    t.numberOfHorzScreens = mainFunc.thisLevelSettings.screenHorzTotal - 1
    t.screenInitialiserInTransition(t.nextScreenInitialiserTransition, t.screenInitialiserHorzTransition, t.screenInitialiserVertTransition, t.relevantHorzScreen, t.relevantHorzScreenFactor, t.numberOfHorzScreens, mainFunc, shapeArray, shapeArrayParameters)
    screenInitialiserInTransition = true
end
    t.screenInitialiser = screenInitialiser

local shortScreenInitialiser = function (mainFunc, gameSetting, shapeArray, shapeArrayParameters)    
   
    mainFunc.backgroundGrids.x = mainFunc.backgroundGrids.x - (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))   
    mainFunc.allLevelSettings.backgroundObjectsGroup.x = mainFunc.allLevelSettings.backgroundObjectsGroup.x - (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
    mainFunc.allLevelSettings.screenObjectsGroup.x = mainFunc.allLevelSettings.screenObjectsGroup.x - (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
    mainFunc.allLevelSettings.midScreenObjectsGroup.x = mainFunc.allLevelSettings.midScreenObjectsGroup.x - (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
    mainFunc.allLevelSettings.frontScreenObjectsGroup.x = mainFunc.allLevelSettings.frontScreenObjectsGroup.x - (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
    
    mainFunc.backgroundGrids.y = mainFunc.backgroundGrids.y - (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
    mainFunc.allLevelSettings.backgroundObjectsGroup.y = mainFunc.allLevelSettings.backgroundObjectsGroup.y - (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
    mainFunc.allLevelSettings.screenObjectsGroup.y = mainFunc.allLevelSettings.screenObjectsGroup.y - (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
    mainFunc.allLevelSettings.midScreenObjectsGroup.y = mainFunc.allLevelSettings.midScreenObjectsGroup.y - (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
    mainFunc.allLevelSettings.frontScreenObjectsGroup.y = mainFunc.allLevelSettings.frontScreenObjectsGroup.y - (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
    
    mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.allLevelSettings.ballScreenHorzValue
    mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.allLevelSettings.ballScreenVertValue
    
    mainFunc.ballBtnScreenCreate.playBtn:addEventListener( "tap", mainFunc.buttonListener )
    mainFunc.ballBtnScreenCreate.backBtn:addEventListener( "tap", mainFunc.buttonListener )
    mainFunc.ballBtnScreenCreate.randomBtn:addEventListener( "tap", mainFunc.buttonListener )

    toolArrayCounter = 0

    for a = 1, #mainFunc.thisLevelSettings.toolArray do
        toolArrayCounter = toolArrayCounter + 1
    end
    if mainFunc.thisLevelSettings.itemBagButtonsVisible then
        mainFunc.ballBtnScreenCreate.itemBtn:addEventListener( "tap", mainFunc.buttonListener )
        transition.to(mainFunc.ballBtnScreenCreate.itemBtn, {alpha=1, time=400})
        if (mainFunc.ballBtnScreenCreate.itemBtn.img
        and mainFunc.ballBtnScreenCreate.itemBtn.img ~= nil) then
            transition.to(mainFunc.ballBtnScreenCreate.itemBtn.img, {alpha=1, time=400})
        end
        
        transition.to(mainFunc.ballBtnScreenCreate.itemBagBtn, {alpha=1, time=400})
        mainFunc.ballBtnScreenCreate.itemBagBtn:addEventListener( "tap", mainFunc.buttonListener )
        mainFunc.thisLevelSettings.hasToolArray = true
    end

    if mainFunc.thisLevelSettings.mapObtained then
        mainFunc.ballBtnScreenCreate.playBtn.alpha = 1
    end

    toolArrayCounterCheck(mainFunc)
    
    mapButtonStateCheck(mainFunc)
    
    function removeIntroScreenStarter ()
        t.removeIntroScreen(mainFunc, gameSetting, shapeArray, shapeArrayParameters)
    end

    timer.performWithDelay(1050, removeIntroScreenStarter, 1)
end
    t.shortScreenInitialiser = shortScreenInitialiser


local removeIntroScreen = function (mainFunc, gameSetting, shapeArray, shapeArrayParameters)
    transition.to(mainFunc.ballBtnScreenCreate.introScreen, {y = mainFunc.ballBtnScreenCreate.introScreen.y + display.contentHeight, time = 150, onComplete = function ()
        mainFunc.levelTimerUpdateTimer = timer.performWithDelay(100, function ()
            mainFunc.updateMainLevelTimer(mainFunc, shapeArray, shapeArrayParameters)
        end, 1000)
    end})

    if (gameSetting == true) then
        mainFunc.thisLevelSettings.thisIsFirstAttempt = false
        if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["level_attempted"] == false then
            mainFunc.thisLevelSettings.thisIsFirstAttempt = true
            myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["level_attempted"] = true
            saveTable(myGameSettings, "myGameSettings.json")
        end

        for a = 1, #mainFunc.ballBtnScreenCreate.introScreen.valueText do
            transition.to(mainFunc.ballBtnScreenCreate.introScreen.valueText[a], {y = mainFunc.ballBtnScreenCreate.introScreen.valueText[a].y + display.contentHeight, time = 150})
        end

        activateObjectsForPlay(mainFunc, shapeArray, shapeArrayParameters)
    else
        --transition.to(mainFunc.ballBtnScreenCreate.introScreen.valueText, {alpha = 0, time = 750, onComplete = function () t.screenInitialiser(mainFunc, shapeArray, shapeArrayParameters) end})
    end
end
    t.removeIntroScreen = removeIntroScreen

return t
