local widget = require("widget")
local t = {}

--------- MAP DIRECTION BUTTONS-----------
local bombGroupCheck = function (mainFunc, stage, shape)
    bombArray = mainFunc.thisLevelSettings.bombArray

    for a = 1, #bombArray do
        if (bombArray[a] ~= nil and bombArray[a].active == true) then
            if bombArray[a].relevantHorzSquare == shape.relevantHorzSquare
            and bombArray[a].relevantVertSquare == shape.relevantVertSquare
            and bombArray[a].relevantHorzScreen == shape.relevantHorzScreen
            and bombArray[a].relevantHorzScreen == shape.relevantHorzScreen then

                if shape.objectType == "shape" then
                    bombArray[a].relevantGroup = mainFunc.allLevelSettings.frontScreenObjectsGroup

                    if stage == "before" then
                        bombArray[a].relevantGroup:remove(bombArray[a])
                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert(bombArray[a])

                        bombArray[a].relevantGroup:remove(bombArray[a].displayObjects["text"][1])
                        mainFunc.allLevelSettings.midScreenObjectsGroup:insert(bombArray[a].displayObjects["text"][1])

                        for b = 1, #mainFunc.thisLevelSettings.bombArray[a].displayObjects["directionLabel"] do
                            bombArray[a].relevantGroup:remove(bombArray[a].displayObjects["directionLabel"][b])
                            mainFunc.allLevelSettings.midScreenObjectsGroup:insert(bombArray[a].displayObjects["directionLabel"][b])
                        end

                        mainFunc.ballAndButtonAndScreenCreateScript.instance2:toFront()

                        for a = 1, #mainFunc.allLevelSettings.bullet do
                            mainFunc.allLevelSettings.bullet[a]:toFront()
                        end
                    elseif stage == "after" then
                        mainFunc.allLevelSettings.midScreenObjectsGroup:remove(bombArray[a])
                        bombArray[a].relevantGroup:insert(bombArray[a])

                        mainFunc.allLevelSettings.midScreenObjectsGroup:remove(bombArray[a].displayObjects["text"][1])
                        bombArray[a].relevantGroup:insert(bombArray[a].displayObjects["text"][1])

                        for b = 1, #bombArray[a].displayObjects["directionLabel"] do
                            mainFunc.allLevelSettings.midScreenObjectsGroup:remove(bombArray[a].displayObjects["directionLabel"][b])
                            bombArray[a].relevantGroup:insert(bombArray[a].displayObjects["directionLabel"][b])
                        end
                    end

                elseif shape.objectType ~= "shape" then
                    bombArray[a].displayObjects["text"][1]:toBack()
                    for b = 1, #bombArray[a].displayObjects["directionLabel"] do
                        bombArray[a].displayObjects["directionLabel"][b]:toBack()
                    end
                    bombArray[a]:toBack()
                end
            end
        end
    end

end
    t.bombGroupCheck = bombGroupCheck

