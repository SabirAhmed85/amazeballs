local t = {}

t.settingsArray = require("modules.levels.all-level-settings")
t.settingsArray.createLevelSettings(t, "iap")

local function createLevelTimeString (timeSeconds, timeMinutes, timeCounter, shouldHide)
    local levelTimeString = tostring(timeSeconds)
    local minuteStringLength = 2
    local secondStringLength = 1
    if timeMinutes > 9 then
        minuteStringLength = 3
    elseif timeMinutes == 0 then
        minuteStringLength = 0
    end
    if timeSeconds > 9 then
        secondStringLength = 2
    end

    if timeMinutes > 0 then
        levelTimeString = tostring(timeMinutes) .. "m" .. levelTimeString
    end

    if #levelTimeString == (minuteStringLength + secondStringLength) then
        levelTimeString = levelTimeString .. ".0"
    end
    local stringLengthDiff = #timeCounter - #levelTimeString
    for a = 1, #timeCounter do
        if shouldHide == false then
            timeCounter[a].alpha = 1
        else
            timeCounter[a].alpha = 0
        end
        timeCounter[a].shouldBeAlpha = 1
        if a < stringLengthDiff + 1 then
            timeCounter[a].alpha = 0
            timeCounter[a].shouldBeAlpha = 0
        end
    end
    
    for a = 1, #levelTimeString do
        local index = a + stringLengthDiff
		if timeCounter[index] then
			timeCounter[index]:setSequence(string.sub(levelTimeString, a, a))
		end
    end
end
    t.createLevelTimeString = createLevelTimeString

local function createItemSimpleIcon (itemName, screenName)

end
    t.createItemSimpleIcon = createItemSimpleIcon

