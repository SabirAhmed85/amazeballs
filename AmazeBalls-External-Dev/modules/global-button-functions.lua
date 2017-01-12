local t = {}
local seeObjects, seeTools
local widget = require("widget")

local toolScreenItemsArray = {
    clock = {true},
    bomb = {true},
    hook = {true},
    dummyBall = {true},
    superBall = {true},
    iceCape = {true},
    fireCape = {true},
    bulletVest = {true},
    characterSpecial = {true},
    bulletVest = {true},
    jet = {true}
}
    t.toolScreenItemsArray = toolScreenItemsArray

local shapeScreenItemsArray = {
    triangle = {true},
    bar = {true},
    autoFan = {true},
    manualFan = {true},
    spitter = {true},
    simple = {true},
    backFire = {true}
}
    t.shapeScreenItemsArray = shapeScreenItemsArray

local hideToolAndShapeCommonElems = function (itemBagScreen)
    itemBagScreen.freeItemsButton:removeSelf()
    itemBagScreen.freeItemsButton = nil
    itemBagScreen.buyMoreButton:removeSelf()
    itemBagScreen.buyMoreButton = nil
end

local function hideItemBagScrollSectionCommonElems (itemBagScreenArray, stateToHide)
    if stateToHide == "tools" then
        itemBagScreenArray.itemBagScreen.toolBg.alpha = 0
    else
        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.alpha = 0
        itemBagScreenArray.itemBagScreen.shapeBg.alpha = 0
    end

    for key, val in pairs(itemBagScreenArray.itemBagScreen.tile) do
        if key == "dummyBall"
        or key == "superBall"
        or key == "simple"
        or key == "backFire" then
            itemBagScreenArray.itemBagScreen.tile[key].counterNumber:removeSelf()
            itemBagScreenArray.itemBagScreen.tile[key].counterNumber = nil
        end
        itemBagScreenArray.itemBagScreen.tile[key]:removeSelf()
        itemBagScreenArray.itemBagScreen.tile[key] = nil
    end

    itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 0

    itemBagScreenArray.itemBagScreen.currentToolTextTitle:removeSelf()
    itemBagScreenArray.itemBagScreen.currentToolTextTitle = nil
    itemBagScreenArray.itemBagScreen.currentToolText:removeSelf()
    itemBagScreenArray.itemBagScreen.currentToolText = nil
    itemBagScreenArray.itemBagScreen.scrollView:removeSelf()
    itemBagScreenArray.itemBagScreen.scrollView = nil
    itemBagScreenArray.itemBagScreen.toolIcon:removeSelf()
    itemBagScreenArray.itemBagScreen.toolIcon = nil

    for a = 1, #itemBagScreenArray.itemBagScreen.toolBGTiles do
        local bg = itemBagScreenArray.itemBagScreen.toolBGTiles[a]

        bg:removeSelf()
        bg = nil
    end
end
    t.hideItemBagScreenCommonElems = hideItemBagScreenCommonElems

local hideItem = function (item)
    for key, val in pairs(item.displayObjects) do
        if (key == "directionLabel" or key == "text") then
            for a = 1, #item.displayObjects[key] do
                item.displayObjects[key][a]:removeSelf()
                item.displayObjects[key][a] = nil
            end
        else
            item.displayObjects[key]:removeSelf()
            item.displayObjects[key] = nil
        end
    end

    item:removeSelf()
    item = nil
end

