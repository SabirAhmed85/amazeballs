
local t = {}

-- Listens for event of player clicking on an object like a Triangle, a Fan, a CharacterChangePoint

--------- MAP DIRECTION BUTTONS-----------
local objectListener = function (event, mainFunc, shapeArray, shapeArrayParameters)

    if event.target.objectType == "characterChangePointButton" then
        local characterChangeSprites, characterChangePointDisplay, chooseCharacter, spriteSequenceData, closeChooseCharacter, characterChangeBg
        local isSpecificCharacter = false
        local originalButton = event.target

        if originalButton.relatedObject.specificCharacter ~= nil then
            isSpecificCharacter = true
        end
        originalButton.relatedObject.bigDirectionArrow.alpha = 0.3
        originalButton.alpha = 0.3

        closeChooseCharacter = function (event)
            local counter = 0
            local newCounter = 0
            for key, val in pairs(characterChangePointDisplay) do
                counter = counter + 1
            end
            for key, val in pairs(characterChangePointDisplay) do
                transition.to(characterChangePointDisplay[key], {alpha = 0, time = 150, onComplete = function ()
                    characterChangePointDisplay[key]:removeEventListener("tap", chooseCharacter)
                    characterChangePointDisplay[key]:removeSelf()
                    characterChangePointDisplay[key] = nil
                    newCounter = newCounter + 1

                    if newCounter == counter then
                        characterChangeBg.closeButton:removeEventListener("tap", closeChooseCharacter)
                        characterChangeBg.closeButton:removeSelf()
                        characterChangeBg.closeButton = nil

                        if characterChangeProfileBg then
                            characterChangeProfileBg:removeSelf()
                            characterChangeProfileBg = nil

                            characterChangeProfile:removeSelf()
                            characterChangeProfile = nil
                        end

                        characterChangeBg:removeSelf()
                        characterChangeBg = nil

                        mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
                        mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
                        mainFunc.buttonListenerScript.addBackItemButtonListenersForItemGained(mainFunc)
                        mainFunc.buttonListenerScript.addBackButtonListenersForItemGained(mainFunc)
                    end
                end})
            end

            originalButton.relatedObject.bigDirectionArrow.alpha = 1
            originalButton.alpha = 1

            characterChangeOverlay:removeEventListener("tap", mainFunc.dummyListener)
            characterChangeOverlay:removeEventListener("touch", mainFunc.dummyListener)
            characterChangeOverlay:removeSelf()
            characterChangeOverlay = nil

        end

        chooseCharacter = function (event)
            for key, val in pairs(characterChangePointDisplay) do
                characterChangePointDisplay[key]:removeEventListener("tap", chooseCharacter)
            end

            local currentBall = mainFunc.ballBtnScreenCreate.ball
            local prevDirection = mainFunc.ballBtnScreenCreate.ball.direction
            local prevX = currentBall.x
            local prevY = currentBall.y
            mainFunc.ballBtnScreenCreate.ball:removeSelf()
            mainFunc.ballBtnScreenCreate.ball = nil
            local sheetSequenceData = mainFunc.allLevelSettings.specialCharacterInLevelSequenceData
            if event.target.value == "normal" then
                sheetSequenceData = mainFunc.allLevelSettings.normalCharacterInLevelSequenceData
            end
            mainFunc.ballBtnScreenCreate.ball = display.newSprite(mainFunc.allLevelSettings.characterInLevelImageSheet[event.target.value], sheetSequenceData)
            physics.addBody( mainFunc.ballBtnScreenCreate.ball, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
            mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballBtnScreenCreate.ball )
            mainFunc.ballBtnScreenCreate.ball.width = 31
            mainFunc.ballBtnScreenCreate.ball.height = 34
            mainFunc.ballBtnScreenCreate.ball.character = event.target.value
            mainFunc.ballBtnScreenCreate.ball.projectileType = "ball"
            mainFunc.ballBtnScreenCreate.ball.direction = prevDirection
            mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex = 0
            mainFunc.ballBtnScreenCreate.ball.transitionId = mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex
            mainFunc.ballBtnScreenCreate.ball.gravityScale = 0
            mainFunc.ballBtnScreenCreate.ball.x = prevX
            mainFunc.ballBtnScreenCreate.ball.y = prevY
            mainFunc.ballBtnScreenCreate.ball.isFixedRotation = true
            mainFunc.ballBtnScreenCreate.ball.character = event.target.value
            mainFunc.ballBtnScreenCreate.ball.autoFanCounter = 0
            mainFunc.ballBtnScreenCreate.ball.fanCenteringCounter = 0
            mainFunc.ballBtnScreenCreate.ball.movementSpeed = 100
            mainFunc.ballBtnScreenCreate.ball.transitioning = false
            mainFunc.ballBtnScreenCreate.ball:toFront()
            mainFunc.ballBtnScreenCreate.ball:setSequence(prevDirection)
            mainFunc.ballBtnScreenCreate.ball:play()
            mainFunc.ballBtnScreenCreate.ball.specialConditionsArray = {}

            timer.performWithDelay(
                200,
                closeChooseCharacter()
            )
        end

        mainFunc.buttonListenerScript.removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        mainFunc.buttonListenerScript.removeButtonListenersForItemGained(mainFunc)
        mainFunc.buttonListenerScript.removeItemButtonListenersForItemGained(mainFunc)

        characterChangePointDisplay = {}

        characterChangeSprites = {}

        thisMyGameSettings = loadTable("myGameSettings.json")
        local xVal = 68

        characterChangeOverlay = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
        characterChangeOverlay:setFillColor(0,0,0)
        characterChangeOverlay.alpha = 0.2
        characterChangeOverlay:addEventListener("tap", mainFunc.dummyListener)
        characterChangeOverlay:addEventListener("touch", mainFunc.dummyListener)

        characterChangeBg = display.newImageRect("images/objects/Layout/characterSelectMenu.png", 443, 133)
        characterChangeBg.width = (443/480) * display.contentWidth
        characterChangeBg.height = (133/320) * display.contentHeight
        characterChangeBg.x = display.contentWidth / 2
        characterChangeBg.y = (245/320) * display.contentHeight

        characterChangeBg.closeButton = display.newImageRect("images/objects/Layout/characterSelectMenu_close.png", 65, 48)
        characterChangeBg.closeButton.width = (45/480) * display.contentWidth
        characterChangeBg.closeButton.height = (48/320) * display.contentHeight
        characterChangeBg.closeButton.x = (415/480) * display.contentWidth
        characterChangeBg.closeButton.y = (255/320) * display.contentHeight
        characterChangeBg.closeButton:addEventListener("tap", closeChooseCharacter)

        for a = 1, #mainFunc.characterConfigArray do
            key = mainFunc.characterConfigArray[a]

            if (isSpecificCharacter == false and myGameSettings["characterUnlocked"][key]) or (isSpecificCharacter and key == event.target.relatedObject.specificCharacter) then
            --if thisMyGameSettings["characterUnlocked"][key] == true then
                if isSpecificCharacter and mainFunc.ballBtnScreenCreate.ball.character == key then
                    key = "normal"
                end
                characterChangeSprites[key] = {}

                characterChangePointDisplay[key] = display.newSprite(mainFunc.allLevelSettings.charactersIconsImageSheet, mainFunc.allLevelSettings.charactersIconsSequenceData)
                characterChangePointDisplay[key]:setSequence(key)
                characterChangePointDisplay[key].x = (xVal/480) * display.contentWidth
                characterChangePointDisplay[key].y = (258/320) * display.contentHeight
                characterChangePointDisplay[key].xScale = 0.6
                characterChangePointDisplay[key].yScale = 0.6
                characterChangePointDisplay[key].value = key
                characterChangePointDisplay[key]:addEventListener("tap", chooseCharacter)

                xVal = xVal + 85.5
            --end
            end
        end

        if isSpecificCharacter then
            characterChangeProfileBg = display.newImageRect("images/objects/Layout/characterSelectMenu-characterBoard.png", 251, 77)
            characterChangeProfileBg.x = xCalc(239.5)
            characterChangeProfileBg.y = yCalc(258)
            characterChangeProfileBg.width = xCalc(251)
            characterChangeProfileBg.height = yCalc(77)

            characterChangeProfile = display.newSprite(mainFunc.allLevelSettings.characterProfileTextImageSheet, mainFunc.allLevelSettings.characterProfileTextSequenceData)
            characterChangeProfile:setSequence(event.target.relatedObject.specificCharacter)
            characterChangeProfile.x = xCalc(223.5)
            characterChangeProfile.y = yCalc(258)
        end
        
    else

        for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
            if (mainFunc.allLevelSettings.transitionArrayIndex[d][2][1] == "flip-horizontal"
            or mainFunc.allLevelSettings.transitionArrayIndex[d][2][1] == "flip-vertical")
            and event.target.name == transitionArrayIndex[d][1][1] then
                if mainFunc.ballBtnScreenCreate.ball.x > (event.target.x - 60)
                and mainFunc.ballBtnScreenCreate.ball.x < (event.target.x + 60)
                and mainFunc.ballBtnScreenCreate.ball.y > (event.target.y - 60)
                and mainFunc.ballBtnScreenCreate.ball.y < (event.target.y + 60) then
                    event.target.flipDisabled = true
                    thisFlippedCounterObject = event.target
                    local function addThisCounterBack ()
                        thisFlippedCounterObject.flipDisabled = false
                    end
                    timer.performWithDelay(400, addThisCounterBack)
                else
                    if event.phase == "began"
                    and event.target.flipDisabled ~= true then
                        if (event.target.relevantHorzScreen  == mainFunc.allLevelSettings.ballScreenHorzValue and event.target.relevantVertScreen == mainFunc.allLevelSettings.ballScreenVertValue and mainFunc.allLevelSettings.mapShowCounter == 0)
                        or (mainFunc.thisLevelSettings.compassObtained == true and (event.target.relevantHorzScreen  ~= mainFunc.allLevelSettings.ballScreenHorzValue or event.target.relevantVertScreen ~= mainFunc.allLevelSettings.ballScreenVertValue)) then
                            display.getCurrentStage():setFocus(event.target)
                            event.target.isFocus = true
                            thisFlipDirection = transitionArrayIndex[d][2][1]
                            mainFunc.objectFlipScript.positionNewFlippedObject(event.target, thisFlipDirection, flipVerticalCounter, mainFunc)
                        end
                    else
                        if event.target.isFocus == true then
                            flipVerticalCounter = 0
                            event.target.isFocus = false
                            display.getCurrentStage():setFocus( nil )
                        end
                    end
                end
            elseif mainFunc.allLevelSettings.transitionArrayIndex[d][2][1] == "slide" then
                if event.target.name == transitionArrayIndex[d][1][1] and stillTransitioningCounter == 0 and event.target.transitionCounter == 0 then
                    
                    if event.phase == "began"
                    and mainFunc.allLevelSettings.ballActivateButtonSet == false
                    and event.target.canShapeSlide == true then
                        if (event.target.relevantHorzScreen  == mainFunc.allLevelSettings.ballScreenHorzValue and event.target.relevantVertScreen == mainFunc.allLevelSettings.ballScreenVertValue and mainFunc.allLevelSettings.mapShowCounter == 0)
                        or (mainFunc.thisLevelSettings.compassObtained == true and (event.target.relevantHorzScreen  ~= mainFunc.allLevelSettings.ballScreenHorzValue or event.target.relevantVertScreen ~= mainFunc.allLevelSettings.ballScreenVertValue)) then
                            
                            mainFunc.allLevelSettings.currentSlidingObject = event.target
                            --thisTransitionObject = event.target
                            mainFunc.allLevelSettings.currentSlidingObject.objectType = event.target.objectType
                            mainFunc.allLevelSettings.currentSlidingObject.enabled = event.target.enabled
                            mainFunc.allLevelSettings.currentSlidingObject.alpha = event.target.alpha
                            mainFunc.allLevelSettings.currentSlidingObject.newDVal = d
                            transitionMoveCounter = 0
                            object1Counter = 0
                            eventStartX = event.x
                            eventStartY = event.y
                            eventStartTime = event.time
                        end
                        
                    elseif event.phase == "moved"
                    and mainFunc.allLevelSettings.stillTransitioningCounter == 0
                    and mainFunc.allLevelSettings.ballActivateButtonSet == false
                    and event.target.canShapeSlide == true then
                        display.getCurrentStage():setFocus(event.target)
                        event.target.isFocus = true
                        eventMove = "true"
                        eventNewX = event.x
                        eventNewY = event.y
                        eventEndTime = event.time
                        if eventStartY ~= null and eventStartX ~= null then
                            ySwipe = eventNewY - eventStartY
                            xSwipe = eventNewX - eventStartX
                        else
                            xSwipe = 0
                            ySwipe = 0
                        end
                        if eventStartTime ~= null then
                            eventTotalTime = eventEndTime - eventStartTime
                        else
                            eventTotalTime = 0
                        end
                        
                        local function startTransitionMoveSomething ()

                            event.target.transitionCounter = 1
                            mainFunc.allLevelSettings.stillTransitioningCounter = 1
                            event.target.additionalCounterForDummyConnector = 0
                            event.target.enabled = false

                            -- for a = 1, #mainFunc.thisLevelSettings.bombArray do
                            --     if mainFunc.thisLevelSettings.bombArray[a].relevantHorzSquare == event.target.relevantHorzSquare
                            --     and mainFunc.thisLevelSettings.bombArray[a].relevantVertSquare == event.target.relevantVertSquare
                            --     and mainFunc.thisLevelSettings.bombArray[a].relevantHorzScreen == event.target.relevantHorzScreen
                            --     and mainFunc.thisLevelSettings.bombArray[a].relevantHorzScreen == event.target.relevantHorzScreen then
                            --         mainFunc.allLevelSettings.frontScreenObjectsGroup:remove(mainFunc.thisLevelSettings.bombArray[a])
                            --         mainFunc.allLevelSettings.backgroundObjectsGroup:insert(mainFunc.thisLevelSettings.bombArray[a])

                            --         mainFunc.allLevelSettings.frontScreenObjectsGroup:remove(mainFunc.thisLevelSettings.bombArray[a].numberOfSquaresLabel)
                            --         mainFunc.allLevelSettings.backgroundObjectsGroup:insert(mainFunc.thisLevelSettings.bombArray[a].numberOfSquaresLabel)

                            --         for b = 1, #mainFunc.thisLevelSettings.bombArray[a].directionLabel do
                            --             mainFunc.allLevelSettings.frontScreenObjectsGroup:remove(mainFunc.thisLevelSettings.bombArray[a].directionLabel[b])
                            --             mainFunc.allLevelSettings.backgroundObjectsGroup:insert(mainFunc.thisLevelSettings.bombArray[a].directionLabel[b])
                            --         end

                            --         mainFunc.thisLevelSettings.bombArray[a]:toBack()
                            --     end
                            -- end
                            mainFunc.objectFunctionsScript.bombGroupCheck(mainFunc, "before", event.target)
                            --Runtime:addEventListener( "enterFrame", mainFunc.transitionMoveSomething)
                            local isActualConnector
                            if event.target.nextOrPrevState == "next" and event.target.nextTransitionSquareIndex == "*" then
                                isActualConnector = false
                            elseif event.target.nextOrPrevState == "prev" and event.target.prevTransitionSquareIndex == "*" then
                                isActualConnector = false
                            else
                                isActualConnector = true
                            end
                            mainFunc.transitionFunctionScript.mainTransitionMoveSomething(event.target, mainFunc, shapeArray, shapeArrayParameters, isActualConnector)
                        end
                            t.startTransitionMoveSomething = startTransitionMoveSomething
                        
                        local function planTransitionMoveSomething(relevantSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext )
                            if relevantSwipe > moreThanThreshold and relevantSwipe < lessThanThreshold and object1Counter == 0 then
                                event.target.thisTransitionXDirection = transXDirection
                                event.target.thisTransitionDirection = transDirection
                                event.target.nextOrPrevState = prevOrNext
                                event.target.storedTransitionDistance = event.target.thisTransitionDistance
                                if transDirection == "horz" then
                                    event.target.storedTransitionDistance = event.target.storedTransitionDistance * event.target.thisTransitionXDirection
                                end
                                if stillTransitioningCounter == 0 then
                                    startTransitionMoveSomething()
                                end
                            end
                        end
                        
                        local function planTransitionMoveSomethingSetUp (topSwipe, bottomSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext)
                            if (topSwipe) < 10 and (topSwipe) > -10 and (eventTotalTime) < 350 then
                                planTransitionMoveSomething(bottomSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext)
                            end
                        end
                        
                        local function alternativePlanTransitionMoveSomethingSetUp(irrelevantSwipe, relevantSwipe, otherRelevantSquare, thisRelevantSquare, prevOrNext, transDirection)
                            if (irrelevantSwipe) < 10 and (irrelevantSwipe) > -10 and (eventTotalTime) < 350 then
                                if otherRelevantSquare ~= "null" and otherRelevantSquare < thisRelevantSquare then
                                    planTransitionMoveSomething(relevantSwipe, -10, -10000, -1, transDirection, prevOrNext)
                                elseif otherRelevantSquare ~= "null" and otherRelevantSquare > thisRelevantSquare then
                                    planTransitionMoveSomething(relevantSwipe, 10000, 10, 1, transDirection, prevOrNext)
                                end
                            end
                        end
                        
                        if event.target.nextTransitionHorzSquare ~= "null"
                        and event.target.nextTransitionHorzSquare > event.target.thisTransitionHorzSquare then
                            event.target.thisTransitionDistance = event.target.nextTransitionHorzSquare - event.target.thisTransitionHorzSquare
                            
                            planTransitionMoveSomethingSetUp(ySwipe, xSwipe, 10000, 10, 1, "horz", "next")
                        elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare < event.target.thisTransitionHorzSquare then
                            event.target.thisTransitionDistance = event.target.thisTransitionHorzSquare - event.target.nextTransitionHorzSquare
                            
                            planTransitionMoveSomethingSetUp(ySwipe, xSwipe, -10, -10000, -1, "horz", "next")
                        elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare == event.target.thisTransitionHorzSquare then
                            event.target.thisTransitionDistance = event.target.nextTransitionVertSquare - event.target.thisTransitionVertSquare
                            
                            alternativePlanTransitionMoveSomethingSetUp(xSwipe, ySwipe, event.target.nextTransitionVertSquare, event.target.thisTransitionVertSquare, "next", "vert")
                        end
                        
                        if  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare > event.target.thisTransitionVertSquare then
                            event.target.thisTransitionDistance = event.target.prevTransitionVertSquare - event.target.thisTransitionVertSquare
                            
                            planTransitionMoveSomethingSetUp(xSwipe, ySwipe, 10000, 10, 1, "vert", "prev")
                        elseif  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare < event.target.thisTransitionVertSquare then
                            event.target.thisTransitionDistance = event.target.prevTransitionVertSquare - event.target.thisTransitionVertSquare
                                    
                            planTransitionMoveSomethingSetUp(xSwipe, ySwipe, -10, -10000, -1, "vert", "prev")
                        elseif event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare == event.target.thisTransitionVertSquare then
                            event.target.thisTransitionDistance = event.target.thisTransitionHorzSquare - event.target.prevTransitionHorzSquare
                                        
                            alternativePlanTransitionMoveSomethingSetUp(ySwipe, xSwipe, event.target.prevTransitionHorzSquare, event.target.thisTransitionHorzSquare, "prev", "horz")
                        end
                    else
                        if event.target.isFocus == true then
                            event.target.isFocus = false
                            display.getCurrentStage():setFocus( nil )
                        end 
                    end
                end
            end
        end


        for d = 1, #mainFunc.allLevelSettings.showingToolsArray do     
            if event.target == mainFunc.allLevelSettings.showingToolsArray[d] then
                for a = 1, #mainFunc.allLevelSettings.showingToolsArray do
                    if (mainFunc.allLevelSettings.showingToolsArray[a] ~= event.target) then
                        if (mainFunc.thisLevelSettings.toolArray[mainFunc.allLevelSettings.showingToolsArray[a].toolArrayCounter]["quantity"] > 0) then
                            mainFunc.allLevelSettings.showingToolsArray[a].isApplied = false
                            mainFunc.allLevelSettings.showingToolsArray[a].isUsed = false
                            mainFunc.allLevelSettings.showingToolsArray[a].alpha = 1
                        end
                    end
                end
                event.target.isUsed = true
                event.target.isApplied = true
                event.target.alpha = 0.7

                mainFunc.ballBtnScreenCreate.itemBtn.relevantShapeArrayCounterForItem = mainFunc.allLevelSettings.showingToolsArray[d].toolArrayCounter

                -- this is only needed because the event fires multiple times - maybe introduce a counter with a stop?
                if mainFunc.ballBtnScreenCreate.itemBtn.img
                and mainFunc.ballBtnScreenCreate.itemBtn.img ~= nil then
                    mainFunc.ballBtnScreenCreate.itemBtn.img:removeSelf()
                    mainFunc.ballBtnScreenCreate.itemBtn.img = nil
                end
                if mainFunc.ballBtnScreenCreate.itemBtn.counterImg
                and mainFunc.ballBtnScreenCreate.itemBtn.counterImg ~= nil then
                    mainFunc.ballBtnScreenCreate.itemBtn.counterImg:removeSelf()
                    mainFunc.ballBtnScreenCreate.itemBtn.counterImg = nil
                end

                local itemsImageSheet = graphics.newImageSheet( "images/objects/items.png", {width = 60, height = 52, numFrames = 12, sheetContentWidth = 720, sheetContentHeight = 52})
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

                mainFunc.ballBtnScreenCreate.itemBtn.isActive = true

                mainFunc.ballBtnScreenCreate.itemBtn.img = display.newSprite(itemsImageSheet, itemsSequenceData)
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballBtnScreenCreate.itemBtn.img)
                itemBtnImage = mainFunc.ballBtnScreenCreate.itemBtn.img
                itemBtnImage:play()
                itemBtnImage:setSequence(mainFunc.thisLevelSettings.toolArray[mainFunc.allLevelSettings.showingToolsArray[d].toolArrayCounter]["name"])
                itemBtnImage.x = mainFunc.ballBtnScreenCreate.itemBtn.x
                itemBtnImage.y = mainFunc.ballBtnScreenCreate.itemBtn.y + 9
                itemBtnImage.xScale = 0.35
                itemBtnImage.yScale = 0.35

                mainFunc.ballBtnScreenCreate.itemBtn.counterImg = display.newImage("images/objects/imageNumber" .. mainFunc.thisLevelSettings.toolArray[mainFunc.allLevelSettings.showingToolsArray[d].toolArrayCounter]["quantity"] .. ".png")
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballBtnScreenCreate.itemBtn.counterImg)
                mainFunc.ballBtnScreenCreate.itemBtn.counterImg.x = mainFunc.ballBtnScreenCreate.itemBtn.x
                mainFunc.ballBtnScreenCreate.itemBtn.counterImg.y = mainFunc.ballBtnScreenCreate.itemBtn.y - 10
                mainFunc.ballBtnScreenCreate.itemBtn.counterImg.xScale = 0.5
                mainFunc.ballBtnScreenCreate.itemBtn.counterImg.yScale = 0.5
            end
        end
    end
