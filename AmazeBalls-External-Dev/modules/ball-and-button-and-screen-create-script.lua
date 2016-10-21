local t = {}
local widget = require("widget")
t.widget = widget

--------- MAIN BALL -----------

local createBall = function (mainFunc)
    local ballCharacter = "normal"
    local sheetSeqData = mainFunc.allLevelSettings.normalCharacterInLevelSequenceData
    if ballCharacter ~= "normal" then
        sheetSeqData = mainFunc.allLevelSettings.specialCharacterInLevelSequenceData
    end
	local instance2 = display.newSprite(mainFunc.allLevelSettings.characterInLevelImageSheet[ballCharacter], sheetSeqData)
    physics.addBody( instance2, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
    mainFunc.allLevelSettings.midScreenObjectsGroup:insert( instance2 )
    instance2.projectileType = "ball"
    instance2.direction = mainFunc.allLevelSettings.direction
    instance2.relevantArrayIndex = 0
    instance2.transitionId = instance2.relevantArrayIndex
    instance2.gravityScale = 0
    -- instance2.xScale = 0.6
    -- instance2.yScale = 0.6
    instance2.x = (((mainFunc.allLevelSettings.ballScreenHorzValue - 1) * display.contentWidth) + ((mainFunc.thisLevelSettings.ballFirstHorzSquare - 1) * mainFunc.allLevelSettings.squareWidth) + (mainFunc.allLevelSettings.gutterWidth) + (mainFunc.allLevelSettings.squareWidth/2) )
    instance2.y = (((mainFunc.allLevelSettings.ballScreenVertValue - 1) * display.contentHeight) + ((mainFunc.thisLevelSettings.ballFirstVertSquare - 1) * mainFunc.allLevelSettings.squareHeight) + (mainFunc.allLevelSettings.gutterHeight) + (mainFunc.allLevelSettings.squareHeight/2))
    instance2.isFixedRotation = true
    instance2.character = ballCharacter
    instance2.autoFanCounter = 0
    instance2.fanCenteringCounter = 0
    instance2.movementSpeed = 100
    instance2.transitioning = false
    instance2:play()
    instance2:toFront()
    instance2:setSequence(instance2.direction)
    instance2.lastFanIndex = nil
    instance2.isCollisioningWith = nil
    instance2.specialConditionsArray = {}

    mainFunc.tm["ball"][instance2.relevantArrayIndex] = mainFunc.tManager.new()

		t.instance2 = instance2
    return instance2
end
	t.createBall = createBall

--------- SCREENS -----------

--- INTRO SCREEN ---
local createIntroScreen = function (currentWorld, currentLevel)
    local introScreen = display.newImageRect("images/level-images/" .. currentWorld .. "/Layout/levelSelectScene.jpg", 480, 320)
        --introScreen:setReferencePoint(display.TopLeftReferencePoint);
        introScreen.width = display.contentWidth
        introScreen.height = display.contentHeight
        introScreen.y = 0.5
        introScreen.x = 0.5
        introScreen.anchorX = 0
        introScreen.anchorY = 0
        introScreen.valueText = {}

        local currentLevelString = tostring(currentLevel)

        local levelButtonNumberImageSheet = graphics.newImageSheet("images/level-images/".. currentWorld .."/Numbers/levelSelectNumber.png", {width = 27, height = 34, numFrames = 10, sheetContentWidth = 270, sheetContentHeight = 34})
        local levelSelectNumberSequenceData = {
            { name = "0", start=1, count=1, loopCount=1 },
            { name = "1", start=2, count=1, loopCount=1 },
            { name = "2", start=3, count=1, loopCount=1 },
            { name = "3", start=4, count=1, loopCount=1 },
            { name = "4", start=5, count=1, loopCount=1 },
            { name = "5", start=6, count=1, loopCount=1 },
            { name = "6", start=7, count=1, loopCount=1 },
            { name = "7", start=8, count=1, loopCount=1 },
            { name = "8", start=9, count=1, loopCount=1 },
            { name = "9", start=10, count=1, loopCount=1 }
        }

        local lastA = 1
        for a = 1, #currentLevelString do
            introScreen.valueText[a] = display.newSprite(levelButtonNumberImageSheet, levelSelectNumberSequenceData)
            introScreen.valueText[a]:setSequence(string.sub(currentLevelString, a, a))
            --introScreen:setReferencePoint(display.CenterReferencePoint);

            introScreen.valueText[a].anchorX = 0.5
            introScreen.valueText[a].anchorY = 0.5
            if (currentLevel < 10) then
                introScreen.valueText[a].x = display.contentWidth/2
            elseif (currentLevel > 9) then
                if (a == 1) then
                    introScreen.valueText[a].x = display.contentWidth/2 - 22
                else
                    introScreen.valueText[a].x = display.contentWidth/2 + 22
                end
            end
            introScreen.valueText[a].y = 220
            introScreen:toFront()
            introScreen.valueText[a]:toFront()

            lastA = a
        end

        local levelSelectTitleImageSheet = graphics.newImageSheet( "images/level-images/worldTitleSprite.png", {width = 300, height = 39, numFrames = 5, sheetContentWidth = 300, sheetContentHeight = 195})
        local levelSelectTitleSequenceData = {
            { name = "WoodyWalk", start=1, count=1,   loopCount=1 },
            { name = "FieryFortress", start=2, count=1, loopCount=1 },
            { name = "HyrollCastle", start=3, count=1, loopCount=1 },
            { name = "IcyIsland", start=4, count=1, loopCount=1 },
            { name = "BallTimore", start=5, count=1, loopCount=1 }
        }

        local levelSelectLevelTextImageSheet = graphics.newImageSheet( "images/level-images/introScreen-levelSprite.png", {width = 140, height = 39, numFrames = 5, sheetContentWidth = 140, sheetContentHeight = 195})
        local levelSelectLevelTextSequenceData = {
            { name = "WoodyWalk", start=1, count=1,   loopCount=1 },
            { name = "FieryFortress", start=2, count=1, loopCount=1 },
            { name = "HyrollCastle", start=3, count=1, loopCount=1 },
            { name = "IcyIsland", start=4, count=1, loopCount=1 },
            { name = "BallTimore", start=5, count=1, loopCount=1 }
        }

        introScreen.valueText[lastA + 1] = display.newSprite(levelSelectTitleImageSheet, levelSelectTitleSequenceData)
        introScreen.valueText[lastA + 1]:setSequence(currentWorld)
        introScreen.valueText[lastA + 1].anchorX = 0.5
        introScreen.valueText[lastA + 1].anchorY = 1
        introScreen.valueText[lastA + 1].x = display.contentWidth / 2
        introScreen.valueText[lastA + 1].y = (120/320) * display.contentHeight

        introScreen.valueText[lastA + 2] = display.newSprite(levelSelectLevelTextImageSheet, levelSelectLevelTextSequenceData)
        introScreen.valueText[lastA + 2]:setSequence(currentWorld)
        introScreen.valueText[lastA + 2].anchorX = 0.5
        introScreen.valueText[lastA + 2].anchorY = 1
        introScreen.valueText[lastA + 2].x = display.contentWidth / 2
        introScreen.valueText[lastA + 2].y = (180/320) * display.contentHeight  

        	t.introScreen = introScreen
        return introScreen
end
    t.createIntroScreen = createIntroScreen

	---- SCREENS AFTER INITIALISATION  ----------

local otherScreensAndButtonCreate = function (mainFunc, levelVariables, shapeArrayParameters)
    --- PAUSE SCREEN ---
    local pauseScreenOverlay = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    pauseScreenOverlay:setFillColor(0,0,0)
    --pauseScreen:setReferencePoint(display.TopLeftReferencePoint);
        pauseScreenOverlay.anchorX = 0.5
        pauseScreenOverlay.anchorY = 0.5
    pauseScreenOverlay.y = display.contentHeight/2
    pauseScreenOverlay.x = display.contentWidth/2
    pauseScreenOverlay.alpha = 0
        t.pauseScreenOverlay = pauseScreenOverlay

    local pauseScreen = display.newImageRect("images/central-images/Layout/pauseScreen.jpg", display.contentWidth, display.contentHeight)
    --pauseScreen:setReferencePoint(display.TopLeftReferencePoint);
        pauseScreen.anchorX = 0.5
        pauseScreen.anchorY = 0
    pauseScreen.y = display.contentHeight
    pauseScreen.x = display.contentWidth / 2
    pauseScreen.state = "unpaused"
    	t.pauseScreen = pauseScreen

    --- MAP SCREEN ---
    local mapScreen = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    mapScreen:setFillColor(0, 0, 0)
    --mapScreen:setReferencePoint(display.TopLeftReferencePoint);
        mapScreen.anchorX = 0
        mapScreen.anchorY = 0
    mapScreen.y = 0
    mapScreen.x = 0
    mapScreen.alpha = 0
    mapScreen.state = "mapHidden"
    	t.mapScreen = mapScreen

    local itemBagScreen = display.newImageRect("images/central-images/Layout/itemBagScreen.png", 480, 320)
    itemBagScreen:setFillColor(255, 255, 255)
    --itemBagScreen:setReferencePoint(display.TopLeftReferencePoint);
        itemBagScreen.anchorX = 0.5
        itemBagScreen.anchorY = 0.5
    itemBagScreen.y = contentCentreY - display.contentHeight
    itemBagScreen.originalY = contentCentreY - display.contentHeight
    itemBagScreen.x = contentCentreX
    itemBagScreen.state = "hidden"
    itemBagScreen.ItemBagScreenX = contentCentreX - (480/2)

    itemBagScreen.itemBagScreenOverlay = display.newRect(contentCentreX, contentCentreY, display.contentWidth, display.contentHeight)
        itemBagScreen.itemBagScreenOverlay:setFillColor(255, 255, 255)
        itemBagScreen.itemBagScreenOverlay.anchorX = 0.5
        itemBagScreen.itemBagScreenOverlay.anchorY = 0.5
        itemBagScreen.itemBagScreenOverlay.state = "hidden"
        itemBagScreen.itemBagScreenOverlay.alpha = 0

    local ItemBagScreenX = itemBagScreen.ItemBagScreenX

    itemBagScreen.toolBg = display.newImageRect("images/central-images/Layout/itemBagScreen-ToolsBg.png", 310, 220)
    itemBagScreen.toolBg.anchorX = 0
    itemBagScreen.toolBg.anchorY = 0
    itemBagScreen.toolBg.y = yCalc(69) - display.contentHeight
    itemBagScreen.toolBg.originalY = yCalc(69) - display.contentHeight
    itemBagScreen.toolBg.x = ItemBagScreenX + 26
    itemBagScreen.toolBg.alpha = 0

    itemBagScreen.shapeBg = display.newImageRect("images/central-images/Layout/itemBagScreen-ShapesBg.png", 310, 220)
    itemBagScreen.shapeBg.anchorX = 0
    itemBagScreen.shapeBg.anchorY = 0
    itemBagScreen.shapeBg.y = 69 - display.contentHeight
    itemBagScreen.shapeBg.originalY = 69 - display.contentHeight
    itemBagScreen.shapeBg.x = ItemBagScreenX + 26
    itemBagScreen.shapeBg.alpha = 0

    itemBagScreen.bottomSelectedTile = display.newImageRect("images/central-images/Layout/itemBagScreen-bottomSelectedTile.png", 55, 48)
    itemBagScreen.bottomSelectedTile.anchorX = 0
    itemBagScreen.bottomSelectedTile.anchorY = 0
    itemBagScreen.bottomSelectedTile.y = 240 - display.contentHeight
    itemBagScreen.bottomSelectedTile.originalY = 240 - display.contentHeight
    itemBagScreen.bottomSelectedTile.x = ItemBagScreenX + 30
    itemBagScreen.bottomSelectedTile.originalX = itemBagScreen.bottomSelectedTile.x

    itemBagScreen.bottomSelectedTileForShape = display.newImageRect("images/central-images/Layout/itemBagScreen-bottomSelectedTileShape.png", 140, 48)
    itemBagScreen.bottomSelectedTileForShape.anchorX = 0
    itemBagScreen.bottomSelectedTileForShape.anchorY = 0
    itemBagScreen.bottomSelectedTileForShape.y = 240 - display.contentHeight
    itemBagScreen.bottomSelectedTileForShape.originalY = 240 - display.contentHeight
    itemBagScreen.bottomSelectedTileForShape.x = ItemBagScreenX + 30
    itemBagScreen.bottomSelectedTileForShape.originalX = itemBagScreen.bottomSelectedTileForShape.x
    itemBagScreen.bottomSelectedTileForShape.alpha = 0

    itemBagScreen.topSelectedTile = display.newImageRect("images/central-images/Layout/itemBagScreen-topSelectedTile.png", 95, 48)
    itemBagScreen.topSelectedTile.anchorX = 0
    itemBagScreen.topSelectedTile.anchorY = 0
    itemBagScreen.topSelectedTile.y = 70 - display.contentHeight
    itemBagScreen.topSelectedTile.originalY = 70 - display.contentHeight
    itemBagScreen.topSelectedTile.x = ItemBagScreenX + 26
    itemBagScreen.topSelectedTile.alpha = 0

    local toggleImageSheet = graphics.newImageSheet("images/central-images/Layout/itemBagScreen-shapeToolToggleButton.png", {width = 77, height = 43, numFrames = 2, sheetContentWidth = 154, sheetContentHeight = 43})
    local toggleSequenceData = {
        { name = "seeShapes", start=1, count=1,   loopCount=1 },
        { name = "seeTools", start=2, count=1, loopCount=1 }
    }
    itemBagScreen.toggleShapeOrToolButton = display.newSprite(toggleImageSheet, toggleSequenceData)
    itemBagScreen.toggleShapeOrToolButton:setSequence("seeShapes")
    itemBagScreen.toggleShapeOrToolButton.anchorX = 0
    itemBagScreen.toggleShapeOrToolButton.anchorY = 0
    itemBagScreen.toggleShapeOrToolButton.y = 11
    itemBagScreen.toggleShapeOrToolButton.x = ItemBagScreenX + 380
    itemBagScreen.toggleShapeOrToolButton.alpha = 0
        t.itemBagScreen = itemBagScreen

    local itemGainedScreen = display.newImageRect("images/central-images/Layout/somethingGainedScreen/itemGainedScreen.png", 480, 320)
    --itemBagScreen:setReferencePoint(display.TopLeftReferencePoint);
    itemGainedScreen.anchorX = 0.5
    itemGainedScreen.anchorY = 0.5
    itemGainedScreen.x = display.contentWidth / 2
    itemGainedScreen.y = display.contentHeight / 2
    itemGainedScreen.alpha = 0
    itemGainedScreen.state = "hidden"
        t.itemGainedScreen = itemGainedScreen

    local levelTimeAmount
    if mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["level_time"] then
        levelTimeAmount = mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["level_time"]
    else
        levelTimeAmount = mainFunc.allLevelSettings.defaultLevelTime
    end

    local levelTimeMinutes = levelTimeAmount/60
    levelTimeMinutes = math.floor(levelTimeMinutes)
    t.levelTimeMinutes = levelTimeMinutes
    local levelTimeSeconds = levelTimeAmount - (60 * levelTimeMinutes)
    t.levelTimeSeconds = levelTimeSeconds
    local levelTimeString = tostring(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds)
    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes > 0 then
        levelTimeString = tostring(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes) .. "m" .. levelTimeString
    end

    --------- LABELS ---------
    local levelTimerLabel = display.newImageRect("images/central-images/Layout/levelTimerDisplay.png", 74, 40)
        --mapShowAndClockLabel:setReferencePoint( display.CenterReferencePoint )
        levelTimerLabel.anchorX = 0
        levelTimerLabel.anchorY = 0
        levelTimerLabel.x = -9
        levelTimerLabel.y = -7
        levelTimerLabel.name = "levelTimerLabel"
        levelTimerLabel.text = display.newText(levelTimeString, 0, 0, nil, 13)
        levelTimerLabel.text.x = levelTimerLabel.x + 39
        levelTimerLabel.text.y = levelTimerLabel.y + 20
        levelTimerLabel.text:setTextColor(150, 30, 120)
        levelTimerLabel.text.alpha = 1
            t.levelTimerLabel = levelTimerLabel
            t.levelTimerLabel.text = levelTimerLabel.text

    local mapShowAndClockLabel = display.newImageRect("images/central-images/Layout/levelTimerDisplay.png", 74, 40)
        --mapShowAndClockLabel:setReferencePoint( display.CenterReferencePoint )
        mapShowAndClockLabel.anchorX = 0
        mapShowAndClockLabel.anchorY = 0
        mapShowAndClockLabel.yScale = -1
        mapShowAndClockLabel.x = -17
        mapShowAndClockLabel.y = display.contentHeight + 7
        mapShowAndClockLabel.name = "mapShowAndClockLabel"
        mapShowAndClockLabel.alpha = 0

    local levelItemsImageSheet = graphics.newImageSheet( mainFunc.allLevelSettings.levelItemsImageSheet, mainFunc.allLevelSettings.levelItemsImageSheetSettings)
    local levelItemsSequenceData = mainFunc.allLevelSettings.levelItemsSequenceData

    mapShowAndClockLabel.map = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
        if currentMedal == "silver" then
            mapShowAndClockLabel.map:setSequence("partialMap")
        else
            mapShowAndClockLabel.map:setSequence("fullMap")
        end
        mapShowAndClockLabel.map.xScale = 0.5
        mapShowAndClockLabel.map.yScale = 0.5
        mapShowAndClockLabel.map.x = mapShowAndClockLabel.x + 35
        mapShowAndClockLabel.map.y = mapShowAndClockLabel.y - 21
        mapShowAndClockLabel.map.alpha = 0

            t.mapShowAndClockLabel = mapShowAndClockLabel
            t.mapShowAndClockLabel.text = mapShowAndClockLabel.text
            t.mapShowAndClockLabel.map = mapShowAndClockLabel.map

    mapShowAndClockLabel.compass = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
        mapShowAndClockLabel.compass:setSequence("fullMap")
        mapShowAndClockLabel.compass.x = mapShowAndClockLabel.x + 52
        mapShowAndClockLabel.compass.y = mapShowAndClockLabel.y - 21
        mapShowAndClockLabel.compass.xScale = 0.5
        mapShowAndClockLabel.compass.yScale = 0.5
        mapShowAndClockLabel.compass.alpha = 0
            t.mapShowAndClockLabel.compass = mapShowAndClockLabel.compass

    local livesLeftScreen = display.newSprite(mainFunc.allLevelSettings.lifeLostScreenBgImageSheet, mainFunc.allLevelSettings.lifeLostScreenBgSequenceData)
        livesLeftScreen:setSequence(myGameSettings["current_max_lives"])
        livesLeftScreen.anchorX = 0.5
        livesLeftScreen.anchorY = 0.5
        livesLeftScreen.width = livesLeftScreen.width * 0.85
        livesLeftScreen.y = display.contentHeight / 2
        livesLeftScreen.x = (display.contentWidth / 2) + ( ( (5 - myGameSettings["current_max_lives"]) * xCalc(88) )/2) 
        livesLeftScreen.alpha = 0
            t.livesLeftScreen = livesLeftScreen

    local lifeIcon = {}
        t.lifeIcon = lifeIcon

    local Xcord = (display.contentWidth/2) - ( ( (myGameSettings["current_max_lives"]) * 82)/2)

    for a = 1, myGameSettings["current_max_lives"] do
        lifeIcon[a] = display.newSprite(mainFunc.allLevelSettings.largeIconsImageSheet, mainFunc.allLevelSettings.largeIconsSequenceData)
            lifeIcon[a].anchorX = 0
            lifeIcon[a].anchorY = 0.5
            lifeIcon[a].x = Xcord + (86 * (a - 1) )
            lifeIcon[a].y = livesLeftScreen.y
            lifeIcon[a]:setSequence("ball")
            lifeIcon[a].xScale = 0.7
            lifeIcon[a].yScale = 0.7
            lifeIcon[a].alpha = 0
    end

    local timesUpNotice = display.newImageRect("images/objects/Layout/timesUpMessage.png", 125, 90)
        timesUpNotice.anchorX = 0.5
        timesUpNotice.anchorY = 0.5
        timesUpNotice.y = display.contentHeight / 2
        timesUpNotice.x = (display.contentWidth / 2)
        timesUpNotice.alpha = 0
            t.timesUpNotice = timesUpNotice


    local showGemsLabel = display.newImage("images/central-images/buttons/coinAndGemLabel.png")
        --showGemsLabel:setReferencePoint(display.BottomLeftReferencePoint);
        showGemsLabel.anchorX = 0
        showGemsLabel.anchorY = 1
        showGemsLabel.y = 0
        showGemsLabel.x = 180
        showGemsLabel.alpha = 0
        showGemsLabel.state = "hidden"
            t.showGemsLabel = showGemsLabel

    local levelItems2ImageSheet = graphics.newImageSheet( mainFunc.allLevelSettings.levelItems2ImageSheet, mainFunc.allLevelSettings.levelItems2ImageSheetSettings)
    local levelItems2SequenceData = mainFunc.allLevelSettings.levelItems2SequenceData

    showGemsLabel.gemIcon = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        showGemsLabel.gemIcon:setSequence("purple")
        --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
        showGemsLabel.gemIcon.anchorX = 0
        showGemsLabel.gemIcon.anchorY = 1
        showGemsLabel.gemIcon.x = showGemsLabel.x - 8
        showGemsLabel.gemIcon.y = showGemsLabel.y - 4
        showGemsLabel.gemIcon.xScale = 0.7
        showGemsLabel.gemIcon.yScale = 0.7
        showGemsLabel.gemIcon.alpha = 0
        showGemsLabel.gemIcon:toFront()

    local gemCounterFirstDigit = display.newImage("images/objects/imageNumber1.png")
        --gemCounterFirstDigit:setReferencePoint(display.BottomLeftReferencePoint);
        gemCounterFirstDigit.anchorX = 0
        gemCounterFirstDigit.anchorY = 1
        gemCounterFirstDigit.x = showGemsLabel.x + 30
        gemCounterFirstDigit.y = showGemsLabel.y - 4
        gemCounterFirstDigit.xScale = 0.5
        gemCounterFirstDigit.yScale = 0.5
        gemCounterFirstDigit.alpha = 0
            t.gemCounterFirstDigit = gemCounterFirstDigit

    local gemCounterSecondDigit = display.newImage("images/objects/imageNumber1.png")
        --gemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
        gemCounterSecondDigit.anchorX = 0
        gemCounterSecondDigit.anchorY = 1
        gemCounterSecondDigit.x = showGemsLabel.x + 40
        gemCounterSecondDigit.y = showGemsLabel.y - 4
        gemCounterSecondDigit.xScale = 0.5
        gemCounterSecondDigit.yScale = 0.5
        gemCounterSecondDigit.alpha = 0
            t.gemCounterSecondDigit = gemCounterSecondDigit

    local showCoinsLabel = display.newImage("images/central-images/buttons/coinAndGemLabel.png")
        --showCoinsLabel:setReferencePoint(display.BottomLeftReferencePoint);
        showCoinsLabel.anchorX = 0
        showCoinsLabel.anchorY = 1
        showCoinsLabel.y = 0
        showCoinsLabel.x = 250
        showCoinsLabel.alpha = 0
        showCoinsLabel.state = "hidden"
            t.showCoinsLabel = showCoinsLabel

    local coinIcons = {}

        coinIcons["redCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        coinIcons["redCoin"]:setSequence("red")
        --coinIcons["redCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
        coinIcons["redCoin"].anchorX = 0
        coinIcons["redCoin"].anchorY = 1
        coinIcons["redCoin"].x = showCoinsLabel.x + 3
        coinIcons["redCoin"].y = showCoinsLabel.y + 1
        coinIcons["redCoin"].xScale = 0.4
        coinIcons["redCoin"].yScale = 0.4
        coinIcons["redCoin"].alpha = 0
        coinIcons["redCoin"].state = "notYetShown"

        coinIcons["blueCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        coinIcons["blueCoin"]:setSequence("blueCoin")
        --coinIcons["blueCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
        coinIcons["blueCoin"].anchorX = 0
        coinIcons["blueCoin"].anchorY = 1
        coinIcons["blueCoin"].x = showCoinsLabel.x + 19
        coinIcons["blueCoin"].y = showCoinsLabel.y + 1
        coinIcons["blueCoin"].xScale = 0.4
        coinIcons["blueCoin"].yScale = 0.4
        coinIcons["blueCoin"].alpha = 0
        coinIcons["blueCoin"].state = "notYetShown"

        coinIcons["purpleCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        coinIcons["purpleCoin"]:setSequence("purpleCoin")
        --coinIcons["purpleCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
        coinIcons["purpleCoin"].anchorX = 0
        coinIcons["purpleCoin"].anchorY = 1
        coinIcons["purpleCoin"].x = showCoinsLabel.x + 34
        coinIcons["purpleCoin"].y = showCoinsLabel.y + 1
        coinIcons["purpleCoin"].xScale = 0.4
        coinIcons["purpleCoin"].yScale = 0.4
        coinIcons["purpleCoin"].alpha = 0
        coinIcons["purpleCoin"].state = "notYetShown"

        t.coinIcons = coinIcons

    --------- BUTTONS -----------

    -- ACTUALLY THE GO BUTTON
    local backBtnImageSheet = graphics.newImageSheet( "images/central-images/buttons/ballActivateButton.png", {width = 81, height = 54, numFrames = 3, sheetContentWidth = 243, sheetContentHeight = 54})
    local backBtnSequenceData = {
        { name = "go", frames={2,2,2,3,3,3,3,3,2}, count = 4, time = 1450 },
        { name = "default", start=2, count=1,   loopCount=1 },
        { name = "over", start=2, count=1,   loopCount=1 }
    }
    local backBtn = display.newSprite(backBtnImageSheet, backBtnSequenceData)
    	--backBtn:setReferencePoint( display.CenterReferencePoint )
        backBtn.anchorX = 0.5
        backBtn.anchorY = 0.5
    	backBtn.x = display.contentWidth / 2
    	backBtn.y = display.contentHeight / 2
    	backBtn.name = "play"
    	backBtn:setSequence("go")
        backBtn:play()
    	backBtn.alpha = 0
    		t.backBtn = backBtn

    -- local itemBtnImageSheet = graphics.newImageSheet( "images/buttons/itemBtn.png", {width = 28, height = 45, numFrames = 1})
    -- local itemBtnSequenceData = {
    --     { name = "go", start=1, count=1,   loopCount=1 },
    --     { name = "default", start=2, count=2,   loopCount=1 },
    --     { name = "over", start=3, count=3, loopCount=1 }
    -- }
    local itemBtn = display.newImageRect("images/central-images/buttons/itemBtn.png", 30, 47)
        --itemBtn:setReferencePoint( display.CenterReferencePoint )
        itemBtn.anchorX = 0.5
        itemBtn.anchorY = 0.5
        itemBtn.x = 25
        itemBtn.y = display.contentHeight - 80
        itemBtn.name = "item"       
        itemBtn.relevantShapeArrayCounterForItem = nil
        itemBtn.img = nil
        itemBtn.isActive = false
        itemBtn.canHookshot = true
            t.itemBtn = itemBtn

    -- local itemBagBtnImageSheet = graphics.newImageSheet( , {width = 45, height = 28, numFrames = 1})
    -- local itemBagBtnSequenceData = {
    --     { name = "go", start=1, count=1,   loopCount=1 },
    --     { name = "default", start=2, count=2,   loopCount=1 },
    --     { name = "over", start=3, count=3, loopCount=1 }   -- }
        
    local itemBagBtnImageSheet = graphics.newImageSheet( "images/central-images/buttons/itemBagBtn.png", {width = 46, height = 30, numFrames = 2, sheetContentWidth = 92, sheetContentHeight = 30})
    local itemBagBtnSequenceData = {
        { name = "open", start=1, count=1,   loopCount=1 },
        { name = "close", start=2, count=1, loopCount=1 }
    }
    itemBagBtn = display.newSprite(itemBagBtnImageSheet, itemBagBtnSequenceData)
    --itemBagBtn:setReferencePoint( display.CenterReferencePoint )
        itemBagBtn.anchorX = 0.5
        itemBagBtn.anchorY = 0.5
    itemBagBtn.x = 90
    itemBagBtn.y = display.contentHeight - 25
    itemBagBtn.name = "itemBag"
    itemBagBtn:setSequence("default")
    itemBagBtn:play()
        t.itemBagBtn = itemBagBtn

    if mainFunc.thisLevelSettings.itemBagButtonsVisible then
        itemBagBtn.alpha = 1
        itemBtn.alpha = 1
    else
        itemBtn.alpha = 0
        itemBagBtn.alpha = 0
    end
    
    -- ACTUALLY MAP BUTTON
    local playBtnImageSheet = graphics.newImageSheet( "images/central-images/buttons/mapButton.png", {width = 61, height = 40, numFrames = 2, sheetContentWidth = 122, sheetContentHeight = 40})
    local playBtnSequenceData = {
        { name = "over", start=1, count=1,   loopCount=1 },
        { name = "default", start=2, count=1, loopCount=1 }
    }             
    local playBtn =
        display.newSprite(playBtnImageSheet, playBtnSequenceData)
        --playBtn:setReferencePoint( display.CenterReferencePoint )
        playBtn.anchorX = 0.5
        playBtn.anchorY = 0.5
        playBtn.x = display.contentWidth - yCalc(28)
        playBtn.y = display.contentHeight - 15
        playBtn.alpha = 0
        playBtn.name = "map"
        playBtn:play()
        playBtn:setSequence("default")
        	t.playBtn = playBtn

        --- MAP BUTTONS ---

    local rightBtn =
        widget.newButton{
            defaultFile="images/central-images/buttons/mapArrow2.png",
            width=25, height=30	-- event listener function
        }
        --rightBtn:setReferencePoint( display.CenterReferencePoint )
        rightBtn.anchorX = 0.5
        rightBtn.anchorY = 0.5
        rightBtn.x = display.contentWidth - (rightBtn.contentWidth - 5)
        rightBtn.y = display.contentHeight/2
        rightBtn.alpha = 0
        rightBtn.name = "mapRightButton"
        	t.rightBtn = rightBtn
        
    local leftBtn =
        widget.newButton{
            labelColor = { default={255}},
            defaultFile="images/central-images/buttons/mapArrow2.png",
            width=25, height=30	-- event listener function
        }
        --leftBtn:setReferencePoint( display.CenterReferencePoint )
        leftBtn.anchorX = 0.5
        leftBtn.anchorY = 0.5
        leftBtn.x = leftBtn.contentWidth - 5
        leftBtn.y = display.contentHeight/2
        leftBtn.alpha = 0
        leftBtn.name = "mapLeftButton"
        leftBtn.rotation = 180
        	t.leftBtn = leftBtn
        
    local upBtn =
        widget.newButton{
            defaultFile="images/central-images/buttons/mapArrow2.png",
            width=25, height=30	-- event listener function
        }
        --upBtn:setReferencePoint( display.CenterReferencePoint )
        upBtn.anchorX = 0.5
        upBtn.anchorY = 0.5
        upBtn.x = display.contentWidth  / 2
        upBtn.y = yCalc(20)
        upBtn.alpha = 0
        upBtn.name = "mapUpButton"
        upBtn.rotation = -90
        	t.upBtn = upBtn
        
    local downBtn =
        widget.newButton{
            defaultFile="images/central-images/buttons/mapArrow2.png",
            width=25, height=30	-- event listener function
        }
        --downBtn:setReferencePoint( display.CenterReferencePoint )
        downBtn.anchorX = 0.5
        downBtn.anchorY = 0.5
        downBtn.x = display.contentWidth  / 2
        downBtn.y = display.contentHeight - yCalc(20)
        downBtn.alpha = 0
        downBtn.name = "mapDownButton"
        downBtn.rotation = 90
        	t.downBtn = downBtn

       	--- PAUSE-SCREEN BUTTONS ---

    local randomBtn =
        widget.newButton{
            labelColor = { default={255}, over={128} },
            defaultFile="images/central-images/buttons/pauseButton.png",
            over="images/central-images/buttons/pauseButton-over.png",
            width=52, height=47,
            onRelease = listener	-- event listener function
        }
        --randomBtn:setReferencePoint( display.CenterReferencePoint )
        randomBtn.anchorX = 0.5
        randomBtn.anchorY = 0.5
        randomBtn.x = display.contentWidth - 26
        randomBtn.y = 23.5
        randomBtn.alpha = 0
        randomBtn.name = "random"
        	t.randomBtn = randomBtn

    local backToPlayOptions = 
    {
        width = 64,
        height = 60,
        numFrames = 1,
        sheetContentWidth = 64,  --width of original 1x size of entire sheet
        sheetContentHeight = 60  --height of original 1x size of entire sheet
    }

    local backToPlaySheet = graphics.newImageSheet( "images/central-images/buttons/backToPlay.png", backToPlayOptions )
                
    local backToPlayBtn =
        widget.newButton{
            width = ((64/480) * display.contentWidth),
            height = 60,
            sheet= backToPlaySheet,
            defaultFrame = 1 -- event listener function
        }
        --backToPlayBtn:setReferencePoint( display.CenterReferencePoint )
        backToPlayBtn.anchorX = 0
        backToPlayBtn.anchorY = 0.5
        backToPlayBtn.width = xCalc(64)
        backToPlayBtn.height = 60
        backToPlayBtn.x = xCalc(314)
        backToPlayBtn.y = pauseScreen.y + 96
        backToPlayBtn.yValue = yCalc(96)
        backToPlayBtn.name = "backToPlay"
        	t.backToPlayBtn = backToPlayBtn


    local backToMainOptions = 
    {
        width = 132,
        height = 60,
        numFrames = 1,
        sheetContentWidth = 132,  --width of original 1x size of entire sheet
        sheetContentHeight = 60  --height of original 1x size of entire sheet
    }

    local backToMainSheet = graphics.newImageSheet( "images/central-images/buttons/backToHome.png", backToMainOptions )
        
    local backToMainBtn =
        widget.newButton{
            width = ((132/480) * display.contentWidth),
            height = 60,
            sheet= backToMainSheet,
            defaultFrame = 1    -- event listener function
        }
        --backToMainBtn:setReferencePoint( display.CenterReferencePoint )
        backToMainBtn.anchorX = 0
        backToMainBtn.anchorY = 0.5
        backToMainBtn.width = xCalc(132)
        backToMainBtn.height = 60
        backToMainBtn.x = xCalc(314)
        backToMainBtn.y = pauseScreen.y + yCalc(151)
        backToMainBtn.yValue = yCalc(151)
        backToMainBtn.name = "backToMain"
            t.backToMainBtn = backToMainBtn
    
    local resetSheet = graphics.newImageSheet( "images/central-images/buttons/reset.png", backToPlayOptions )
            
    local resetBtn =
        widget.newButton{
            width = ((64/480) * display.contentWidth),
            height = 60,
            sheet= resetSheet,
            defaultFrame = 1
        }
        --resetBtn:setReferencePoint( display.CenterReferencePoint )
        resetBtn.anchorX = 1
        resetBtn.anchorY = 0.5
        resetBtn.width = xCalc(64)
        resetBtn.height = 60
        resetBtn.x = xCalc(132) + backToMainBtn.x
        resetBtn.y = pauseScreen.y + 96
        resetBtn.yValue = yCalc(96)
        resetBtn.name = "reset"
        	t.resetBtn = resetBtn

    levelConfigScript = require("modules.level-config-array")
    levelConfigArray = levelConfigScript.levelConfigArray

    local smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
    local smallIconsSequenceData = {
        { name = "lives", start=1, count=1,   loopCount=1 },
        { name = "gems", start=2, count=1, loopCount=1 },
        { name = "coins", start=3, count=1, loopCount=1 },
        { name = "silverMedal", start=4, count=1, loopCount=1 },
        { name = "goldMedal", start=5, count=1, loopCount=1 },
        { name = "plusButton-inactive", start=6, count=1, loopCount=1 },
        { name = "plusButton-active", start=7, count=1, loopCount=1 },
        { name = "question-mark", start=8, count=1, loopCount=1 }
    }

    local WorldStatusBarNumbersImageSheet = graphics.newImageSheet( "images/level-images/" .. currentWorld .. "/Numbers/worldStatusBarNumbers.png", {width = 13, height = 14, numFrames = 11})
    local WorldStatusBarNumbersSequenceData = {
        { name = "1", start=1, count=1,   loopCount=1 },
        { name = "2", start=2, count=1, loopCount=1 },
        { name = "3", start=3, count=1, loopCount=1 },
        { name = "4", start=4, count=1, loopCount=1 },
        { name = "5", start=5, count=1, loopCount=1 },
        { name = "6", start=6, count=1, loopCount=1 },
        { name = "7", start=7, count=1, loopCount=1 },
        { name = "8", start=8, count=1, loopCount=1 },
        { name = "9", start=9, count=1, loopCount=1 },
        { name = "0", start=10, count=1, loopCount=1 },
        { name = ",", start=11, count=1, loopCount=1 }
    }

    local MainBarNumbersImageSheet = graphics.newImageSheet( "images/central-images/Numbers/MainLivesAndCoinBar-numbers.png", {width = 13, height = 14, numFrames = 15, sheetContentWidth = 195, sheetContentHeight = 14})
    local MainBarNumbersSequenceData = {
        { name = "1", start=1, count=1,   loopCount=1 },
        { name = "2", start=2, count=1, loopCount=1 },
        { name = "3", start=3, count=1, loopCount=1 },
        { name = "4", start=4, count=1, loopCount=1 },
        { name = "5", start=5, count=1, loopCount=1 },
        { name = "6", start=6, count=1, loopCount=1 },
        { name = "7", start=7, count=1, loopCount=1 },
        { name = "8", start=8, count=1, loopCount=1 },
        { name = "9", start=9, count=1, loopCount=1 },
        { name = "0", start=10, count=1, loopCount=1 },
        { name = ",", start=11, count=1, loopCount=1 },
        { name = ".", start=12, count=1, loopCount=1 },
        { name = "-", start=13, count=1, loopCount=1 },
        { name = "/", start=14, count=1, loopCount=1 },
        { name = "m", start=15, count=1, loopCount=1 }
    }

    local lives = tostring(myGameSettings["total_lives"])
    local totalLivesAllowed = tostring(myGameSettings["current_max_lives"])
    

    -- local livesCounter = {}

    -- for a = 1, #lives do

    --     livesCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
    --     livesCounter[a]:setSequence(string.sub(lives, #lives - (a - 1), #lives - (a - 1) ))
    --     livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
    --     livesCounter[a].y = dollarIcon.y - 7

    --     if (a == 1) then
    --         livesCounter[a].x = livesPlusSign.x - 10
    --     else
    --         livesCounter[a].x = livesCounter[a - 1].x - 10
    --     end

    -- end

    local dollarIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        dollarIcon:setSequence("coins")
        --dollarIcon:setReferencePoint( display.CenterReferencePoint )
        dollarIcon.anchorX = 0.5
        dollarIcon.anchorY = 0.5
        dollarIcon.x = pauseScreen.x + xCalc(99)
        dollarIcon.y = pauseScreen.y + yCalc(208)
        dollarIcon.yValue = yCalc(208)
        dollarIcon.name = "dollarIcon"
            t.dollarIcon = dollarIcon

    local coinPlusButton = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        if (999999 - myGameSettings["total_coins"]) > 10000 then
            coinPlusButton:setSequence("plusButton-active")
            coinPlusButton.shouldBeActive = true
        else
            coinPlusButton:setSequence("plusButton-inactive")
            coinPlusButton.shouldBeActive = false
        end
        coinPlusButton.anchorX = 0.5
        coinPlusButton.anchorY = 0.5
        coinPlusButton.x = pauseScreen.x + ((184/480) * display.contentWidth)
        coinPlusButton.y = pauseScreen.y + yCalc(208)
        coinPlusButton.yValue = yCalc(208)
        coinPlusButton.name = "coinPlusButton"
        coinPlusButton.value = "Coins"
        coinPlusButton.relBool = levelVariables.CoinsOpened
            t.coinPlusButton = coinPlusButton

    if mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter
    and mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter ~= nil then
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter do
            mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter[a] = nil
        end
    end

    mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter = {}

    local dollarCounter = mainFunc.globalFunctions.createCoinDisplay(mainFunc, dollarIcon.x - 16, dollarIcon.y + 15, pauseScreen.y, "inGame")

    t.dollarCounter = dollarCounter

    local livesIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        livesIcon:setSequence("lives")
        --livesIcon:setReferencePoint( display.CenterReferencePoint )
        livesIcon.anchorX = 0.5
        livesIcon.anchorY = 0.5
        livesIcon.x = pauseScreen.x + ((98/480) * display.contentWidth)
        livesIcon.y = pauseScreen.y + yCalc(243)
        livesIcon.yValue = yCalc(243)
        livesIcon.name = "livesIcon"
            t.livesIcon = livesIcon

    local livesPlusButton = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        if (myGameSettings["total_lives"] < myGameSettings["current_max_lives"])
        or (myGameSettings["current_max_lives"] < myGameSettings["total_max_lives"]) then
            livesPlusButton:setSequence("plusButton-active")
            livesPlusButton.shouldBeActive = true
        else
            livesPlusButton:setSequence("plusButton-inactive")
            livesPlusButton.shouldBeActive = false
        end
        livesPlusButton.anchorX = 0.5
        livesPlusButton.anchorY = 0.5
        livesPlusButton.x = pauseScreen.x + ((159/480) * display.contentWidth)
        livesPlusButton.y = pauseScreen.y + yCalc(243)
        livesPlusButton.yValue = yCalc(243)
        livesPlusButton.name = "livesPlusButton"
        livesPlusButton.value = "Lives"
        livesPlusButton.relBool = levelVariables.LivesOpened
            t.livesPlusButton = livesPlusButton

    local livesCounter = {}

    livesCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        livesCounter[1]:setSequence(tostring(lives))
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        livesCounter[1].anchorX = 0
        livesCounter[1].anchorY = 0
        livesCounter[1].y = pauseScreen.y + livesIcon.y - yCalc(6)
        livesCounter[1].yValue = livesIcon.yValue - yCalc(6)
        livesCounter[1].x = livesIcon.x + xCalc(21)

    livesCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        livesCounter[2]:setSequence("/")
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        livesCounter[2].anchorX = 0
        livesCounter[2].anchorY = 0
        livesCounter[2].y = pauseScreen.y + livesIcon.y - yCalc(5)
        livesCounter[2].yValue = livesIcon.yValue - yCalc(5)
        livesCounter[2].x = livesIcon.x + xCalc(31)

    livesCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        livesCounter[3]:setSequence(tostring(totalLivesAllowed))
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        livesCounter[3].anchorX = 0
        livesCounter[3].anchorY = 0
        livesCounter[3].y = pauseScreen.y + livesIcon.y - yCalc(6)
        livesCounter[3].yValue = livesIcon.yValue - yCalc(6)
        livesCounter[3].x = livesIcon.x + xCalc(39)

    t.livesCounter = livesCounter

    ----

    local levelDisplay = {}

    local currentLevelString = tostring(currentLevel)

    local levelButtonNumberImageSheet = graphics.newImageSheet("images/level-images/".. currentWorld .."/Numbers/levelSelectNumber.png", {width = 27, height = 34, numFrames = 10, sheetContentWidth = 270, sheetContentHeight = 34})
    local levelSelectNumberSequenceData = {
        { name = "0", start=1, count=1, loopCount=1 },
        { name = "1", start=2, count=1, loopCount=1 },
        { name = "2", start=3, count=1, loopCount=1 },
        { name = "3", start=4, count=1, loopCount=1 },
        { name = "4", start=5, count=1, loopCount=1 },
        { name = "5", start=6, count=1, loopCount=1 },
        { name = "6", start=7, count=1, loopCount=1 },
        { name = "7", start=8, count=1, loopCount=1 },
        { name = "8", start=9, count=1, loopCount=1 },
        { name = "9", start=10, count=1, loopCount=1 }
    }

    local levelSelectTitleImageSheet = graphics.newImageSheet( "images/level-images/worldTitleSprite.png", {width = 300, height = 39, numFrames = 5, sheetContentWidth = 300, sheetContentHeight = 195})
    local levelSelectTitleSequenceData = {
        { name = "WoodyWalk", start=1, count=1,   loopCount=1 },
        { name = "FieryFortress", start=2, count=1, loopCount=1 },
        { name = "HyrollCastle", start=3, count=1, loopCount=1 },
        { name = "IcyIsland", start=4, count=1, loopCount=1 },
        { name = "BallTimore", start=5, count=1, loopCount=1 }
    }

    local levelSelectLevelTextImageSheet = graphics.newImageSheet( "images/level-images/introScreen-levelSprite.png", {width = 140, height = 39, numFrames = 5, sheetContentWidth = 140, sheetContentHeight = 195})
    local levelSelectLevelTextSequenceData = {
        { name = "WoodyWalk", start=1, count=1,   loopCount=1 },
        { name = "FieryFortress", start=2, count=1, loopCount=1 },
        { name = "HyrollCastle", start=3, count=1, loopCount=1 },
        { name = "IcyIsland", start=4, count=1, loopCount=1 },
        { name = "BallTimore", start=5, count=1, loopCount=1 }
    }

    levelDisplay[1] = display.newSprite(levelSelectTitleImageSheet, levelSelectTitleSequenceData)
    levelDisplay[1]:setSequence(currentWorld)
    levelDisplay[1].anchorX = 0
    levelDisplay[1].anchorY = 0
    levelDisplay[1].xScale = 0.4
    levelDisplay[1].yScale = 0.4
    levelDisplay[1].x = xCalc(20)
    levelDisplay[1].y = pauseScreen.y + yCalc(277)
    levelDisplay[1].yValue = yCalc(277)

    levelDisplay[2] = display.newSprite(levelSelectLevelTextImageSheet, levelSelectLevelTextSequenceData)
    levelDisplay[2]:setSequence(currentWorld)
    levelDisplay[2].anchorX = 0
    levelDisplay[2].anchorY = 0
    levelDisplay[2].xScale = 0.4
    levelDisplay[2].yScale = 0.4
    levelDisplay[2].x = xCalc(20)
    levelDisplay[2].y = pauseScreen.y + yCalc(297)
    levelDisplay[2].yValue = yCalc(297)

    local lastA = 3
    for a = 1, #currentLevelString do
        levelDisplay[lastA] = display.newSprite(levelButtonNumberImageSheet, levelSelectNumberSequenceData)
        levelDisplay[lastA]:setSequence(string.sub(currentLevelString, a, a))
        --introScreen:setReferencePoint(display.CenterReferencePoint);

        levelDisplay[lastA].anchorX = 0
        levelDisplay[lastA].anchorY = 0
        levelDisplay[lastA].xScale = 0.45
        levelDisplay[lastA].yScale = 0.45
        if (a == 1) then
            levelDisplay[lastA].x = xCalc(78)
        else
            levelDisplay[lastA].x = xCalc(93)
        end
        levelDisplay[lastA].y = pauseScreen.y + yCalc(297)
        levelDisplay[lastA].yValue = yCalc(297)

        lastA = a
    end

        t.levelDisplay = levelDisplay

    local timeIcon = display.newSprite(mainFunc.allLevelSettings.itemsImageSheet, mainFunc.allLevelSettings.itemsSequenceData)
    timeIcon:setSequence("clock")
    --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
    timeIcon.anchorX = 0
    timeIcon.anchorY = 1
    timeIcon.xScale = 0.45
    timeIcon.yScale = 0.45
    timeIcon.y = pauseScreen.y + yCalc(307)
    timeIcon.x = xCalc(163)
    timeIcon.yValue = yCalc(307)
        t.timeIcon = timeIcon

    local timeCounter = {}
    local timeCounterString = tostring(33932.8)
    local digitDistance = xCalc(9)

    for a = 1, #timeCounterString do
        local currentSequence = string.sub(timeCounterString, a, a)
        timeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            timeCounter[a]:setSequence(currentSequence)
            timeCounter[a].anchorX = 0
            timeCounter[a].anchorY = 1

            timeCounter[a].y = pauseScreen.y + yCalc(304)
            timeCounter[a].yValue = yCalc(304)
            if a == 1 then
                timeCounter[a].x = timeIcon.x + xCalc(90) - (digitDistance * #timeCounterString)
            elseif currentSequence == "." then
                timeCounter[a].x = timeCounter[a-1].x + digitDistance
                timeCounter[a].y = timeCounter[a-1].y + yCalc(5)
                timeCounter[a].yValue = 305
            else
                timeCounter[a].x = timeCounter[a-1].x + digitDistance
            end
    end
        t.timeCounter = timeCounter

    local gemIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
    local totalGems = 0
    gemIcon.alpha = 0
    gemIcon.yValue = 0
    for a = 1, #shapeArrayParameters do
        if (shapeArrayParameters[a][1] == "gem" and shapeArrayParameters[a][7] == "purple") then
            totalGems = totalGems + 1
        end
    end
    mainFunc.thisLevelSettings.totalGems = totalGems

    if (myGameSettings["gems_discovered_first"] == true) then
        if (mainFunc.thisLevelSettings.totalGems > 0) then

            gemIcon.alpha = 1
            gemIcon:setSequence("gems")
            --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
            gemIcon.anchorX = 0
            gemIcon.anchorY = 1
            gemIcon.y = pauseScreen.y + yCalc(311)
            gemIcon.x = xCalc(275)
            gemIcon.yValue = yCalc(312)

            local gemIconCounterLabel = {}

            local gemIconCounter = "00"

            for a = 1, #gemIconCounter do
                gemIconCounterLabel[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                gemIconCounterLabel[a]:setSequence(string.sub(gemIconCounter, a, a ))
                --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                gemIconCounterLabel[a].anchorX = 0
                gemIconCounterLabel[a].anchorY = 1
                gemIconCounterLabel[a].y = pauseScreen.y + yCalc(304)
                gemIconCounterLabel[a].yValue = yCalc(304)

                if (a == 1) then
                    gemIconCounterLabel[a].x = xCalc(313)
                else
                    gemIconCounterLabel[a].x = gemIconCounterLabel[a - 1].x + xCalc(10)
                end
            end

            gemIconCounterLabel[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                gemIconCounterLabel[3]:setSequence("/")
                --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                gemIconCounterLabel[3].anchorX = 0
                gemIconCounterLabel[3].anchorY = 1
                gemIconCounterLabel[3].y = pauseScreen.y + yCalc(304)
                gemIconCounterLabel[3].yValue = yCalc(304)
                gemIconCounterLabel[3].x = gemIconCounterLabel[2].x + xCalc(10)

            local totalGemCounterString = tostring(totalGems)
            if (totalGems < 9) then totalGemCounterString = '0' .. totalGemCounterString end

            for a = 1, #totalGemCounterString do
                gemIconCounterLabel[a + 3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                    gemIconCounterLabel[a + 3]:setSequence(string.sub(totalGemCounterString, a, a ))
                    --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    gemIconCounterLabel[a + 3].anchorX = 0
                    gemIconCounterLabel[a + 3].anchorY = 1
                    gemIconCounterLabel[a + 3].y = pauseScreen.y + yCalc(304)
                    gemIconCounterLabel[a + 3].yValue = yCalc(304)
                    if a == 1 then
                        gemIconCounterLabel[a + 3].x = gemIconCounterLabel[a + 2].x + xCalc(7)
                    else
                        gemIconCounterLabel[a + 3].x = gemIconCounterLabel[a + 2].x + xCalc(10)
                    end
            end

            t.gemIconCounterLabel = gemIconCounterLabel

            local pauseScreenCoins = {}
            local levelItems2SpriteSheet = graphics.newImageSheet(mainFunc.allLevelSettings.levelItems2ImageSheet, levelItems2ImageSheetSettings)

            pauseScreenCoins["redCoin"] = display.newSprite(levelItems2SpriteSheet, levelItems2SequenceData)
                pauseScreenCoins["redCoin"]:setSequence("red")
                --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                pauseScreenCoins["redCoin"].anchorX = 0
                pauseScreenCoins["redCoin"].anchorY = 1
                pauseScreenCoins["redCoin"].xScale = 0.45
                pauseScreenCoins["redCoin"].yScale = 0.45
                pauseScreenCoins["redCoin"].y = pauseScreen.y + yCalc(308)
                pauseScreenCoins["redCoin"].yValue = yCalc(308)
                pauseScreenCoins["redCoin"].x = xCalc(398)
                pauseScreenCoins["redCoin"].alpha = 0

            pauseScreenCoins["blueCoin"] = display.newSprite(levelItems2SpriteSheet, levelItems2SequenceData)
                pauseScreenCoins["blueCoin"]:setSequence("blueCoin")
                --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                pauseScreenCoins["blueCoin"].anchorX = 0
                pauseScreenCoins["blueCoin"].anchorY = 1
                pauseScreenCoins["blueCoin"].xScale = 0.45
                pauseScreenCoins["blueCoin"].yScale = 0.45
                pauseScreenCoins["blueCoin"].y = pauseScreen.y + yCalc(308)
                pauseScreenCoins["blueCoin"].yValue = yCalc(308)
                pauseScreenCoins["blueCoin"].x = xCalc(414)
                pauseScreenCoins["blueCoin"].alpha = 0

            pauseScreenCoins["purpleCoin"] = display.newSprite(levelItems2SpriteSheet, levelItems2SequenceData)
                pauseScreenCoins["purpleCoin"]:setSequence("purpleCoin")
                --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                pauseScreenCoins["purpleCoin"].anchorX = 0
                pauseScreenCoins["purpleCoin"].anchorY = 1
                pauseScreenCoins["purpleCoin"].xScale = 0.45
                pauseScreenCoins["purpleCoin"].yScale = 0.45
                pauseScreenCoins["purpleCoin"].y = pauseScreen.y + yCalc(308)
                pauseScreenCoins["purpleCoin"].yValue = yCalc(308)
                pauseScreenCoins["purpleCoin"].x = xCalc(431)
                pauseScreenCoins["purpleCoin"].alpha = 0

            t.pauseScreenCoins = pauseScreenCoins
        end
    else
        gemIcon.alpha = 1
        gemIcon:setSequence("question-mark")
        --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
        gemIcon.anchorX = 0
        gemIcon.anchorY = 1
        gemIcon.y = pauseScreen.y + 310
        gemIcon.x = xCalc(322)
        gemIcon.yValue = pauseScreen.y + 310

        local pauseScreenCoins = {}

        pauseScreenCoins["question-mark"] = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            pauseScreenCoins["question-mark"]:setSequence("question-mark")
            --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
            pauseScreenCoins["question-mark"].anchorX = 0
            pauseScreenCoins["question-mark"].anchorY = 1
            pauseScreenCoins["question-mark"].y = pauseScreen.y + yCalc(304)
            pauseScreenCoins["question-mark"].yValue = yCalc(304)
            pauseScreenCoins["question-mark"].x = xCalc(376)

        t.pauseScreenCoins = pauseScreenCoins
    end
        t.gemIcon = gemIcon

    return backToMainBtn, resetBtn, backToPlayBtn, randomBtn, listener, downBtn, upBtn, leftBtn, rightBtn, play, backBtn, mapScreen, pauseScreen, itemBtn, dollarIcon, coinPlusButton, dollarCounter, livesIcon, livesPlusButton, livesCounter, gemIcon, gemIconCounter, gemIconCounterLabel
end
    t.otherScreensAndButtonCreate = otherScreensAndButtonCreate

return t