local hideTools = function (settingsArray, itemBagScreenArray)
    itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 0
    itemBagScreenArray.itemBagScreen.bottomSelectedTile.alpha = 0

    hideItemBagScrollSectionCommonElems(itemBagScreenArray, "tools")

    for a = 1, #settingsArray.showingToolsArray do
        local tool = settingsArray.showingToolsArray[a]

        hideItem(tool)

        if (a == #settingsArray.showingToolsArray) then
            settingsArray.showingToolsArray = {}
        end
    end
    
    itemBagScreenArray.itemBagScreen.toolBGTiles = {}
    settingsArray.showingToolsArray = {}
    settingsArray.itemBagIsOpen = false
end

local hideObjects = function (settingsArray, itemBagScreenArray, isMysteryBag)

    if isMysteryBag == false then
        hideItemBagScrollSectionCommonElems(itemBagScreenArray, "shape")
    end

    for a = 1, #settingsArray.showingObjectsArray do
        local shape = settingsArray.showingObjectsArray[a]

        hideItem(shape)

        if (a == #settingsArray.showingObjectsArray) then
            settingsArray.showingObjectsArray = {}
        end
    end
end
    t.hideObjects = hideObjects

seeTools = function (mainArray, settingsArray, viewScreenName, itemBagScreenArray, firstAttempt)
    local xVal = -20
    local yVal = 31
    local thisXVal = 70
    local thisYVal = 70

    myToolArray = loadTable("myTotalToolArray.json")

    local ballExists = {}
    ballExists["dummyBall"] = false
    ballExists["superBall"] = false
    local ballToolArrayCounter = {}
    local ballTotal = {}
    for a = 1, #myToolArray do
        if myToolArray[a][1] == "dummyBall" then
            ballExists["dummyBall"] = true
            ballToolArrayCounter["dummyBall"] = a
            ballTotal["dummyBall"] =  myToolArray[a]["quantity"]
        end
        if myToolArray[a][1] == "superBall" then
            ballExists["superBall"] = true
            ballToolArrayCounter["superBall"]  = a
            ballTotal["superBall"] =  myToolArray[a]["quantity"]
        end

    end
    if ballExists["dummyBall"] == false then
        ballTotal["dummyBall"] = 1
    end

    if ballExists["superBall"] == false then
        ballTotal["superBall"] = 1
    end
    local toolPosLabelArray = {"bomb", "dummyBall", "hook", "superBall", "jet", "clock", "fireCape", "characterSpecial", "iceCape", "bulletVest"}
    local currentToolTextOptions = { width = 230, align = "left", font = native.systemFont, fontSize = 13 }

    itemBagScreenArray.itemBagScreen.currentScreen = "clock"
    itemBagScreenArray.itemBagScreen.tile = {}

    if (firstAttempt == true and myGameSettings["shapesDiscovered"]) then
        itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton:addEventListener("tap", mainArray.toggleShapeOrToolView)
        transition.to(itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton, {alpha = 1, time = 100})
    end

    itemBagScreenArray.itemBagScreen.bottomSelectedTile:toFront()
    itemBagScreenArray.itemBagScreen.bottomSelectedTile.x = itemBagScreenArray.itemBagScreen.bottomSelectedTile.originalX
    itemBagScreenArray.itemBagScreen.bottomSelectedTile.alpha = 1
    itemBagScreenArray.itemBagScreen.toolBg:toFront()
    itemBagScreenArray.itemBagScreen.toolBg.alpha = 1

    currentToolTextOptions.text = settingsArray.itemScreenToolDescriptions["clock"][1] .. ": " .. settingsArray.itemScreenToolDescriptions["clock"][2]

    itemBagScreenArray.itemBagScreen.currentToolText = display.newText(currentToolTextOptions)
    itemBagScreenArray.itemBagScreen.currentToolText.anchorX = 0
    itemBagScreenArray.itemBagScreen.currentToolText.anchorY = 0
    itemBagScreenArray.itemBagScreen.currentToolText.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 82
    itemBagScreenArray.itemBagScreen.currentToolText.y = yCalc(196)
    itemBagScreenArray.itemBagScreen.currentToolText:setTextColor(0.4, 0.4, 0.4)
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.currentToolText)

    currentToolTextOptions.text = settingsArray.itemScreenToolDescriptions["clock"][1] .. ":"

    itemBagScreenArray.itemBagScreen.currentToolTextTitle = display.newText(currentToolTextOptions)
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.anchorX = 0
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.anchorY = 0
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 82
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.y = yCalc(196)
    itemBagScreenArray.itemBagScreen.currentToolTextTitle:setTextColor(0.55, 0.2, 0.2)
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.currentToolTextTitle)


    for a = 1, #toolPosLabelArray do
        local toolExistsInBag = false
        local thisRelItemArray
        local key = toolPosLabelArray[a]
        if viewScreenName == "inGame" then
            thisRelItemArray = mainArray.thisLevelSettings.toolArray
        else
            thisRelItemArray = mainArray.allLevelSettings.toolArray
        end
        for b = 1, #thisRelItemArray do
            if thisRelItemArray[b]["name"] == key then
                toolExistsInBag = true
            end
        end
        if (myGameSettings["itemDiscovered"][key] or toolExistsInBag) then
            tile = display.newSprite(itemsImageSheet, itemsSequenceData)
            tile:setSequence(key)
        else
            tile = display.newSprite(settingsArray.smallIconsImageSheet, settingsArray.smallIconsSequenceData)
            tile:setSequence("question-mark")
        end
        tile.value = key
        tile.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + settingsArray.itemScreenToolPositioningArray[key][1]
        tile.y = settingsArray.itemScreenToolPositioningArray[key][2]
        if key == "dummyBall"
        or key == "superBall" then
            tile.xScale = 0.75
            tile.yScale = 0.75

            tile.counterNumber = display.newImage("images/objects/itemCounter-number".. ballTotal[key] ..".png")
            settingsArray.itemScreenObjectsGroup:insert(tile.counterNumber)
            tile.counterNumber:toFront()
            tile.counterNumber.x = tile.x + 15
            tile.counterNumber.y = tile.y + 15
            tile.counterNumber.xScale = 0.75
            tile.counterNumber.yScale = 0.75
        else
            tile.xScale = 0.6
            tile.yScale = 0.6
        end
        tile.value = key

        if (myGameSettings["itemDiscovered"][key] or toolExistsInBag) then
            if key == "dummyBall"
            or key == "superBall" then
                tile:addEventListener("tap", mainArray.listener)
            else
                tile:addEventListener("tap", mainArray.changeToolInnerScreen)
            end
        end

        itemBagScreenArray.itemBagScreen.tile[key] = tile
        settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.tile[key])
    end

    showingToolsArrayCounter = 0

    t.createToolInnerScreen(mainArray, itemBagScreenArray, settingsArray, mainArray.buttonListenerScript, itemBagScreenArray.itemBagScreen.currentScreen, viewScreenName)

    itemBagScreenArray.itemBagScreen.scrollView:toFront()
end
    t.seeTools = seeTools