end
    t.objectListener = objectListener

local deactivateSpitter = function (mainFunc, shapeArray, arrowWasTouched)
    local i = mainFunc.thisLevelSettings.currentSpitter

    if mainFunc.thisLevelSettings.currentArrowTimer and mainFunc.thisLevelSettings.currentArrowTimer ~= nil then
        timer.cancel(mainFunc.thisLevelSettings.currentArrowTimer)
        mainFunc.thisLevelSettings.currentArrowTimer = nil
    end

    if shapeArray[i].upArrow then
        shapeArray[i].upArrowClickable.alpha = 0
        shapeArray[i].upArrow.alpha = 1
        shapeArray[i].upArrowClickable:removeEventListener("tap", mainFunc.spitterArrowTouch)
    end
    if shapeArray[i].rightArrowClickable then
        shapeArray[i].rightArrowClickable:removeEventListener("tap", mainFunc.spitterArrowTouch)
        shapeArray[i].rightArrowClickable.alpha = 0
        shapeArray[i].rightArrow.alpha = 1
    end
    if shapeArray[i].downArrowClickable then
        shapeArray[i].downArrowClickable:removeEventListener("tap", mainFunc.spitterArrowTouch)
        shapeArray[i].downArrowClickable.alpha = 0
        shapeArray[i].downArrow.alpha = 1
    end
    if shapeArray[i].leftArrowClickable then
        shapeArray[i].leftArrowClickable:removeEventListener("tap", mainFunc.spitterArrowTouch)
        shapeArray[i].leftArrowClickable.alpha = 0
        shapeArray[i].leftArrow.alpha = 1
    end
    if shapeArray[i].mainFuncListenerAdded == false then
        shapeArray[i]:addEventListener("touch", mainFunc.listener)
        shapeArray[i].mainFuncListenerAdded = true
    end
    shapeArray[i]:addEventListener("tap")
    shapeArray[i].canShapeSlide = true
    if arrowWasTouched then
        mainFunc.thisLevelSettings.currentArrowTimer2 = timer.performWithDelay(10, function () mainFunc.thisLevelSettings.currentArrowTimer2 = nil shapeArray[i].enabled = true end)
    else
        shapeArray[i].enabled = true
    end

    mainFunc.thisLevelSettings.currentSpitter = nil
