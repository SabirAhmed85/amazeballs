local t = {}

local switchImageSheet = graphics.newImageSheet( "images/objects/switchSprite.png", {frames = { {x = xCalc(0), y =yCalc(0), width = xCalc(59), height = yCalc(52)}, {x = xCalc(59), y = yCalc(0), width = xCalc(61), height = yCalc(52)} }, sheetContentWidth = xCalc(119), sheetContentHeight = yCalc(52)})
local switchSequenceData = {
    { name = "off", start=1, count=1,   loopCount=1 },
    { name = "on", start=2, count=1, loopCount=1 }
}

local function spawn (z, mainFunc)
    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "simple"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "tunnel"
    or shapeArrayParameters[z][1] == "backFire"
    or shapeArrayParameters[z][1] == "characterChangePoint" then
        object = display.newSprite(mainFunc.allLevelSettings.allFansImageSheet, mainFunc.allLevelSettings.allFansSequenceData)
        object:setSequence(shapeArrayParameters[z][1])
        if (shapeArrayParameters[z][1] == "tunnel") then
            mainFunc.thisLevelSettings.tunnelCounter = mainFunc.thisLevelSettings.tunnelCounter + 1
        end
    elseif shapeArrayParameters[z][1] == "door"
    or shapeArrayParameters[z][1] == "switch" then
        local shapeWidth = 60
        local shapeHeight = 52
        if (shapeArrayParameters[z][1] == "door") then
            shapeWidth = 26
            shapeHeight = 54
        end

        if (shapeArrayParameters[z][1] == "switch") then
            object = display.newSprite(switchImageSheet, switchSequenceData)
            object:setSequence("off")
            object.width = xCalc(60)
            object.height = yCalc(52)
        else
            object = display.newImageRect("images/objects/"..shapeArrayParameters[z][1]..".png", shapeWidth, shapeHeight)
        end
    elseif shapeArrayParameters[z][1] == "shape" then
        if shapeArrayParameters[z][10] ~= "breakable" then
            if shapeArrayParameters[z][7] == "triangleTopRightShape"
            or shapeArrayParameters[z][7] == "triangleBottomRightShape"
            or shapeArrayParameters[z][7] == "triangleBottomLeftShape"
            or shapeArrayParameters[z][7] == "triangleTopLeftShape" then
                local shapeString = shapeArrayParameters[z][7]
                if shapeArrayParameters[z][10] and (shapeArrayParameters[z][10] == "icy" or shapeArrayParameters[z][10] == "fire" or shapeArrayParameters[z][10] == "hyroll") then
                    shapeString = shapeArrayParameters[z][10] .. "-" .. shapeString
                end
                object = display.newSprite(mainFunc.allLevelSettings.triangleImageSheet, mainFunc.allLevelSettings.triangleSequenceData)
                object:setSequence(shapeString)
            elseif shapeArrayParameters[z][7] == "triangleLeftAndRightShape" then
                object = display.newSprite(mainFunc.allLevelSettings.triangleLeftAndRightImageSheet, mainFunc.allLevelSettings.triangleLeftAndRightSequenceData)
                object:setSequence(shapeArrayParameters[z][7])
                if shapeArrayParameters[z][8] == 2 then
                    object.rotation = 180
                end
            elseif shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
                object = display.newSprite(mainFunc.allLevelSettings.triangleTopAndBottomImageSheet, mainFunc.allLevelSettings.triangleTopAndBottomSequenceData)
                object:setSequence(shapeArrayParameters[z][7])
                if shapeArrayParameters[z][8] == 1 then
                    object.rotation = 180
                end
            elseif shapeArrayParameters[z][7] == "bar" or shapeArrayParameters[z][7] == "doubleBar" then
                local barSize = "single"
                if shapeArrayParameters[z][7] == "doubleBar" then
                    barSize = "double"
                end
                local barShape = "horz"
                if shapeArrayParameters[z][8] then
                    barShape = shapeArrayParameters[z][8]
                end

                object = display.newSprite(mainFunc.allLevelSettings.barImageSheet[barSize][barShape], mainFunc.allLevelSettings.barSequenceData[barSize][barShape])
                object:setSequence(shapeArrayParameters[z][7])
            end
        else
            object = display.newSprite(mainFunc.allLevelSettings.triangleImageSheet, mainFunc.allLevelSettings.triangleSequenceData)
            object:setSequence("breakable-" .. shapeArrayParameters[z][7])
            object.broken = false
        end
    elseif shapeArrayParameters[z][1] == "gem" then
        local levelItems2ImageSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItems2ImageSheet, mainFunc.allLevelSettings.levelItems2ImageSheetSettings)
        local levelItems2SequenceData = mainFunc.allLevelSettings.levelItems2SequenceData
        object = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        object:play()
        object:setSequence(shapeArrayParameters[z][7] .. "Floating")

        object.width = xCalc(60)
        object.height = yCalc(52)
    elseif shapeArrayParameters[z][1] == "item" then
        local itemsImageSheet = mainFunc.allLevelSettings.itemsImageSheet
        local itemsSequenceData = mainFunc.allLevelSettings.itemsSequenceData

        local levelItemsImageSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItemsImageSheet, mainFunc.allLevelSettings.levelItemsImageSheetSettings)
        local levelItemsSequenceData = mainFunc.allLevelSettings.levelItemsSequenceData

        if shapeArrayParameters[z][2] == "bomb"
        or shapeArrayParameters[z][2] == "hook"
        or shapeArrayParameters[z][2] == "jet"
        or shapeArrayParameters[z][2] == "clock"
        or shapeArrayParameters[z][2] == "mystery-block"
        or shapeArrayParameters[z][2] == "big-present"
        or shapeArrayParameters[z][2] == "small-present"
        or shapeArrayParameters[z][2] == "coins" then
            object = display.newSprite(itemsImageSheet, itemsSequenceData)
            object.width = xCalc(60)
            object.height = yCalc(52)
        elseif shapeArrayParameters[z][2] == "map"
        or shapeArrayParameters[z][2] == "compass" then
            object = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
            object.width = xCalc(43)
            object.height = yCalc(34)
        end

        if (shapeArrayParameters[z][2] == "map")
        and mainFunc.thisLevelSettings.mapObtained == true then
            object.x = -10000
            object.alpha = 0
        elseif (shapeArrayParameters[z][2] == "compass")
        and mainFunc.thisLevelSettings.compassObtained == true then
            object.x = -10000
            object.alpha = 0
        else
            object:play()
            if shapeArrayParameters[z][2] == "map" or shapeArrayParameters[z][2] == "compass" then
                local label = "Map"
                if shapeArrayParameters[z][2] == "compass" then
                    label = "Compass"
                end
                object:setSequence(currentMedal .. label)
            else
                local itemLabel = shapeArrayParameters[z][2]
                if shapeArrayParameters[z][2] == "coins"
                and shapeArrayParameters[z][7] > 99 then
                    itemLabel = itemLabel .. "-big"
                elseif shapeArrayParameters[z][2] == "coins"
                and shapeArrayParameters[z][7] < 99 then
                    itemLabel = itemLabel .. "-small"
                end
                object:setSequence(itemLabel)
            end
        end
    elseif shapeArrayParameters[z][1] == "endPoint" then
        object = display.newImageRect("images/objects/" .. currentMedal .. "Medal.png", 63, 55)
    elseif shapeArrayParameters[z][1] == "gun" then
        local gunImageSheet = graphics.newImageSheet( "images/objects/gun.png", {width = 60, height = 52, numFrames = 4, sheetContentWidth = 240, sheetContentHeight = 52})
        local gunSequenceData = {
            { name = "up", start=1, count=1,   loopCount=1 },
            { name = "right", start=2, count=1, loopCount=1 },
            { name = "down", start=3, count=1, loopCount=1 },
            { name = "left", start=4, count=1, loopCount=1 }
        }
        object = display.newSprite(gunImageSheet, gunSequenceData)
        object:play()
        object:setSequence(shapeArrayParameters[z][7])
    end
    return object
