local t = {}
local sprite = require("modules.object-create.sprite");
local createBGTile, createMainBGTiles, createGem, createCharacterChangePoint, calculateXFromPosition, calculateYFromPosition;

local switchImageSheet = graphics.newImageSheet( "images/objects/switchSprite.png", {frames = { {x = xCalc(0), y =yCalc(0), width = xCalc(59), height = yCalc(52)}, {x = xCalc(59), y = yCalc(0), width = xCalc(61), height = yCalc(52)} }, sheetContentWidth = xCalc(119), sheetContentHeight = yCalc(52)})
local switchSequenceData = {
    { name = "off", start=1, count=1,   loopCount=1 },
    { name = "on", start=2, count=1, loopCount=1 }
}

local function positionShape(shape, x, y, props)
    shape.x = x;
    shape.y = y;
    shape.width = props["width"] and props["width"] or shape.width;
    shape.height = props["height"] and props["height"] or shape.height;
    shape.xScale = props["xScale"] and props["xScale"] or shape.xScale;
    shape.yScale = props["yScale"] and props["yScale"] or shape.yScale;
    shape.rotation = props["rotation"] and props["rotation"] or shape.rotation;
    shape.alpha = props["alpha"] and props["alpha"] or shape.alpha;
end;

local function spawn (z, mainFunc)
    local shapeParameters = shapeArrayParameters[z];
    local shapeType = shapeParameters["type"];
    local shapeName = shapeParameters["name"];
    local shapeSubType = shapeParameters["subType"];
    
    if hasValue({ "autoFan", "manualFan", "simple", "spitter", "tunnel", "backFire", "characterChangePoint" }, shapeType) then
        object = sprite(mainFunc.allLevelSettings.allFansImageSheet, mainFunc.allLevelSettings.allFansSequenceData, shapeType)

        if (shapeType == "tunnel") then

            mainFunc.thisLevelSettings.tunnelCounter = mainFunc.thisLevelSettings.tunnelCounter + 1
        end
    elseif shapeType == "door" then
        object = display.newImageRect("images/objects/"..shapeParameters["type"]..".png", 26, 54)
    elseif shapeType == "switch" then
        object = sprite(switchImageSheet, switchSequenceData, "off", 60, 52);
    elseif shapeType == "shape" then
        if shapeParameters["props"][3] ~= "breakable" then
            if hasValue({ "triangleTopRightShape", "triangleBottomRightShape", "triangleBottomLeftShape", "triangleTopLeftShape" }, shapeSubType) then
                local shapeString = shapeSubType;
                if shapeParameters["props"][3] and (shapeParameters["props"][3] == "icy" or shapeParameters["props"][3] == "fire" or shapeParameters["props"][3] == "hyroll") then
                    shapeString = shapeParameters["props"][3] .. "-" .. shapeString
                end
                object = sprite(mainFunc.allLevelSettings.triangleImageSheet, mainFunc.allLevelSettings.triangleSequenceData, shapeString);
            elseif shapeSubType == "triangleLeftAndRightShape" then
                object = sprite(mainFunc.allLevelSettings.triangleLeftAndRightImageSheet, mainFunc.allLevelSettings.triangleLeftAndRightSequenceData, shapeSubType);

                if shapeParameters["props"][1] == 2 then
                    object.rotation = 180;
                end
            elseif shapeSubType == "triangleTopAndBottomShape" then
                object = sprite(mainFunc.allLevelSettings.triangleTopAndBottomImageSheet, mainFunc.allLevelSettings.triangleTopAndBottomSequenceData, shapeSubType);

                if shapeParameters["props"][1] == 1 then
                    object.rotation = 180;
                end
            elseif shapeSubType == "bar" or shapeSubType == "doubleBar" then
                local barSize = "single"
                if shapeSubType == "doubleBar" then
                    barSize = "double"
                end
                local barShape = "horz"
                if shapeParameters["props"][1] then
                    barShape = shapeParameters["props"][1]
                end

                object = sprite(mainFunc.allLevelSettings.barImageSheet[barSize][barShape], mainFunc.allLevelSettings.barSequenceData[barSize][barShape], shapeSubType);
            end
        else
            object = sprite(mainFunc.allLevelSettings.triangleImageSheet, mainFunc.allLevelSettings.triangleSequenceData, "breakable-" .. shapeSubType);

            object.broken = false
        end
    elseif shapeType == "gem" then
        local levelItems2ImageSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItems2ImageSheet, mainFunc.allLevelSettings.levelItems2ImageSheetSettings)
        local levelItems2SequenceData = mainFunc.allLevelSettings.levelItems2SequenceData
        object = sprite(levelItems2ImageSheet, levelItems2SequenceData, shapeSubType .. "Floating", true, 60, 52);
    elseif shapeType == "item" then
        local itemsImageSheet = mainFunc.allLevelSettings.itemsImageSheet
        local itemsSequenceData = mainFunc.allLevelSettings.itemsSequenceData

        local levelItemsImageSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItemsImageSheet, mainFunc.allLevelSettings.levelItemsImageSheetSettings)
        local levelItemsSequenceData = mainFunc.allLevelSettings.levelItemsSequenceData;

        local getGeneralItemSequence = function()
            local sequence = shapeName;
            
            if shapeName == "coins"
            and shapeSubType > 99 then
                sequence = sequence .. "-big"
            elseif shapeName == "coins"
            and shapeSubType < 99 then
                sequence = sequence .. "-small"
            end
            return sequence;
        end;

        local itemProps =
            hasValue({ "bomb", "hook", "jet", "clock", "mystery-block", "big-present", "small-present", "coins" }, shapeName) and
                {
                    sheet = itemsImageSheet,
                    sequenceData = itemsSequenceData,
                    width = 60,
                    height = 52,
                    sequence = getGeneralItemSequence()
                }
                or
                { 
                    sheet = levelItemsImageSheet,
                    sequenceData = levelItemsSequenceData,
                    width = 43,
                    height = 34,
                    sequence = currentMedal .. shapeName:gsub("^%l", string.upper)
                };
        object = sprite(itemProps.sheet, itemProps.sequenceData, itemProps.sequence, true, itemProps.width, itemProps.height);

        if (shapeName == "map")
        and mainFunc.thisLevelSettings.mapObtained == true then
            object.x = -10000
            object.alpha = 0
            object:pause();
        elseif (shapeName == "compass")
        and mainFunc.thisLevelSettings.compassObtained == true then
            object.x = -10000
            object.alpha = 0
            object:pause();
        end;
    elseif shapeType == "endPoint" then
        object = display.newImageRect("images/objects/" .. currentMedal .. "Medal.png", 60, 52)
    elseif shapeType == "gun" then
        local gunImageSheet = graphics.newImageSheet( "images/objects/gun.png", {width = 60, height = 52, numFrames = 4, sheetContentWidth = 240, sheetContentHeight = 52})
        local gunSequenceData = {
            { name = "up", start=1, count=1,   loopCount=1 },
            { name = "right", start=2, count=1, loopCount=1 },
            { name = "down", start=3, count=1, loopCount=1 },
            { name = "left", start=4, count=1, loopCount=1 }
        }
        object = sprite(gunImageSheet, gunSequenceData, shapeSubType, true);
    end

    return object