end
    t.deactivateSpitter = deactivateSpitter

local spitterArrowTouch = function (event, mainFunc, shapeArray, shapeArrayParameters)
    Runtime:removeEventListener("enterFrame", autoFanTransition)
    
    local function moveBallFromSpitter()
        mainFunc.allLevelSettings.spitterCounter = 1
        event.target.relatedSpitter.lastBallReleaseDirection = mainFunc.ballBtnScreenCreate.ball.direction
        mainFunc.allLevelSettings.shouldBallMoveState = "true"
        mainFunc.allLevelSettings.isBallMovingState = "true"

        local thisFan = event.target.relatedSpitter
        local obj = mainFunc.ballBtnScreenCreate.ball
        local fanYTarget = thisFan.y
        local fanXTarget = thisFan.x
        local calculateTarget = function (axis)
            if axis == "y" then
                local yFig = (obj.y - mainFunc.allLevelSettings.gutterHeight) / mainFunc.allLevelSettings.squareHeight
                yFig = math.floor(yFig)
                yFig = (mainFunc.allLevelSettings.squareHeight * (yFig + 0.5) ) + mainFunc.allLevelSettings.gutterHeight
                return yFig
            elseif axis == "x" then
                local xFig = (obj.x - mainFunc.allLevelSettings.gutterWidth) / mainFunc.allLevelSettings.squareWidth
                xFig = math.floor(xFig)
                xFig = (mainFunc.allLevelSettings.squareWidth * (xFig + 0.5) ) + mainFunc.allLevelSettings.gutterWidth
                return xFig
            end
        end

        if thisFan.isAutoSlideObject
        and thisFan.autoSlideDirection == "horz"
        and (obj.direction == "up" or obj.direction == "down") then
            fanXTarget = calculateTarget("x")
            transition.to(obj, {x = fanXTarget, time=50})
            obj.x = fanXTarget
        elseif thisFan.isAutoSlideObject 
        and thisFan.autoSlideDirection == "vert"
        and (obj.direction == "left" or obj.direction == "right") then
            fanYTarget = calculateTarget("y")
            obj.y = fanYTarget
        end

        mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballBtnScreenCreate.ball, mainFunc)
        mainFunc.ballBtnScreenCreate.ball:setSequence(mainFunc.ballBtnScreenCreate.ball.direction)
        if mainFunc.allLevelSettings.followShapeWithBallApplied and mainFunc.allLevelSettings.shapeToBeFollowedIndex == thisFan.shapeArrayIndex then
            Runtime:removeEventListener("enterFrame", mainFunc.objectToBallTransitionScript.listener)
            mainFunc.allLevelSettings.followShapeWithBallApplied = false
        end
        
        local function reactivateBallSpitter ()
            thisBallSpitter.isBallPresent = false
            mainFunc.allLevelSettings.spitterCounter = 0
            mainFunc.ballBtnScreenCreate.ball.lastFanIndex = nil
            event.target.relatedSpitter.lastBallReleaseDirection = nil
        end
        timer.performWithDelay(185, reactivateBallSpitter)

        if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
            if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanRelease"] then
                mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanRelease"](mainFunc, thisBallSpitter, shapeArray)
            end
        end

        thisBallSpitter.canShapeSlide = true
        mainFunc.objectListenerScript.deactivateSpitter(mainFunc, shapeArray, true)
    end

    mainFunc.ballBtnScreenCreate.ball.direction = event.target.direction
    thisBallSpitter = event.target.relatedSpitter
    moveBallFromSpitter()
    
    local function addBackAutoFan ()
        Runtime:addEventListener("enterFrame", mainFunc.autoFanTransitionListener)
        mainFunc.ballBtnScreenCreate.ball.autoFanCounter = 0
    end
    
    timer.performWithDelay(90, addBackAutoFan, 1)