local squarePopulator = function (thisBomb, dir, dirFactor, relevantSquareStartNum, bombExplodeArrayCounter, mainFunc, shapeArray, shapeArrayParameters, firstIndex, index, bombCounter)
    
    local explosionImageSheet = graphics.newImageSheet( "images/objects/explosion.png", {width = 60, height = 52, numFrames = 4, sheetContentWidth = 240, sheetContentHeight = 52})
    local explosionSequenceData = {
        { name = "up", frames={1,2,3,4,3,2,1}, time = 1000, loopCount = 1 }
    }

    local thisBomb = mainFunc.thisLevelSettings.bombArray[bombCounter]
    thisBomb.numberOfExplosionsOccured = thisBomb.numberOfExplosionsOccured + 1
    thisBomb.totalSquares = thisBomb.props["properties"]["squares"]

    local explosionsCounter = thisBomb.numberOfExplosionsOccured

    thisBomb.explosions[explosionsCounter] = display.newSprite(explosionImageSheet, explosionSequenceData)

    thisBomb.explosions[explosionsCounter].arrayIndex = explosionsCounter
    mainFunc.allLevelSettings.midScreenObjectsGroup:insert(thisBomb.explosions[explosionsCounter])
    thisBomb.explosions[explosionsCounter]:setSequence("up")
    --thisBomb.object.timeScale = 0.075
    thisBomb.explosions[explosionsCounter]:play()
    thisBomb.explosions[explosionsCounter].rotateTransition = timer.performWithDelay(75, function()
        thisBomb.explosions[explosionsCounter].rotateTransition = nil
        thisBomb.explosions[explosionsCounter].rotateTransitionObject = transition.to(thisBomb.explosions[explosionsCounter], {time= 200, rotation = 45, onComplete = function ()
            thisBomb.explosions[explosionsCounter].rotateTransitionObject = nil
        end}) 
    end, 1)
    showingToolsArray = mainFunc.allLevelSettings.showingToolsArray
    
    if (dir == "horz") then
        thisBomb.explosions[explosionsCounter].x = xCalc(30) + (mainFunc.allLevelSettings.squareWidth / 2) + ((thisBomb.relevantHorzSquare + relevantSquareStartNum) * mainFunc.allLevelSettings.squareWidth) + (dirFactor * (thisBomb.bombExplodeCounter[bombExplodeArrayCounter] * mainFunc.allLevelSettings.squareWidth)) + (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
        thisBomb.explosions[explosionsCounter].y = yCalc(26) + (mainFunc.allLevelSettings.squareHeight / 2) + ((thisBomb.relevantVertSquare - 1) * mainFunc.allLevelSettings.squareHeight) + (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
        thisBomb.explosions[explosionsCounter].relevantHorzSquare = thisBomb.relevantHorzSquare + ((thisBomb.bombExplodeCounter[bombExplodeArrayCounter] + 1) * dirFactor)
        thisBomb.explosions[explosionsCounter].relevantVertSquare = thisBomb.relevantVertSquare
    else
        thisBomb.explosions[explosionsCounter].y = yCalc(26) + (mainFunc.allLevelSettings.squareHeight / 2) + ((thisBomb.relevantVertSquare + relevantSquareStartNum) * mainFunc.allLevelSettings.squareHeight) + (dirFactor * (thisBomb.bombExplodeCounter[bombExplodeArrayCounter] * mainFunc.allLevelSettings.squareHeight)) + (display.contentHeight * (mainFunc.allLevelSettings.ballScreenVertValue - 1))
        thisBomb.explosions[explosionsCounter].x = xCalc(30) + (mainFunc.allLevelSettings.squareWidth / 2) + ((thisBomb.relevantHorzSquare - 1) * mainFunc.allLevelSettings.squareWidth) + (display.contentWidth * (mainFunc.allLevelSettings.ballScreenHorzValue - 1))
        thisBomb.explosions[explosionsCounter].relevantVertSquare = thisBomb.relevantVertSquare + ((thisBomb.bombExplodeCounter[bombExplodeArrayCounter] + 1) * dirFactor)
        thisBomb.explosions[explosionsCounter].relevantHorzSquare = thisBomb.relevantHorzSquare
    end
    thisBomb.explosions[explosionsCounter].fadeTransition = timer.performWithDelay(350, function() 
        thisBomb.explosions[explosionsCounter].fadeTransition = nil
        thisBomb.explosions[explosionsCounter].fadeTransitionObject = transition.to(thisBomb.explosions[explosionsCounter], {alpha = 0, time= 550, onComplete = function ()
            thisBomb.explosions[explosionsCounter].fadeTransitionObject = nil
            thisBomb.explosions[explosionsCounter]:removeSelf()
            thisBomb.explosions[explosionsCounter] = nil
        end})
    end, 1)
    for z = 1, #shapeArray do
        if shapeArray[z].breakable
        and shapeArray[z].hyrollBreakable == false
        and shapeArray[z].relevantHorzSquare == thisBomb.explosions[explosionsCounter].relevantHorzSquare
        and shapeArray[z].relevantVertSquare == thisBomb.explosions[explosionsCounter].relevantVertSquare then
            shapeArray[z].triangleDummy = display.newSprite(mainFunc.allLevelSettings.breakableTriangleImageSheet, mainFunc.allLevelSettings.breakableTriangleSequenceData)
            mainFunc.allLevelSettings.midScreenObjectsGroup:insert(shapeArray[z].triangleDummy)
            shapeArray[z].triangleDummy.x = shapeArray[z].x
            shapeArray[z].triangleDummy.y = shapeArray[z].y
            shapeArray[z].triangleDummy.xScale = 7/6
            shapeArray[z].triangleDummy.yScale = 7/6
            shapeArray[z].triangleDummy:setSequence(shapeArrayParameters[z]["subType"])
            shapeArray[z].triangleDummy:play()
            shapeArray[z].triangleDummy.fadeTransition = transition.to(shapeArray[z].triangleDummy, {alpha = 0, time = 2000, onComplete = function ()
                shapeArray[z].triangleDummy.fadeTransition = nil
                shapeArray[z].triangleDummy:removeSelf()
                shapeArray[z].triangleDummy = nil
            end})
            shapeArray[z].alpha = 0
            shapeArray[z].broken = true
            physics.removeBody(shapeArray[z])
        end
    end

    mainFunc.thisLevelSettings.bombArray[bombCounter].squarePopulatorParams = nil
    if (thisBomb.bombExplodeCounter[bombExplodeArrayCounter] < (thisBomb.totalSquares - 1) and mainFunc.thisLevelSettings.bombsCanExplode == true) then
        thisBomb.bombExplodeCounter[bombExplodeArrayCounter] = thisBomb.bombExplodeCounter[bombExplodeArrayCounter] + 1
        mainFunc.thisLevelSettings.bombArray[bombCounter].squarePopulatorTimer = timer.performWithDelay(100, function ()
            mainFunc.thisLevelSettings.bombArray[bombCounter].squarePopulatorTimer = nil
            if mainFunc.thisLevelSettings.bombsCanExplode == true then
                t.squarePopulator(thisBomb, dir, dirFactor, relevantSquareStartNum, bombExplodeArrayCounter, mainFunc, shapeArray, shapeArrayParameters, firstIndex, index, bombCounter)
            else
                mainFunc.thisLevelSettings.bombArray[bombCounter].squarePopulatorParams = {thisBomb, dir, dirFactor, relevantSquareStartNum, bombExplodeArrayCounter, mainFunc, shapeArray, shapeArrayParameters, firstIndex, index, bombCounter}
            end 
        end, 1)
    elseif (thisBomb.bombExplodeCounter[bombExplodeArrayCounter] < (thisBomb.totalSquares - 1) and mainFunc.thisLevelSettings.bombsCanExplode == false) then
        mainFunc.thisLevelSettings.bombArray[bombCounter].squarePopulatorParams = {thisBomb, dir, dirFactor, relevantSquareStartNum, bombExplodeArrayCounter, mainFunc, shapeArray, shapeArrayParameters, firstIndex, index, bombCounter}
    elseif (thisBomb.bombExplodeCounter[bombExplodeArrayCounter] == (thisBomb.totalSquares - 1) ) then
        if (thisBomb.numberOfExplosionsOccured == thisBomb.numberOfExplosions) then
            for a = 1, #thisBomb.displayObjects["directionLabel"] do
                thisBomb.displayObjects["directionLabel"][a]:removeSelf()
            end
            thisBomb.displayObjects["text"][1]:removeSelf()

            thisBomb:removeSelf()
            mainFunc.thisLevelSettings.bombInUseCounter = mainFunc.thisLevelSettings.bombInUseCounter - 1

            if (mainFunc.thisLevelSettings.bombInUseCounter == 0) then
                mainFunc.thisLevelSettings.bombIsInUse = false

                if (mainFunc.allLevelSettings.isWaitingForBombForScreenChange) then
                    timer.performWithDelay(1000, function ()
                        mainFunc.screenChangingScript.changeToRightScreen(mainFunc, shapeArray, shapeArrayParameters, "auto", mainFunc.allLevelSettings.waitingForScreenChangeDirection)
                    end, 1)
                end
            end

            thisBomb.finalRemoveBombTimer = timer.performWithDelay(1000, function ()
                thisBomb.finalRemoveBombTimer = nil
                mainFunc.thisLevelSettings.bombIsExplodingCounter = mainFunc.thisLevelSettings.bombIsExplodingCounter - 1
                mainFunc.thisLevelSettings.bombArray[bombCounter] = nil
            end)

            mainFunc.thisLevelSettings.bombArray[bombCounter].active = false
        end
    end
end
    t.squarePopulator = squarePopulator

local bombExplode = function (toolArrayCounter, bombCounter, mainFunc, shapeArray, shapeArrayParameters)
    local thisToolArrayCounter = toolArrayCounter
    local thisBomb = mainFunc.thisLevelSettings.bombArray[bombCounter]

    local function finalBombExplode (thisBomb)
        local bombExplodeArrayCounter = 1
        thisBomb.numberOfExplosions = thisBomb.props["properties"]["squares"] * #thisBomb.props["properties"]["directions"]
        thisBomb.numberOfExplosionsOccured = 0
        mainFunc.thisLevelSettings.bombIsExplodingCounter = mainFunc.thisLevelSettings.bombIsExplodingCounter + 1

        for a = 1, #thisBomb.props["properties"]["directions"] do
            if thisBomb.props["properties"]["directions"][a] == "up" then
                thisBomb.bombExplodeCounter[a] = 0
                mainFunc.objectFunctionsScript.squarePopulator(thisBomb, "vert", -1, -2, a, mainFunc, shapeArray, shapeArrayParameters, thisToolArrayCounter, a, bombCounter)
            elseif thisBomb.props["properties"]["directions"][a] == "down" then
                thisBomb.bombExplodeCounter[a] = 0
                mainFunc.objectFunctionsScript.squarePopulator(thisBomb, "vert", 1, 0, a, mainFunc, shapeArray, shapeArrayParameters, thisToolArrayCounter, a, bombCounter)
                
            elseif thisBomb.props["properties"]["directions"][a] == "right" then
                thisBomb.bombExplodeCounter[a] = 0
                mainFunc.objectFunctionsScript.squarePopulator(thisBomb, "horz", 1, 0, a, mainFunc, shapeArray, shapeArrayParameters, thisToolArrayCounter, a, bombCounter)
                
            elseif thisBomb.props["properties"]["directions"][a] == "left" then
                thisBomb.bombExplodeCounter[a] = 0
                mainFunc.objectFunctionsScript.squarePopulator(thisBomb, "horz", -1, -2, a, mainFunc, shapeArray, shapeArrayParameters, thisToolArrayCounter, a, bombCounter)
                
            end

            for a = 1, #thisBomb.displayObjects["directionLabel"] do
                thisBomb.displayObjects["directionLabel"][a].alpha = 0
            end
            thisBomb.displayObjects["text"][1].alpha = 0

            thisBomb.alpha = 0
        end

    end

    thisBomb.timer = timer.performWithDelay(3000, function ()
        thisBomb.timer = nil
        finalBombExplode(thisBomb)
    end)
end
    t.bombExplode = bombExplode

return t