end

local createBGTile = function ()

end

local function createLevelObject(shapeArrayParameters, shapeArray, z, mainFunc)
    local shapeParameters = shapeArrayParameters[z];
    shapeArray[z] = spawn(z, mainFunc);
    shapeArray[z].relevantShapeArrayIndex = z;
    shapeArray[z].objectType = shapeParameters["type"];
    shapeArray[z].relevantHorzScreen = shapeParameters["location"]["xScreen"];
    shapeArray[z].relevantVertScreen = shapeParameters["location"]["yScreen"];
    shapeArray[z].relevantHorzSquare = shapeParameters["location"]["xSquare"];
    shapeArray[z].relevantVertSquare = shapeParameters["location"]["ySquare"];

    if shapeParameters["type"] == "shape" then
        shapeArray[z].isCollisioning = false
        shapeArray[z].breakable = false
        shapeArray[z].hyrollBreakable = false
        for a = 1, #mainFunc.shapeRelatedArrays.shapeFormingArray  do
            if mainFunc.shapeRelatedArrays.shapeFormingArray[a][1] == shapeParameters["subType"] then
                relevantShape = mainFunc.shapeRelatedArrays.shapeFormingArray[a][2]
                if shapeParameters["subType"] == "triangleTopAndBottomShape" then
                    relevantShape = mainFunc.shapeRelatedArrays.shapeFormingArray[a][3]
                end
                if (shapeParameters["props"][2] and shapeParameters["props"][2] ~= "_" and (shapeParameters["subType"] ~= "bar" and shapeParameters["subType"] ~= "doubleBar") ) then
                    shapeArrayParam = (shapeParameters["props"][2]) + 11
                    shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[shapeArrayParam]
                    shapeArray[z].directionsArrayAtIndex = shapeArrayParam
                else 
                    if shapeParameters["subType"] ~= "bar" and shapeParameters["subType"] ~= "doubleBar" then
                        shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[mainFunc.shapeRelatedArrays.shapeFormingArray[a][5]]
                        shapeArray[z].directionsArrayAtIndex = mainFunc.shapeRelatedArrays.shapeFormingArray[a][5]
                    elseif shapeParameters["subType"] == "bar" or shapeParameters["subType"] == "doubleBar" then
                        local shape = shapeParameters["props"][1]
                        local arrayIndex = 2
                        if shape == "vert" then
                            arrayIndex = 4
                        end
                        local indexAddition = 1
                        if shapeParameters["props"][2] and shapeParameters["props"][2] ~= "_" then
                            indexAddition = shapeParameters["props"][2]
                        end
                        shapeArray[z].directionsArray = mainFunc.allLevelSettings.directionArrayIndex[mainFunc.shapeRelatedArrays.shapeFormingArray[a][3] + indexAddition]
                        shapeArray[z].directionsArrayAtIndex = mainFunc.shapeRelatedArrays.shapeFormingArray[a][3]
                    end
                end
                if (shapeParameters["props"][3] and (shapeParameters["props"][3] == "breakable" or shapeParameters["props"][3] == "hyroll") ) then
                    shapeArray[z].breakable = true
                    shapeArray[z].hyrollBeakable = false
                    if shapeParameters["props"][3] == "hyroll" then
                        shapeArray[z].hyrollBreakable = true
                    end
                else
                    shapeArray[z].breakable = false
                    shapeArray[z].hyrollBreakable = false
                end
                if (shapeParameters["props"][3] and (shapeParameters["props"][3] == "icy" or shapeParameters["props"][3] == "fire") ) then
                    shapeArray[z].triangleSpecialType = shapeParameters["props"][3]
                end
            end
        end
        
        physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape=relevantShape } )
        shapeArray[z].relevantPhysicsBodyParams = { density=10, friction=1, bounce=0, shape=relevantShape }
        shapeArray[z].shape = shapeParameters["subType"]
        shapeArray[z].effectiveShape = shapeArray[z].shape
        shapeArray[z].state = 1
        if shapeParameters["props"][1] then
            shapeArray[z].state = shapeParameters["props"][1]
        end
        shapeArray[z].transitionArrayState = shapeParameters["startPositionIndex"]
        shapeArray[z].isTransitioning = false
        sceneGroup:insert( shapeArray[z] )
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
    elseif shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "spitter"
    or shapeParameters["type"] == "door"
    or shapeParameters["type"] == "tunnel" 
    or shapeParameters["type"] == "switch"
    or shapeParameters["type"] == "endPoint"
    or shapeParameters["type"] == "characterChangePoint"
    or shapeParameters["type"] == "simple" 
    or shapeParameters["type"] == "backFire" then
        --shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint)
        mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z] )
        shapeArray[z].isTransitioning = false
    end

    if shapeParameters["type"] == "gun" then
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
    
    if shapeParameters["type"] == "switch" then
        shapeArray[z].switchCounter = 0
        shapeArray[z].switchOnOffCounter = 0
        if shapeParameters["subType"] == "rotate-object" then
            shapeArray[z].rotateSwitch = "first"
        end
    end
    
    if shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan" then
        -- shapeArray[z].xScale = 0.6
        -- shapeArray[z].yScale = 0.6
        shapeArray[z].direction = shapeParameters["subType"]
    end
    
    if shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "spitter" then
        shapeArray[z].isBallPresent = false
    end

    if shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "spitter"
    or shapeParameters["type"] == "shape"
    or shapeParameters["type"] == "simple"
    or shapeParameters["type"] == "backFire"
    or shapeParameters["type"] == "tunnel" then
        shapeArray[z].canShapeSlide = true
        shapeArray[z].lastBallReleaseDirection = nil
    end
    
    if shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "spitter"
    or shapeParameters["type"] == "characterChangePoint"
    or shapeParameters["type"] == "simple"
    or shapeParameters["type"] == "backFire"
    or shapeParameters["type"] == "tunnel" then
        shapeArray[z].enabled = true
    end

    if shapeParameters["type"] == "manualFan" then
        shapeArray[z].activeNow = false
    end

    if shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "spitter"
    or shapeParameters["type"] == "shape"
    or shapeParameters["type"] == "simple"
    or shapeParameters["type"] == "item"
    or shapeParameters["type"] == "endPoint"
    or shapeParameters["type"] == "backFire"
    or shapeParameters["type"] == "tunnel"
    or shapeParameters["type"] == "characterChangePoint" then

        if (shapeParameters["subType"] == "bar" or shapeParameters["subType"] == "doubleBar") then
            shapeArray[z].width = (50/60) * mainFunc.allLevelSettings.squareWidth
        elseif shapeParameters["subType"] == "triangleTopAndBottomShape" then
            shapeArray[z].width = mainFunc.allLevelSettings.squareWidth * 2
        else
            shapeArray[z].width = mainFunc.allLevelSettings.squareWidth
        end
    end
    
    if shapeParameters["subType"] == "triangleLeftAndRightShape" then
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 2
    elseif shapeParameters["subType"] == "doubleBar" and shapeParameters["props"][1] == "horz" then
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 1.75
    elseif shapeParameters["subType"] == "doubleBar" and shapeParameters["props"][1] == "vert" then
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight * 2.75
    else
        shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
    end
    
    local location = shapeParameters["location"];
    shapeArray[z].anchorX = 0.5;
    shapeArray[z].anchorY = 0.5;
    shapeArray[z].x = calculateXFromPosition(location["xScreen"], location["xSquare"], mainFunc);
    shapeArray[z].y = calculateYFromPosition(location["yScreen"], location["ySquare"], mainFunc);
    shapeArray[z].originalX = shapeArray[z].x;
    shapeArray[z].originalY = shapeArray[z].y;
    shapeArray[z].name = shapeParameters["name"]
    shapeArray[z].relevantHorzScreen = location["xScreen"]
    shapeArray[z].relevantVertScreen = location["yScreen"]
    shapeArray[z].relevantHorzSquare = location["xSquare"]
    shapeArray[z].relevantVertSquare = location["ySquare"]
    shapeArray[z].objectType = shapeParameters["type"]
    shapeArray[z].shapeArrayIndex = z
    shapeArray[z].mainFuncListenerAdded = false
    shapeArray[z].isAutoSliding = false
    shapeArray[z].isAutoSlideObject = false
    shapeArray[z].origWidth = shapeArray[z].width
    shapeArray[z].origHeight = shapeArray[z].height

    if (shapeParameters["type"] ~= "door") then
        shapeArray[z].x = shapeArray[z].x + ((mainFunc.allLevelSettings.squareWidth - shapeArray[z].contentWidth) / 2)
        shapeArray[z].y = shapeArray[z].y + ((mainFunc.allLevelSettings.squareHeight - shapeArray[z].contentHeight) / 2)
    end
    
    if (shapeParameters["type"] == "shape") then
        if (shapeParameters["subType"] ~= "triangleLeftAndRightShape")
        and (shapeParameters["subType"] ~= "triangleTopAndBottomShape") then
            shapeArray[z].y = shapeArray[z].y
            shapeArray[z].x = shapeArray[z].x
        else
            if (shapeParameters["subType"] == "triangleLeftAndRightShape") then
                shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight)
                if (shapeParameters["props"][1] == 2) then
                    shapeArray[z].x = shapeArray[z].x + xCalc(4)
                    shapeArray[z].y = shapeArray[z].y + yCalc(1)
                end
            else
                shapeArray[z].x = shapeArray[z].x + xCalc(60)
                shapeArray[z].y = shapeArray[z].y
                if (shapeParameters["props"][1] == 2) then
                    shapeArray[z].y = shapeArray[z].y - yCalc(3)
                end
            end
        end
        if (shapeParameters["subType"] == "triangleBottomLeftShape")
        or (shapeParameters["subType"] == "triangleTopLeftShape") then
            shapeArray[z].x = shapeArray[z].x + xCalc(1)
        elseif (shapeParameters["subType"] == "triangleBottomRightShape")
        or (shapeParameters["subType"] == "triangleTopRightShape") then
            shapeArray[z].x = shapeArray[z].x - xCalc(1)
        end

        if (shapeParameters["subType"] == "triangleTopRightShape")
        or (shapeParameters["subType"] == "triangleTopLeftShape") then
            shapeArray[z].y = shapeArray[z].y + yCalc(1)
        elseif (shapeParameters["subType"] == "triangleBottomRightShape")
        or (shapeParameters["subType"] == "triangleBottomLeftShape") then
            shapeArray[z].y = shapeArray[z].y - yCalc(1)
        end

        if (shapeParameters["props"][3] and shapeParameters["props"][3] == "breakable") then
            shapeArray[z].y = shapeArray[z].y
            shapeArray[z].x = shapeArray[z].x
            if shapeParameters["subType"] ~= "triangleTopRightShape" then
                local shapePosArray = {
                    triangleBottomRightShape = {y = 7, x = -4},
                    triangleBottomLeftShape = {y = 2, x = -1},
                    triangleTopLeftShape = {y = 7, x = -5}
                }

                --shapeArray[z].y = shapeArray[z].y + yCalc(shapePosArray[shapeParameters["subType"]]["y"])
                --shapeArray[z].x = shapeArray[z].x + xCalc(shapePosArray[shapeParameters["subType"]]["x"])
            end
        end

        local relevantDirectionArray

        if (shapeParameters["subType"] == "bar") or (shapeParameters["subType"] == "doubleBar") then
            if shapeArray[z].state == "horz" then
                shapeArray[z].x = shapeArray[z].x - (mainFunc.allLevelSettings.squareWidth / 2) - xCalc(5)
                if (shapeParameters["subType"] == "doubleBar") then
                    shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight) - yCalc(7)
                end
                relevantDirectionArray = 2
            else
                shapeArray[z].rotation = 90
                shapeArray[z].x = shapeArray[z].x - xCalc(5)
                shapeArray[z].y = shapeArray[z].y - (mainFunc.allLevelSettings.squareHeight/2)
                relevantDirectionArray = 4
                if (shapeParameters["subType"] == "doubleBar") then
                    shapeArray[z].x = shapeArray[z].x + (mainFunc.allLevelSettings.squareWidth / 2)
                    shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.squareHeight) - yCalc(5)
                end
            end
        end
        
        if (shapeParameters["subType"] ~= "bar") and (shapeParameters["subType"] ~= "doubleBar") then
            relevantDirectionArray = shapeArray[z].state * 2
        end
        
        for a = 1, #shapeArray[z].directionsArray[relevantDirectionArray] do
            if a < 5 then

                if shapeArray[z].directionsArray[relevantDirectionArray][a][1] then
                    if (a == 4
                    and shapeParameters["subType"] == "triangleLeftAndRightShape"
                    and shapeArray[z].state == 1)
                    or (a == 2
                    and shapeParameters["subType"] == "triangleLeftAndRightShape"
                    and shapeArray[z].state == 2)
                    or (a == 3
                    and shapeParameters["subType"] == "triangleTopAndBottomShape"
                    and shapeArray[z].state == 1)
                    or (a == 1
                    and shapeParameters["subType"] == "triangleTopAndBottomShape"
                    and shapeArray[z].state == 2)
                    or (a == 4
                    and shapeParameters["subType"] == "triangleTopRightShape")
                    or (a == 4
                    and shapeParameters["subType"] == "triangleBottomRightShape")
                    or (a == 2
                    and shapeParameters["subType"] == "triangleTopLeftShape")
                    or (a == 2
                    and shapeParameters["subType"] == "triangleBottomLeftShape")
                    or ( (a == 1 or a == 3)
                    and (shapeParameters["subType"] == "bar" or shapeParameters["subType"] == "doubleBar") and shapeParameters["props"][1] == "horz")
                    or ( (a == 2 or a == 4)
                    and (shapeParameters["subType"] == "bar" or shapeParameters["subType"] == "doubleBar") and shapeParameters["props"][1] == "vert") then
                    
                    else
                        killBar = display.newImageRect("images/objects/killBar.png", 17, 49)

                        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( killBar )
                        killBar.relatedShape = shapeArray[z].name
                        killBar.relatedDirectionArrayIndex = a
                        
                        if (a == 4
                        and shapeParameters["subType"] == "triangleLeftAndRightShape"
                        and shapeArray[z].state == 2) then
                            killBar.relatedDirectionArrayIndex = 2
                        elseif (a == 3
                        and shapeParameters["subType"] == "triangleTopAndBottomShape"
                        and shapeArray[z].state == 2) then
                            killBar.relatedDirectionArrayIndex = 1
                        end
                        
                        killBar.x = shapeArray[z].x
                        killBar.y = shapeArray[z].y

                        if shapeParameters["subType"] == "bar" or shapeParameters["subType"] == "doubleBar" then
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
                        {"triangleTopLeftShape", "triangleTopRightShape", 0, 25, 90, "triangleLeftAndRightShape", 0, 25, 45, 0, -25, -135, "triangleTopAndBottomShape", -27, 25, 90, 27, 25, 90, "triangleBottomLeftShape", -3, -1, 135, "triangleBottomRightShape", 0, 0, 45},
                        {"triangleTopRightShape", "triangleBottomRightShape", -25, 0, 180, "triangleLeftAndRightShape", -27, -24, 180, -27, 22, 180, "triangleTopAndBottomShape", -24, -4, 135, -24, 4, 135},
                        {"triangleBottomLeftShape", "triangleBottomRightShape", 3, -25, -90, "triangleLeftAndRightShape", 3, -24, -45, -3, 24, 135, "triangleTopAndBottomShape", -27, -25, -90, 27, -25, -90, "triangleTopLeftShape", -3, -2, 225, "triangleTopRightShape", 2, -1, -45},
                        {"triangleTopLeftShape", "triangleBottomLeftShape", 25, 0, 0, "triangleLeftAndRightShape", 27, 24, 0, 27, -22, 0, "triangleTopAndBottomShape", 24, -4, -45, 24, 4, 45}
                    }
                    
                    for b=1, #killBarPositionArray do
                        if a == b then
                            if shapeParameters["subType"] == killBarPositionArray[b][1]
                            or shapeParameters["subType"] == killBarPositionArray[b][2] then
                                killBar.x = killBar.x + xCalc(killBarPositionArray[b][3])
                                killBar.y = killBar.y + yCalc(killBarPositionArray[b][4])
                                killBar.rotation = killBarPositionArray[b][5]
                            elseif shapeParameters["subType"] == killBarPositionArray[b][6] then
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
                            elseif shapeParameters["subType"] == killBarPositionArray[b][13] then
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
                                if shapeParameters["subType"] == killBarPositionArray[b][20] then
                                    killBar.x = killBar.x + xCalc(killBarPositionArray[b][21])
                                    killBar.y = killBar.y + yCalc(killBarPositionArray[b][22])
                                    killBar.rotation = killBarPositionArray[b][23]
                                elseif shapeParameters["subType"] == killBarPositionArray[b][24] then
                                    killBar.x = killBar.x + xCalc(killBarPositionArray[b][25])
                                    killBar.y = killBar.y + yCalc(killBarPositionArray[b][26])
                                    killBar.rotation = killBarPositionArray[b][27]
                                end
                            end
                        end
                    end
                    
                elseif shapeArray[z].directionsArray[relevantDirectionArray][a] == "specialRule" then
                    
                    if shapeParameters["subType"] == "triangleLeftAndRightShape" then
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
                    elseif shapeParameters["subType"] == "triangleTopAndBottomShape" then
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
    
    if (shapeParameters["type"] == "door") then
        if shapeParameters["subType"] == "up" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareWidth
            shapeArray[z].width = yCalc(26)
            shapeArray[z].y = shapeArray[z].y - (mainFunc.allLevelSettings.squareHeight) + (shapeArray[z].contentWidth/2) - yCalc(4)
            shapeArray[z].x = shapeArray[z].x
            shapeArray[z].rotation = 270
        elseif shapeParameters["subType"] == "right" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
            shapeArray[z].width = xCalc(26)
            shapeArray[z].x = shapeArray[z].x + mainFunc.allLevelSettings.gutterWidth + xCalc(17)
            shapeArray[z].y = shapeArray[z].y
        elseif shapeParameters["subType"] == "down" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareWidth
            shapeArray[z].width = yCalc(26)
            shapeArray[z].y = shapeArray[z].y + (mainFunc.allLevelSettings.gutterHeight * 2) + mainFunc.allLevelSettings.squareHeight - (shapeArray[z].contentWidth * 2) - yCalc(17)
            shapeArray[z].x = shapeArray[z].x
            shapeArray[z].rotation = 90
        elseif shapeParameters["subType"] == "left" then
            shapeArray[z].height = mainFunc.allLevelSettings.squareHeight
            shapeArray[z].width = xCalc(26)
            shapeArray[z].xScale = -1
            shapeArray[z].x = shapeArray[z].x - mainFunc.allLevelSettings.gutterWidth - xCalc(17)
            -- - mainFunc.allLevelSettings.gutterWidth - 22
            shapeArray[z].y = shapeArray[z].y
        end
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
        if shapeParameters["props"][1] and shapeParameters["props"][1] == "enabled" then
            shapeArray[z].enabled = true
        elseif shapeParameters["props"][1] and shapeParameters["props"][1] == "disabled" then
            shapeArray[z].enabled = false
        else
            shapeArray[z].enabled = true
        end
        if shapeArray[z].enabled == false then
            shapeArray[z].alpha = 0
        end
    end
    
    if shapeParameters["type"] == "spitter" then
        shapeArray[z].type = shapeParameters["type"]
        shapeArray[z].upEnabled = false
        shapeArray[z].rightEnabled = false
        shapeArray[z].downEnabled = false
        shapeArray[z].leftEnabled = false
        
        if shapeParameters["subType"] == "up" then
            shapeArray[z].upEnabled = true
            shapeArray[z].upArrow = display.newImageRect("images/objects/spitter-arrow.png", 15, 10)
            --shapeArray[z].upArrow:setReferencePoint(display.TopLeftReferencePoint);
            shapeArray[z].upArrow.anchorX = 0.5
            shapeArray[z].upArrow.anchorY = 0.5
            mainFunc.allLevelSettings.screenObjectsGroup:insert( shapeArray[z].upArrow )
            shapeArray[z].upArrow.x = shapeArray[z].x
            shapeArray[z].upArrow.y = shapeArray[z].y - yCalc(16.5)
        end
        if shapeParameters["props"][1] == "right" then
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
        if shapeParameters["props"][2] == "down" then
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
        if shapeParameters["props"][3] == "left" then
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
    
    if shapeParameters["type"] == "tunnel" then
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
            if shapeParameters["subType"] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][2]
            and shapeParameters["props"][1] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][3]
            and shapeParameters["props"][2] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][4]
            and shapeParameters["props"][3] == mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][5] then
                shapeArray[z].colour = mainFunc.thisLevelSettings.alreadyProcessedTunnels[a][1]
                mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed = mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed + 1
            end
        end

        shapeArray[z].secondDirection = shapeParameters["subType"]
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
        shapeArray[z].endTunnelPiece.x = ((shapeParameters["props"][1] - 1) * display.contentWidth) + (((shapeParameters["props"][3] - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth ) + (mainFunc.allLevelSettings.squareWidth/2)
        shapeArray[z].endTunnelPiece.y = ((shapeParameters["props"][2] - 1) * display.contentHeight) + (((shapeParameters["props"][4] - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight ) + (mainFunc.allLevelSettings.squareHeight/2)
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

        table.insert(mainFunc.thisLevelSettings.alreadyProcessedTunnels, {shapeArray[z].colour, shapeParameters["subType"], shapeParameters["props"][1], shapeParameters["props"][2], shapeParameters["props"][3]})
    end
    
    if shapeParameters["type"] == "switch" then
        local switchNumberImageSheet = graphics.newImageSheet( "images/objects/numbers/switchNumber"..mainFunc.thisLevelSettings.numberOfSwitchesCounter..".png", {width = 39, height = 37, numFrames = 2})
        local switchNumberSequenceData = {
            { name = "off", start=1, count=1,   loopCount=1 },
            { name = "on", start=2, count=1, loopCount=1 }
        }

        shapeArray[z].objectsToProcess = shapeParameters["subType"]
        
        if (shapeParameters["props"][2] == nil or shapeParameters["props"][2] == "labelled") then
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
                            if shapeArrayParameters[a]["name"] == shapeArray[z].objectsToProcess[index][2] then
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
                                if shapeArrayParameters[thisFlippingShapeIndex]["subType"] == switchValueTextPositioningArray[b][1] then
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
                        if shapeArrayParameters[a]["name"] == shapeArray[z].objectsToProcess[index][2]
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
                        elseif shapeArrayParameters[a]["name"] == shapeArray[z].objectsToProcess[index][2]
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
    
    if shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "autoFan" then

        local fanArrowImageSheet = graphics.newImageSheet( "images/objects/fan-arrow.png", {width = 47, height = 11, numFrames = 2, sheetContentWidth = 47, sheetContentHeight = 22})
        local fanArrowSequenceData = {
            { name = "off", start=2, count=1,   loopCount=1 },
            { name = "on", start=1, count=1, loopCount=1 }
        }
        shapeArray[z].directionIndicatorArrow = display.newSprite(fanArrowImageSheet, fanArrowSequenceData)
        if shapeParameters["type"] == "manualFan" then
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
    
    if shapeParameters["type"] == "gem" then
        shapeArray[z].width = xCalc(60)
        shapeArray[z].height = yCalc(52)
        shapeArray[z].gemType = shapeParameters["subType"]
        shapeArray[z].wasCollectedPreviously = false
        if (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["red_coin"] == 1 and shapeArray[z].gemType == "redCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["blue_coin"] == 1 and shapeArray[z].gemType == "blueCoin")
        or (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["purple_coin"] == 1 and shapeArray[z].gemType == "purpleCoin") then
            shapeArray[z].alpha = 0
        else
            if (shapeArray[z].gemType == "purple") then
                shapeArray[z].x = shapeArray[z].x
                shapeArray[z].fullName = shapeArray[z].name .. shapeParameters["location"]["xScreen"] .. shapeParameters["location"]["yScreen"] .. shapeParameters["location"]["xSquare"] .. shapeParameters["location"]["ySquare"]

                shapeArray[z].circle = sprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData, "purple");

                positionShape(shapeArray[z].circle, shapeArray[z].x, shapeArray[z].y, { 
                    xScale = 0.7, yScale = 0.7, alpha = 0.5
                });
                mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z].circle )
                shapeArray[z].circle:toFront();
                
                for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"] do
                    if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"][a] == shapeArray[z].fullName then
                        shapeArray[z].wasCollectedPreviously = true
                    end
                end
                if shapeArray[z].wasCollectedPreviously == false then
                    shapeArray[z].circle.alpha = 0.6
                end
            else
                shapeArray[z].backBoard = sprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData, shapeArray[z].gemType);

                positionShape(
                    shapeArray[z].backBoard,
                    shapeArray[z].x,
                    shapeArray[z].y,
                    shapeArray[z].wasCollectedPreviously and {
                        alpha = 0.7,
                        xScale = 0.7,
                        yScale = 0.7
                    } or {});
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

    if shapeParameters["type"] == "item" then
        if hasValue({ "partialMap", "fullMap", "compass" }, shapeParameters["name"]) then
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
        if (shapeParameters["name"] == "mystery-block") then
            local mysteryBlockIsTaken = false
            for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"] do
                local blockLocation = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][a]["location"];
                if blockLocation[1] == shapeParameters["location"]["xScreen"]
                and blockLocation[2] == shapeParameters["location"]["yScreen"]
                and blockLocation[3] == shapeParameters["location"]["xSquare"]
                and blockLocation[4] == shapeParameters["location"]["ySquare"] then
                    mysteryBlockIsTaken = true
                end
            end
            if mainFunc.thisLevelSettings.mapObtained == false or mysteryBlockIsTaken then
                shapeArray[z].alpha = 0
            else
                shapeArray[z]:toBack()
                shapeArray[z]:addEventListener("tap", mainFunc.mysteryBlockTouch)
            end
            shapeArray[z].allowedShapesArray = shapeParameters["subType"]
        end
        shapeArray[z].itemLabel = shapeParameters["name"]

        if (shapeParameters["name"] ~= "mystery-block") then
            shapeArray[z].backBoard = display.newSprite(mainFunc.allLevelSettings.levelItemsBackboardImageSheet, mainFunc.allLevelSettings.levelItemsBackboardSequenceData)
            shapeArray[z].backBoard:setSequence("item")
            positionShape(shapeArray[z].backBoard, shapeArray[z].x, shapeArray[z].y, { alpha = 0.9, xScale = 0.85, yScale = 0.85 });
            mainFunc.allLevelSettings.backgroundObjectsGroup:insert( shapeArray[z].backBoard )
            shapeArray[z].backBoard:toBack()
        end
    end
    
    if shapeParameters["type"] == "laser" then
        shapeArray[z].laserDirection = shapeParameters["subType"]
        shapeArray[z].laserCounter = 0
        shapeArray[z].x = shapeArray[z].x + xCalc(30)
        shapeArray[z].y = shapeArray[z].y + yCalc(26)
        mainFunc.allLevelSettings.frontScreenObjectsGroup:insert( shapeArray[z] )
    end
    
    if shapeParameters["type"] == "endPoint" then
        shapeArray[z].enabled = true
        shapeArray[z].medalPiece = display.newImageRect("images/objects/" .. currentMedal .. "Medal-medalPiece.png", 60, 52)
        shapeArray[z].medalPiece.x = shapeArray[z].x
        shapeArray[z].medalPiece.y = shapeArray[z].y
        mainFunc.allLevelSettings.midScreenObjectsGroup:insert( shapeArray[z].medalPiece )
    end

    if shapeParameters["type"] == "gun" then
        local gunbase = display.newSprite(mainFunc.allLevelSettings.allFansImageSheet, mainFunc.allLevelSettings.allFansSequenceData)
        gunbase:setSequence("gunBase")
        --gunbase:setReferencePoint(display.TopLeftReferencePoint)
        gunbase.anchorX = 0
        gunbase.anchorY = 0
        mainFunc.allLevelSettings.screenObjectsGroup:insert(gunbase)
        gunbase.x = ((shapeParameters["location"]["xScreen"] - 1) * display.contentWidth) + (((shapeParameters["location"]["xSquare"] - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth)
        gunbase.y = ((shapeParameters["location"]["yScreen"] - 1) * display.contentHeight) + (((shapeParameters["location"]["ySquare"] - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight)
    end

    if shapeParameters["type"] == "door" then
        shapeArray[z]:toBack()     
    end

    if (shapeParameters["name"] == "map")
    and mainFunc.thisLevelSettings.mapObtained == true then
        object.x = -10000
        object.alpha = 0
    elseif (shapeParameters["name"] == "compass")
    and mainFunc.thisLevelSettings.compassObtained == true then
        object.x = -10000
        object.alpha = 0
    end

    if shapeParameters["type"] == "shape"
    or shapeParameters["type"] == "autoFan"
    or shapeParameters["type"] == "manualFan"
    or shapeParameters["type"] == "spitter"
    or shapeParameters["type"] == "simple"
    or shapeParameters["type"] == "backFire" then
        for a = 1, #myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"] do
            local thisShape = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"][a]
            if thisShape["location"]["xScreen"] == shapeParameters["location"]["xScreen"]
            and thisShape["location"]["yScreen"] == shapeParameters["location"]["yScreen"]
            and thisShape["location"]["xSquare"] == shapeParameters["location"]["xSquare"]
            and thisShape["location"]["ySquare"] == shapeParameters["location"]["ySquare"] then
                shapeArray[z]:addEventListener("touch", mainFunc.mysteryBlockRemove)
            end
        end
    end

    if shapeParameters["type"] == "characterChangePoint" then
        createCharacterChangePoint(shapeArray[z], shapeParameters, mainFunc);
    end

    if (hasValue({"door", "gem", "endPoint", "mystery-block", "item"}, shapeParameters["type"]) == false and
        hasValue({"bar"}, shapeParameters["subType"]) == false) then
        shapeArray[z].BGTiles = createMainBGTiles(shapeArray[z], mainFunc);
    end

    if (hasValue({"gem", "item"}, shapeParameters["type"])
        and shapeParameters["subType"] ~= "purple") then
        shapeArray[z].BGTiles = {};
        -- object.BGTile = createBGTile();
        shapeArray[z].BGTiles[1] = createBGTile(shapeArray[z].x, shapeArray[z].y, 45, 38, mainFunc);
    end
end
    t.createLevelObject = createLevelObject

function createBGTile(x, y, width, height, mainFunc)
    local tile = display.newImageRect("images/level-images/" .. currentWorld .. "/Layout/shape-bg-tile-small.png", width, height);
    tile.x = x;
    tile.y = y;
    mainFunc.allLevelSettings.backgroundObjectsGroup: insert(tile);
    tile:toBack();

    return tile;
end

function createMainBGTiles(shape, mainFunc)
    local extraTilesCounter = 0;
    local BGTiles = {};
    
    BGTiles[1] = createBGTile(shape.originalX, shape.originalY, mainFunc.allLevelSettings.squareWidth, mainFunc.allLevelSettings.squareHeight, mainFunc);

    for a = 1, #mainFunc.allLevelSettings.transitionArrayIndex do
        local thisTransition = mainFunc.allLevelSettings.transitionArrayIndex[a];
        if (thisTransition.shapeName == shape.name) then
            for b = 1, #thisTransition.positionArray do
                if (thisTransition.startPositionIndex ~= b) then
                    local position = thisTransition.positionArray[b];
                    local tileX = calculateXFromPosition(position[1], position[3], mainFunc);
                    local tileY = calculateYFromPosition(position[2], position[4], mainFunc);
                    
                    BGTiles[extraTilesCounter + 2] = createBGTile(tileX, tileY, mainFunc.allLevelSettings.squareWidth, mainFunc.allLevelSettings.squareHeight, mainFunc);
                    extraTilesCounter = extraTilesCounter + 1;
                end
            end
        end
    end

    return BGTiles;
end

function createGem()

end

function createCharacterChangePoint(shape, shapeParameters, mainFunc)
    shape.specificCharacter = nil
    if shapeParameters["subType"] then
        shape.specificCharacter = shapeParameters["subType"]
        shape.specificCharacterCircle = display.newImageRect("images/objects/Layout/ballChangerCircle.png", 60, 52)
        shape.specificCharacterCircle.x = shape.x
        shape.specificCharacterCircle.y = shape.y
        mainFunc.allLevelSettings.screenObjectsGroup: insert(shape.specificCharacterCircle)

        shape.specificCharacterIcon = display.newSprite(mainFunc.allLevelSettings.charactersIconsImageSheet, mainFunc.allLevelSettings.charactersIconsSequenceData)
        shape.specificCharacterIcon:setSequence(shape.specificCharacter)
        shape.specificCharacterIcon.xScale = 0.22
        shape.specificCharacterIcon.yScale = 0.22
        shape.specificCharacterIcon.x = shape.x
        shape.specificCharacterIcon.y = shape.y
        mainFunc.allLevelSettings.screenObjectsGroup: insert(shape.specificCharacterIcon)
    end

    shape.button = display.newImageRect("images/objects/Layout/ballChangerButton.png", 60, 52)
    shape.button.alpha = 0
    shape.button.objectType = "characterChangePointButton"
    shape.button.relatedObject = shape
    shape.button:addEventListener("tap", mainFunc.listener)
    mainFunc.allLevelSettings.screenObjectsGroup: insert(shape.button)
    --shape.button.alpha = 0
    local xValAdd = mainFunc.allLevelSettings.squareWidth * 0.8
    local yValAdd = mainFunc.allLevelSettings.squareHeight/1.5
    local rotate = -25
    if shapeParameters["location"]["xSquare"] > 4 then
        xValAdd = xValAdd * -1
        xScaleAdjust = 1
    else
        xScaleAdjust = -1
    end

    if shapeParameters["location"]["ySquare"] > 1 then
        yValAdd = yValAdd * -1
    end

    shape.button.x = shape.x + xValAdd
    shape.button.y = shape.y + yValAdd
    shape.button.xScale = xScaleAdjust

    shape.bigDirectionArrow = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
    shape.bigDirectionArrow:setSequence("purpleArrow")
    shape.bigDirectionArrow.alpha = 0
    mainFunc.allLevelSettings.frontScreenObjectsGroup: insert(shape.bigDirectionArrow)
end

function calculateXFromPosition(xScreen, xSquare, mainFunc)
    return ((xScreen - 1) * display.contentWidth) + (((xSquare - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth ) + (mainFunc.allLevelSettings.squareWidth/2);
end

function calculateYFromPosition(yScreen, ySquare, mainFunc)
    return ((yScreen - 1) * display.contentHeight) + (((ySquare - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight ) + (mainFunc.allLevelSettings.squareHeight/2);
end

return t