end
    t.spitterArrowTouch = spitterArrowTouch

local objectBallActivate = function (event, mainFunc, shapeArray, shapeArrayParameters)
    if event.target.objectType == "simple" or event.target.objectType == "backFire" or event.target.objectType == "characterChangePoint" then
        local thisFan = event.target
        local obj = mainFunc.ballBtnScreenCreate.ball
        local fanYTarget = thisFan.y
        local fanXTarget = thisFan.x
        local calculateTarget = function (axis)
            if axis == "y" then
                local yFig = (obj.y - mainFunc.allLevelSettings.gutterHeight) / mainFunc.allLevelSettings.squareHeight
                yFig = math.floor(yFig)
                yFig = (mainFunc.allLevelSettings.squareHeight * (yFig + 0.5) ) + mainFunc.allLevelSettings.gutterHeight
                return yFig
            elseif axis == "x" then
                local xFig = (obj.x - mainFunc.allLevelSettings.gutterWidth) / mainFunc.allLevelSettings.squareWidth
                xFig = math.floor(xFig)
                xFig = (mainFunc.allLevelSettings.squareWidth * (xFig + 0.5) ) + mainFunc.allLevelSettings.gutterWidth
                return xFig
            end
        end

        local releaseBallFromSimple = function ()
            mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballBtnScreenCreate.ball, mainFunc)
                print("no")
            if mainFunc.allLevelSettings.followShapeWithBallApplied then
                print("ko")
                Runtime:removeEventListener("enterFrame", mainFunc.objectToBallTransitionScript.listener)
                mainFunc.allLevelSettings.followShapeWithBallApplied = false
            end
            local function reactivateBallFromSimple ()
                if (mainFunc.ballBtnScreenCreate.ball.lastFanIndex == thisFan.shapeArrayIndex) then
                    mainFunc.ballBtnScreenCreate.ball.lastFanIndex = nil
                end
                thisFan.lastBallReleaseDirection = nil
                if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
                    if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanRelease"] then
                        mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanRelease"](mainFunc, thisFan, shapeArray)
                    end
                end
            end

            mainFunc.allLevelSettings.shouldBallMoveState = "true"
            mainFunc.allLevelSettings.isBallMovingState = "true"

            timer.performWithDelay(185, reactivateBallFromSimple)

            event.target.bigDirectionArrow.alpha = 0
            if thisFan.objectType == "characterChangePoint" then
                thisFan.button.alpha = 0
                --event.target.button:removeEventListener("tap", mainFunc.listener)
            end
            thisFan.isBallPresent = false
            thisFan.canShapeSlide = true
            thisFan.shouldBallMoveInAutoSlide = false
        end

        if thisFan.isAutoSlideObject
        and thisFan.autoSlideDirection == "horz"
        and (obj.direction == "up" or obj.direction == "down") then
            local yIncrementVal = 20
            if obj.direction == "up" then
                yIncrementVal = yIncrementVal * -1
            end
            fanYTarget = fanYTarget + yIncrementVal
            fanXTarget = calculateTarget("x")
            transition.to(obj, {y = fanYTarget, x = fanXTarget, time = 50, onComplete = function()
                releaseBallFromSimple()
            end})
        elseif thisFan.isAutoSlideObject 
        and thisFan.autoSlideDirection == "vert"
        and (obj.direction == "left" or obj.direction == "right") then
            local xIncrementVal = 20
            if obj.direction == "left" then
                xIncrementVal = xIncrementVal * -1
            end
            fanXTarget = fanXTarget + xIncrementVal
            fanYTarget = calculateTarget("y")
            transition.to(obj, {y = fanYTarget, x = fanXTarget, time = 50, onComplete = function()
                releaseBallFromSimple()
            end})
        else
            releaseBallFromSimple()
        end
    elseif event.target.objectType == "characterChangePointButton" then
        local characterChangeSprites, characterChangePointDisplay, chooseCharacter, spriteSequenceData, closeChooseCharacter, characterChangeBg
        local isSpecificCharacter = false
        if event.target.specificCharacter ~= nil then
            isSpecificCharacter = true
        end

        closeChooseCharacter = function (event)
            local counter = 0
            local newCounter = 0
            for key, val in pairs(characterChangePointDisplay) do
                counter = counter + 1
            end
            for key, val in pairs(characterChangePointDisplay) do
                transition.to(characterChangePointDisplay[key], {alpha = 0, time = 150, onComplete = function ()
                    characterChangePointDisplay[key]:removeSelf()
                    characterChangePointDisplay[key] = nil
                    newCounter = newCounter + 1

                    if newCounter == counter then
                        characterChangeBg.closeButton:removeEventListener("tap", closeChooseCharacter)
                        characterChangeBg.closeButton:removeSelf()
                        characterChangeBg.closeButton = nil

                        characterChangeBg:removeSelf()
                        characterChangeBg = nil

                        mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
                        mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
                        mainFunc.buttonListenerScript.addBackItemButtonListenersForItemGained(mainFunc)
                        mainFunc.buttonListenerScript.addBackButtonListenersForItemGained(mainFunc)
                    end
                end})
            end
        end

        chooseCharacter = function (event)
            for key, val in pairs(characterChangePointDisplay) do
                characterChangePointDisplay[key]:removeEventListener("tap", chooseCharacter)
            end

            local currentBall = mainFunc.ballBtnScreenCreate.ball
            local prevDirection = mainFunc.ballBtnScreenCreate.ball.direction
            local prevX = currentBall.x
            local prevY = currentBall.y
            mainFunc.ballBtnScreenCreate.ball:removeSelf()
            mainFunc.ballBtnScreenCreate.ball = nil
            mainFunc.ballBtnScreenCreate.ball = display.newSprite(characterChangeSprites[event.target.value].imageSheet, spriteSequenceData)
            physics.addBody( mainFunc.ballBtnScreenCreate.ball, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
            mainFunc.allLevelSettings.midScreenObjectsGroup:insert( mainFunc.ballBtnScreenCreate.ball )
            mainFunc.ballBtnScreenCreate.ball.projectileType = "ball"
            mainFunc.ballBtnScreenCreate.ball.direction = prevDirection
            mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex = 0
            mainFunc.ballBtnScreenCreate.ball.transitionId = mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex
            mainFunc.ballBtnScreenCreate.ball.gravityScale = 0
            mainFunc.ballBtnScreenCreate.ball.x = prevX
            mainFunc.ballBtnScreenCreate.ball.y = prevY
            mainFunc.ballBtnScreenCreate.ball.isFixedRotation = true
            mainFunc.ballBtnScreenCreate.ball.character = event.target.value
            mainFunc.ballBtnScreenCreate.ball.autoFanCounter = 0
            mainFunc.ballBtnScreenCreate.ball.fanCenteringCounter = 0
            mainFunc.ballBtnScreenCreate.ball.movementSpeed = 100
            mainFunc.ballBtnScreenCreate.ball.transitioning = false
            mainFunc.ballBtnScreenCreate.ball:toFront()
            mainFunc.ballBtnScreenCreate.ball:setSequence(prevDirection)
            mainFunc.ballBtnScreenCreate.ball:play()
            mainFunc.ballBtnScreenCreate.ball.specialConditionsArray = {}

            timer.performWithDelay(
                200,
                closeChooseCharacter()
            )
        end

        mainFunc.buttonListenerScript.removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
        mainFunc.buttonListenerScript.removeButtonListenersForItemGained(mainFunc)
        mainFunc.buttonListenerScript.removeItemButtonListenersForItemGained(mainFunc)

        characterChangePointDisplay = {}

        characterChangeSprites = {}
        spriteSequenceData = {
            { name = "up", start=1, count=1,   loopCount=1 },
            { name = "right", start=2, count=1, loopCount=1 },
            { name = "down", start=3, count=1, loopCount=1 },
            { name = "left", start=4, count=1, loopCount=1 }
        }
        

        thisMyGameSettings = loadTable("myGameSettings.json")
        local xVal = 68

        characterChangeBg = display.newImageRect("images/objects/Layout/characterSelectMenu.png", 443, 133)
        characterChangeBg.width = (443/480) * display.contentWidth
        characterChangeBg.height = (133/320) * display.contentHeight
        characterChangeBg.x = display.contentWidth / 2
        characterChangeBg.y = (245/320) * display.contentHeight

        characterChangeBg.closeButton = display.newImageRect("images/objects/Layout/characterSelectMenu_close.png", 65, 48)
        characterChangeBg.closeButton.width = (45/480) * display.contentWidth
        characterChangeBg.closeButton.height = (48/320) * display.contentHeight
        characterChangeBg.closeButton.x = (415/480) * display.contentWidth
        characterChangeBg.closeButton.y = (255/320) * display.contentHeight
        characterChangeBg.closeButton:addEventListener("tap", closeChooseCharacter)

        for a = 1, #mainFunc.characterConfigArray do
            key = mainFunc.characterConfigArray[a]
            if (isSpecificCharacter == false and myGameSettings["characterUnlocked"][key]) or (isSpecificCharacter and key == event.target.specificCharacter) then
            --if thisMyGameSettings["characterUnlocked"][key] == true then
                if isSpecificCharacter and mainFunc.ballBtnScreenCreate.ball.character == key then
                    key = "normal"
                end
                characterChangeSprites[key] = {}
                local relSheetPath = mainFunc.fullCharacterConfigArray[key]["sheetName"]
                local relSheetWidth = mainFunc.fullCharacterConfigArray[key]["sheetWidth"]
                local relSheetHeight = mainFunc.fullCharacterConfigArray[key]["sheetHeight"]
                characterChangeSprites[key].imageSheet = graphics.newImageSheet( relSheetPath, {width = relSheetWidth/4, height = relSheetHeight/2, numFrames = 8, sheetContentWidth = relSheetWidth, sheetContentHeight = relSheetHeight}) 
                characterChangePointDisplay[key] = display.newSprite(characterChangeSprites[key].imageSheet, spriteSequenceData)
                characterChangePointDisplay[key]:setSequence(mainFunc.ballBtnScreenCreate.ball.direction)
                characterChangePointDisplay[key].x = (xVal/480) * display.contentWidth
                characterChangePointDisplay[key].y = (258/320) * display.contentHeight
                characterChangePointDisplay[key].value = key
                characterChangePointDisplay[key]:addEventListener("tap", chooseCharacter)

                xVal = xVal + 85.5
            --end
            end
        end
    end
end
    t.objectBallActivate = objectBallActivate

local closeMysteryBagScreen = function (mainFunc, blockChanged)
    -- close mysteryBlockScreen
    if blockChanged then
        transition.to(mainFunc.mysteryBagScreen.mysteryBlock, {alpha = 0, time = 200})
        mainFunc.mysteryBagScreen.mysteryBlock:removeEventListener("tap", mainFunc.mysteryBlockTouch)
    end
    mainFunc.globalFunctions.hideObjects(mainFunc.allLevelSettings, mainFunc.ballBtnScreenCreate, true)
    transition.to(mainFunc.mysteryBagScreen.bg, {alpha = 0, time = 250})
    transition.to(mainFunc.mysteryBagScreen.selectedTile, {alpha = 0, time = 250})
    for b = 1, #mainFunc.mysteryBagScreen.allowedShapes do
        transition.to(mainFunc.mysteryBagScreen.allowedShapesTiles[b], {alpha = 0, time = 250})
        if mainFunc.mysteryBagScreen.allowedShapes[b].displayObjects["directionLabel"] then
            for c = 1, #mainFunc.mysteryBagScreen.allowedShapes[b].displayObjects["directionLabel"] do
                mainFunc.mysteryBagScreen.allowedShapes[b].displayObjects["directionLabel"][c]:removeSelf()
                mainFunc.mysteryBagScreen.allowedShapes[b].displayObjects["directionLabel"][c] = nil
            end
        end
        transition.to(mainFunc.mysteryBagScreen.allowedShapes[b], {alpha = 0, time = 250})
    end
    for b = 1, #mainFunc.mysteryBagScreen.allowedShapesTabs do
        transition.to(mainFunc.mysteryBagScreen.allowedShapesTabs[b], {alpha = 0, time = 250})
        transition.to(mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabBg, {alpha = 0, time = 250})
        transition.to(mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabIcon, {alpha = 0, time = 250})
    end
    for a = 1, #mainFunc.ballBtnScreenCreate.itemBagScreen.toolBGTiles do
        mainFunc.ballBtnScreenCreate.itemBagScreen.toolBGTiles[a]:removeSelf()
        mainFunc.ballBtnScreenCreate.itemBagScreen.toolBGTiles[a] = nil
    end
    mainFunc.ballBtnScreenCreate.itemBagScreen.scrollView:removeSelf()
    mainFunc.ballBtnScreenCreate.itemBagScreen.scrollView = nil
    mainFunc.mysteryBagScreen.scrollBg:removeSelf()
    mainFunc.mysteryBagScreen.scrollBg = nil
    mainFunc.mysteryBagScreen.closeButton:removeSelf()
    mainFunc.mysteryBagScreen.closeButton = nil
    transition.to(mainFunc.mysteryBagScreen.bg, {alpha = 0, time = 250})
    transition.to(mainFunc.mysteryBagScreen.bg, {alpha = 0, time = 250, onComplete = function ()
        mainFunc.mysteryBagScreen.bg:removeSelf()
        mainFunc.mysteryBagScreen.bg = nil
        mainFunc.mysteryBagScreen.selectedTile:removeSelf()
        mainFunc.mysteryBagScreen.selectedTile = nil
        for b = 1, #mainFunc.mysteryBagScreen.allowedShapes do
            mainFunc.mysteryBagScreen.allowedShapes[b]:removeSelf()
            mainFunc.mysteryBagScreen.allowedShapes[b] = nil
        end
        for b = 1, #mainFunc.mysteryBagScreen.allowedShapesTabs do
            mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabBg:removeSelf()
            mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabBg = nil
            mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabIcon:removeSelf()
            mainFunc.mysteryBagScreen.allowedShapesTabs[b].tabIcon = nil
        end
        for b = 1, #mainFunc.mysteryBagScreen.allowedShapesTiles do
            mainFunc.mysteryBagScreen.allowedShapesTiles[b]:removeSelf()
            mainFunc.mysteryBagScreen.allowedShapesTiles[b] = nil
        end
        transition.to(mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay, {alpha = 0, time = 150})
        mainFunc.allLevelSettings.mysteryBlockBagIsOpen = false

        mainFunc.allLevelSettings.isScreenPausedState = false

        mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter - 1
    end})
end
    t.closeMysteryBagScreen = closeMysteryBagScreen

local mysteryBlockShapeListener = function (event, mainFunc, shapeArray, shapeArrayParameters)
    local newX = event.target.x + mainFunc.ballBtnScreenCreate.itemBagScreen.scrollView.x
    local newY = event.target.y + mainFunc.ballBtnScreenCreate.itemBagScreen.scrollView.y
    mainFunc.allLevelSettings.itemScreenObjectsGroup:remove(event.target)
    mainFunc.ballBtnScreenCreate.itemBagScreen.scrollView:remove(event.target)
    mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(event.target)
    event.target.x = newX
    event.target.y = newY
    event.target:toFront()
    local diffFromObjectXVal, diffFromObjectYVal
    if event.target.y > mainFunc.mysteryBagScreen.mysteryBlock.y then
        diffFromObjectYVal = 15
    else
        diffFromObjectYVal = -15
    end
    if event.target.x > mainFunc.mysteryBagScreen.mysteryBlock.x then
        diffFromObjectXVal = 15
    else
        diffFromObjectXVal = -15
    end
    transition.to(event.target, {x = mainFunc.mysteryBagScreen.mysteryBlock.x + diffFromObjectXVal, y = mainFunc.mysteryBagScreen.mysteryBlock.y + diffFromObjectYVal, time = 50, onComplete = function ()
        transition.to(event.target, {x = mainFunc.mysteryBagScreen.mysteryBlock.x, y = mainFunc.mysteryBagScreen.mysteryBlock.y, alpha = 0.7, time = 220, onComplete = function ()
            for a = 1, #shapeArray do
                if mainFunc.mysteryBagScreen.mysteryBlockShapeArrayIndex == shapeArray[a].shapeArrayIndex then
                    local newObject = shapeArray[a].allowedShapesArray[event.target.allowedShapesIndex]
                    local formattedObjectToSave = {}

                    -- create object to save form this object
                    if newObject["properties"]["directions"] then
                        formattedObjectToSave["directions"] = newObject["properties"]["directions"]
                    end
                    if newObject["properties"]["shape"] then
                        formattedObjectToSave["shape"] = newObject["properties"]["shape"]
                    end
                    formattedObjectToSave["shapeName"] = newObject["name"]
                    if formattedObjectToSave["shapeName"] == "triangle" or formattedObjectToSave["shapeName"] == "bar" then
                        formattedObjectToSave["shapeName"] = "shape"
                        formattedObjectToSave["isBar"] = false
                        if formattedObjectToSave["shapeName"] == "bar" then
                            formattedObjectToSave["isBar"] = true
                        end
                    end
                    formattedObjectToSave["location"] = mainFunc.mysteryBagScreen.mysteryBlockCords

                    local lengthOfShapesArray = #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"]

                    myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][lengthOfShapesArray + 1] = formattedObjectToSave

                    saveTable(myGameSettings, "myGameSettings.json")

                    local newShapeObj = {}

                    newShapeObj[1] = formattedObjectToSave["shapeName"]
                    newShapeObj[2] = formattedObjectToSave["shapeName"] .. "_" .. formattedObjectToSave["location"][1] .. "_" ..formattedObjectToSave["location"][2] .. "_" ..formattedObjectToSave["location"][3] .. "_" .. formattedObjectToSave["location"][4]
                    for b = 1, #formattedObjectToSave["location"] do
                        newShapeObj[b + 2] = formattedObjectToSave["location"][b]
                    end

                    if formattedObjectToSave["shapeName"] == "spitter" then
                        local upExists = false
                        local rightExists = false
                        local leftExists = false
                        local downExists = false
                        for b = 1, #formattedObjectToSave["directions"] do
                            if formattedObjectToSave["directions"][b] == "up" then
                                upExists = true
                            elseif formattedObjectToSave["directions"][b] == "right" then
                                rightExists = true
                            elseif formattedObjectToSave["directions"][b] == "down" then
                                downExists = true
                            elseif formattedObjectToSave["directions"][b] == "left" then
                                leftExists = true
                            end
                            if upExists == true then
                                newShapeObj[7] = "up"
                            else
                                newShapeObj[7] = _
                            end
                            if rightExists == true then
                                newShapeObj[8] = "right"
                            else
                                newShapeObj[8] = _
                            end
                            if downExists == true then
                                newShapeObj[9] = "down"
                            else
                                newShapeObj[9] = _
                            end
                            if leftExists == true then
                                newShapeObj[10] = "left"
                            else
                                newShapeObj[10] = _
                            end
                        end
                    elseif formattedObjectToSave["shapeName"] == "manualFan"
                    or formattedObjectToSave["shapeName"] == "autoFan" then
                        newShapeObj[7] = formattedObjectToSave["directions"][1]
                    elseif formattedObjectToSave["shapeName"] == "shape" then
                        if formattedObjectToSave["isBar"] == true then
                            newShapeObj[7] = "bar"
                            newShapeObj[8] = formattedObjectToSave["shape"]
                            newShapeObj[9] = _
                        else
                            newShapeObj[7] = formattedObjectToSave["shape"]
                            newShapeObj[8] = 1
                            newShapeObj[9] = _
                        end
                    end

                    shapeArrayParameters[#shapeArrayParameters + 1] = newShapeObj

                    mainFunc.createLevelObject(shapeArrayParameters, shapeArray, #shapeArrayParameters, mainFunc)

                    if formattedObjectToSave["shapeName"] == "shape" then
                        shapeArray[#shapeArray]:addEventListener("collision", mainFunc.on_Triangle_Collision)
                    elseif formattedObjectToSave["shapeName"] == "spitter"
                    or formattedObjectToSave["shapeName"] == "autoFan"
                    or formattedObjectToSave["shapeName"] == "manualFan"
                    or formattedObjectToSave["shapeName"] == "simple"
                    or formattedObjectToSave["shapeName"] == "backFire" then
                        mainFunc.activateObjectsForPlay(mainFunc, shapeArray, #shapeArray)
                    end

                    local objectArray = loadTable("myTotalObjectArray.json")
                    objectArray[event.target.objectArrayIndex]["quantity"] = objectArray[event.target.objectArrayIndex]["quantity"] - 1
                    if objectArray[event.target.objectArrayIndex]["quantity"] == 0 then
                        table.remove(objectArray, event.target.objectArrayIndex)
                    end
                    saveTable(objectArray, "myTotalObjectArray.json")

                    closeMysteryBagScreen(mainFunc, true, shapeArray, shapeArrayParameters)
                end
            end
        end})
    end})
end
    t.mysteryBlockShapeListener = mysteryBlockShapeListener

local mysteryBlockRemoveComplete = function (event, mainFunc, shapeArrayParameters, shapeArray)
    if mainFunc.mysteryBagScreen.mysteryBlockToRemove.upArrow then
        mainFunc.mysteryBagScreen.mysteryBlockToRemove.upArrow.alpha = 0
    end
    if mainFunc.mysteryBagScreen.mysteryBlockToRemove.rightArrow then
        mainFunc.mysteryBagScreen.mysteryBlockToRemove.rightArrow.alpha = 0
    end
    if mainFunc.mysteryBagScreen.mysteryBlockToRemove.downArrow then
        mainFunc.mysteryBagScreen.mysteryBlockToRemove.downArrow.alpha = 0
    end
    if mainFunc.mysteryBagScreen.mysteryBlockToRemove.leftArrow then
        mainFunc.mysteryBagScreen.mysteryBlockToRemove.leftArrow.alpha = 0
    end
    if (mainFunc.mysteryBagScreen.mysteryBlockToRemove.directionIndicatorArrow) then
        mainFunc.mysteryBagScreen.mysteryBlockToRemove.directionIndicatorArrow.alpha = 0
    end

    transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {rotation = 15, time = 100, onComplete = function ()
        transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {x = mainFunc.mysteryBagScreen.mysteryBlockToRemove.x + 40, xScale = 0.75, yScale = 0.75, time = 250})
        transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {y = mainFunc.mysteryBagScreen.mysteryBlockToRemove.y - 35, time = 50, onComplete=function ()
            transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {y = mainFunc.mysteryBagScreen.mysteryBlockToRemove.y - 5, time = 200, onComplete = function ()
                transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {x = mainFunc.mysteryBagScreen.mysteryBlockToRemove.x + 40, alpha = 0.3, time = 250})
                transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {y = mainFunc.mysteryBagScreen.mysteryBlockToRemove.y + 5, time = 200, onComplete=function ()
                    transition.to(mainFunc.mysteryBagScreen.mysteryBlockToRemove, {y = mainFunc.mysteryBagScreen.mysteryBlockToRemove.y + 35, time = 50, onComplete=function ()
                        local indexOfItemToRemoveFromArray
                        mainFunc.mysteryBagScreen.mysteryBlockToRemove.alpha = 0
                        mainFunc.mysteryBagScreen.mysteryBlockToRemove.x = -9000

                        for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"] do
                            local locationObject = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][a]["location"]

                            if locationObject[1] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["xScreen"]
                            and locationObject[2] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["yScreen"]
                            and locationObject[3] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["xSquare"]
                            and locationObject[4] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["ySquare"] then
                                indexOfItemToRemoveFromArray = a
                            end
                        end

                        table.remove(myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"], indexOfItemToRemoveFromArray)
                        saveTable(myGameSettings, "myGameSettings.json")

                        for a = 1, #shapeArrayParameters do
                            if shapeArrayParameters[a]["type"] == "item" and shapeArrayParameters[a]["name"] == "mystery-block"
                            and shapeArrayParameters[a]["location"]["xScreen"] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["xScreen"]
                            and shapeArrayParameters[a]["location"]["yScreen"] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["yScreen"]
                            and shapeArrayParameters[a]["location"]["xSquare"] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["xSquare"]
                            and shapeArrayParameters[a]["location"]["ySquare"] == shapeArrayParameters[mainFunc.mysteryBagScreen.mysteryBlockToRemove.shapeArrayIndex]["location"]["ySquare"] then
                                transition.to(shapeArray[a], {alpha = 1, time = 250, onComplete = function ()
                                    shapeArray[a]:addEventListener("tap", mainFunc.mysteryBlockTouch)
                                end})
                            end
                        end

                        t.closeMysteryBlockRemoveOption(nil, mainFunc)
                    end})
                end})
            end})
        end})
    end})

    