seeObjects = function (mainArray, itemBagScreenArray, settingsArray, viewScreenName)

    --itemBagScreenArray.itemBagScreen.shapeBg:toFront()
    itemBagScreenArray.itemBagScreen.shapeBg.alpha = 1

    itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape:toFront()
    itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.x = itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.originalX
    itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.alpha = 1

    local toolPosLabelArray = {"autoFan", "manualFan", "spitter", "triangle", "bar", "simple", "backFire"}

    local currentToolTextOptions = { width = 230, align = "left", font = native.systemFont, fontSize = 13 }

    currentToolTextOptions.text = settingsArray.itemScreenToolDescriptions["triangle"][1] .. ": " .. settingsArray.itemScreenToolDescriptions["triangle"][2]

    itemBagScreenArray.itemBagScreen.currentScreen = "triangle"

    itemBagScreenArray.itemBagScreen.scrollView = widget.newScrollView {
        top = 0,
        left = 0,
        verticalScrollDisabled = true,
        height = 65,
        width = 280,
        scrollWidth = display.contentWidth,
        scrollHeight = 65,
        hideBackground = true,
        hideScrollBar = true
    }

    itemBagScreenArray.itemBagScreen.currentToolText = display.newText(currentToolTextOptions)
    itemBagScreenArray.itemBagScreen.currentToolText.anchorX = 0
    itemBagScreenArray.itemBagScreen.currentToolText.anchorY = 0
    itemBagScreenArray.itemBagScreen.currentToolText.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 82
    itemBagScreenArray.itemBagScreen.currentToolText.y = yCalc(196)
    itemBagScreenArray.itemBagScreen.currentToolText:setTextColor(0.4, 0.4, 0.4)
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.currentToolText)

    currentToolTextOptions.text = settingsArray.itemScreenToolDescriptions["triangle"][1] .. ":"

    itemBagScreenArray.itemBagScreen.currentToolTextTitle = display.newText(currentToolTextOptions)
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.anchorX = 0
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.anchorY = 0
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 82
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.y = yCalc(196)
    itemBagScreenArray.itemBagScreen.currentToolTextTitle:setTextColor(0.55, 0.2, 0.2)
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.currentToolTextTitle)

    for key, val in pairs(itemBagScreenArray.itemBagScreen.tile) do
        itemBagScreenArray.itemBagScreen.tile[key]:removeSelf()
        itemBagScreenArray.itemBagScreen.tile[key] = nil
    end
    itemBagScreenArray.itemBagScreen.tile = {}
    local tile = {}

    for a = 1, #toolPosLabelArray do
        local objectExistsInBag = false
        local objectIndex
        local itemQuant = 0
        local key = toolPosLabelArray[a]
        if viewScreenName == "inGame" then
            thisRelItemArray = mainArray.thisLevelSettings.objectArray
        else
            thisRelItemArray = mainArray.allLevelSettings.objectArray
        end

        for b = 1, #thisRelItemArray do
            if thisRelItemArray[b]["name"] == key then
                objectExistsInBag = true
                objectIndex = b
                itemQuant = thisRelItemArray[b]["quantity"]
            end
        end
        if (myGameSettings["itemDiscovered"][key] or objectExistsInBag) then
            tile = display.newSprite(settingsArray.shapesImageSheet, settingsArray.shapesSequenceData)
            tile:setSequence(key)
        else
            tile = display.newSprite(settingsArray.smallIconsImageSheet, settingsArray.smallIconsSequenceData)
            tile:setSequence("question-mark")
        end
        tile.value = key
        tile.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + settingsArray.itemScreenToolPositioningArray[key][1]
        tile.y = settingsArray.itemScreenToolPositioningArray[key][2]
        if key == "simple"
        or key == "backFire" then
            tile.xScale = 0.75
            tile.yScale = 0.75
            tile.counterNumber = display.newImage("images/objects/itemCounter-number" .. itemQuant + 1 .. ".png")
            settingsArray.itemScreenObjectsGroup:insert(tile.counterNumber)
            tile.counterNumber:toFront()
            tile.counterNumber.x = tile.x + 15
            tile.counterNumber.y = tile.y + 15
            tile.counterNumber.xScale = 0.75
            tile.counterNumber.yScale = 0.75
        else
            tile.xScale = 0.6
            tile.yScale = 0.6
        end

        if key ~= "simple"
        and key ~= "backFire"
        and (myGameSettings["itemDiscovered"][key] or objectExistsInBag) then
            tile:addEventListener("tap", mainArray.changeToolInnerScreen)
        end
        itemBagScreenArray.itemBagScreen.tile[key] = tile
        settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.tile[key])
        if tile.counterNumber then
            tile.counterNumber:toFront()
        end
    end

    showingToolsArrayCounter = 0

    viewScreenName = "levelSelect"
    t.createToolInnerScreen(mainArray, itemBagScreenArray, settingsArray, itemBagScreenArray.buttonListenerScript, itemBagScreenArray.itemBagScreen.currentScreen, viewScreenName)

    itemBagScreenArray.itemBagScreen.scrollView:toFront()

    itemBagScreenArray.objectsShown = true

end
	t.seeObjects = seeObjects

local function toggleShapeOrToolView (mainArray, settingsArray, itemBagScreenArray, viewScreenName)
    local relItemBagArray, relSettingsArray
    if (viewScreenName == "levelSelect") then
        relItemBagArray = mainArray
    else
        relItemBagArray = mainArray.ballAndButtonAndScreenCreateScript
    end
    if settingsArray.itemBagIsOpen then
        hideTools(settingsArray, itemBagScreenArray)
        seeObjects(mainArray, itemBagScreenArray, settingsArray, viewScreenName)
        itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton:setSequence("seeTools")
        settingsArray.itemBagIsOpen = false
        settingsArray.mysteryBlockBagIsOpen = true
    elseif settingsArray.mysteryBlockBagIsOpen then
        hideObjects(settingsArray, itemBagScreenArray, false)
        seeTools(mainArray, settingsArray, "levelSelect", itemBagScreenArray, false)
        itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton:setSequence("seeShapes")
        settingsArray.itemBagIsOpen = true
        settingsArray.mysteryBlockBagIsOpen = false
    end
end
    t.toggleShapeOrToolView = toggleShapeOrToolView