local function createItemDetailedIcon (thisIsShapeScreen, itemName, viewScreenName, itemArray, a, showingArray, showingToolsArrayCounter)
    if thisIsShapeScreen then
        relImageSheet = t.settingsArray.shapesImageSheet
        relSequenceData = t.settingsArray.shapesSequenceData
    else
        relImageSheet = t.settingsArray.itemsImageSheet
        relSequenceData = t.settingsArray.itemsSequenceData
    end

    local toolScale, textScale, directionLabelScale, counterNumberScale, requiredAlpha, directionArray, propertiesArray, textToShow
    if viewScreenName == "IAPItemTile" or viewScreenName == "IAPPurchaseScreen" then
        itemArray = itemArray[itemName][a]
    else
        itemArray = itemArray[a]
    end

    if viewScreenName ~= "ItemGainedScreenMulti" then
        propertiesArray = itemArray["properties"]
        textToShow = nil
    elseif viewScreenName == "ItemGainedScreenMulti" then
        propertiesArray = {}
        if (itemName == "bomb")
        or (itemName == "hook") then
            propertiesArray["directions"] = itemArray[9]
        elseif (itemName == "jet") then
            propertiesArray["directions"] = itemArray[8]
        elseif (itemName == "autoFan")
        or (itemName == "manualFan") then
            propertiesArray["directions"] = {itemArray[2]}
        elseif (itemName == "spitter") then
            propertiesArray["directions"] = itemArray[2]
        end
        if (itemName == "bomb")
        or (itemName == "hook") then
            propertiesArray["squares"] = itemArray[8]
            itemArray["quantity"] = itemArray[10]
        elseif (itemName == "jet") then
            itemArray["quantity"] = itemArray[9]
        elseif (itemName == "clock")
        or (itemName == "fireCape")
        or (itemName == "characterSpecial")
        or (itemName == "iceCape")
        or (itemName == "bulletVest") then
            propertiesArray["seconds"] = itemArray[8]
            itemArray["quantity"] = itemArray[9]
        elseif (itemName == "dummyBall")
        or (itemName == "superBall") then
            itemArray["quantity"] = itemArray[8]
        end
    end

    if viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" then
        toolScale = 0.5
        textScale = 0.4
        directionLabelScale = 0.6
        counterNumberScale = 0.75
    elseif viewScreenName == "IAPItemTile" or viewScreenName == "mysteryBlockBag" then
        toolScale = 0.6
        textScale = 0.4
        directionLabelScale = 0.7
    else
        toolScale = 0.9
        textScale = 0.55
        directionLabelScale = 0.8
        counterNumberScale = 0.75
    end

    if viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "MedalGainedScreen" or viewScreenName == "IAPPurchaseScreen" then
        requiredAlpha = 0
    else
        requiredAlpha = 1
    end

    if (itemName == "bomb")
    or (itemName == "hook")
    or (itemName == "jet")
    or (itemName == "autoFan")
    or (itemName == "manualFan")
    or (itemName == "spitter") then
        directionArray = propertiesArray["directions"]
    end

    if (itemName == "bomb") or (itemName == "hook") then
        textToShow = propertiesArray["squares"]
    elseif (itemName == "clock")
    or (itemName == "fireCape")
    or (itemName == "characterSpecial")
    or (itemName == "iceCape")
    or (itemName == "bulletVest") then
        textToShow = propertiesArray["seconds"]
    end

    local tool = display.newSprite(relImageSheet, relSequenceData)

    tool.toolArrayCounter = a
    tool.relevantArrayIndex = a
    tool.name = "item"

    tool:play()
    tool:setSequence(itemName)

    tool.xScale = toolScale
    tool.yScale = toolScale

    tool.displayObjects = {}

    if textToShow ~= nil then
        tool.displayObjects["text"] = {}
        if textToShow < 10 then
            if textToShow == 0 then
                textToShow = 9
            end 
            tool.displayObjects["text"][1] = display.newImage("images/objects/bomb-number-"..textToShow..".png")
        else
            textToShow = math.floor(textToShow / 10)
            textToShow2 = textToShow % 10
            tool.displayObjects["text"][1] = display.newImage("images/objects/bomb-number-"..textToShow..".png")
            tool.displayObjects["text"][2] = display.newImage("images/objects/bomb-number-1.png")
        end
        for a = 1, #tool.displayObjects["text"] do
            tool.displayObjects["text"][a].xScale = textScale
            tool.displayObjects["text"][a].yScale = textScale
        end
    end

    local itemDirectionArrowArray = {
        up = function (arrow) arrow.rotation = 0 end,
        right = function (arrow) arrow.rotation = 90 end,
        down = function (arrow) arrow.rotation = 180 end,
        left = function (arrow) arrow.rotation = 270 end
    }

    if (itemName == "bomb")
    or (itemName == "hook")
    or (itemName == "jet")
    or (itemName == "autoFan")
    or (itemName == "manualFan")
    or (itemName == "spitter") then
        tool.displayObjects["directionLabel"] = {}

        if (itemName == "bomb")
        or (itemName == "autoFan")
        or (itemName == "manualFan")
        or (itemName == "spitter") then
            for z = 1, #directionArray do
                tool.displayObjects["directionLabel"][z] = display.newImageRect("images/objects/bomb-arrow.png", 20, 13)
                tool.displayObjects["directionLabel"][z].direction = directionArray[z]
                tool.displayObjects["directionLabel"][z].xScale = directionLabelScale
                tool.displayObjects["directionLabel"][z].yScale = directionLabelScale
                itemDirectionArrowArray[directionArray[z]](tool.displayObjects["directionLabel"][z])
            end
        elseif (itemName == "hook")
        or (itemName == "jet") then
            tool.displayObjects["directionLabel"][1] = display.newImageRect("images/objects/bomb-arrow.png", 20, 13)
            tool.displayObjects["directionLabel"][1].xScale = directionLabelScale
            tool.displayObjects["directionLabel"][1].yScale = directionLabelScale
            itemDirectionArrowArray[propertiesArray["directions"][1]](tool.displayObjects["directionLabel"][1])
        end
    end

    if showingToolsArrayCounter ~= nil and showingToolsArrayCounter > 4 then
        tool.displayObjects["background"] = display.newImageRect("images/central-images/Layout/itemBagScreen-itemSquare.png", 66, 60)
        bgStartXVal = bgStartXVal + 68
    end

    if viewScreenName == "itemBagScreen" 
    or viewScreenName == "IAPYouHaveDisplayslow" 
    or viewScreenName == "IAPYouHaveDisplayfast" 
    or viewScreenName == "MedalGainedScreen" 
    or viewScreenName == "ItemGainedScreen" 
    or viewScreenName == "ItemGainedScreenMulti"
    or viewScreenName == "IAPPurchaseScreen" then
        local counterNumberImageSheet = t.settingsArray.itemBagScreenCounterImageSheet
        local counterNumberSequenceData = t.settingsArray.itemBagScreenCounterSequenceData

        tool.displayObjects["counterNumber"] = display.newSprite(counterNumberImageSheet, counterNumberSequenceData)
        tool.displayObjects["counterNumber"]:setSequence(itemArray["quantity"])
        tool.displayObjects["counterNumber"].xScale = counterNumberScale
        tool.displayObjects["counterNumber"].yScale = counterNumberScale
    end

    tool.alpha = requiredAlpha

    if tool.displayObjects["text"] then
        for a = 1, #tool.displayObjects["text"] do
            tool.displayObjects["text"][a].alpha = requiredAlpha
        end
    end

    if tool.displayObjects["directionLabel"] then
        for a = 1, #tool.displayObjects["directionLabel"] do
            tool.displayObjects["directionLabel"][a].alpha = requiredAlpha
        end
    end

    if tool.displayObjects["counterNumber"] then
        tool.displayObjects["counterNumber"].alpha = requiredAlpha
    end

    return tool