end
    t.mysteryBlockRemoveComplete = mysteryBlockRemoveComplete

local closeMysteryBlockRemoveOption = function (event, mainFunc)
    transition.to(mainFunc.mysteryBagScreen.agreeButton, {alpha = 0, time = 100})
    transition.to(mainFunc.mysteryBagScreen.closeButton, {alpha = 0, time = 100, onComplete = function ()
        mainFunc.mysteryBagScreen.closeButton:removeSelf()
        mainFunc.mysteryBagScreen.closeButton = nil
        mainFunc.mysteryBagScreen.agreeButton:removeSelf()
        mainFunc.mysteryBagScreen.agreeButton = nil
        transition.to(mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay, {alpha = 0, time = 200, onComplete = function ()
            mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
            mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)
        end})
    end})
end
    t.closeMysteryBlockRemoveOption = closeMysteryBlockRemoveOption

local mysteryBlockRemoveOption = function (event, mainFunc, shapeArray, shapeArrayParameters)
    transition.to(mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay, {alpha = 0.15, time = 200})
    mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
    mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("touch", mainFunc.dummyListener)

    mainFunc.mysteryBagScreen = {}
    mainFunc.mysteryBagScreen.mysteryBlockToRemove = event.target
    mainFunc.mysteryBagScreen.closeButton = display.newSprite(mainFunc.allLevelSettings.mysteryBlockButtonsImageSheet, mainFunc.allLevelSettings.mysteryBlockButtonsSequenceData)
    mainFunc.mysteryBagScreen.closeButton:setSequence("cancel")
    mainFunc.mysteryBagScreen.closeButton.x = contentCentreX - 70
    mainFunc.mysteryBagScreen.closeButton.y = yCalc(150)
    mainFunc.mysteryBagScreen.closeButton:addEventListener("tap", mainFunc.closeMysteryBlockRemoveOption)

    mainFunc.mysteryBagScreen.agreeButton = display.newSprite(mainFunc.allLevelSettings.mysteryBlockButtonsImageSheet, mainFunc.allLevelSettings.mysteryBlockButtonsSequenceData)
    mainFunc.mysteryBagScreen.agreeButton:setSequence("remove")
    mainFunc.mysteryBagScreen.agreeButton.x = contentCentreX + 70
    mainFunc.mysteryBagScreen.agreeButton.y = yCalc(150)
    mainFunc.mysteryBagScreen.agreeButton:addEventListener("tap", mainFunc.mysteryBlockRemoveComplete)