end

local function createLevelObject(shapeArrayParameters, shapeArray, z, mainFunc)
    shapeArray[z] = spawn(z, mainFunc)
    shapeArray[z].relevantShapeArrayIndex = z
    shapeArray[z].relevantHorzScreen = shapeArrayParameters[z][3]
    shapeArray[z].relevantVertScreen = shapeArrayParameters[z][4]
    if shapeArrayParameters[z][1] == "shape" then
        shapeArray[z].isCollisioning = false
        shapeArray[z].breakable = false
        shapeArray[z].hyrollBreakable = false
        for a = 1, #mainFunc.shapeRelatedArrays.shapeFormingArray  do
            if mainFunc.shapeRelatedArrays.shapeFormingArray[a][1] == shapeArrayParameters[z][7] then
                relevantShape = mainFunc.shapeRelatedArrays.shapeFormingArray[a][2]
                if shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
                    relevantShape = mainFunc.shapeRelatedArrays.shapeFormingArray[a][3]
                end
                if (shapeArrayParameters[z][9] and shapeArrayParameters[z][9] ~= "_" and (shapeArrayParameters[z][7] ~= "bar" and shapeArrayParameters[z][7] ~= "doubleBar") ) then
                    shapeArrayParam = (shapeArrayParameters[z][9]) + 11
                    shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[shapeArrayParam]
                    shapeArray[z].directionsArrayAtIndex = shapeArrayParam
                else 
                    if shapeArrayParameters[z][7] ~= "bar" and shapeArrayParameters[z][7] ~= "doubleBar" then
                        shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[mainFunc.shapeRelatedArrays.shapeFormingArray[a][5]]
                        shapeArray[z].directionsArrayAtIndex = mainFunc.shapeRelatedArrays.shapeFormingArray[a][5]
                    elseif shapeArrayParameters[z][7] == "bar" or shapeArrayParameters[z][7] == "doubleBar" then
                        local shape = shapeArrayParameters[z][8]
                        local arrayIndex = 2
                        if shape == "vert" then
                            arrayIndex = 4
                        end
                        local indexAddition = 1
                        if shapeArrayParameters[z][9] and shapeArrayParameters[z][9] ~= "_" then
                            indexAddition = shapeArrayParameters[z][9]
                        end
                        shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[mainFunc.shapeRelatedArrays.shapeFormingArray[a][3] + indexAddition]
                        shapeArray[z].directionsArrayAtIndex = mainFunc.shapeRelatedArrays.shapeFormingArray[a][3]
                    end
                end
                if (shapeArrayParameters[z][10] and (shapeArrayParameters[z][10] == "breakable" or shapeArrayParameters[z][10] == "hyroll") ) then
                    shapeArray[z].breakable = true
                    shapeArray[z].hyrollBeakable = false
                    if shapeArrayParameters[z][10] == "hyroll" then
                        shapeArray[z].hyrollBreakable = true
                    end
                else
                    shapeArray[z].breakable = false
                    shapeArray[z].hyrollBreakable = false
                end
                if (shapeArrayParameters[z][10] and (shapeArrayParameters[z][10] == "icy" or shapeArrayParameters[z][10] == "fire") ) then
                    shapeArray[z].triangleSpecialType = shapeArrayParameters[z][10]
                end
            end
        end
        physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape=relevantShape } )
        shapeArray[z].relevantPhysicsBodyParams = { density=10, friction=1, bounce=0, shape=relevantShape }
        shapeArray[z].shape = shapeArrayParameters[z][7]
        shapeArray[z].effectiveShape = shapeArray[z].shape
        shapeArray[z].state = 1
        if shapeArrayParameters[z][8] then
            shapeArray[z].state = shapeArrayParameters[z][8]
        end
        shapeArray[z].transitionArrayState = shapeArrayParameters[z][8]
        shapeArray[z].isTransitioning = false
        sceneGroup:insert( shapeArray[z] )
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
    elseif shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "door"
    or shapeArrayParameters[z][1] == "tunnel" 
    or shapeArrayParameters[z][1] == "switch"
    or shapeArrayParameters[z][1] == "endPoint"
    or shapeArrayParameters[z][1] == "characterChangePoint"
    or shapeArrayParameters[z][1] == "simple" 
    or shapeArrayParameters[z][1] == "backFire" then
        --shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint)
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z] )
        shapeArray[z].isTransitioning = false
    end

    if shapeArrayParameters[z][1] == "gun" then
        --shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint)
        shapeArray[z].anchorX = 0.5
        shapeArray[z].anchorY = 0.5
        shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[mainFunc.shapeRelatedArrays.shapeFormingArray[9][3]]
        shapeArray[z].directionsArrayAtIndex = mainFunc.shapeRelatedArrays.shapeFormingArray[9][3]
        shapeArray[z].state = 1
        shapeArray[z].shape = "gun"
        physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape = mainFunc.shapeRelatedArrays.shapeFormingArray[9][2] } )
        sceneGroup:insert( shapeArray[z] )
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(shapeArray[z])
    end
    
    if shapeArrayParameters[z][1] == "switch" then
        shapeArray[z].switchCounter = 0
        shapeArray[z].switchOnOffCounter = 0
        if shapeArrayParameters[z][7] == "rotate-object" then
            shapeArray[z].rotateSwitch = "first"
        end
    end
    
    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan" then
        -- shapeArray[z].xScale = 0.6
        -- shapeArray[z].yScale = 0.6
        shapeArray[z].direction = shapeArrayParameters[z][7]
    end
    
    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "spitter" then
        shapeArray[z].isBallPresent = false
    end

    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "shape"
    or shapeArrayParameters[z][1] == "simple"
    or shapeArrayParameters[z][1] == "backFire"
    or shapeArrayParameters[z][1] == "tunnel" then
        shapeArray[z].canShapeSlide = true
        shapeArray[z].lastBallReleaseDirection = nil
    end
    
    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "characterChangePoint"
    or shapeArrayParameters[z][1] == "simple"
    or shapeArrayParameters[z][1] == "backFire"
    or shapeArrayParameters[z][1] == "tunnel" then
        shapeArray[z].enabled = true
    end

    if shapeArrayParameters[z][1] == "manualFan" then
        shapeArray[z].activeNow = false
    end

    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "shape"
    or shapeArrayParameters[z][1] == "simple"
    or shapeArrayParameters[z][1] == "item"
    or shapeArrayParameters[z][1] == "endPoint"
    or shapeArrayParameters[z][1] == "backFire"
    or shapeArrayParameters[z][1] == "tunnel"
    or shapeArrayParameters[z][1] == "characterChangePoint" then

        if shapeArrayParameters[z][1] == "shape" and (shapeArrayParameters[z][7] == "bar" or (shapeArrayParameters[z][7] == "doubleBar") ) then
            shapeArray[z].width = (50/60) * mainFunc.allLevelSettings.squareWidth
        elseif shapeArrayParameters[z][1] == "shape" and shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
            shapeArray[z].width = mainFunc.allLevelSettings.squareWidth * 2
        else
            shapeArray[z].width = mainFunc.allLevelSettings.squareWidth
        end
    end
    
    if shapeArrayParameters[z][1] == "shape" and shapeArrayParameters[z][7] == "triangleLeftAndRightShape" then
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 2
    elseif shapeArrayParameters[z][1] == "shape" and shapeArrayParameters[z][7] == "doubleBar" and shapeArrayParameters[z][8] == "horz" then
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 1.75
    elseif shapeArrayParameters[z][1] == "shape" and shapeArrayParameters[z][7] == "doubleBar" and shapeArrayParameters[z][8] == "vert" then
        print(shapeArrayParameters[z][7], shapeArrayParameters[z][8])
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 2.75
    else
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
    end
    
    shapeArray[z].anchorX = 0.5
    shapeArray[z].anchorY = 0.5
    shapeArray[z].x = ((shapeArrayParameters[z][3] - 1) * display.contentWidth) + (((shapeArrayParameters[z][5] - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth ) + (mainFunc.allLevelSettings.squareWidth/2)
    shapeArray[z].y = ((shapeArrayParameters[z][4] - 1) * display.contentHeight) + (((shapeArrayParameters[z][6] - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight ) + (mainFunc.allLevelSettings.squareHeight/2)
    shapeArray[z].name = shapeArrayParameters[z][2]
    shapeArray[z].relevantHorzScreen = shapeArrayParameters[z][3]
    shapeArray[z].relevantVertScreen = shapeArrayParameters[z][4]
    shapeArray[z].relevantHorzSquare = shapeArrayParameters[z][5]
    shapeArray[z].relevantVertSquare = shapeArrayParameters[z][6]
    shapeArray[z].objectType = shapeArrayParameters[z][1]
    shapeArray[z].shapeArrayIndex = z
    shapeArray[z].mainFuncListenerAdded = false
    shapeArray[z].isAutoSliding = false
    shapeArray[z].isAutoSlideObject = false
    shapeArray[z].origWidth = shapeArray[z].width
    shapeArray[z].origHeight = shapeArray[z].height

    if (shapeArrayParameters[z][1] ~= "door") then
        shapeArray[z].x = shapeArray[z].x + ((mainFunc.allLevelSettings.squareWidth - shapeArray[z].contentWidth) / 2)
        shapeArray[z].y = shapeArray[z].y + ((mainFunc.allLevelSettings.squareHeight - shapeArray[z].contentHeight) / 2)
    end
    
    if (shapeArrayParameters[z][1] == "shape") then
        if (shapeArrayParameters[z][7] ~= "triangleLeftAndRightShape")
        and (shapeArrayParameters[z][7] ~= "triangleTopAndBottomShape") then
            shapeArray[z].y = shapeArray[z].y
            shapeArray[z].x = shapeArray[z].x
        else
            if (shapeArrayParameters[z][7] == "triangleLeftAndRightShape") then
                shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight)
                if (shapeArrayParameters[z][8] == 2) then
                    shapeArray[z].x = shapeArray[z].x + xCalc(4)
                    shapeArray[z].y = shapeArray[z].y + yCalc(1)
                end
            else
                shapeArray[z].x = shapeArray[z].x + xCalc(60)
                shapeArray[z].y = shapeArray[z].y
                if (shapeArrayParameters[z][8] == 2) then
                    shapeArray[z].y = shapeArray[z].y - yCalc(3)
                end
            end
        end
        if (shapeArrayParameters[z][7] == "triangleBottomLeftShape")
        or (shapeArrayParameters[z][7] == "triangleTopLeftShape") then
            shapeArray[z].x = shapeArray[z].x + xCalc(1)
        elseif (shapeArrayParameters[z][7] == "triangleBottomRightShape")
        or (shapeArrayParameters[z][7] == "triangleTopRightShape") then
            shapeArray[z].x = shapeArray[z].x - xCalc(1)
        end

        if (shapeArrayParameters[z][7] == "triangleTopRightShape")
        or (shapeArrayParameters[z][7] == "triangleTopLeftShape") then
            shapeArray[z].y = shapeArray[z].y + yCalc(1)
        elseif (shapeArrayParameters[z][7] == "triangleBottomRightShape")
        or (shapeArrayParameters[z][7] == "triangleBottomLeftShape") then
            shapeArray[z].y = shapeArray[z].y - yCalc(1)
        end

        if (shapeArrayParameters[z][10] and shapeArrayParameters[z][10] == "breakable") then
            shapeArray[z].y = shapeArray[z].y
            shapeArray[z].x = shapeArray[z].x
            if shapeArrayParameters[z][7] ~= "triangleTopRightShape" then
                local shapePosArray = {
                    triangleBottomRightShape = {y = 7, x = -4},
                    triangleBottomLeftShape = {y = 2, x = -1},
                    triangleTopLeftShape = {y = 7, x = -5}
                }

                --shapeArray[z].y = shapeArray[z].y + yCalc(shapePosArray[shapeArrayParameters[z][7]]["y"])
                --shapeArray[z].x = shapeArray[z].x + xCalc(shapePosArray[shapeArrayParameters[z][7]]["x"])
            end
        end

        local relevantDirectionArray

        if (shapeArrayParameters[z][7] == "bar") or (shapeArrayParameters[z][7] == "doubleBar") then
            if shapeArray[z].state == "horz" then
                shapeArray[z].x = shapeArray[z].x - (mainFunc.allLevelSettings.squareWidth / 2) - xCalc(5)
                if (shapeArrayParameters[z][7] == "doubleBar") then
                    shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight) - yCalc(7)
                end
                relevantDirectionArray = 2
            else
                shapeArray[z].rotation = 90
                shapeArray[z].x = shapeArray[z].x - xCalc(5)
                shapeArray[z].y = shapeArray[z].y - (mainFunc.allLevelSettings.squareHeight/2)
                relevantDirectionArray = 4
                if (shapeArrayParameters[z][7] == "doubleBar") then
                    shapeArray[z].x = shapeArray[z].x + (mainFunc.allLevelSettings.squareWidth / 2)
                    shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight) - yCalc(5)
                end
            end
        end
        
        if (shapeArrayParameters[z][7] ~= "bar") and (shapeArrayParameters[z][7] ~= "doubleBar") then
            relevantDirectionArray = shapeArray[z].state * 2
        end
        
        for a = 1, #shapeArray[z].directionsArray[relevantDirectionArray] do
            if a < 5 then

                if shapeArray[z].directionsArray[relevantDirectionArray][a][1] then
                    if (a == 4
                    and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
                    and shapeArray[z].state == 1)
                    or (a == 2
                    and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
                    and shapeArray[z].state == 2)
                    or (a == 3
                    and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
                    and shapeArray[z].state == 1)
                    or (a == 1
                    and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
                    and shapeArray[z].state == 2)
                    or (a == 4
                    and shapeArrayParameters[z][7] == "triangleTopRightShape")
                    or (a == 4
                    and shapeArrayParameters[z][7] == "triangleBottomRightShape")
                    or (a == 2
                    and shapeArrayParameters[z][7] == "triangleTopLeftShape")
                    or (a == 2
                    and shapeArrayParameters[z][7] == "triangleBottomLeftShape")
                    or ( (a == 1 or a == 3)
                    and (shapeArrayParameters[z][7] == "bar" or shapeArrayParameters[z][7] == "doubleBar") and shapeArrayParameters[z][8] == "horz")
                    or ( (a == 2 or a == 4)
                    and (shapeArrayParameters[z][7] == "bar" or shapeArrayParameters[z][7] == "doubleBar") and shapeArrayParameters[z][8] == "vert") then
                    
                    else
                        killBar = display.newImageRect("images/objects/killBar.png", 17, 49)

                        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                        killBar.relatedShape = shapeArray[z].name
                        killBar.relatedDirectionArrayIndex = a
                        
                        if (a == 4
                        and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
                        and shapeArray[z].state == 2) then
                            killBar.relatedDirectionArrayIndex = 2
                        elseif (a == 3
                        and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
                        and shapeArray[z].state == 2) then
                            killBar.relatedDirectionArrayIndex = 1
                        end
                        
                        killBar.x = shapeArray[z].x
                        killBar.y = shapeArray[z].y

                        if shapeArrayParameters[z][7] == "bar" or shapeArrayParameters[z][7] == "doubleBar" then
                            if shapeArray[z].state == "horz" then
                                if (a == 2) then
                                    killBar.x = killBar.x - xCalc(7)
                                    killBar.rotation = 180
                                else
                                    killBar.x = killBar.x + xCalc(7)
                                    killBar.rotation = 0
                                end
                            else
                                if (a == 1) then
                                    killBar.y = killBar.y + yCalc(6)
                                    killBar.rotation = 90
                                else
                                    killBar.y = killBar.y - yCalc(6)
                                    killBar.rotation = -90
                                end
                            end
                        end
                    end
                    --local textObj = display.newText(shapeArray[z].name, 0,0, nil, 14); textObj.x = 20;
                    local killBarPositionArray = {
                        {"triangleTopLeftShape","triangleTopRightShape", 0, 25, 90, "triangleLeftAndRightShape", 0, 25, 45, 0, -25, -135, "triangleTopAndBottomShape", -27, 25, 90, 27, 25, 90, "triangleBottomLeftShape", -3, -1, 135, "triangleBottomRightShape", 0, 0, 45},
                        {"triangleTopRightShape","triangleBottomRightShape", -25, 0, 180, "triangleLeftAndRightShape", -27, -24, 180, -27, 22, 180, "triangleTopAndBottomShape", -24, -4, 135, -24, 4, 135},
                        {"triangleBottomLeftShape","triangleBottomRightShape", 3, -25, -90, "triangleLeftAndRightShape", 3, -24, -45, -3, 24, 135, "triangleTopAndBottomShape", -27, -25, -90, 27, -25, -90, "triangleTopLeftShape", -3, -2, 225, "triangleTopRightShape", 2, -1, -45},
                        {"triangleTopLeftShape","triangleBottomLeftShape", 25, 0, 0, "triangleLeftAndRightShape", 27, 24, 0, 27, -22, 0, "triangleTopAndBottomShape", 24, -4, -45, 24, 4, 45}
                    }
                    
                    for b=1, #killBarPositionArray do
                        if a == b then
                            if shapeArrayParameters[z][7] == killBarPositionArray[b][1]
                            or shapeArrayParameters[z][7] == killBarPositionArray[b][2] then
                                killBar.x = killBar.x + xCalc(killBarPositionArray[b][3])
                                killBar.y = killBar.y + yCalc(killBarPositionArray[b][4])
                                killBar.rotation = killBarPositionArray[b][5]
                            elseif shapeArrayParameters[z][7] == killBarPositionArray[b][6] then
                                if a == 4 then
                                    thisRelevantState = 2
                                else
                                    thisRelevantState = 1
                                end
                                if b % 2 == 0 then
                                    if shapeArray[z].state == thisRelevantState then
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][7])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][8])
                                        killBar.rotation = killBarPositionArray[b][9]
                                        
                                        killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                        killBar.relatedShape = shapeArray[z].name
                                        killBar.relatedDirectionArrayIndex = 2
                                        killBar.x = shapeArray[z].x + xCalc(killBarPositionArray[b][10])
                                        killBar.y = shapeArray[z].y + yCalc(killBarPositionArray[b][11])
                                        killBar.rotation = killBarPositionArray[b][12]
                                    end
                                else
                                    if shapeArray[z].state == 1 then
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][7])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][8])
                                        killBar.rotation = killBarPositionArray[b][9]
                                    else
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][10])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][11])
                                        killBar.rotation = killBarPositionArray[b][12]
                                    end
                                end
                            elseif shapeArrayParameters[z][7] == killBarPositionArray[b][13] then
                                if b % 2 == 0 then
                                    if shapeArray[z].state == 1 then
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][14])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][15])
                                        killBar.rotation = killBarPositionArray[b][16]
                                    else
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][17])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][18])
                                        killBar.rotation = killBarPositionArray[b][19]
                                    end
                                else
                                    if b == 3 then
                                        thisRelevantState = 2
                                    else
                                        thisRelevantState = 1
                                    end
                                    if shapeArray[z].state == thisRelevantState then
                                        killBar.x = killBar.x + xCalc(killBarPositionArray[b][14])
                                        killBar.y = killBar.y + yCalc(killBarPositionArray[b][15])
                                        killBar.rotation = killBarPositionArray[b][16]
                                        
                                        killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                        killBar.relatedShape = shapeArray[z].name
                                        killBar.relatedDirectionArrayIndex = 1
                                        killBar.x = shapeArray[z].x + xCalc(killBarPositionArray[b][17])
                                        killBar.y = shapeArray[z].y + yCalc(killBarPositionArray[b][18])
                                        killBar.rotation = killBarPositionArray[b][19]
                                    end
                                end
                            end
                            
                            if (killBarPositionArray[b][20]) then
                                if shapeArrayParameters[z][7] == killBarPositionArray[b][20] then
                                    killBar.x = killBar.x + xCalc(killBarPositionArray[b][21])
                                    killBar.y = killBar.y + yCalc(killBarPositionArray[b][22])
                                    killBar.rotation = killBarPositionArray[b][23]
                                elseif shapeArrayParameters[z][7] == killBarPositionArray[b][24] then
                                    killBar.x = killBar.x + xCalc(killBarPositionArray[b][25])
                                    killBar.y = killBar.y + yCalc(killBarPositionArray[b][26])
                                    killBar.rotation = killBarPositionArray[b][27]
                                end
                            end
                        end
                    end
                    
                elseif shapeArray[z].directionsArray[relevantDirectionArray][a] == "specialRule" then
                    
                    if shapeArrayParameters[z][7] == "triangleLeftAndRightShape" then
                        if shapeArray[z].state == 1 then
                            if a == 2 then
                                if shapeArray[z].directionsArray[2][5][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 2
                                    killBar.rotation = 180
                                    killBar.x = shapeArray[z].x - xCalc(27)
                                    killBar.y = shapeArray[z].y - yCalc(22)
                                end
                                if shapeArray[z].directionsArray[2][6][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 2
                                    killBar.rotation = 180
                                    killBar.x = shapeArray[z].x - xCalc(27)
                                    killBar.y = shapeArray[z].y + yCalc(22)
                                end
                            end
                        else
                            if a == 4 then
                                if shapeArray[z].directionsArray[2][7][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 2
                                    killBar.rotation = 180
                                    killBar.x = shapeArray[z].x - xCalc(27)
                                    killBar.y = shapeArray[z].y - yCalc(22)
                                end
                                if shapeArray[z].directionsArray[2][8][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 2
                                    killBar.rotation = 0
                                    killBar.x = shapeArray[z].x + xCalc(27)
                                    killBar.y = shapeArray[z].y + yCalc(22)
                                end
                            end
                        end
                    elseif shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
                        if shapeArray[z].state == 1 then
                            if a == 1 then
                                if shapeArray[z].directionsArray[2][5][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 1
                                    killBar.rotation = 90
                                    killBar.x = shapeArray[z].x - xCalc(27)
                                    killBar.y = shapeArray[z].y + yCalc(25)
                                end
                                if shapeArray[z].directionsArray[2][6][1] then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 1
                                    killBar.rotation = 90
                                    killBar.x = shapeArray[z].x + xCalc(27)
                                    killBar.y = shapeArray[z].y + yCalc(25)
                                end
                            end
                        else
                            if a == 3 then
                                if shapeArray[z].directionsArray[relevantDirectionArray][7] == "kill" then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 1
                                    killBar.rotation = -90
                                    killBar.x = shapeArray[z].x - xCalc(27)
                                    killBar.y = shapeArray[z].y - yCalc(26)
                                end
                                if shapeArray[z].directionsArray[2][8] == "kill" then
                                    killBar = display.newImageRect("images/objects/killBar.png", 17, 49)
                                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                                    killBar.relatedShape = shapeArray[z].name
                                    killBar.relatedDirectionArrayIndex = 1
                                    killBar.rotation = -90
                                    killBar.x = shapeArray[z].x + xCalc(27)
                                    killBar.y = shapeArray[z].y - yCalc(26)
                                end
                            end
                        end
                    end
                end
            end
        end
        
    end
    
    if (shapeArrayParameters[z][1] == "door") then
        if shapeArrayParameters[z][7] == "up" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareWidth
            shapeArray[z].width = yCalc(26)
            shapeArray[z].y = shapeArray[z].y - (mainFunc.allLevelSettings.squareHeight) + (shapeArray[z].contentWidth/2) - yCalc(4)
            shapeArray[z].x = shapeArray[z].x
            shapeArray[z].rotation = 270
        elseif shapeArrayParameters[z][7] == "right" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
            shapeArray[z].width = xCalc(26)
            shapeArray[z].x = shapeArray[z].x + mainFunc.allLevelSettings.gutterWidth + xCalc(17)
            shapeArray[z].y = shapeArray[z].y
        elseif shapeArrayParameters[z][7] == "down" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareWidth
            shapeArray[z].width = yCalc(26)
            shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.gutterHeight * 2) + mainFunc.allLevelSettings.squareHeight - (shapeArray[z].contentWidth * 2) - yCalc(17)
            shapeArray[z].x = shapeArray[z].x
            shapeArray[z].rotation = 90
        elseif shapeArrayParameters[z][7] == "left" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
            shapeArray[z].width = xCalc(26)
            shapeArray[z].xScale = -1
            shapeArray[z].x = shapeArray[z].x - mainFunc.allLevelSettings.gutterWidth - xCalc(17)
            -- - mainFunc.allLevelSettings.gutterWidth - 22
            shapeArray[z].y = shapeArray[z].y
        end
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
        if shapeArrayParameters[z][8] and shapeArrayParameters[z][8] == "enabled" then
            shapeArray[z].enabled = true
        elseif shapeArrayParameters[z][8] and shapeArrayParameters[z][8] == "disabled" then
            shapeArray[z].enabled = false
        else
            shapeArray[z].enabled = true
        end
        if shapeArray[z].enabled == false then
            shapeArray[z].alpha = 0
        end
    end
    
    if shapeArrayParameters[z][1] == "spitter" then
        shapeArray[z].type = shapeArrayParameters[z][1]
        shapeArray[z].upEnabled = false
        shapeArray[z].rightEnabled = false
        shapeArray[z].downEnabled = false
        shapeArray[z].leftEnabled = false
        
        if shapeArrayParameters[z][7] == "up" then
            shapeArray[z].upEnabled = true
            shapeArray[z].upArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
            --shapeArray[z].upArrow:setReferencePoint(display.TopLeftReferencePoint);
            shapeArray[z].upArrow.anchorX = 0.5
            shapeArray[z].upArrow.anchorY = 0.5
            mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].upArrow )
            shapeArray[z].upArrow.x = shapeArray[z].x
            shapeArray[z].upArrow.y = shapeArray[z].y - yCalc(16.5)
        end
        if shapeArrayParameters[z][8] == "right" then
            shapeArray[z].rightEnabled = true
            shapeArray[z].rightArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
            --shapeArray[z].rightArrow:setReferencePoint(display.TopLeftReferencePoint);
            shapeArray[z].rightArrow.anchorX = 0.5
            shapeArray[z].rightArrow.anchorY = 0.5
            mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].rightArrow )
            shapeArray[z].rightArrow.rotation = 90
            shapeArray[z].rightArrow.x = shapeArray[z].x + xCalc(17.5)
            shapeArray[z].rightArrow.y = shapeArray[z].y
        end
        if shapeArrayParameters[z][9] == "down" then
            shapeArray[z].downEnabled = true
            shapeArray[z].downArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
            --shapeArray[z].downArrow:setReferencePoint(display.TopLeftReferencePoint);
            shapeArray[z].downArrow.anchorX = 0.5
            shapeArray[z].downArrow.anchorY = 0.5
            mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].downArrow )
            shapeArray[z].downArrow.yScale = -1
            shapeArray[z].downArrow.x = shapeArray[z].x
            shapeArray[z].downArrow.y = shapeArray[z].y + yCalc(16.5)
        end
        if shapeArrayParameters[z][10] == "left" then
            shapeArray[z].leftEnabled = true
            shapeArray[z].leftArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
            --shapeArray[z].leftArrow:setReferencePoint(display.TopLeftReferencePoint);
            shapeArray[z].leftArrow.anchorX = 0.5
            shapeArray[z].leftArrow.anchorY = 0.5
            mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].leftArrow )
            shapeArray[z].leftArrow.rotation = 270
            shapeArray[z].leftArrow.x = shapeArray[z].x - xCalc(17.5)
            shapeArray[z].leftArrow.y = shapeArray[z].y
        end

    end
    
    if shapeArrayParameters[z][1] == "tunnel" then
        local tunnelPiecesImageSheet = graphics.newImageSheet( "images/objects/tunnel-extraPiecesSprite.png", {width = 25, height = 30, numFrames = 21, sheetContentWidth = 175, sheetContentHeight = 90})
        local tunnelPiecesSequenceData = {
            { name = "blueCircleOn", start=1, count=1,   loopCount=1 },
            { name = "greenCircleOn", start=2, count=1, loopCount=1 },
            { name = "redCircleOn", start=3, count=1,   loopCount=1 },
            { name = "orangeCircleOn", start=4, count=1, loopCount=1 },
            { name = "whiteCircleOn", start=5, count=1,   loopCount=1 },
            { name = "greyCircleOn", start=6, count=1, loopCount=1 },
            { name = "purpleCircleOn", start=7, count=1,   loopCount=1 },
            { name = "blueCircleOff", start=8, count=1, loopCount=1 },
            { name = "greenCircleOff", start=9, count=1,   loopCount=1 },
            { name = "redCircleOff", start=10, count=1, loopCount=1 },
            { name = "orangeCircleOff", start=11, count=1,   loopCount=1 },
            { name = "whiteCircleOff", start=12, count=1, loopCount=1 },
            { name = "greyCircleOff", start=13, count=1,   loopCount=1 },
            { name = "purpleCircleOff", start=14, count=1, loopCount=1 },
            { name = "blueArrow", start=15, count=1,   loopCount=1 },
            { name = "greenArrow", start=16, count=1, loopCount=1 },
            { name = "redArrow", start=17, count=1,   loopCount=1 },
            { name = "orangeArrow", start=18, count=1, loopCount=1 },
            { name = "whiteArrow", start=19, count=1,   loopCount=1 },
            { name = "greyArrow", start=20, count=1, loopCount=1 },
            { name = "purpleArrow", start=21, count=1,   loopCount=1 }
        }
        local tunnelColoursArray = {"blue", "green", "red", "orange", "white", "grey", "purple"}
        local tunnelDirectionIndicatorArrowArray = {
            {-1, 13},
            {-16, 0},
            {-1, -16},
            {28, 0}
        }
        local exitTunnelDirectionIndicatorArrowArray = {
            {0, -15},
            {19, 0},
            {0, 15},
            {-19, 0}
        }

        shapeArray[z].colour = tunnelColoursArray[mainFunc.thisLevelSettings.tunnelCounter - mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed]

        for a = 1, #mainFunc.thisLevelSettings.alreadyProcessedTunnels do
            if shapeArrayParameters[z][7] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][2]
            and shapeArrayParameters[z][8] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][3]
            and shapeArrayParameters[z][9] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][4]
            and shapeArrayParameters[z][10] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][5] then
                shapeArray[z].colour = mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][1]
                mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed = mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed + 1
            end
        end

        shapeArray[z].secondDirection = shapeArrayParameters[z][11]
        shapeArray[z].relevantLowerX = shapeArray[z].x - (mainFunc.allLevelSettings.squareWidth/2)
        shapeArray[z].relevantHigherX = shapeArray[z].x + (mainFunc.allLevelSettings.squareWidth/2)
        shapeArray[z].relevantLowerY = shapeArray[z].y - (mainFunc.allLevelSettings.squareHeight/2)
        shapeArray[z].relevantHigherY = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight/2)

        shapeArray[z].tunnelCircle = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
        shapeArray[z].tunnelCircle:setSequence(shapeArray[z].colour .. "CircleOff")
        shapeArray[z].tunnelCircle.width = xCalc(25)
        shapeArray[z].tunnelCircle.height = yCalc(30)
        shapeArray[z].tunnelCircle.x = shapeArray[z].x
        shapeArray[z].tunnelCircle.y = shapeArray[z].y + yCalc(1)
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].tunnelCircle )
        
        shapeArray[z].endTunnelPiece = display.newImageRect("images/objects/tunnel-endPoint.png", 31, 30)
        shapeArray[z].endTunnelPiece.x = ((shapeArrayParameters[z][7] - 1) * display.contentWidth) + (((shapeArrayParameters[z][9] - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth ) + (mainFunc.allLevelSettings.squareWidth/2)
        shapeArray[z].endTunnelPiece.y = ((shapeArrayParameters[z][8] - 1) * display.contentHeight) + (((shapeArrayParameters[z][10] - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight ) + (mainFunc.allLevelSettings.squareHeight/2)
        shapeArray[z].endTunnelPiece.alpha = 0.55
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].endTunnelPiece )

        shapeArray[z].endTunnelCircle = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
        shapeArray[z].endTunnelCircle:setSequence(shapeArray[z].colour .. "CircleOff")
        shapeArray[z].endTunnelCircle.x = shapeArray[z].endTunnelPiece.x
        shapeArray[z].endTunnelCircle.y = shapeArray[z].endTunnelPiece.y
        shapeArray[z].endTunnelCircle.alpha = 0.55
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].endTunnelCircle )
        
        shapeArray[z].exitDirectionArrow = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
        shapeArray[z].exitDirectionArrow:setSequence(shapeArray[z].colour .. "Arrow")
        shapeArray[z].exitDirectionArrow.x = shapeArray[z].endTunnelCircle.x
        shapeArray[z].exitDirectionArrow.y = shapeArray[z].endTunnelCircle.y
        if shapeArray[z].secondDirection ~= "none" then
            shapeArray[z].exitDirectionArrow.alpha = 0.55
        else
            shapeArray[z].exitDirectionArrow.alpha = 0
        end
        
        for a = 1, #mainFunc.shapeRelatedArrays.directionArray do
            if mainFunc.shapeRelatedArrays.directionArray[a] == shapeArray[z].secondDirection then
                shapeArray[z].exitDirectionArrow.x = shapeArray[z].exitDirectionArrow.x + exitTunnelDirectionIndicatorArrowArray[a][1]
                shapeArray[z].exitDirectionArrow.y = shapeArray[z].exitDirectionArrow.y + exitTunnelDirectionIndicatorArrowArray[a][2]
                shapeArray[z].exitDirectionArrow.rotation = (90 * (a - 2))
            end
        end
        
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].exitDirectionArrow )

        table.insert(mainFunc.thisLevelSettings.alreadyProcessedTunnels, {shapeArray[z].colour, shapeArrayParameters[z][7], shapeArrayParameters[z][8], shapeArrayParameters[z][9], shapeArrayParameters[z][10]})
    end
    
    if shapeArrayParameters[z][1] == "switch" then
        local switchNumberImageSheet = graphics.newImageSheet( "images/objects/numbers/switchNumber"..mainFunc.thisLevelSettings.numberOfSwitchesCounter..".png", {width = 39, height = 37, numFrames = 2})
        local switchNumberSequenceData = {
            { name = "off", start=1, count=1,   loopCount=1 },
            { name = "on", start=2, count=1, loopCount=1 }
        }

        shapeArray[z].objectsToProcess = shapeArrayParameters[z][7]
        
        if (shapeArrayParameters[z][9] == nil or shapeArrayParameters[z][9] == "labelled") then
            shapeArray[z].isLabelled = true
            shapeArray[z].switchValueText = display.newSprite(switchNumberImageSheet, switchNumberSequenceData)
            --shapeArray[z].switchValueText:toBack()
            mainFunc.allLevelSettings.midScreenObjectsGroup:insert( shapeArray[z].switchValueText )
            shapeArray[z].switchValueText:play()
            shapeArray[z].switchValueText.x = shapeArray[z].x
            shapeArray[z].switchValueText.y = shapeArray[z].y
        else
            shapeArray[z].isLabelled = false
        end
        
        if shapeArray[z].isLabelled then
            local function addSwitchValueText(thisFlippingShapeIndex)
                shapeArray[thisFlippingShapeIndex].isLabelled = true
                shapeArray[thisFlippingShapeIndex].switchValueText = display.newImage("images/objects/numbers/flipPositionSwitchNumber"..mainFunc.thisLevelSettings.numberOfSwitchesCounter..".png")
                mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[thisFlippingShapeIndex].switchValueText )
                shapeArray[thisFlippingShapeIndex].switchValueText:toFront()
                shapeArray[thisFlippingShapeIndex].switchValueText.x = shapeArray[thisFlippingShapeIndex].x
                shapeArray[thisFlippingShapeIndex].switchValueText.y = shapeArray[thisFlippingShapeIndex].y
            end
            for index = 1, #shapeArray[z].objectsToProcess do
                if shapeArray[z].objectsToProcess[index][1] == "flip-horizontal"
                or shapeArray[z].objectsToProcess[index][1] == "flip-vertical"
                or shapeArray[z].objectsToProcess[index][1] == "slide" then

                    if shapeArray[z].objectsToProcess[index][1] == "flip-horizontal" then
                        for a = 1, #shapeArrayParameters do
                            if shapeArrayParameters[a][2] == shapeArray[z].objectsToProcess[index][2] then
                                shapeArray[a].switchSlideNextOrPrev = "next"
                            end
                        end
                    end
                    for a = 1, #shapeArrayParameters do
                        local function addSwitchValueTextForFlip(thisFlippingShapeIndex)
                            local switchValueTextPositioningArray = {
                                {"triangleTopLeftShape", 0, 11, 11, 1},
                                {"triangleTopRightShape", 0, 11, -13, 1},
                                {"triangleBottomRightShape", -1, -11, -12, -1},
                                {"triangleBottomLeftShape", 0, -11, 12, 0}
                            }
                            
                            for b =1, #switchValueTextPositioningArray do
                                if shapeArrayParameters[thisFlippingShapeIndex][7] == switchValueTextPositioningArray[b][1] then
                                    if thisFlipTransitionDirection == "flip-horizontal" then
                                        shapeArray[thisFlippingShapeIndex].switchValueText.x  = shapeArray[thisFlippingShapeIndex].switchValueText.x + xCalc(switchValueTextPositioningArray[b][2])
                                        shapeArray[thisFlippingShapeIndex].switchValueText.y  = shapeArray[thisFlippingShapeIndex].switchValueText.y + yCalc(switchValueTextPositioningArray[b][3])
                                    elseif thisFlipTransitionDirection == "flip-vertical" then
                                        shapeArray[thisFlippingShapeIndex].switchValueText.x  = shapeArray[thisFlippingShapeIndex].switchValueText.x + xCalc(switchValueTextPositioningArray[b][4])
                                        shapeArray[thisFlippingShapeIndex].switchValueText.y  = shapeArray[thisFlippingShapeIndex].switchValueText.y + yCalc(switchValueTextPositioningArray[b][5])
                                    end
                                end
                            end
                            
                        end
                        if shapeArrayParameters[a][2] == shapeArray[z].objectsToProcess[index][2]
                        and shapeArray[z].isLabelled then
                            if shapeArray[z].objectsToProcess[index][1] == "flip-horizontal"
                            or shapeArray[z].objectsToProcess[index][1] == "flip-vertical" then
                                thisFlippingShapeIndex = a
                                thisFlipTransitionDirection = shapeArray[z].objectsToProcess[index][1]
                                mainFunc.objectCreateScript.addFlipIndicatorTriangles(mainFunc, shapeArray, shapeArrayParameters)
                            end
                            addSwitchValueText(a)
                            if shapeArray[z].objectsToProcess[index][1] == "flip-horizontal"
                            or shapeArray[z].objectsToProcess[index][1] == "flip-vertical" then
                                addSwitchValueTextForFlip(a)
                            end
                        elseif shapeArrayParameters[a][2] == shapeArray[z].objectsToProcess[index][2]
                        and shapeArray[z].isLabelled == false then
                            shapeArray[a].isLabelled = false
                        end
                    end
                end
            end

            mainFunc.thisLevelSettings.numberOfSwitchesCounter = mainFunc.thisLevelSettings.numberOfSwitchesCounter + 1
        end
        
        if shapeArray[z].islabelled then
        end
    end
    
    if shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "autoFan" then

        local fanArrowImageSheet = graphics.newImageSheet( "images/objects/fan-arrow.png", {width = 47, height = 11, numFrames = 2, sheetContentWidth = 47, sheetContentHeight = 22})
        local fanArrowSequenceData = {
            { name = "off", start=2, count=1,   loopCount=1 },
            { name = "on", start=1, count=1, loopCount=1 }
        }
        shapeArray[z].directionIndicatorArrow = display.newSprite(fanArrowImageSheet, fanArrowSequenceData)
        if shapeArrayParameters[z][1] == "manualFan" then
            shapeArray[z].directionIndicatorArrow:setSequence("off")
        else
            shapeArray[z].directionIndicatorArrow:setSequence("on")
        end
        shapeArray[z].directionIndicatorArrow.x = shapeArray[z].x
        shapeArray[z].directionIndicatorArrow.y = shapeArray[z].y
        shapeArray[z].directionIndicatorArrow.xScale = 0.9
        shapeArray[z].directionIndicatorArrow.yScale = 0.9
        
        local directionIndicatorArrowArray = {
            {0, -16},
            {19, 0},
            {0, 16},
            {-19, 0}
        }
        
        for a = 1, #mainFunc.shapeRelatedArrays.directionArray do
            if mainFunc.shapeRelatedArrays.directionArray[a] == shapeArray[z].direction then
                shapeArray[z].directionIndicatorArrow.x = shapeArray[z].directionIndicatorArrow.x + xCalc(directionIndicatorArrowArray[a][1])
                shapeArray[z].directionIndicatorArrow.y = shapeArray[z].directionIndicatorArrow.y + yCalc(directionIndicatorArrowArray[a][2])
                shapeArray[z].directionIndicatorArrow.rotation = (90 * (a - 1))
            end
        end
        
        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( shapeArray[z].directionIndicatorArrow )
    end
    
    if shapeArrayParameters[z][1] == "gem" then
        shapeArray[z].width = xCalc(60)
        shapeArray[z].height = yCalc(52)
        shapeArray[z].gemType = shapeArrayParameters[z][7]
        shapeArray[z].wasCollectedPreviously = false
        if (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["red_coin"] == 1 and shapeArray[z].gemType == "redCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["blue_coin"] == 1 and shapeArray[z].gemType == "blueCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["purple_coin"] == 1 and shapeArray[z].gemType == "purpleCoin") then
            shapeArray[z].alpha = 0
        else
            if (shapeArray[z].gemType == "purple") then
                shapeArray[z].x = shapeArray[z].x
                shapeArray[z].fullName = shapeArray[z].name .. shapeArrayParameters[z][3] .. shapeArrayParameters[z][4] .. shapeArrayParameters[z][5] .. shapeArrayParameters[z][6]

                for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"] do
                    if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"][a] == shapeArray[z].fullName then
                        shapeArray[z].wasCollectedPreviously = true
                    end
                end

                shapeArray[z].circle = display.newSprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData)
                shapeArray[z].circle:setSequence("purpleRing")
                shapeArray[z].circle.x = shapeArray[z].x
                shapeArray[z].circle.y = shapeArray[z].y
                shapeArray[z].circle.xScale = 0.7
                shapeArray[z].circle.yScale = 0.7
                shapeArray[z].circle.alpha = 0.5
                mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z].circle )
                shapeArray[z].circle:toFront()

                if shapeArray[z].wasCollectedPreviously == false then
                    shapeArray[z].circle.alpha = 0.6
                end
            else
                shapeArray[z].backBoard = display.newSprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData)
                shapeArray[z].backBoard:setSequence(shapeArray[z].gemType)
                shapeArray[z].backBoard.x = shapeArray[z].x
                
                if shapeArray[z].wasCollectedPreviously then
                    shapeArray[z].backBoard.alpha = 0.7
                    shapeArray[z].backBoard.xScale = 0.7
                    shapeArray[z].backBoard.yScale = 0.7
                end
                shapeArray[z].backBoard.y = shapeArray[z].y
                mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z].backBoard )
                shapeArray[z].backBoard:toFront()
            end;

            physics.addBody(shapeArray[z], "static", { density = 1.0, friction = 0.3, bounce = 0.2, shape={-20, -17, 20, -17, 20, 17, -20, 17} })
            shapeArray[z].xScale = 0.55
            shapeArray[z].yScale = 0.55
            mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z] )
            shapeArray[z]:toFront()
            shapeArray[z]:addEventListener("collision", mainFunc.gemCollisionListener)
        end

        if (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["red_coin"] == 1 and shapeArray[z].gemType == "redCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["blue_coin"] == 1 and shapeArray[z].gemType == "blueCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["purple_coin"] == 1 and shapeArray[z].gemType == "purpleCoin") then
            shapeArray[z].x = -10000
        end

    end

    if shapeArrayParameters[z][1] == "item" then
        if hasValue({ "partialMap", "fullMap", "compass" }, shapeArrayParameters[z][2]) then
            shapeArray[z].xScale = 0.6
            shapeArray[z].yScale = 0.6
        else
            shapeArray[z].xScale = 0.7
            shapeArray[z].yScale = 0.7
        end
        shapeArray[z].isObtained = false
        shapeArray[z].isApplied = false
        shapeArray[z].hasBeenUsed = false
        mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z] )
        shapeArray[z]:toBack()
        if (shapeArrayParameters[z][2] == "mystery-block") then
            local mysteryBlockIsTaken = false
            for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"] do
                local blockLocation = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][a]["location"];
                if blockLocation[1] == shapeArrayParameters[z][3]
                and blockLocation[2] == shapeArrayParameters[z][4]
                and blockLocation[3] == shapeArrayParameters[z][5]
                and blockLocation[4] == shapeArrayParameters[z][6] then
                    mysteryBlockIsTaken = true
                end
            end
            if mainFunc.thisLevelSettings.mapObtained == false or mysteryBlockIsTaken then
                shapeArray[z].alpha = 0
            else
                shapeArray[z]:toBack()
                shapeArray[z]:addEventListener("tap", mainFunc.mysteryBlockTouch)
            end
            shapeArray[z].allowedShapesArray = shapeArrayParameters[z][7]
        end
        shapeArray[z].itemLabel = shapeArrayParameters[z][2]

        if (shapeArrayParameters[z][2] ~= "mystery-block") then
            shapeArray[z].backBoard = display.newSprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData)
            shapeArray[z].backBoard:setSequence("item")
            shapeArray[z].backBoard.x = shapeArray[z].x
            shapeArray[z].backBoard.y = shapeArray[z].y
            shapeArray[z].backBoard.alpha = 0.9
            shapeArray[z].backBoard.xScale = 0.85
            shapeArray[z].backBoard.yScale = 0.85
            mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z].backBoard )
            shapeArray[z].backBoard:toBack()
        end
    end
    
    if shapeArrayParameters[z][1] == "laser" then
        shapeArray[z].laserDirection = shapeArrayParameters[z][7]
        shapeArray[z].laserCounter = 0
        shapeArray[z].x = shapeArray[z].x + xCalc(30)
        shapeArray[z].y = shapeArray[z].y + yCalc(26)
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
    end
    
    if shapeArrayParameters[z][1] == "endPoint" then
        shapeArray[z].enabled = true
        shapeArray[z].medalPiece = display.newImageRect("images/objects/" .. currentMedal .. "Medal-medalPiece.png", 60, 52)
        shapeArray[z].medalPiece.x = shapeArray[z].x
        shapeArray[z].medalPiece.y = shapeArray[z].y
        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( shapeArray[z].medalPiece )
    end

    if shapeArrayParameters[z][1] == "gun" then
        local gunbase = display.newSprite(mainFunc.allLevelSettings.allFansImageSheet, mainFunc.allLevelSettings.allFansSequenceData)
        gunbase:setSequence("gunBase")
        --gunbase:setReferencePoint(display.TopLeftReferencePoint)
        gunbase.anchorX = 0
        gunbase.anchorY = 0
        mainFunc.allLevelSettings.screenObjectsGroup:insert(gunbase)
        gunbase.x = ((shapeArrayParameters[z][3] - 1) * display.contentWidth) + (((shapeArrayParameters[z][5] - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth)
        gunbase.y = ((shapeArrayParameters[z][4] - 1) * display.contentHeight) + (((shapeArrayParameters[z][6] - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight)
    end

    if shapeArrayParameters[z][1] == "door" then
        shapeArray[z]:toBack()     
    end

    if (shapeArrayParameters[z][2] == "map")
    and mainFunc.thisLevelSettings.mapObtained == true then
        object.x = -10000
        object.alpha = 0
    elseif (shapeArrayParameters[z][2] == "compass")
    and mainFunc.thisLevelSettings.compassObtained == true then
        object.x = -10000
        object.alpha = 0
    end

    if shapeArrayParameters[z][1] == "shape"
    or shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "simple"
    or shapeArrayParameters[z][1] == "backFire" then
        for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"] do
            local thisShape = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][a]
            if thisShape["location"][1] == shapeArrayParameters[z][3]
            and thisShape["location"][2] == shapeArrayParameters[z][4]
            and thisShape["location"][3] == shapeArrayParameters[z][5]
            and thisShape["location"][4] == shapeArrayParameters[z][6] then
                shapeArray[z]:addEventListener("touch", mainFunc.mysteryBlockRemove)
            end
        end
    end

    if shapeArrayParameters[z][1] == "characterChangePoint" then
        shapeArray[z].specificCharacter = nil
        if shapeArrayParameters[z][7] then
            shapeArray[z].specificCharacter = shapeArrayParameters[z][7]
            shapeArray[z].specificCharacterCircle = display.newImageRect("images/objects/Layout/ballChangerCircle.png", 60, 52)
            shapeArray[z].specificCharacterCircle.x = shapeArray[z].x
            shapeArray[z].specificCharacterCircle.y = shapeArray[z].y
            mainFunc.allLevelSettings.screenObjectsGroup: insert(shapeArray[z].specificCharacterCircle)

            shapeArray[z].specificCharacterIcon = display.newSprite(mainFunc.allLevelSettings.charactersIconsImageSheet, mainFunc.allLevelSettings.charactersIconsSequenceData)
            shapeArray[z].specificCharacterIcon:setSequence(shapeArray[z].specificCharacter)
            shapeArray[z].specificCharacterIcon.xScale = 0.22
            shapeArray[z].specificCharacterIcon.yScale = 0.22
            shapeArray[z].specificCharacterIcon.x = shapeArray[z].x
            shapeArray[z].specificCharacterIcon.y = shapeArray[z].y
            mainFunc.allLevelSettings.screenObjectsGroup: insert(shapeArray[z].specificCharacterIcon)
        end

        shapeArray[z].button = display.newImageRect("images/objects/Layout/ballChangerButton.png", 60, 52)
        shapeArray[z].button.alpha = 0
        shapeArray[z].button.objectType = "characterChangePointButton"
        shapeArray[z].button.relatedObject = shapeArray[z]
        shapeArray[z].button:addEventListener("tap", mainFunc.listener)
        mainFunc.allLevelSettings.screenObjectsGroup: insert(shapeArray[z].button)
        --shapeArray[z].button.alpha = 0
        local xValAdd = mainFunc.allLevelSettings.squareWidth * 0.8
        local yValAdd = mainFunc.allLevelSettings.squareHeight/1.5
        local rotate = -25
        if shapeArrayParameters[z][5] > 4 then
            xValAdd = xValAdd * -1
            xScaleAdjust = 1
        else
            xScaleAdjust = -1
        end

        if shapeArrayParameters[z][6] > 1 then
            yValAdd = yValAdd * -1
        end

        shapeArray[z].button.x = shapeArray[z].x + xValAdd
        shapeArray[z].button.y = shapeArray[z].y + yValAdd
        shapeArray[z].button.xScale = xScaleAdjust

        shapeArray[z].bigDirectionArrow = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
        shapeArray[z].bigDirectionArrow:setSequence("purpleArrow")
        shapeArray[z].bigDirectionArrow.alpha = 0
        mainFunc.allLevelSettings.frontScreenObjectsGroup: insert(shapeArray[z].bigDirectionArrow)
    end
end
    t.createLevelObject = createLevelObject

return t