local changeToolSelectedTile = function (itemBagScreenArray, settingsArray, screenName, viewScreenName)
    if (screenName == "bomb")
    or (screenName == "hook")
    or (screenName == "jet")
    or (screenName == "autoFan")
    or (screenName == "manualFan")
    or (screenName == "spitter") then
        itemBagScreenArray.itemBagScreen.topSelectedTile:toFront()
        itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 1
        itemBagScreenArray.itemBagScreen.bottomSelectedTile.alpha = 0
        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.alpha = 0

        itemBagScreenArray.itemBagScreen.topSelectedTile.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + settingsArray.itemScreenToolPositioningArray[screenName][1] - 48
        if (screenName == "manualFan") then
            itemBagScreenArray.itemBagScreen.topSelectedTile.x = itemBagScreenArray.itemBagScreen.topSelectedTile.x + 1
        elseif (screenName == "hook" or screenName == "spitter") then
            itemBagScreenArray.itemBagScreen.topSelectedTile.x = itemBagScreenArray.itemBagScreen.topSelectedTile.x + 2
        elseif (screenName == "jet") then
            itemBagScreenArray.itemBagScreen.topSelectedTile.x = itemBagScreenArray.itemBagScreen.topSelectedTile.x + 3
        end
    elseif (screenName == "clock")
    or (screenName == "iceCape")
    or (screenName == "characterSpecial")
    or (screenName == "fireCape")
    or (screenName == "bulletVest") then
        itemBagScreenArray.itemBagScreen.bottomSelectedTile:toFront()
        itemBagScreenArray.itemBagScreen.bottomSelectedTile.alpha = 1
        itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 0
        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.alpha = 0

        itemBagScreenArray.itemBagScreen.bottomSelectedTile.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + settingsArray.itemScreenToolPositioningArray[screenName][1] - 28
        if (screenName == "clock") then
            itemBagScreenArray.itemBagScreen.bottomSelectedTile.x = itemBagScreenArray.itemBagScreen.bottomSelectedTile.x + 2
        end
    elseif (screenName == "triangle")
    or (screenName == "bar") then
        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape:toFront()
        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.alpha = 1
        itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 0
        itemBagScreenArray.itemBagScreen.bottomSelectedTile.alpha = 0

        itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + settingsArray.itemScreenToolPositioningArray[screenName][1] - 69
        if (screenName == "triangle") then
            itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.x = itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.x - 5
        end
    end

    itemBagScreenArray.itemBagScreen.tile[screenName]:toFront()

    itemBagScreenArray.itemBagScreen.currentToolText.text = settingsArray.itemScreenToolDescriptions[screenName][1] .. ": " .. settingsArray.itemScreenToolDescriptions[screenName][2]
    itemBagScreenArray.itemBagScreen.currentToolTextTitle.text = settingsArray.itemScreenToolDescriptions[screenName][1] .. ":"
end
    t.changeToolSelectedTile = changeToolSelectedTile

local changeMysteryBlockBagSelectedTile = function (mainFunc, screenName, i)
    local tileXIndex
    local mysteryBagScreen = mainFunc.mysteryBagScreen

    if (i < 5) then
        tileXIndex = i
        mysteryBagScreen.selectedTile.yScale = 1
        mysteryBagScreen.selectedTile.y = yCalc(152)
    else
        tileXIndex = i - 4
        mysteryBagScreen.selectedTile.yScale = -1
        mysteryBagScreen.selectedTile.y = yCalc(235)
    end
    mysteryBagScreen.selectedTile.x = xCalc(245) + xCalc( (tileXIndex-1) * 59.25)
    for a = 1, #mysteryBagScreen.allowedShapesTabs do
        mysteryBagScreen.allowedShapesTabs[a].tabIcon:toFront()
    end

    t.createItemBagToolScreenAndScroll(mainFunc, screenName, mainFunc.allLevelSettings.shapesImageSheet, mainFunc.allLevelSettings.shapesSequenceData, mainFunc.ballAndButtonAndScreenCreateScript, mainFunc.allLevelSettings, mainFunc.buttonListenerScript, mainFunc.mysteryBlockShapeListener, "mysteryBlockBag")

end
    t.changeMysteryBlockBagSelectedTile = changeMysteryBlockBagSelectedTile
local createToolInnerScreen, globalOpenItemBagFunction

createToolInnerScreen = function (mainArray, itemBagScreenArray, settingsArray, buttonListenerScript, screenName, viewScreenName)
    itemBagScreenArray.itemBagScreen.currentScreen = screenName
    local xVal = 70

    if itemBagScreenArray.itemBagScreen.toolIcon then
        itemBagScreenArray.itemBagScreen.toolIcon:removeSelf()
        itemBagScreenArray.itemBagScreen.toolIcon = nil
    end
    
    itemBagScreenArray.itemBagScreen.bottomSelectedTile:toFront()
    for key, val in pairs(itemBagScreenArray.itemBagScreen.tile) do
        itemBagScreenArray.itemBagScreen.tile[key]:toFront()
    end

    local thisIsShapeScreen = false
    local relSheet = settingsArray.itemsImageSheet
    local relSequenceData = settingsArray.itemsSequenceData
    for key, val in pairs(settingsArray.shapesSequenceData) do
        if settingsArray.shapesSequenceData[key]["name"] == screenName then
            thisIsShapeScreen = true
        end
    end
    if thisIsShapeScreen then
        relSheet = settingsArray.shapesImageSheet
        relSequenceData = settingsArray.shapesSequenceData
    end
    itemBagScreenArray.itemBagScreen.toolIcon = display.newSprite(relSheet, relSequenceData)
    itemBagScreenArray.itemBagScreen.toolIcon:setSequence(screenName)
    itemBagScreenArray.itemBagScreen.toolIcon.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 55
    itemBagScreenArray.itemBagScreen.toolIcon.y = 217
    itemBagScreenArray.itemBagScreen.toolIcon.xScale = 0.55
    itemBagScreenArray.itemBagScreen.toolIcon.yScale = 0.55
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.toolIcon)

    if viewScreenName == "inGame" then
        itemBagScreenArray.itemBtn:toFront()
        itemBagScreenArray.itemBagBtn:toFront()
    end

    t.createItemBagToolScreenAndScroll(mainArray, screenName, relSheet, relSequenceData, itemBagScreenArray, settingsArray, buttonListenerScript, mainArray.listener, viewScreenName)

end
    t.createToolInnerScreen = createToolInnerScreen

    -- (levelVariables, nil, nil, "levelSelect", levelVariables)