end
    t.mysteryBlockRemoveOption = mysteryBlockRemoveOption

local mysteryBlockTouchFunction = function (event, mainFunc, shapeArray, shapeArrayParameters)
    if mainFunc.allLevelSettings.itemBagIsOpen == false
    and mainFunc.allLevelSettings.mysteryBlockBagIsOpen == false
    and mainFunc.allLevelSettings.isBallMovingState == "false" then
        -- shut off background listeners
        transition.to(mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay, {alpha = 0.25, time = 200})
        mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("touch", mainFunc.dummyListener)

        mainFunc.allLevelSettings.itemBagIsOpen = false
        mainFunc.allLevelSettings.mysteryBlockBagIsOpen = true

        mainFunc.allLevelSettings.isScreenPausedState = true

        mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.buttonListenerScript.removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.allLevelSettings.shouldBallMoveCounter = mainFunc.allLevelSettings.shouldBallMoveCounter + 1

        local shapeArrayParameterItem = shapeArrayParameters[event.target.shapeArrayIndex]
        local xVal = xCalc(48)
        local yVal = yCalc(12.5)
        local tabXVal = xCalc(245)
        local tabYVal = yCalc(60)
        local shapesProcessedArray = {}

        if shapeArrayParameterItem[6] < 3 then
            yVal = yCalc(132.5)
            tabYVal = yCalc(151)
        end
        mainFunc.mysteryBagScreen = {}
        mainFunc.mysteryBagScreen.mysteryBlock = event.target
        mainFunc.mysteryBagScreen.mysteryBlockShapeArrayIndex = event.target.shapeArrayIndex
        mainFunc.mysteryBagScreen.mysteryBlockCords = {shapeArrayParameterItem[3], shapeArrayParameterItem[4], shapeArrayParameterItem[5], shapeArrayParameterItem[6]}
        mainFunc.mysteryBagScreen.allowedShapesArray = event.target.allowedShapesArray
        mainFunc.mysteryBagScreen.allowedShapes = {}
        mainFunc.mysteryBagScreen.allowedShapesTiles = {}
        mainFunc.mysteryBagScreen.allowedShapesTabs = {}

        mainFunc.mysteryBagScreen.bg = display.newImageRect("images/objects/Layout/mysteryBag-chooseShapeBg.png", 195, 117)
        mainFunc.mysteryBagScreen.bg.anchorX = 0
        mainFunc.mysteryBagScreen.bg.anchorY = 0
        mainFunc.mysteryBagScreen.bg.x = xCalc(25)
        mainFunc.mysteryBagScreen.bg.y = yVal
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.bg)

        mainFunc.mysteryBagScreen.closeButton = display.newImageRect("images/objects/Layout/mysteryBag-closeButton.png", 70, 55)
        if event.target.x > display.contentWidth then
            mainFunc.mysteryBagScreen.closeButton.x = event.target.x - xCalc(50)
        else
            mainFunc.mysteryBagScreen.closeButton.x = event.target.x + xCalc(50)
        end
        mainFunc.mysteryBagScreen.closeButton.y = event.target.y
        mainFunc.mysteryBagScreen.closeButton:addEventListener("tap", mainFunc.closeMysteryBagScreen)

        for a = 1, #event.target.allowedShapesArray do
            mainFunc.mysteryBagScreen.allowedShapesTiles[a] = display.newImageRect("images/objects/Layout/mysteryBag-chooseShapeTile.png", 40, 37)
            mainFunc.mysteryBagScreen.allowedShapesTiles[a].anchorX = 0
            mainFunc.mysteryBagScreen.allowedShapesTiles[a].anchorY = 0
            mainFunc.mysteryBagScreen.allowedShapesTiles[a].x = xVal - 17
            mainFunc.mysteryBagScreen.allowedShapesTiles[a].y = yVal + 40
            mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.allowedShapesTiles[a])
            -- if shape is not yet unlocked, show question mark

            -- if shape can be viewed, show icon
            mainFunc.mysteryBagScreen.allowedShapes[a] = mainFunc.globalImageCreateFunctions.createItemDetailedIcon(true, event.target.allowedShapesArray[a]["name"], "mysteryBlockBag", event.target.allowedShapesArray, a, nil, nil)
            mainFunc.globalImageCreateFunctions.positionItemDetailedIcon(mainFunc.mysteryBagScreen.allowedShapes[a], xVal + 3, yVal + 59, true, event.target.allowedShapesArray[a]["name"], "mysteryBlockBag", event.target.allowedShapesArray, a, nil, nil)
            mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.allowedShapes[a])

            xVal = xVal + 45
            if a == 4 then
                xVal = xCalc(48)
                yVal = yVal + yCalc(35)
            end
        end

        for a = 1, #event.target.allowedShapesArray do
            local processedAlready = false
            for b = 1, #shapesProcessedArray do
                if shapesProcessedArray[b] == event.target.allowedShapesArray[a]["name"] then
                    processedAlready = true
                end
            end
            if processedAlready == false then
                -- create the clickable tabs
                mainFunc.mysteryBagScreen.allowedShapesTabs[a] = {}
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg = display.newImageRect("images/objects/Layout/mysteryBag-tabBg.png", 58, 38)
                if a < 5 then
                    mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.rotation = 180
                elseif a == 5 then
                    tabXVal = tabXVal - 1
                end
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.width = xCalc(58)
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.height = yCalc(38)
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.x = tabXVal
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.y = tabYVal
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg)

                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon = display.newSprite(mainFunc.allLevelSettings.shapesImageSheet, mainFunc.allLevelSettings.shapesSequenceData)
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon:setSequence(event.target.allowedShapesArray[a]["name"])
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.x = mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.x
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.y = mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg.y
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.xScale = 0.5
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.yScale = 0.5
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.value = event.target.allowedShapesArray[a]["name"]
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.isMysteryBlockBagTab = true
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon.index = a
                mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon:addEventListener("tap", mainFunc.changeToolInnerScreen)
                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon)

                tabXVal = tabXVal + xCalc(59.25)
                if a == 4 then
                    tabXVal = xCalc(245)
                    tabYVal = tabYVal + yCalc(86)
                end
                table.insert(shapesProcessedArray, event.target.allowedShapesArray[a]["name"])
            end
        end

        mainFunc.mysteryBagScreen.scrollBg = display.newImageRect("images/objects/Layout/mysteryBag-scrollBg.png", 240, 45)
        mainFunc.mysteryBagScreen.scrollBg.width = xCalc(240)
        mainFunc.mysteryBagScreen.scrollBg.height = yCalc(62)
        mainFunc.mysteryBagScreen.scrollBg.x = xCalc(334)
        mainFunc.mysteryBagScreen.scrollBg.y = yCalc(193)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.scrollBg)

        mainFunc.globalFunctions.createItemBagToolScreenAndScroll(mainFunc, "triangle", mainFunc.allLevelSettings.shapesImageSheet, mainFunc.allLevelSettings.shapesSequenceData, mainFunc.ballBtnScreenCreate, mainFunc.allLevelSettings, mainFunc.buttonListenerScript, mainFunc.mysteryBlockShapeListener, "mysteryBlockBag")

        mainFunc.mysteryBagScreen.selectedTile = display.newImageRect("images/objects/Layout/mysteryBag-selectedTab.png", 58, 38)
        mainFunc.mysteryBagScreen.selectedTile.rotation = 180
        mainFunc.mysteryBagScreen.selectedTile.width = xCalc(58)
        mainFunc.mysteryBagScreen.selectedTile.height = yCalc(38)
        mainFunc.mysteryBagScreen.selectedTile.x = xCalc(245)
        mainFunc.mysteryBagScreen.selectedTile.y = yCalc(152)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.mysteryBagScreen.selectedTile)

        mainFunc.mysteryBagScreen.scrollBg:toBack()

        for a = 1, #mainFunc.mysteryBagScreen.allowedShapesTabs do
            mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabBg:toBack()
            mainFunc.mysteryBagScreen.allowedShapesTabs[a].tabIcon:toFront()
        end
    end

end
    t.mysteryBlockTouchFunction = mysteryBlockTouchFunction

return t