end
    t.createItemDetailedIcon = createItemDetailedIcon

local function positionItemDetailedIcon (tool, xCord, yCord, thisIsShapeScreen, itemName, viewScreenName, itemArray, a, showingArray, showingToolsArrayCounter)
    local directionArray, propertiesArray

    if viewScreenName == "IAPItemTile" or viewScreenName == "IAPPurchaseScreen"then
        itemArray = itemArray[itemName][a]
    else
        itemArray = itemArray[a]
    end

    if viewScreenName ~= "ItemGainedScreenMulti" then
        propertiesArray = itemArray["properties"]
    elseif viewScreenName == "ItemGainedScreenMulti" then
        propertiesArray = {}
        if (itemName == "triangle")
        or (itemName == "bar") then
            propertiesArray["shape"] = itemArray[2]
        elseif (itemName == "bomb")
        or (itemName == "hook") then
            propertiesArray["directions"] = itemArray[9]
        elseif (itemName == "jet") then
            propertiesArray["directions"] = itemArray[8]
        elseif (itemName == "autoFan")
        or (itemName == "manualFan") then
            propertiesArray["directions"] = {itemArray[2]}
        elseif (itemName == "spitter") then
            propertiesArray["directions"] = itemArray[2]
        end
        if (itemName == "bomb")
        or (itemName == "hook") then
            propertiesArray["squares"] = itemArray[8]
            itemArray["quantity"] = itemArray[10]
        elseif (itemName == "jet") then
            itemArray["quantity"] = itemArray[9]
        elseif (itemName == "clock")
        or (itemName == "fireCape")
        or (itemName == "characterSpecial")
        or (itemName == "iceCape")
        or (itemName == "bulletVest") then
            propertiesArray["seconds"] = itemArray[8]
            itemArray["quantity"] = itemArray[9]
        end
    end

    if (itemName == "bomb")
    or (itemName == "hook")
    or (itemName == "jet")
    or (itemName == "autoFan")
    or (itemName == "manualFan")
    or (itemName == "spitter") then
        directionArray = propertiesArray["directions"]
    end

    tool.x = xCord
    tool.y = yCord

    if itemName == "triangle" then
        local triangleRotateArray = { triangleBottomRightShape = 90, triangleBottomLeftShape = 180, triangleTopLeftShape = 270}
        local trianglePositionArray = {
            triangleBottomRightShape = {x = 2, y = 4},
            triangleBottomLeftShape = {x = 2, y = -28},
            triangleTopLeftShape = {x = 1, y = -33},
        }

        if propertiesArray["shape"] ~= "triangleTopRightShape" then
            print(propertiesArray["shape"], "shap", propertiesArray)
            tool.rotation = triangleRotateArray[propertiesArray["shape"]]
            tool.x = tool.x + trianglePositionArray[propertiesArray["shape"]]["x"]
            tool.y = tool.y + trianglePositionArray[propertiesArray["shape"]]["y"]
        end
    elseif itemName == "bar" then
        if propertiesArray["shape"] == "horz" then
            tool.rotation = 83
            tool.y = tool.y + 8
        else
            tool.rotation = -7
            tool.y = tool.y - 3
        end
    end

    if showingToolsArrayCounter ~= nil and showingToolsArrayCounter > 4 then
        tool.displayObjects["background"].x = bgStartXVal
        bgStartXVal = bgStartXVal + 68
        tool.displayObjects["background"].y = bgStartYVal
    end

    if (tool.displayObjects["text"]) then
        tool.displayObjects["text"][1].x = tool.x
        if viewScreenName == "itemBagScreen" then
            tool.displayObjects["text"][1].y = tool.y + 3
        elseif viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPItemTile" then
            tool.displayObjects["text"][1].y = tool.y + 1
        else
            tool.displayObjects["text"][1].y = tool.y + 3
        end

        if (tool.displayObjects["text"][2]
        and tool.displayObjects["text"][2] ~= nil) then
            tool.displayObjects["text"][1].x = tool.x - 2
            tool.displayObjects["text"][2].x = tool.x + 5.5
            tool.displayObjects["text"][2].y = tool.y + 4

            if viewScreenName == "itemBagScreen" then
                tool.displayObjects["text"][2].y = tool.y + 4
            elseif viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPItemTile"
            or viewScreenName == "mysteryBlockBag" then
                tool.displayObjects["text"][2].y = tool.y + 2
            else
                tool.displayObjects["text"][2].y = tool.y + 4
            end
        end
    end

    local itemDirectionArrowArray, shapeDirectionArrowArray, bombDirectionArrowArray
    if viewScreenName == "itemBagScreen" then
        itemDirectionArrowArray = {
            up = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y - 13 end,
            right = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x + 11 end,
            down = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y + 13 end,
            left = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x - 12 end
        }
        shapeDirectionArrowArray = {
            up = function (obj) obj.y = obj.y - 16 end,
            right = function (obj) obj.x = obj.x + 14 obj.y = obj.y - 2 end,
            down = function (obj) obj.y = obj.y + 11 end,
            left = function (obj) obj.x = obj.x - 14 obj.y = obj.y - 2 end
        }
        bombDirectionArrowArray = {
            up = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y - 13 end,
            right = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x + 11 end,
            down = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y + 13 end,
            left = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x - 12 end
        }
    elseif viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPYouHaveDisplayfast" then
        itemDirectionArrowArray = {
            up = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y - 10 end,
            right = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x + 9 end,
            down = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y + 10 end,
            left = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x - 9 end
        }
        shapeDirectionArrowArray = {
            up = function (obj) obj.y = obj.y - 9 end,
            right = function (obj) obj.x = obj.x + 8.5 obj.y = obj.y - 0.5 end,
            down = function (obj) obj.y = obj.y + 7.5 end,
            left = function (obj) obj.x = obj.x - 8.5 obj.y = obj.y - 0.5 end
        }
        bombDirectionArrowArray = {
            up = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y - 10 end,
            right = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x + 9 end,
            down = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y + 10 end,
            left = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x - 9 end
        }
    elseif viewScreenName == "IAPItemTile" or viewScreenName == "mysteryBlockBag" then
        itemDirectionArrowArray = {
            up = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y - 13 end,
            right = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x + 11 end,
            down = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y + 13 end,
            left = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x - 12 end
        }
        shapeDirectionArrowArray = {
            up = function (obj) obj.y = obj.y - 11 end,
            right = function (obj) obj.x = obj.x + 11 obj.y = obj.y - 0.5 end,
            down = function (obj) obj.y = obj.y + 10 end,
            left = function (obj) obj.x = obj.x - 11 obj.y = obj.y - 0.5 end
        }
        bombDirectionArrowArray = {
            up = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y - 10 end,
            right = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x + 10 end,
            down = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y + 10 end,
            left = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x - 10 end
        }
    else
        itemDirectionArrowArray = {
            up = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y - 13 end,
            right = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x + 11 end,
            down = function () tool.displayObjects["directionLabel"][1].y = tool.displayObjects["directionLabel"][1].y + 13 end,
            left = function () tool.displayObjects["directionLabel"][1].x = tool.displayObjects["directionLabel"][1].x - 12 end
        }
        shapeDirectionArrowArray = {
            up = function (obj) obj.y = obj.y - 11 end,
            right = function (obj) obj.x = obj.x + 11 obj.y = obj.y - 0.5 end,
            down = function (obj) obj.y = obj.y + 10 end,
            left = function (obj) obj.x = obj.x - 11 obj.y = obj.y - 0.5 end
        }
        bombDirectionArrowArray = {
            up = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y - 13 end,
            right = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x + 11 end,
            down = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].y + 13 end,
            left = function (bombDirectionLabelCounter, showType, tool)  tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x = tool.displayObjects["directionLabel"][bombDirectionLabelCounter].x - 12 end
        }
    end

    if (itemName == "bomb")
    or (itemName == "autoFan")
    or (itemName == "manualFan")
    or (itemName == "spitter") then
        for z = 1, #directionArray do
            tool.displayObjects["directionLabel"][z].x = tool.x
            if viewScreenName == "itemBagScreen" and itemName == "bomb" then
                tool.displayObjects["directionLabel"][z].y = tool.y + 3
            elseif viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPItemTile"
            or viewScreenName == "mysteryBlockBag" then
                tool.displayObjects["directionLabel"][z].y = tool.y + 1
            else
                tool.displayObjects["directionLabel"][z].y = tool.y + 3
            end
            if itemName ~= "bomb" then
                shapeDirectionArrowArray[directionArray[z]](tool.displayObjects["directionLabel"][z])
            else
                bombDirectionArrowArray[directionArray[z]](z, "item-screen", tool)
            end
        end
    elseif (itemName == "hook")
    or (itemName == "jet") then
        tool.displayObjects["directionLabel"][1].x = tool.x
        if viewScreenName == "itemBagScreen" then
            tool.displayObjects["directionLabel"][1].y = tool.y + 3
        elseif viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" then
            tool.displayObjects["directionLabel"][1].y = tool.y + 1
        else
            tool.displayObjects["directionLabel"][1].y = tool.y + 3
        end
        itemDirectionArrowArray[propertiesArray["directions"][1]]()
    end

    if viewScreenName == "itemBagScreen" or viewScreenName == "MedalGainedScreen" or viewScreenName == "ItemGainedScreen" or viewScreenName == "IAPPurchaseScreen" then
        tool.displayObjects["counterNumber"].x = tool.x + 23
        tool.displayObjects["counterNumber"].y = tool.y + 19
    elseif viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" then
        tool.displayObjects["counterNumber"].x = tool.x + 13
        tool.displayObjects["counterNumber"].y = tool.y + 10
    end


    if viewScreenName == "IAPYouHaveDisplayfast" or viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPItemTile" then
        tool.originalY = tool.y - display.contentHeight
        if tool.displayObjects["text"] then
            for a = 1, #tool.displayObjects["text"] do
                tool.displayObjects["text"][a].originalY = tool.displayObjects["text"][a].y - display.contentHeight
            end
        end

        if tool.displayObjects["directionLabel"] then
            for a = 1, #tool.displayObjects["directionLabel"] do
                tool.displayObjects["directionLabel"][a].originalY = tool.displayObjects["directionLabel"][a].y - display.contentHeight
            end
        end

        if tool.displayObjects["counterNumber"] then
            tool.displayObjects["counterNumber"].originalY = tool.displayObjects["counterNumber"].y - display.contentHeight
        end
    end

    if viewScreenName == "IAPYouHaveDisplayslow" or viewScreenName == "IAPPurchaseScreen" then
        local timeLength
        if viewScreenName == "IAPPurchaseScreen" then
            timeLength = 75
        else
            timeLength = 1000
        end
        timer.performWithDelay(timeLength, function ()
            transition.to(tool, {alpha = 1, time = 250})
            if tool.displayObjects["text"] then
                for a = 1, #tool.displayObjects["text"] do
                    transition.to(tool.displayObjects["text"][a], {alpha = 1, time = 250})
                end
            end

            if tool.displayObjects["directionLabel"] then
                for a = 1, #tool.displayObjects["directionLabel"] do
                    transition.to(tool.displayObjects["directionLabel"][a], {alpha = 1, time = 250})
                end
            end

            transition.to(tool.displayObjects["counterNumber"], {alpha = 1, time = 250})
        end)
    end

    return tool
end
    t.positionItemDetailedIcon = positionItemDetailedIcon

        -- body

return t