globalOpenItemBagFunction = function (mainArray, shapeArray, shapeArrayParameters, levelVariables, viewScreenName, itemBagScreenArray)
    if (levelVariables == nil) then
        levelVariables = mainArray
    end
    if (itemBagScreenArray == nil) then
        itemBagScreenArray = mainArray
    end

    if (mainArray.allLevelSettings.itemBagIsOpen == false) then
        itemBagScreenArray.itemBagScreen.itemBagScreenOverlay.alpha = 0.05
        itemBagScreenArray.itemBagScreen.itemBagScreenOverlay:addEventListener("tap", mainArray.dummyListener)
        itemBagScreenArray.itemBagScreen.itemBagScreenOverlay:addEventListener("touch", mainArray.dummyListener)

        local createToolInnerScreen, changeToolInnerScreen
        mainArray.allLevelSettings.itemBagIsOpen = true
        mainArray.allLevelSettings.mysteryBlockBagIsOpen = false

        mainArray.allLevelSettings.isScreenPausedState = true

        if (viewScreenName == "inGame") then
            mainArray.ballAndButtonAndScreenCreateScript.itemBagBtn:setSequence("close")
            mainArray.buttonListenerScript.removeEventListenersForPause(mainArray, shapeArray, shapeArrayParameters)
            mainArray.buttonListenerScript.removeShapeListenersForPause(mainArray, shapeArray, shapeArrayParameters)

            mainArray.allLevelSettings.shouldBallMoveCounter = mainArray.allLevelSettings.shouldBallMoveCounter + 1

            if mainArray.thisLevelSettings.mapObtained == true then
                mainArray.ballAndButtonAndScreenCreateScript.playBtn.alpha = 0.3
            end
            mainArray.ballAndButtonAndScreenCreateScript.itemBtn:toFront()
            mainArray.ballAndButtonAndScreenCreateScript.itemBagBtn:toFront()
        elseif viewScreenName == "levelSelect" then
        end

        itemBagScreenArray.itemBagScreen.toolBg:toBack()
        itemBagScreenArray.itemBagScreen:toBack()
        itemBagScreenArray.itemBagScreen.itemBagScreenOverlay:toBack()
        transition.to(itemBagScreenArray.mapScreen, {alpha = 0.5, time = 100})
        itemBagScreenArray.itemBagScreen.topSelectedTile.alpha = 0
        transition.to(itemBagScreenArray.itemBagScreen.topSelectedTile, {y = itemBagScreenArray.itemBagScreen.topSelectedTile.originalY + display.contentHeight, time = 100})
        itemBagScreenArray.itemBagScreen.bottomSelectedTile.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 31
        transition.to(itemBagScreenArray.itemBagScreen.toolBg, {alpha = 1, y = itemBagScreenArray.itemBagScreen.toolBg.originalY + display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.shapeBg, {alpha = 0, y = itemBagScreenArray.itemBagScreen.shapeBg.originalY + display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.bottomSelectedTile, {alpha = 1, y = itemBagScreenArray.itemBagScreen.bottomSelectedTile.originalY + display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape, {y = itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.originalY + display.contentHeight, time = 100})
        mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagBtn)
        if (viewScreenName == "inGame") then
            mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBtn)
        elseif (viewScreenName == "levelSelect") then
            transition.to(levelVariables.itemBagBtn, {x = levelVariables.itemBagBtn.finalX, y = levelVariables.itemBagBtn.finalY, time = 100})
        end
        transition.to(itemBagScreenArray.itemBagScreen.itemBagScreenOverlay, {alpha = 0.15, time = 200})
        transition.to(itemBagScreenArray.itemBagScreen, {y = itemBagScreenArray.itemBagScreen.originalY + display.contentHeight, time = 100, onComplete = function ()

            t.seeTools(mainArray, mainArray.allLevelSettings, viewScreenName, itemBagScreenArray, true)

            itemBagScreenArray.itemBagScreen.freeItemsButton = display.newImageRect("images/central-images/buttons/itemBagScreen-freeItemsButton.png", 90, 62)
            itemBagScreenArray.itemBagScreen.freeItemsButton.value = "FreeItems"
            itemBagScreenArray.itemBagScreen.freeItemsButton.x  = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 400
            itemBagScreenArray.itemBagScreen.freeItemsButton.y = 174
            mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.freeItemsButton)
            --itemBagScreenArray.itemBagScreen.freeItemsButton:addEventListener("tap", levelVariables.openIAP)

            itemBagScreenArray.itemBagScreen.buyMoreButton = display.newImageRect("images/central-images/buttons/itemBagScreen-buyMoreButton.png", 122, 74)
            itemBagScreenArray.itemBagScreen.buyMoreButton.value = "Tools"
            itemBagScreenArray.itemBagScreen.buyMoreButton.x  = itemBagScreenArray.itemBagScreen.ItemBagScreenX + 389
            itemBagScreenArray.itemBagScreen.buyMoreButton.y = 249
            mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.buyMoreButton)
            itemBagScreenArray.itemBagScreen.buyMoreButton:addEventListener("tap", levelVariables.openIAP)

        end})

        --mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagBtn)
        --itemBagScreenArray.itemBagBtn:toFront()
        --mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBtn)
        --itemBagScreenArray.itemBtn:toFront()
        --mainArray.allLevelSettings.itemScreenObjectsGroup:insert(itemBagScreenArray.randomBtn)
        --itemBagScreenArray.randomBtn:toFront()
        mainArray.allLevelSettings.itemScreenObjectsGroup:toFront()

        if viewScreenName == "inGame" then
            mainArray.allLevelSettings.pauseScreenObjectsGroup:toFront()
        end
    else

        --if mainArray.allLevelSettings.mysteryBlockBagIsOpen == false then
        if viewScreenName == "inGame" then
            itemBagScreenArray.itemBagBtn:setSequence("open")
            itemBagScreenArray.itemBtn.alpha = 1
        end

        if mainArray.allLevelSettings.itemBagIsOpen == true then

            hideTools(mainArray.allLevelSettings, itemBagScreenArray)
            hideToolAndShapeCommonElems(itemBagScreenArray.itemBagScreen)
            
            itemBagScreenArray.itemBagScreen.toolBGTiles = {}
            mainArray.allLevelSettings.showingToolsArray = {}
            mainArray.allLevelSettings.itemBagIsOpen = false
        elseif mainArray.allLevelSettings.mysteryBlockBagIsOpen == true then

            hideObjects(mainArray.allLevelSettings, itemBagScreenArray, false)
            hideToolAndShapeCommonElems(itemBagScreenArray.itemBagScreen)

            --itemBagScreenArray.itemBagScreen.toolBGTiles = {}
            mainArray.allLevelSettings.showingObjectsArray = {}
            mainArray.allLevelSettings.mysteryBlockBagIsOpen = false
        end

        local function bagScreenCloseFunction()
            if viewScreenName == "inGame" then
                transition.to(itemBagScreenArray.mapScreen, {alpha = 0, time = 50})
                mainArray.allLevelSettings.shouldBallMoveCounter = mainArray.allLevelSettings.shouldBallMoveCounter - 1

                mainArray.buttonListenerScript.addBackEventListenersForPause(mainArray, shapeArray, shapeArrayParameters)
                
                mainArray.buttonListenerScript.addBackShapeListenersForPause(mainArray, shapeArray, shapeArrayParameters)

                --itemBagScreenArray.playBtn:addEventListener( "tap", mainArray.buttonListener )

                if (mainArray.allLevelSettings.mysteryBlockBagIsOpen == true) then
                    if mainArray.thisLevelSettings.itemBagButtonsVisible then
                        itemBagScreenArray.itemBtn.alpha = 0
                        itemBagScreenArray.itemBagBtn.alpha = 0
                        itemBagScreenArray.itemBagBtn:removeEventListener( "tap", mainArray.buttonListener )
                    else
                        itemBagScreenArray.itemBtn.alpha = 1
                    end
                    mainArray.allLevelSettings.mysteryBlockBagIsOpen = false
                end

                if mainArray.thisLevelSettings.mapObtained == true then
                    itemBagScreenArray.playBtn.alpha = 1
                end
            end

            timer.performWithDelay(750, function ()
                itemBagScreenArray.itemBagScreen.itemBagScreenOverlay:removeEventListener("tap", mainArray.dummyListener)
                itemBagScreenArray.itemBagScreen.itemBagScreenOverlay:removeEventListener("touch", mainArray.dummyListener)
            end)
        end

        itemBagScreenArray.itemBagScreen.toolBg:toBack()
        transition.to(itemBagScreenArray.itemBagScreen.topSelectedTile, {y = itemBagScreenArray.itemBagScreen.topSelectedTile.y - display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape, {y = itemBagScreenArray.itemBagScreen.bottomSelectedTileForShape.y - display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.bottomSelectedTile, {y = itemBagScreenArray.itemBagScreen.bottomSelectedTile.y - display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.toolBg, {y = itemBagScreenArray.itemBagScreen.toolBg.y - display.contentHeight, time = 100})
        transition.to(itemBagScreenArray.itemBagScreen.shapeBg, {y = itemBagScreenArray.itemBagScreen.shapeBg.y - display.contentHeight, time = 100})
        itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton:removeEventListener("tap", mainArray.toggleShapeOrToolView)
        transition.to(itemBagScreenArray.itemBagScreen.toggleShapeOrToolButton, {alpha = 0, time = 100})
        if (viewScreenName == "levelSelect") and (mainArray.thisLevelSettings.itemBagButtonsVisible) then
            transition.to(levelVariables.itemBagBtn, {x = levelVariables.itemBagBtn.originalX, y = levelVariables.itemBagBtn.originalY, time = 100})
        end
        transition.to(itemBagScreenArray.itemBagScreen.itemBagScreenOverlay, {alpha = 0, time = 200})
        transition.to(itemBagScreenArray.itemBagScreen, {y = itemBagScreenArray.itemBagScreen.y - display.contentHeight, time = 100, onComplete = function ()
            bagScreenCloseFunction()
            mainArray.allLevelSettings.itemBagIsOpen = false
        end})

    end

    if mainArray.thisLevelSettings.itemBagButtonsVisible then
        timer.performWithDelay(600, function () itemBagScreenArray.itemBagBtn:addEventListener("tap", mainArray.buttonListener) end)
    end
end
    t.globalOpenItemBagFunction = globalOpenItemBagFunction


    local widthCalc = function (width)
        local widthRecalc = ( width / 480 ) * display.contentWidth
        return widthRecalc
    end
        t.widthCalc = widthCalc

    local heightCalc = function (height)
        local heightRecalc = ( height / 320 ) * display.contentHeight
        return heightRecalc
    end
        t.heightCalc = heightCalc

local createCoinDisplay = function (mainFunc, xVal , yVal, pauseScreenY, viewScreenName)
    local myGameSettings = loadTable("myGameSettings.json")

    local coinCounter = tostring( myGameSettings["total_coins"] )
    if myGameSettings["total_coins"] < 10 then
        coinCounter = "00" .. coinCounter
    elseif myGameSettings["total_coins"] > 9
    and myGameSettings["total_coins"] < 100 then
        coinCounter = "0" .. coinCounter
    elseif myGameSettings["total_coins"] > 999 then
        local afterCommaString = string.sub(coinCounter, #coinCounter - 2, #coinCounter)
        local beforeCommaString = string.sub(coinCounter, 1, #coinCounter - 3)
        coinCounter = beforeCommaString .. ',' .. afterCommaString
    end

    local objArray = {}

    for a = 1, 7 do
        local distanceDifference = xCalc(8)

        objArray[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        objArray[a]:setSequence("0")
        objArray[a].anchorX = 0
        objArray[a].anchorY = 1
        objArray[a].y = yVal - 7.5
        if viewScreenName == "inGame" then
            objArray[a].yValue = yVal - 7.5 - pauseScreenY
        elseif viewScreenName == "titleScreen" then
            objArray[a].originalY = yVal - 7.5
        end

        if (a == 1) then
            objArray[a].x = xVal + xCalc(30) + (distanceDifference * (6 - #coinCounter) )
        else
            objArray[a].x = objArray[a - 1].x + distanceDifference
        end

        if a < (7 - (#coinCounter - 1) ) then
            objArray[a].alpha = 0
        end

    end

    for a = 1, #coinCounter do
        local i = 7 - #coinCounter + a
		--update later
		if objArray[i] then
			objArray[i]:setSequence(string.sub(coinCounter, a, a))
		end
    end

    return objArray
end
    t.createCoinDisplay = createCoinDisplay

local createItemBagToolScreenAndScroll = function (mainArray, screenName, itemsImageSheet, itemsSequenceData, itemBagScreenArray, settingsArray, buttonListenerScript, mainListener, screenViewName)
    local itemArray, showingArray, itemTypeShowing, thisIsShapeScreen, bgStartXVal, bgStartYVal
    local xVal = 35
    local bgStartXVal = 35
    local bgStartYVal = 31
    local scrollHeight = 65
    local scrollWidth = 280
    local tileIncrement = 68
    if screenViewName == "mysteryBlockBag" then
        xVal = xCalc(219)
        bgStartXVal = xCalc(25)
        bgStartYVal = yCalc(28)
        scrollHeight = yCalc(55)
        scrollWidth = xCalc(233)
        tileIncrement = xCalc(60)
    end

    if (t.toolScreenItemsArray[screenName]) then
        itemTypeShowing = "tool"
        if screenViewName == "inGame" then
            itemArray = mainArray.thisLevelSettings.toolArray
        else
            itemArray = loadTable("myTotalToolArray.json")
        end
        showingArray = settingsArray.showingToolsArray
        thisIsShapeScreen = false
        settingsArray.showingToolsArray = {}
    elseif (t.shapeScreenItemsArray[screenName]) then
        itemTypeShowing = "shape"
        if screenViewName == "inGame" then
            itemArray = mainArray.thisLevelSettings.objectArray
        else
            itemArray = loadTable("myTotalObjectArray.json")
        end
        showingArray = settingsArray.showingObjectsArray
        thisIsShapeScreen = true
        settingsArray.showingObjectsArray = {}
    end

    if itemBagScreenArray.itemBagScreen.scrollView then
        itemBagScreenArray.itemBagScreen.scrollView:removeSelf()
        itemBagScreenArray.itemBagScreen.scrollView = nil
    end

    for a = 1, #settingsArray.showingToolsArray do
        local tool = settingsArray.showingToolsArray[a]
        if tool.displayObjects then
        for key, val in pairs(tool.displayObjects) do
            if (tool.displayObjects[key][1]) then
                for a = 1, #tool.displayObjects[key] do
                    --tool.displayObjects[key][a]:removeSelf()
                    tool.displayObjects[key][a] = nil
                end
            elseif tool.displayObjects[key] ~= nil then
                --tool.displayObjects[key]:removeSelf()
                tool.displayObjects[key] = nil
            end
        end
        end

        --tool:removeSelf()
        tool = nil
    end
    if itemBagScreenArray.itemBagScreen.toolBGTiles then
        for a = 1, #itemBagScreenArray.itemBagScreen.toolBGTiles do
            local bg = itemBagScreenArray.itemBagScreen.toolBGTiles[a]

            --bg:removeSelf()
            bg = nil
        end
    end

    ---

    itemBagScreenArray.itemBagScreen.toolBGTiles = {}
        
    itemBagScreenArray.itemBagScreen.scrollView = widget.newScrollView {
        top = 0,
        left = 0,
        verticalScrollDisabled = true,
        height = scrollHeight,
        width = scrollWidth,
        scrollWidth = display.contentWidth,
        scrollHeight = scrollHeight,
        hideBackground = true,
        hideScrollBar = true
    }

    --scrollView:setReferencePoint(display.TopLeftReferencePoint);
    itemBagScreenArray.itemBagScreen.scrollView.alpha = 1
    itemBagScreenArray.itemBagScreen.scrollView.anchorX = 0
    itemBagScreenArray.itemBagScreen.scrollView.anchorY = 0
    if screenViewName ~= "mysteryBlockBag" then
        itemBagScreenArray.itemBagScreen.scrollView.x = itemBagScreenArray.itemBagScreen.ItemBagScreenX + xVal
        itemBagScreenArray.itemBagScreen.scrollView.y = 123
        itemBagScreenArray.itemBagScreen.scrollView.originalY = 117 - display.contentHeight
    elseif screenViewName == "mysteryBlockBag" then
        itemBagScreenArray.itemBagScreen.scrollView.x = xVal
        itemBagScreenArray.itemBagScreen.scrollView.y = yCalc(165)
    end
    itemBagScreenArray.itemBagScreen.scrollView:toFront()

    for a = 1, 4 do
        itemBagScreenArray.itemBagScreen.toolBGTiles[a] = display.newImageRect("images/central-images/Layout/itemBagScreen-itemSquare.png", 66, 60)
        itemBagScreenArray.itemBagScreen.toolBGTiles[a].x = bgStartXVal + ( (a-1) * tileIncrement)
        itemBagScreenArray.itemBagScreen.toolBGTiles[a].y = bgStartYVal
        if screenViewName == "mysteryBlockBag" then
            itemBagScreenArray.itemBagScreen.toolBGTiles[a].xScale = 0.75
            itemBagScreenArray.itemBagScreen.toolBGTiles[a].yScale = 0.75
        end
        settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.toolBGTiles[a])
        itemBagScreenArray.itemBagScreen.scrollView:insert(itemBagScreenArray.itemBagScreen.toolBGTiles[a])
    end

    local showingToolsArrayCounter = 0

    for a = 1, #itemArray do
        if (itemArray[a]["name"] == screenName)
        and (itemArray[a]["quantity"] > 0) then
            showingToolsArrayCounter = showingToolsArrayCounter + 1

            if showingToolsArrayCounter > 4 then
                -- create another bg tiles
            end

            itemArray[a]["showingToolsArrayCounter"] = showingToolsArrayCounter
            if thisIsShapeScreen then
                settingsArray.showingObjectsArray[showingToolsArrayCounter] = mainArray.globalImageCreateFunctions.createItemDetailedIcon(true, screenName, "itemBagScreen", itemArray, a, showingArray, showingToolsArrayCounter) 
                showingArray = settingsArray.showingObjectsArray
            else
                settingsArray.showingToolsArray[showingToolsArrayCounter] = mainArray.globalImageCreateFunctions.createItemDetailedIcon(false, screenName, "itemBagScreen", itemArray, a, showingArray, showingToolsArrayCounter) 
                showingArray = settingsArray.showingToolsArray
            end

            local tool = showingArray[showingToolsArrayCounter]
            if screenViewName == "mysteryBlockBag" then
                tool.xScale = 0.75
                tool.yScale = 0.75
            end
            settingsArray.itemScreenObjectsGroup:insert(tool)
            showingArray[showingToolsArrayCounter]:toFront()
            itemBagScreenArray.itemBagScreen.scrollView:insert(tool)

            if tool.displayObjects["text"] then
                for a = 1, #tool.displayObjects["text"] do
                    settingsArray.itemScreenObjectsGroup:insert(tool.displayObjects["text"][a])
                    tool.displayObjects["text"][a]:toFront()
                    itemBagScreenArray.itemBagScreen.scrollView:insert(tool.displayObjects["text"][a])
                end
            end

            if tool.displayObjects["directionLabel"] then
                for a = 1, #tool.displayObjects["directionLabel"] do
                    settingsArray.itemScreenObjectsGroup:insert(tool.displayObjects["directionLabel"][a])
                    tool.displayObjects["directionLabel"][a]:toFront()
                    itemBagScreenArray.itemBagScreen.scrollView:insert(tool.displayObjects["directionLabel"][a])
                end
            end

            settingsArray.itemScreenObjectsGroup:insert(tool.displayObjects["counterNumber"])
            itemBagScreenArray.itemBagScreen.scrollView:insert(tool.displayObjects["counterNumber"])
            tool.displayObjects["counterNumber"]:toFront()

            local newXVal = xVal
            local yValToUse = 31
            if screenViewName == "mysteryBlockBag" then
                newXVal = xVal - 25
                yValToUse = 43
            end

            mainArray.globalImageCreateFunctions.positionItemDetailedIcon(tool, bgStartXVal, bgStartYVal, thisIsShapeScreen, screenName, "itemBagScreen", itemArray, a, showingArray, showingToolsArrayCounter) 
            
            tool.isShowingInItemScreen = true

            if tool.isApplied == true then
                tool.alpha = 0.5
            end

            if screenViewName == "mysteryBlockBag" then
                tool.alpha = 0.5
                tool.objectArrayIndex = a

                local function activateThisShape (index)
                    tool.alpha = 1
                    tool.allowedShapesIndex = index
                    tool:addEventListener("tap", mainListener)
                end

                local shapeShouldBeActive = false
                local relShapeIndex
                for b = 1, #mainArray.mysteryBagScreen.allowedShapesArray do
                    if mainArray.mysteryBagScreen.allowedShapesArray[b]["name"] == screenName then
                        if screenName == "triangle" and screenName == "bar" then
                            if itemArray[a]["properties"]["shape"] == mainArray.mysteryBagScreen.allowedShapesArray[b]["properties"]["shape"] then
                                shapeShouldBeActive = true
                                relShapeIndex = b
                            end
                        elseif screenName == "autoFan" or screenName == "manualFan" then
                            if itemArray[a]["properties"]["directions"][1] == mainArray.mysteryBagScreen.allowedShapesArray[b]["properties"]["directions"][1] then
                                shapeShouldBeActive = true
                                relShapeIndex = b
                            end
                        elseif screenName == "spitter" then
                            if #itemArray[a]["properties"]["directions"] ~= #mainArray.mysteryBagScreen.allowedShapesArray[b]["properties"]["directions"] then
                                shapeShouldBeActive = false
                            else
                                shapeShouldBeActive = true
                                for c = 1, #itemArray[a]["properties"]["directions"] do
                                    if itemArray[a]["properties"]["directions"][c] ~= mainArray.mysteryBagScreen.allowedShapesArray[b]["properties"]["directions"][c] then
                                        shapeShouldBeActive = false
                                    end
                                end
                                relShapeIndex = b
                            end
                        else
                            shapeShouldBeActive = true
                            relShapeIndex = b
                        end
                    end
                end
                if shapeShouldBeActive then
                    activateThisShape(relShapeIndex)
                end
            end
            if (screenViewName == "inGame" and itemTypeShowing == "tool") then
                tool:addEventListener("tap", mainListener)
            end

            xVal = xVal + tileIncrement
            bgStartXVal = bgStartYVal + tileIncrement

            if (itemArray[a]["created"] == "not-created") then
                itemArray[a]["created"] = "created"
            end
        end

    end
    settingsArray.itemScreenObjectsGroup:insert(itemBagScreenArray.itemBagScreen.scrollView)
end
    t.createItemBagToolScreenAndScroll = createItemBagToolScreenAndScroll

        -- body

return t