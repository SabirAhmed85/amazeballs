local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
widget.setTheme ( "widget_theme_ios" )
-- Clear previous scene
--storyboard.removeAll()

--display.setDefault( "background", 243, 245, 177 )
display.setDefault( "background", 0, 0, 0 )
display.setStatusBar( display.HiddenStatusBar )



local worldButton, totalWorlds, thisworldButton, scrollView, medalChooseScreen, silverMedalButton, goldMedalButton, itemBagButton, scrollView, totalToolArray, toolArray, levelVariables, ItemBagBtnFunction, dollarCounter, dollarIcon, showCoinsLabel
local touchButton, smallIconsImageSheet, smallIconsSequenceData, background, checkAvailabilityOfBuyButtonToShow, checkAvailabilityOfBuyButtonToHide, openIAP, closeIAP, addBackEventListenersFromIAP, IAPScript, addBackBackgroundEventListeners, removeBackgroundEventListeners
local prepareCreateYouhaveDisplay, addBackBuyButtonListener, buyButtonPressed, goToLevel, closePurchaseScreen, removeIAPScreenListeners, newMusic
local currentWorldViewing = nil
local scrollDisabled = false
local worldButton = {}
local levelVariables
local dummyScrollView = display.newGroup()
local backgroundObjects = display.newGroup()
--myGameSettings = loadTable("myGameSettings.json")

addBackBackgroundEventListeners = function ()
    levelVariables.backButton:addEventListener("tap", levelVariables.backBtn)
    dollarPlusSign:addEventListener("tap", levelVariables.openIAP) 
    livesPlusSign:addEventListener("tap", levelVariables.openIAP)
    for a = 1, #worldButton do
        if worldButton[a].locked == true and worldButton[a].fullyBlocked ~= true then
            worldButton[a]:addEventListener("tap", levelVariables.openIAP)
        elseif worldButton[a].locked ~= true then
            worldButton[a]:addEventListener("tap", goToLevel)
        end
    end
end

removeBackgroundEventListeners = function ()
    levelVariables.backButton:removeEventListener("tap", levelVariables.backBtn)
    dollarPlusSign:removeEventListener("tap", levelVariables.openIAP) 
    livesPlusSign:removeEventListener("tap", levelVariables.openIAP)
    for a = 1, #worldButton do
        if worldButton[a].locked == true and worldButton[a].fullyBlocked ~= true then
            worldButton[a]:removeEventListener("tap", levelVariables.openIAP)
        elseif worldButton[a].locked ~= true then
            worldButton[a]:removeEventListener("tap", goToLevel)
        end
    end
end

local buttonClick = function (button, proportion)
	local oldXScale = button.xScale
	local oldYScale = button.yScale

	local newXScale = (proportion / 10) * oldXScale
	local newYScale = (proportion / 10) * oldYScale
	transition.to(button, {xScale = newXScale, yScale = newYScale, time = 30, onComplete = function ()
		transition.to(button, {xScale = oldXScale, yScale = oldYScale, time = 30})
	end})
end

 --- IAP RELATED STARTS
if (iapAvail) then
    IAPScript = require("modules.IAP.IAP-config")
end

local livesPurchasedFunction, coinsUpdatedFunction

function livesPurchasedFunction ()
    IAPScript.IAPFunctionsScript.updateLivesDisplay(livesCounter)
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(dollarCounter)
    IAPScript.IAPFunctionsScript.updateLivesPlusButton(livesPlusSign, levelVariables.openIAP)
    IAPScript.IAPFunctionsScript.updateCoinsPlusButton(dollarPlusSign, levelVariables.openIAP)
end

function coinsUpdatedFunction ()
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(dollarCounter)
    IAPScript.IAPFunctionsScript.updateCoinsPlusButton(dollarPlusSign, levelVariables.openIAP)
end

checkAvailabilityOfBuyButtonToShow = function (button, levelVariables)
    button.alpha = button.availabilityCheckFunction(button)
    if button.alpha == 1 then
        button:addEventListener("tap", levelVariables.buyButtonPressed)
    end
end

checkAvailabilityOfBuyButtonToHide = function (button, levelVariables)
    button.alpha = button.availabilityCheckFunction(button)
    if button.alpha == 1 then
        button:removeEventListener("tap", levelVariables.buyButtonPressed)
    end
end

local addBackIAPToolOrBlockScreenListeners = function (screen, screenName)
    for a = 1, #screen.tile do
        screen.tile[a].buyDisplay[1].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
    end

    IAPOverlay.purchaseScreens[screenName].currentPurchaseScreenShowing = nil
end

closePurchaseScreen = function (event)
    if event.target.currentPurchaseScreenShowing == "canBuy" then
        IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons["noButton"]:removeEventListener("tap", closePurchaseScreen)
        IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons["yesButton"]:removeEventListener("tap", closePurchaseScreen)

        if event.target.currentPurchaseScreenShowing == "canBuy" then
            if IAPOverlay.purchaseScreens["canBuy"].icon then
                for key, val in pairs(IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects) do
                    if key == "counterNumber" then
                        IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects[key]:removeSelf()
                        IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects[key] = nil
                    else
                        for a = 1, #IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects[key] do
                            IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects[key][a]:removeSelf()
                            IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects[key][a] = nil
                        end
                    end
                end
                for a = 1, #IAPOverlay.purchaseScreens["canBuy"].priceNumbers do
                    IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a]:removeSelf()
                    IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a] = nil
                end
                IAPOverlay.purchaseScreens["canBuy"].currencyIcon:removeSelf()
                IAPOverlay.purchaseScreens["canBuy"].currencyIcon = nil
                transition.to(IAPOverlay.purchaseScreens["canBuy"].icon, {alpha = 0, time = 200, onComplete = function ()
                    IAPOverlay.purchaseScreens["canBuy"].icon:removeSelf()
                    IAPOverlay.purchaseScreens["canBuy"].icon = nil
                end})
            end
        end

    else
        IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons["closeButton"]:removeEventListener("tap", closePurchaseScreen)
    end
    for key, val in pairs (IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons) do
        transition.to(IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons[key], {alpha = 0, time = 250})
        if IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons[key] == event.target then
            if key ~= "yesButton" then
                IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons[key]:removeEventListener("tap", levelVariables.closePurchaseScreen)
            else
                --IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons[key]:removeEventListener("tap", levelVariables.addPurchasedToolToBag)
                levelVariables.addPurchasedToolToBag(nil, nil, nil)
                coinsUpdatedFunction()
            end
        end
    end
    timer.performWithDelay(250, function ()
        transition.to(IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].screen, {alpha = 0, time = 200, onComplete = function ()
            if (event.target.currentPurchaseScreenShowing == "cantBuy_space") then
                timer.performWithDelay(300, function () addBackIAPToolOrBlockScreenListeners(levelVariables.IAPOverlay.currentToolScreen, event.target.currentPurchaseScreenShowing) end)
            else
                if event.target.currentPurchaseScreenShowing == "canBuy" and IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].currentPurchaseType ~= "lives" then
                    timer.performWithDelay(100, function () addBackIAPToolOrBlockScreenListeners(levelVariables.IAPOverlay.currentToolScreen, event.target.currentPurchaseScreenShowing) end)
                elseif event.target.currentPurchaseScreenShowing == "canBuy" and IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].currentPurchaseType == "lives" then
                    timer.performWithDelay(100, function () addBackIAPScreenListeners(IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].currentPurchaseType) end)
                end
            end
        end})
    end)
end

addBackIAPScreenListeners = function (purchaseType)
    if purchaseType == "lives" then
        for a = 1, #levelVariables.IAPOverlay.liveScreen.leftTile do
            for b = 1, #levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay do
                if levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay[b].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
                end
            end

            if a == 1 then
                for b = 1, #levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay do
                    if levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay[b].buyButton.alpha == 1 then
                        levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay[b].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
                    end
                end
            end
        end
    elseif purchaseType == "Coins" then
        for a = 1, #levelVariables.IAPOverlay.coinScreen.leftTile do
            for b = 1, #levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay do
                if levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay[b].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
                end
                if levelVariables.IAPOverlay.coinScreen.rightTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.coinScreen.rightTile[a].buyDisplay[b].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
                end
            end
        end
    end
end

removeIAPScreenListeners = function (event)
    if event.target.purchaseType == "Lives" then
        for a = 1, #levelVariables.IAPOverlay.liveScreen.leftTile do
            for b = 1, #levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay do
                if levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.liveScreen.leftTile[a].buyDisplay[b].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
                end
            end

            if a == 1 then
                for b = 1, #levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay do
                    if levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay[b].buyButton.alpha == 1 then
                        levelVariables.IAPOverlay.liveScreen.rightTile[a].buyDisplay[b].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
                    end
                end
            end
        end
    elseif event.target.purchaseType == "Coins" then
        for a = 1, #levelVariables.IAPOverlay.coinScreen.leftTile do
            for b = 1, #levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay do
                if levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.coinScreen.leftTile[a].buyDisplay[b].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
                end
                if levelVariables.IAPOverlay.coinScreen.rightTile[a].buyDisplay[b].buyButton.alpha == 1 then
                    levelVariables.IAPOverlay.coinScreen.rightTile[a].buyDisplay[b].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
                end
            end
        end
    else
        if IAPScript.IAPToolsItemArray[event.target.purchaseType] then
            relScreen = levelVariables.IAPOverlay.toolScreen
        elseif IAPScript.IAPShapesItemArray[event.target.purchaseType] then
            relScreen = levelVariables.IAPOverlay.shapeScreen
        end
        for a = 1, #relScreen[event.target.purchaseType].tile do
            relScreen[event.target.purchaseType].tile[a].buyDisplay[1].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
        end
    end
end

buyButtonPressed = function (event)
    levelVariables.removeIAPScreenListeners(event)

    IAPScript.IAPFunctionsScript.buyButtonPressedMain(event.target,
        IAPScript.IAPStoreConfigurationArray, 
        IAPScript.IAPToolsItemArray, 
        IAPScript.IAPShapesItemArray,
        "myTotalToolArray.json", 
        "myGameSettings.json", 
        buyButtonPressed,
        levelVariables)
    
end

addBackBuyButtonListener = function (button, levelVariables)
    if button.alpha == 1 then
        button:addEventlistener("tap", levelVariables.buyButtonPressed)
    end
end

prepareCreateYouhaveDisplay = function (screen, relevantGameDataArrayPath, xValue, yValue, relScreen, speed, displayGroup)

    local objArray = IAPScript.createYouhaveDisplay(screen, relevantGameDataArrayPath, xValue, yValue, relScreen, speed, displayGroup)

    return objArray
end

function dummyListener(event)
    return true
end

function openIAP (event)
    removeBackgroundEventListeners()
    if (levelVariables.IAPScreenObjectsGroup) then

    else
        levelVariables.IAPScreenObjectsGroup = display.newGroup()
    end
    IAPScript.openIAPScreen(event.target.value, levelVariables, event.target.relBool)
end

function closeIAP (event)
    if levelVariables.currentIAPScreen == "Lives" then
        relevantTile = IAPOverlay.livesTileSelected
        relevantUnselectedTile = IAPOverlay.livesTileUnselected
        IAPOverlay.livesTileUnselected.selected = false
    elseif levelVariables.currentIAPScreen == "Coins" then
        relevantTile = IAPOverlay.coinsTileSelected
        relevantUnselectedTile = IAPOverlay.coinsTileUnselected
        IAPOverlay.coinsTileUnselected.selected = false
    elseif levelVariables.currentIAPScreen == "Tools" then
        relevantTile = IAPOverlay.toolsTileSelected
        relevantUnselectedTile = IAPOverlay.toolsTileUnselected
        IAPOverlay.toolsTileUnselected.selected = false
    elseif levelVariables.currentIAPScreen == "Shapes" then
        relevantTile = IAPOverlay.shapesTileSelected
        relevantUnselectedTile = IAPOverlay.shapesTileUnselected
        IAPOverlay.shapesTileUnselected.selected = false
    elseif levelVariables.currentIAPScreen == "Unlock" then
        relevantTile = IAPOverlay.unlockTileSelected
        relevantUnselectedTile = IAPOverlay.unlockTileUnselected
        IAPOverlay.unlockTileUnselected.selected = false
    end
    IAPScript.hideIAPInnerScreen(levelVariables.currentIAPScreen, IAPOverlay, relevantTile, relevantUnselectedTile, levelVariables, true)
end

function addBackEventListenersFromIAP (event)
    addBackBackgroundEventListeners()
end

    ----IAP RELATED ENDS

function goToLevel (event)
    -- simply go to level1.lua scene
    --purge level
    thisworldButton = event.target
    myGameSettings["worldSelectLastWorld"] = thisworldButton.value
    currentWorld = thisworldButton.value
    saveTable(myGameSettings, "myGameSettings.json")
    --currentMedal = thisMedalButton.value
    --currentLevelLabel = currentLevel .. "-" .. thisMedalButton.value
    composer.gotoScene( "LevelSelectScene", {effect = "crossFade", time = 150} )
    return true -- indicates successful touch
end

--[[
local function touchMedalButton (event)
	thisMedalButton = event.target
	goToLevel()
end
]]

--[[
local function closeMedalScreen (event)
	silverMedalButton:removeEventListener("touch", touchMedalButton)
	goldMedalButton:removeEventListener("touch", touchMedalButton)
	closeButton:removeEventListener("touch", closeMedalScreen)

	medalChooseScreen.showing = false

	transition.to(closeButton, {alpha = 0, time= 100})
	transition.to(silverMedalButton, {alpha = 0, time= 100})
	transition.to(silverMedalButton.valueText, {alpha = 0, time= 100})
	transition.to(goldMedalButton, {alpha = 0, time= 100})
	transition.to(goldMedalButton.valueText, {alpha = 0, time= 100, onComplete = function ()
		transition.to(medalChooseScreen, {alpha = 0, time = 100});
		for a = 1, #worldButton do
        	worldButton[a]:addEventListener("tap", touchButton)
	    end
	end})
	scrollView._view._isHorizontalScrollingDisabled = false
end
]]

--[[
local function openMedalScreen ()
	transition.to(medalChooseScreen, {alpha = 1, time= 100, onComplete = function ()
		silverMedalButton.alpha = 1
		goldMedalButton.alpha = 1
		closeButton.alpha = 1

		silverMedalButton.valueText.alpha = 1

		medalChooseScreen.showing = true
		silverMedalButton:addEventListener("touch", touchMedalButton)
		if (levelButton[thisLevelButton.value].goldAccessible == true) then
			goldMedalButton:addEventListener("touch", touchMedalButton)
			goldMedalButton.valueText.alpha = 1
		end
		closeButton:addEventListener("touch", closeMedalScreen)
	end})
end
]]

--[[
function touchButton (event)
	scrollView._view._isHorizontalScrollingDisabled = true
    --if event.phase == "began" then
    	for a = 1, #worldButton do
	        worldButton[a]:removeEventListener("tap", touchButton)
	    end
    	thisworldButton = event.target

    	--Medal Choose Screen
	    medalChooseScreen = display.newRect(0, 0, 200, 100)
	    	medalChooseScreen:setFillColor(155, 155, 255)
	    	medalChooseScreen:setReferencePoint(display.CenterReferencePoint);
	    	medalChooseScreen.y = display.contentHeight / 2
	    	medalChooseScreen.x = display.contentWidth / 2
	    	medalChooseScreen.alpha = 0
	    	medalChooseScreen.showing = false

	    silverMedalButton = display.newImage("images/objects/switch.png")
	    	silverMedalButton:setReferencePoint(display.TopLeftReferencePoint);
			silverMedalButton.x = medalChooseScreen.x - 90
			silverMedalButton.y = medalChooseScreen.y - 45
			silverMedalButton.xScale = 0.6
			silverMedalButton.yScale = 1.6
	    	silverMedalButton.alpha = 0
			silverMedalButton.value = "silver"
			silverMedalButton.valueText = display.newText("s", silverMedalButton.x + 20, silverMedalButton.y + 18, nil, 26)
			silverMedalButton.valueText.alpha = 0

		goldMedalButton = display.newImage("images/objects/switch.png")
	    	goldMedalButton:setReferencePoint(display.TopLeftReferencePoint);
			goldMedalButton.x = medalChooseScreen.x + 10
			goldMedalButton.y = medalChooseScreen.y - 45
			goldMedalButton.xScale = 0.6
			goldMedalButton.yScale = 1.6
	    	goldMedalButton.alpha = 0
			goldMedalButton.value = "gold"
			goldMedalButton.valueText = display.newText("g", goldMedalButton.x + 20, goldMedalButton.y + 18, nil, 26)
			goldMedalButton.valueText.alpha = 0

		closeButton = display.newImage("images/objects/switch.png")
	    	closeButton:setReferencePoint(display.TopLeftReferencePoint);
			closeButton.x = medalChooseScreen.x + 50
			closeButton.y = medalChooseScreen.y - 100
			closeButton.xScale = 0.6
			closeButton.yScale = 1.6
	    	closeButton.alpha = 0

    	openMedalScreen()
    --end
end
]]


local function scrollListener (event)
    --[[
    local phase = event.phase

    if ( phase == "began") then
        event.xStart = event.x
    elseif ( phase == "moved" ) then
        local dy = event.x - event.xStart
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy < -10 ) then
            scrollView:scrollToPosition( { x = -480, time=450 } )
        elseif ( dy > 10 ) then
            scrollView:scrollToPosition( { x = 0, time=450 } )
        end
    end
    ]]
    local phase = event.phase
	if event.limitReached and scrollDisabled == false then
        if ( event.direction == "left" ) then
        	--scrollBack to default position
            scrollView._view._isHorizontalScrollingDisabled = true
        	scrollView:scrollToPosition( { x = xCalc(-1920), time=400, onComplete = function ()
            end } )
        end
	end

    if ( phase == "began" and scrollView._view._isHorizontalScrollingDisabled == false) then
        event.xStart = event.x
    elseif ( phase == "moved" and scrollView._view._isHorizontalScrollingDisabled == false) then
        local dx = event.x - event.xStart
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        local worldButtonIndex
        local calculateCurrentWorldX = function ()
            for a = 1, #worldButton do
                if (worldButton[a].value == currentWorldViewing) then
                    return a
                end
            end
        end

        if ( dx < -70 ) then
            worldButtonIndex = calculateCurrentWorldX()
            if (worldButtonIndex ~= 5) then
                scrollView._view._isHorizontalScrollingDisabled = true
                scrollView:scrollToPosition( { x = worldButton[worldButtonIndex + 1].scrollSelectArray["midWay"] * -1, time=250, onComplete = function ()
                    currentWorldViewing = worldButton[worldButtonIndex + 1].value
                end } )
            end
        elseif ( dx > 70 ) then
            worldButtonIndex = calculateCurrentWorldX()
            if (worldButtonIndex ~= 1) then
                scrollView._view._isHorizontalScrollingDisabled = true
                scrollView:scrollToPosition( { x = worldButton[worldButtonIndex - 1].scrollSelectArray["midWay"] * -1, time=250, onComplete = function ()
                    currentWorldViewing = worldButton[worldButtonIndex - 1].value
                end } )
            end
        end
    elseif (phase == "ended" and scrollView._view._isHorizontalScrollingDisabled == false) then
        local xView, yView = scrollView:getContentPosition()
        for a = 1, #worldButton do
            if (xView < worldButton[a].scrollSelectArray["lowerLimit"] * -1)
            and (xView > worldButton[a].scrollSelectArray["upperLimit"] * -1) then
                scrollView._view._isHorizontalScrollingDisabled = true
                scrollView:scrollToPosition( { x = worldButton[a].scrollSelectArray["midWay"] * -1, time=400 } )
                currentWorldViewing = worldButton[a].value
            end
        end
        scrollView._view._isHorizontalScrollingDisabled = false
    elseif (phase == "ended") then
        scrollView._view._isHorizontalScrollingDisabled = false
    end
end

--[[
local function itemBag (event)
	buttonClick(itemBagButton, 8)
	if (levelVariables.itemBagIsOpen == false) then
		scrollView._view._isHorizontalScrollingDisabled = true
		for i = 1, #levelButton do
			levelButton[i]:removeEventListener("tap", touchButton)
		end
	else
		scrollView._view._isHorizontalScrollingDisabled = false
		for i = 1, #levelButton do
			levelButton[i]:addEventListener("tap", touchButton)
		end
	end
	ItemBagBtnFunction(levelVariables)
end
]]

local function backBtn (event)
	buttonClick(event.target, 78)
	timer.performWithDelay(100, composer.gotoScene("TitleScreen", {effect = "crossFade", time = 10}))
end


-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
    local sceneGroup = self.view
    -- Initialize the scene here.
    -- Example: add display objects to "scenesceneGroup", add touch listeners, etc.
    
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Load two audio streams and one sound
        newMusic = audio.loadStream( "audio/worldSelect.wav" )

        -- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
        musicChannel["worldSelect"] = audio.play( newMusic, { channel=2, loops=-1 } )

        myGameSettings = loadTable("myGameSettings.json")
        levelVariables = {}
        levelVariables.livesPurchasedFunction = livesPurchasedFunction
        levelVariables.coinsUpdatedFunction = coinsUpdatedFunction
        levelVariables.addBackEventListenersFromIAP = addBackEventListenersFromIAP
        levelVariables.closePurchaseScreen = closePurchaseScreen
        levelVariables.openIAP = openIAP
        levelVariables.closeIAP = closeIAP
        levelVariables.removeIAPScreenListeners = removeIAPScreenListeners
        levelVariables.prepareCreateYouhaveDisplay = prepareCreateYouhaveDisplay
        levelVariables.addBackBuyButtonListener = addBackBuyButtonListener
        levelVariables.buyButtonPressed = buyButtonPressed
        levelVariables.checkAvailabilityOfBuyButtonToShow = checkAvailabilityOfBuyButtonToShow
        levelVariables.checkAvailabilityOfBuyButtonToHide = checkAvailabilityOfBuyButtonToHide
        levelVariables.backBtn = backBtn
        levelVariables.dummyListener = dummyListener
            -- Called when the scene is still off screen (but is about to come on screen).
        levelVariables.IAPOpened = false
        levelVariables.LivesOpened = false
        levelVariables.CoinsOpened = false
        levelVariables.ToolsOpened = false
        levelVariables.ShapesOpened = false
        levelVariables.UnlockOpened = false
        levelVariables.itemBagIsOpen = false
        levelVariables.allLevelSettings = require("modules.levels.all-level-settings")
        levelVariables.globalImageCreateFunctions = require("modules.global-image-creation-functions")
        levelVariables.allLevelSettings.createLevelSettings(levelVariables, "out-of-level")
        mainFunc = {}

        -- Tiles

        local levelConfigScript = require("modules.level-config-array")
        levelConfigArray = levelConfigScript.levelConfigArray

        background = display.newImageRect("images/central-images/Layout/WorldSelectScreenBackground.png", display.contentWidth, display.contentHeight)
        background.anchorX = 0
        background.anchorY = 0
        backgroundObjects:insert(background)

        levelVariables.backButton = display.newImageRect("images/central-images/buttons/levelSelectBack.png", 70, 53)
            --levelVariables.backButton:setReferencePoint(display.CenterCenterReferencePoint);
            levelVariables.anchorX = 0.5
            levelVariables.anchorY = 0.5
            levelVariables.backButton.x = display.contentWidth - 40
            levelVariables.backButton.y = 29
            levelVariables.backButton:addEventListener("tap", backBtn)
            backgroundObjects:insert(levelVariables.backButton)

        ----

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

        local lives = tostring(myGameSettings["total_lives"])
        local totalLivesAllowed = tostring(myGameSettings["current_max_lives"])
        
        local levelItems2ImageSheet = graphics.newImageSheet( levelVariables.allLevelSettings.levelItems2ImageSheet, levelVariables.allLevelSettings.levelItems2ImageSheetSettings)
        local levelItems2SequenceData = levelVariables.allLevelSettings.levelItems2SequenceData

        smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
        smallIconsSequenceData = {
            { name = "lives", start=1, count=1,   loopCount=1 },
            { name = "gems", start=2, count=1, loopCount=1 },
            { name = "coins", start=3, count=1, loopCount=1 },
            { name = "silverMedal", start=4, count=1, loopCount=1 },
            { name = "goldMedal", start=5, count=1, loopCount=1 },
            { name = "plusButton-inactive", start=6, count=1, loopCount=1 },
            { name = "plusButton-active", start=7, count=1, loopCount=1 },
            { name = "question-mark", start=8, count=1, loopCount=1 }
        }

        MainBarNumbersImageSheet = graphics.newImageSheet( "images/central-images/Numbers/MainLivesAndCoinBar-numbers.png", {width = 13, height = 14, numFrames = 15, sheetContentWidth = 195, sheetContentHeight = 14})
        MainBarNumbersSequenceData = {
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

        WorldUnlockedBarNumbersImageSheet = graphics.newImageSheet( "images/central-images/Numbers/worldSelectUnlockedBarNumbers.png", {width = 13, height = 17, numFrames = 11, sheetContentWidth = 143, sheetContentHeight = 17})
        WorldUnlockedBarNumbersSequenceData = {
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
            { name = "/", start=11, count=1, loopCount=1 }
        }

        WorldLockedBarNumbersImageSheet = graphics.newImageSheet( "images/central-images/Numbers/worldSelectLockedBarNumbers.png", {width = 13, height = 17, numFrames = 11, sheetContentWidth = 143, sheetContentHeight = 17})
        WorldLockedBarNumbersSequenceData = {
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

        dollarIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            dollarIcon:setSequence("coins")
            --dollarIcon:setReferencePoint(display.BottomLeftReferencePoint);
            dollarIcon.anchorX = 0
            dollarIcon.anchorY = 1
            dollarIcon.x = xCalc(357)
            dollarIcon.y = display.contentHeight  - 5
            backgroundObjects:insert(dollarIcon)

        dollarPlusSign = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            if (999999 - myGameSettings["total_coins"]) > 10000 then
                dollarPlusSign:setSequence("plusButton-active")
                dollarPlusSign:addEventListener("tap", levelVariables.openIAP)
            else
                dollarPlusSign:setSequence("plusButton-inactive")
            end
            dollarPlusSign.anchorX = 0
            dollarPlusSign.anchorY = 1
            dollarPlusSign.x = display.contentWidth - ((37/480) * display.contentWidth)
            dollarPlusSign.y = display.contentHeight  - 5
            dollarPlusSign.value = "Coins"
            dollarPlusSign.relBool = levelVariables.CoinsOpened
            backgroundObjects:insert(dollarPlusSign)

        dollarCounter = {}

        for a = 1, 7 do
            local distanceDifference = xCalc(8)

            dollarCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            backgroundObjects:insert(dollarCounter[a])
            dollarCounter[a]:setSequence("0")
            dollarCounter[a].anchorX = 0
            dollarCounter[a].anchorY = 1
            dollarCounter[a].y = dollarIcon.y - 7.5
            dollarCounter[a].originalY = dollarIcon.y - 7.5

            if (a == 1) then
                dollarCounter[a].x = dollarIcon.x + xCalc(30) + (distanceDifference * (6 - #coinCounter) )
            else
                dollarCounter[a].x = dollarCounter[a - 1].x + distanceDifference
            end

            if a < (7 - (#coinCounter - 1) ) then
                dollarCounter[a].alpha = 0
            end

        end

        for a = 1, #coinCounter do
            local i = 7 - #coinCounter + a
            dollarCounter[i]:setSequence(string.sub(coinCounter, a, a))
        end


        -------------

        livesIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            livesIcon:setSequence("lives")
            --livesIcon:setReferencePoint(display.BottomLeftReferencePoint);
            livesIcon.anchorX = 0
            livesIcon.anchorY = 1
            livesIcon.x = display.contentWidth - ((223/480) * display.contentWidth)
            livesIcon.y = display.contentHeight  - 5
            backgroundObjects:insert(livesIcon)

        livesPlusSign = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            if (myGameSettings["total_lives"] < myGameSettings["current_max_lives"])
            or (myGameSettings["current_max_lives"] < myGameSettings["total_max_lives"]) then
                livesPlusSign:setSequence("plusButton-active")
                livesPlusSign:addEventListener("tap", levelVariables.openIAP)
            else
                livesPlusSign:setSequence("plusButton-inactive")
            end
            livesPlusSign.anchorX = 0
            livesPlusSign.anchorY = 1
            livesPlusSign.x = display.contentWidth - ((168/480) * display.contentWidth)
            livesPlusSign.y = (315/320) * display.contentHeight
            livesPlusSign.value = "Lives"
            livesPlusSign.relBool = levelVariables.LivesOpened
            backgroundObjects:insert(livesPlusSign)

        livesCounter = {}

        livesCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            livesCounter[1]:setSequence(tostring(lives))
            --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
            livesCounter[1].anchorX = 0
            livesCounter[1].anchorY = 0
            livesCounter[1].y = livesIcon.y - 21
            livesCounter[1].x = livesIcon.x + xCalc(28)
            backgroundObjects:insert(livesCounter[1])

        livesCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            livesCounter[2]:setSequence("/")
            --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
            livesCounter[2].anchorX = 0
            livesCounter[2].anchorY = 0
            livesCounter[2].y = livesIcon.y - 20
            livesCounter[2].x = livesIcon.x + xCalc(38)
            backgroundObjects:insert(livesCounter[2])

        livesCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            livesCounter[3]:setSequence(tostring(totalLivesAllowed))
            --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
            livesCounter[3].anchorX = 0
            livesCounter[3].anchorY = 0
            livesCounter[3].y = livesIcon.y - 21
            livesCounter[3].x = livesIcon.x + xCalc(46)
            backgroundObjects:insert(livesCounter[3])

        ----------------- WORLD STATUS BAR

        local silverMedalXVal = ((64/480) * display.contentWidth)

        goldMedalCounterLabel = {}

        goldMedalCounter = 0

        ----

        local gemIconXVal = ((131/480) * display.contentWidth)

        silverMedalCounterLabel = {}

        silverMedalCounter = 0

        for key, val in pairs(levelConfigScript.levelConfigArray) do

            totalLevels = 0
            for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[key]) do
                totalLevels = totalLevels + 1
            end
            for a = 1, totalLevels do
			
            --[[
            print(key)
			print(a)
			print(totalLevels)
			print(goldMedalCounter)


			print(myGameSettings[key]["levels"][a]["gold_gained"])
--]]

			--[[
                if myGameSettings[key]["levels"][a]["gold_gained"] == true then
                    goldMedalCounter = goldMedalCounter + 1
                end
				--]]
            end

            for a = 1, totalLevels do
                if myGameSettings[key]["levels"][a]["silver_gained"] == true then
                    silverMedalCounter = silverMedalCounter + 1
                end
            end
            
        end

        silverMedalCounterInt = silverMedalCounter
        goldMedalCounterInt = goldMedalCounter

        goldMedalCounter = tostring( goldMedalCounter )

        if (#goldMedalCounter == 1) then
            silverMedalXVal = silverMedalXVal + ((8/480) * display.contentWidth)
        elseif (#goldMedalCounter == 2) then
            silverMedalXVal = silverMedalXVal + ((4/480) * display.contentWidth)
        elseif (#goldMedalCounter == 3) then
            silverMedalXVal = silverMedalXVal + 0
        end

        for a = 1, #goldMedalCounter do

            goldMedalCounterLabel[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            goldMedalCounterLabel[a]:setSequence((string.sub(goldMedalCounter, a, a)))
            --goldMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
            goldMedalCounterLabel[a].anchorX = 0
            goldMedalCounterLabel[a].anchorY = 1
            goldMedalCounterLabel[a].y = dollarIcon.y - 7

            if (a == 1) then
                goldMedalCounterLabel[a].x = xCalc(38)
            else
                goldMedalCounterLabel[a].x = goldMedalCounterLabel[a - 1].x + xCalc(10)
            end

        end

        silverMedalCounter = tostring( silverMedalCounter ) -- silverMedalCounter

        if (#silverMedalCounter == 1) then
            gemIconXVal = gemIconXVal + ((8/480) * display.contentWidth)
        elseif (#silverMedalCounter == 2) then
            gemIconXVal = gemIconXVal + ((4/480) * display.contentWidth)
        elseif (#silverMedalCounter == 3) then
            gemIconXVal = gemIconXVal + 0
        end

        for a = 1, #silverMedalCounter do

            silverMedalCounterLabel[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            silverMedalCounterLabel[a]:setSequence((string.sub(silverMedalCounter, a, a)))
            --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
            silverMedalCounterLabel[a].anchorX = 0
            silverMedalCounterLabel[a].anchorY = 1
            silverMedalCounterLabel[a].y = dollarIcon.y - 7

            if (a == 1) then
                silverMedalCounterLabel[a].x = xCalc(107)
            else
                silverMedalCounterLabel[a].x = silverMedalCounterLabel[a - 1].x + xCalc(10)
            end

        end

        ----

        gemIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)

        if (myGameSettings["gems_discovered_second"] == true) then

            gemIcon:setSequence("gems")
            --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
            gemIcon.anchorX = 0
            gemIcon.anchorY = 1
            gemIcon.xScale = 0.8
            gemIcon.yScale = 0.8
            gemIcon.y = display.contentHeight - 7
            gemIcon.x = xCalc(145)
            gemIcon.state = "coinsLabelHidden"

            worldStatusBarEndXVal = ((174/480) * display.contentWidth)

            gemIconCounterLabel = {}

            gemIconCounter = 0

            for key, val in pairs(levelConfigScript.levelConfigArray) do

                totalLevels = 0
                for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[key]) do
                    totalLevels = totalLevels + 1
                end
                for a = 1, totalLevels do
                    gemIconCounter = gemIconCounter + myGameSettings[key]["levels"][a]["silver-achievements"]["purple_gems"]
                    gemIconCounter = gemIconCounter + myGameSettings[key]["levels"][a]["gold-achievements"]["purple_gems"]
                end

            end

            gemIconCounter = tostring( gemIconCounter )

            if (#gemIconCounter == 1) then
                worldStatusBarEndXVal = worldStatusBarEndXVal + ((8/480) * display.contentWidth)
            elseif (#gemIconCounter == 2) then
                worldStatusBarEndXVal = worldStatusBarEndXVal + ((4/480) * display.contentWidth)
            elseif (#gemIconCounter == 3) then
                worldStatusBarEndXVal = worldStatusBarEndXVal + 0
            end

            local stringContainsComma = false
            for a = 1, #gemIconCounter do
                local currentIndex = a
                local currentSequence = currentIndex
                if stringContainsComma == true then
                    currentIndex = a + 1
                    currentSequence = currentIndex - 1
                end
                if currentIndex == 2 and #gemIconCounter == 4 then
                    stringContainsComma = true
                    gemIconCounterLabel[currentIndex] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                    gemIconCounterLabel[currentIndex]:setSequence(",")
                    --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    gemIconCounterLabel[currentIndex].anchorX = 0
                    gemIconCounterLabel[currentIndex].anchorY = 1
                    gemIconCounterLabel[currentIndex].y = dollarIcon.y - 5
                    gemIconCounterLabel[currentIndex].x = gemIconCounterLabel[currentIndex - 1].x + xCalc(6)

                    gemIconCounterLabel[currentIndex + 1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                    gemIconCounterLabel[currentIndex + 1]:setSequence(string.sub(gemIconCounter, currentSequence, currentSequence))
                    --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    gemIconCounterLabel[currentIndex + 1].anchorX = 0
                    gemIconCounterLabel[currentIndex + 1].anchorY = 1
                    gemIconCounterLabel[currentIndex + 1].y = dollarIcon.y - 7
                    gemIconCounterLabel[currentIndex + 1].x = gemIconCounterLabel[currentIndex].x + xCalc(9)
                else
                    gemIconCounterLabel[currentIndex] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                    gemIconCounterLabel[currentIndex]:setSequence(string.sub(gemIconCounter, currentSequence, currentSequence))
                    --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    gemIconCounterLabel[currentIndex].anchorX = 0
                    gemIconCounterLabel[currentIndex].anchorY = 1
                    gemIconCounterLabel[currentIndex].y = dollarIcon.y - 7

                    if (currentIndex == 1) then
                        gemIconCounterLabel[currentIndex].x = xCalc(171)
                    else
                        gemIconCounterLabel[currentIndex].x = gemIconCounterLabel[currentIndex - 1].x + xCalc(10)
                    end
                end

            end

        else
            gemIcon:setSequence("question-mark")
                --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
                gemIcon.anchorX = 0
                gemIcon.anchorY = 1
                gemIcon.y = display.contentHeight - 5
                gemIcon.x = 125
                gemIcon.state = "coinsLabelHidden"
        end

        -------------------------
        --Shape Objects In Game--
        -------------------------
        --------- SCREEN 1
        local scrollViewPadding = xCalc(13)
        local scrollViewHeight = (display.contentHeight - (scrollViewPadding * 2) - 50)
        local scrollViewWidth = display.contentWidth
        
        scrollView = widget.newScrollView {
            top = 0,
            left = 0,
            verticalScrollDisabled = true,
            height = scrollViewHeight,
            width = scrollViewWidth,
            scrollWidth = (display.contentWidth * #levelConfigScript.worldConfigArray),
            scrollHeight = scrollViewHeight,
            hideBackground = true,
            listener = scrollListener
        }

        --scrollView:setReferencePoint(display.TopLeftReferencePoint);
        scrollView.anchorX = 0
        scrollView.anchorY = 0
        scrollView.x = 0
        scrollView.y = scrollViewPadding + yCalc(36)

        local xVal = scrollView.x + (display.contentWidth/ 2)
        local originalXVal = xVal
        local yVal = scrollView.y + yCalc(20)
        
        --Function to spawn an object

        local function spawn ()
            object = display.newImageRect("images/level-images/" .. thisWorldButtonValue .. "/Layout/WorldSelectTile.png", 350, 149)
            return object
        end

        local totalSilverMedals = 0
        local totalGoldMedals = 0

        totalWorlds = 0
        for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray) do
            totalWorlds = totalWorlds + 1
        end

      --   for a = 1, totalWorlds do
            -- for Key, Val in pairs (levelConfigScript.levelConfigArray) do
                
      --        totalLevels = 0
            --  for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[Key]) do
            --      print('sec ', secondKey, secondVal, Key)
            --      if myGameSettings[Key]["levels"][secondKey]["silver_gained"] == true then
            --          silverMedalCounter = silverMedalCounter + 1
            --      end
            --     end
            -- end
      --   end

        --Runtime:addEventListener( "enterFrame", storyboard.printMemUsage )
        --Spawn two objects

        i = 1

        for i = 1, #levelConfigScript.worldConfigArray do
            thisWorldButtonValue = levelConfigScript.worldConfigArray[i][1]
            --calculate if level is accessible

            worldButton[i] = spawn()

            --create scrollSelectArray
            worldButton[i].scrollSelectArray = {
                lowerLimit = -(display.contentWidth/2) + (display.contentWidth * (i - 1)),
                midWay = display.contentWidth * (i - 1),
                upperLimit = (display.contentWidth/2) + (display.contentWidth * (i - 1))
            }

            worldButton[i].accessible = true

            if (worldButton.goldAccessible == true)
            and (worldButton.silverAccessible == true) then
                worldButton[i].accessible = true
            end

            --[[
            if totalSilverMedals >= levelConfigArray[currentWorld]["level"..i]["silver"]["silver"] then
                levelButton[i].silverAccessible = true
            end

            if levelConfigArray[currentWorld]["level"..i]["silver"]["gold"] then
                if totalGoldMedals < levelConfigArray[currentWorld]["level"..i]["silver"]["gold"] then
                    levelButton[i].silverAccessible = false
                end
            end

            if totalSilverMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["silver"] then
                if levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
                    if totalGoldMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
                        levelButton[i].goldAccessible = true
                    end
                else
                    levelButton[i].goldAccessible = true
                end

                if levelConfigArray[currentWorld]["level"..i]["gold"]["gems"] then
                    if totalSilverMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["gems"] then
                        levelButton[i].gemsAccessible = true
                    end
                else
                    levelButton[i].gemsAccessible = true
                end
            end
            --]]
            
            --worldButton[i]:setReferencePoint(display.TopLeftReferencePoint);
            worldButton[i].anchorX = 0.5
            worldButton[i].anchorY = 0
            worldButton[i].x = xVal + xCalc(2)
            worldButton[i].y = yVal - yCalc(52)

            scrollView:insert(worldButton[i])

            local thisWorldSilverMedalsRequired = levelConfigScript.worldConfigArray[i][2]["silver"]
            local thisWorldGoldMedalsRequired = levelConfigScript.worldConfigArray[i][2]["gold"]
            local totalLevels = 0
            local silverMedalCounter = 0
            local goldMedalCounter = 0
            local gemCounter = 0
            for key, val in pairs(levelConfigScript.levelConfigArray[thisWorldButtonValue]) do
                totalLevels = totalLevels + 1
            end
            local thisWorldMedalTotal = totalLevels
            for a = 1, totalLevels do
                if myGameSettings[thisWorldButtonValue]["levels"][a]["silver_gained"] == true then
                    silverMedalCounter = silverMedalCounter + 1
                end
                if myGameSettings[thisWorldButtonValue]["levels"][a]["gold_gained"] == true then
                    goldMedalCounter = goldMedalCounter + 1
                end

                gemCounter = gemCounter + myGameSettings[thisWorldButtonValue]["levels"][a]["silver-achievements"]["purple_gems"]
                gemCounter = gemCounter + myGameSettings[thisWorldButtonValue]["levels"][a]["gold-achievements"]["purple_gems"]
            end

            local lastWorldThatWasUnlockedIndex = 1

            if silverMedalCounterInt >= thisWorldSilverMedalsRequired
            and goldMedalCounterInt >= thisWorldGoldMedalsRequired
            and myGameSettings["worldUnlocked"][thisWorldButtonValue] then
                worldButton[i].locked = false
                lastWorldThatWasUnlockedIndex = i
            else
                worldButton[i].locked = true
                if (i - lastWorldThatWasUnlockedIndex) > 1 then
                    worldButton[i].fullyBlocked = true
                else

                    worldButton[i].fullyBlocked = false
                end
            end

            if (worldButton[i].locked == true) then
                if (worldButton[i].fullyBlocked == true) then
                    worldButton[i].infoTile = display.newImageRect("images/central-images/Layout/WorldSelectTile-locked.png", 350, 58)
                else
                    worldButton[i].infoTile = display.newImageRect("images/central-images/Layout/WorldSelectTile-locked.png", 350, 58)
                end
            else
                worldButton[i].infoTile = display.newImageRect("images/central-images/Layout/WorldSelectTile-unlocked.png", 350, 58)
            end
            --worldButton[i].infoTile:setReferencePoint(display.TopLeftReferencePoint);
            worldButton[i].infoTile.anchorX = 0.5
            worldButton[i].infoTile.anchorY = 0
            worldButton[i].infoTile.x = worldButton[i].x + 0.5
            worldButton[i].infoTile.y = worldButton[i].y + 149.5
            scrollView:insert(worldButton[i].infoTile)

            worldButton[i].infoTile.silverMedalIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            worldButton[i].infoTile.silverMedalIcon:setSequence("silverMedal")
            worldButton[i].infoTile.silverMedalIcon.anchorX = 0
            worldButton[i].infoTile.silverMedalIcon.anchorY = 0
            worldButton[i].infoTile.silverMedalIcon.y = worldButton[i].y + 159

            --local silverMedalString = tostring(levelConfigScript.levelConfigArray[secondKey][""])

            worldButton[i].infoTile.silverMedalCounter = {}

            worldButton[i].infoTile.goldMedalIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
            worldButton[i].infoTile.goldMedalIcon:setSequence("goldMedal")
            worldButton[i].infoTile.goldMedalIcon.anchorX = 0
            worldButton[i].infoTile.goldMedalIcon.anchorY = 0
            worldButton[i].infoTile.goldMedalIcon.y = worldButton[i].y + 159

            worldButton[i].infoTile.goldMedalCounter = {}

            if worldButton[i].locked ~= true then
                local thisWorldMedalTotal = tostring(thisWorldMedalTotal)
                if #thisWorldMedalTotal == 1 then
                    thisWorldMedalTotal = '0' .. thisWorldMedalTotal
                end

                local thisWorldGoldMedalCounter = tostring(goldMedalCounter)
                if #thisWorldGoldMedalCounter == 1 then
                    thisWorldGoldMedalCounter = '0' .. thisWorldGoldMedalCounter
                end
                for a = 1, #thisWorldGoldMedalCounter do
                    worldButton[i].infoTile.goldMedalCounter[a] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                        worldButton[i].infoTile.goldMedalCounter[a]:setSequence((string.sub(thisWorldGoldMedalCounter, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.goldMedalCounter[a].anchorX = 0
                        worldButton[i].infoTile.goldMedalCounter[a].anchorY = 1
                        worldButton[i].infoTile.goldMedalCounter[a].y = worldButton[i].y + 183

                    if (a == 1) then
                        worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].x - 11
                    else
                        worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].infoTile.goldMedalCounter[a - 1].x + xCalc(10)
                    end

                    scrollView:insert(worldButton[i].infoTile.goldMedalCounter[a])
                end

                worldButton[i].infoTile.goldMedalCounter[3] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                    worldButton[i].infoTile.goldMedalCounter[3]:setSequence("/")
                    --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    worldButton[i].infoTile.goldMedalCounter[3].anchorX = 0
                    worldButton[i].infoTile.goldMedalCounter[3].anchorY = 1
                    worldButton[i].infoTile.goldMedalCounter[3].y = worldButton[i].y + 183
                    worldButton[i].infoTile.goldMedalCounter[3].x = worldButton[i].infoTile.goldMedalCounter[2].x + xCalc(10)
                scrollView:insert(worldButton[i].infoTile.goldMedalCounter[3])

                for a = 1, #thisWorldMedalTotal do
                    local currentCounter  = a + 3

                    worldButton[i].infoTile.goldMedalCounter[currentCounter] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                        worldButton[i].infoTile.goldMedalCounter[currentCounter]:setSequence((string.sub(thisWorldMedalTotal, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.goldMedalCounter[currentCounter].anchorX = 0
                        worldButton[i].infoTile.goldMedalCounter[currentCounter].anchorY = 1
                        worldButton[i].infoTile.goldMedalCounter[currentCounter].y = worldButton[i].y + 183
                        worldButton[i].infoTile.goldMedalCounter[currentCounter].x = worldButton[i].infoTile.goldMedalCounter[currentCounter - 1].x + xCalc(10)

                    scrollView:insert(worldButton[i].infoTile.goldMedalCounter[currentCounter])
                end


                local thisWorldSilverMedalCounter = tostring(silverMedalCounter)
                if #thisWorldSilverMedalCounter == 1 then
                    thisWorldSilverMedalCounter = '0' .. thisWorldSilverMedalCounter
                end
                for a = 1, #thisWorldSilverMedalCounter do
                    worldButton[i].infoTile.silverMedalCounter[a] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                        worldButton[i].infoTile.silverMedalCounter[a]:setSequence((string.sub(thisWorldSilverMedalCounter, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.silverMedalCounter[a].anchorX = 0
                        worldButton[i].infoTile.silverMedalCounter[a].anchorY = 1
                        worldButton[i].infoTile.silverMedalCounter[a].y = worldButton[i].y + 183

                    if (a == 1) then
                        worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].x + 81
                    else
                        worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].infoTile.silverMedalCounter[a - 1].x + xCalc(10)
                    end

                    scrollView:insert(worldButton[i].infoTile.silverMedalCounter[a])
                end

                worldButton[i].infoTile.silverMedalCounter[3] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                    worldButton[i].infoTile.silverMedalCounter[3]:setSequence("/")
                    --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                    worldButton[i].infoTile.silverMedalCounter[3].anchorX = 0
                    worldButton[i].infoTile.silverMedalCounter[3].anchorY = 1
                    worldButton[i].infoTile.silverMedalCounter[3].y = worldButton[i].y + 183
                    worldButton[i].infoTile.silverMedalCounter[3].x = worldButton[i].infoTile.silverMedalCounter[2].x + xCalc(10)
                scrollView:insert(worldButton[i].infoTile.silverMedalCounter[3])

                for a = 1, #thisWorldMedalTotal do
                    local currentCounter  = a + 3

                    worldButton[i].infoTile.silverMedalCounter[currentCounter] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                        worldButton[i].infoTile.silverMedalCounter[currentCounter]:setSequence((string.sub(thisWorldMedalTotal, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.silverMedalCounter[currentCounter].anchorX = 0
                        worldButton[i].infoTile.silverMedalCounter[currentCounter].anchorY = 1
                        worldButton[i].infoTile.silverMedalCounter[currentCounter].y = worldButton[i].y + 183
                        worldButton[i].infoTile.silverMedalCounter[currentCounter].x = worldButton[i].infoTile.silverMedalCounter[currentCounter - 1].x + xCalc(10)

                    scrollView:insert(worldButton[i].infoTile.silverMedalCounter[currentCounter])
                end
            else
                local thisWorldGoldMedalsRequiredLabel = tostring(thisWorldGoldMedalsRequired)

                for a = 1, #thisWorldGoldMedalsRequiredLabel do
                    worldButton[i].infoTile.goldMedalCounter[a] = display.newSprite(WorldLockedBarNumbersImageSheet, WorldLockedBarNumbersSequenceData)
                        worldButton[i].infoTile.goldMedalCounter[a]:setSequence((string.sub(thisWorldGoldMedalsRequiredLabel, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.goldMedalCounter[a].anchorX = 0
                        worldButton[i].infoTile.goldMedalCounter[a].anchorY = 1
                        worldButton[i].infoTile.goldMedalCounter[a].y = worldButton[i].y + 183

                    if (a == 1) then
                        if #thisWorldGoldMedalsRequiredLabel == 1 then
                            worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].x + 31
                        elseif #thisWorldGoldMedalsRequiredLabel == 2 then
                            worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].x + 27
                        elseif #thisWorldGoldMedalsRequiredLabel == 3 then
                            worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].x + 21
                        end
                    else
                        worldButton[i].infoTile.goldMedalCounter[a].x = worldButton[i].infoTile.goldMedalCounter[a - 1].x + xCalc(10)
                    end

                    scrollView:insert(worldButton[i].infoTile.goldMedalCounter[a])
                end

                local thisWorldSilverMedalsRequiredLabel = tostring(thisWorldSilverMedalsRequired)
                for a = 1, #thisWorldSilverMedalsRequiredLabel do
                    worldButton[i].infoTile.silverMedalCounter[a] = display.newSprite(WorldLockedBarNumbersImageSheet, WorldLockedBarNumbersSequenceData)
                        worldButton[i].infoTile.silverMedalCounter[a]:setSequence((string.sub(thisWorldSilverMedalsRequiredLabel, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].infoTile.silverMedalCounter[a].anchorX = 0
                        worldButton[i].infoTile.silverMedalCounter[a].anchorY = 1
                        worldButton[i].infoTile.silverMedalCounter[a].y = worldButton[i].y + 183

                    if (a == 1) then
                        if #thisWorldSilverMedalsRequiredLabel == 1 then
                            worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].x + 113
                        elseif #thisWorldSilverMedalsRequiredLabel == 2 then
                            worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].x + 108
                        elseif #thisWorldSilverMedalsRequiredLabel == 3 then
                            worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].x + 104
                        end
                    else
                        worldButton[i].infoTile.silverMedalCounter[a].x = worldButton[i].infoTile.silverMedalCounter[a - 1].x + xCalc(10)
                    end

                    scrollView:insert(worldButton[i].infoTile.silverMedalCounter[a])
                end
            end


            --[[
            if silverMedalCounterInt >= thisWorldSilverMedalsRequired
            and goldMedalCounterInt >= thisWorldGoldMedalsRequired
            and myGameSettings["worldUnlocked"][thisWorldButtonValue] then
                worldButton[i].locked = false
                lastWorldThatWasUnlockedIndex = i
            else
                worldButton[i].locked = true
                if (i - lastWorldThatWasUnlockedIndex) > 1 then
                    worldButton[i].fullyBlocked = true
                else

                    worldButton[i].fullyBlocked = false
                end
            end

            --]]


            if (worldButton[i].locked == true) then
                worldButton[i].infoTile.silverMedalIcon.x = worldButton[i].x - 15

                worldButton[i].infoTile.goldMedalIcon.x = worldButton[i].x + 65

                if (worldButton[i].fullyBlocked == true) then

                else

                    print("start print")

                    --[[
                    print(silverMedalCounter, thisWorldButtonValue)

                    print(sliverMedalCounterInt, thisWorldSilverMedalsRequired, goldMedalCounterInt)
                    print(thisWorldGoldMedalsRequired, myGameSettings["worldUnlocked"][thisWorldButtonValue])
                    ]]

                    print("silverMedalCounterInt: ", silverMedalCounterInt)
                    print("thisWorldSilverMedalsRequired: ", thisWorldSilverMedalsRequired)

                    print("1 >= 2 and ")

                    print("goldmedalCounterInt: ", goldMedalCounterInt)
                    print("thisWorldGoldMedalRequired: ", thisWorldGoldMedalRequired)

                    print("3 >= 4 and true")

                    print("myGameSettings[worldUnlock][thisWorldButtonValue]: ", myGameSettings["worldUnlocked"][thisWorldButtonValue])

                    print("else")
                    print(">1? ", (i - lastWorldThatWasUnlockedIndex))
                    print("end print")


                    --worldButton[i].overlay = display.newImage("images/central-images/Layout/WorldSelectTile-overlay.png")
                    worldButton[i].overlay = display.newImage("images/central-images/Layout/WorldSelectTile-unlocked.png")
                    
                    --if worldButton[i].overlay then
                        print("worldButton Exist")
                        worldButton[i].overlay:addEventListener("tap", levelVariables.openIAP)
                   -- else
                        print("worldButton not exist")
                   -- end

                end

                if worldButton[i].overlay then 
                    worldButton[i].overlay.anchorX = 0
                    worldButton[i].overlay.anchorY = 0
                    worldButton[i].overlay.x = worldButton[i].x - (worldButton[i].contentWidth/2) - 1
                    worldButton[i].overlay.y = worldButton[i].y - 2
                    worldButton[i].overlay.value = "Unlock"
                    worldButton[i].overlay.relBool = true
                    scrollView:insert(worldButton[i].overlay)
                end

            else
                worldButton[i].infoTile.silverMedalIcon.x = worldButton[i].x - 40

                worldButton[i].infoTile.goldMedalIcon.x = worldButton[i].x + 50
            end

            scrollView:insert(worldButton[i].infoTile.silverMedalIcon)
            scrollView:insert(worldButton[i].infoTile.goldMedalIcon)


            worldButton[i].valueTextButton = display.newImageRect("images/central-images/buttons/WorldSelectScene-WorldCounter.png", 55, 47)
            --worldButton[i].valueTextButton:setReferencePoint(display.TopLeftReferencePoint);
            worldButton[i].valueTextButton.anchorX = 0.5
            worldButton[i].valueTextButton.anchorY = 0
            worldButton[i].valueTextButton.x = worldButton[i].x - (worldButton[i].contentWidth/2)
            worldButton[i].valueTextButton.y = worldButton[i].y - yCalc(7)
            scrollView:insert(worldButton[i].valueTextButton)

            local levelSelectNumberImageSheet = graphics.newImageSheet( "images/central-images/Numbers/worldSelectWorldNumbers.png", {width = 24, height = 27, numFrames = 9, sheetContentWidth = 216, sheetContentHeight = 27})
            local levelSelectNumberSequenceData = {
                { name = "1", start=1, count=1, loopCount=1 },
                { name = "2", start=2, count=1, loopCount=1 },
                { name = "3", start=3, count=1, loopCount=1 },
                { name = "4", start=4, count=1, loopCount=1 },
                { name = "5", start=5, count=1, loopCount=1 },
                { name = "6", start=6, count=1, loopCount=1 },
                { name = "7", start=7, count=1, loopCount=1 },
                { name = "8", start=8, count=1, loopCount=1 },
                { name = "9", start=9, count=1, loopCount=1 }
            }

            worldButton[i].valueText = display.newSprite(levelSelectNumberImageSheet, levelSelectNumberSequenceData)
            worldButton[i].valueText:setSequence(i)
            --worldButton[i].valueText:setReferencePoint(display.TopLeftReferencePoint);
            worldButton[i].valueText.anchorX = 0.5
            worldButton[i].valueText.anchorY = 0
            worldButton[i].valueText.x = worldButton[i].x - (worldButton[i].contentWidth/2) - 2
            worldButton[i].valueText.y = worldButton[i].y + yCalc(1)
            scrollView:insert(worldButton[i].valueText)
            worldButton[i].valueText:toFront()
            worldButton[i].value = levelConfigScript.worldConfigArray[i][1]

            if myGameSettings["gems_discovered_second"] == true
            and (worldButton[i].locked ~= true) then
                worldButton[i].gemIcon = display.newImageRect("images/central-images/Layout/WorldSelectTileGemDisplay.png", 100, 45)
                --worldButton[i].gemIcon:setReferencePoint(display.TopLeftReferencePoint);
                worldButton[i].gemIcon.anchorX = 0
                worldButton[i].gemIcon.anchorY = 0
                worldButton[i].gemIcon.x = worldButton[i].x - 166
                worldButton[i].gemIcon.y = worldButton[i].y + 152
                scrollView:insert(worldButton[i].gemIcon)
                worldButton[i].gemIcon:toFront()

                local thisWorldGemCounter = tostring(gemCounter)
                if (#thisWorldGemCounter == 1) then
                    thisWorldGemCounter = '00' .. thisWorldGemCounter
                elseif (#thisWorldGemCounter == 2) then
                    thisWorldGemCounter = '0' .. thisWorldGemCounter
                end

                worldButton[i].gemCounterLabel = {}
                for a = 1, #thisWorldGemCounter do
                    worldButton[i].gemCounterLabel[a] = display.newSprite(WorldUnlockedBarNumbersImageSheet, WorldUnlockedBarNumbersSequenceData)
                        worldButton[i].gemCounterLabel[a]:setSequence((string.sub(thisWorldGemCounter, a, a)))
                        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
                        worldButton[i].gemCounterLabel[a].anchorX = 0
                        worldButton[i].gemCounterLabel[a].anchorY = 1
                        worldButton[i].gemCounterLabel[a].y = worldButton[i].y + 183

                    if (a == 1) then
                        worldButton[i].gemCounterLabel[a].x = worldButton[i].x - 121
                    else
                        worldButton[i].gemCounterLabel[a].x = worldButton[i].gemCounterLabel[a - 1].x + xCalc(10)
                    end

                    scrollView:insert(worldButton[i].gemCounterLabel[a])
                end

                
            end


            if worldButton[i].locked ~= true then
                worldButton[i]:addEventListener("tap", goToLevel)
            end

            
            xVal = xVal + display.contentWidth

            i = i + 1
        end
        
        scrollView:setScrollWidth(display.contentWidth * (#levelConfigScript.worldConfigArray) );

        sceneGroup:insert(scrollView)
        sceneGroup:insert(backgroundObjects)

        for a = 1, #worldButton do
            if worldButton[a].value == myGameSettings["worldSelectLastWorld"] then
                scrollView:scrollToPosition( { x = worldButton[a].scrollSelectArray["midWay"] * -1, time = 1 } )
                currentWorldViewing = worldButton[a].value
            end
        end

        backgroundObjects:toBack()
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        audio.stop(musicChannel["worldSelect"])
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        levelVariables.backButton:removeEventListener("tap", backBtn)
        dollarPlusSign:removeEventListener("tap", levelVariables.openIAP) 
        livesPlusSign:removeEventListener("tap", levelVariables.openIAP)

        dollarIcon:removeSelf()
        dollarIcon = nil
        for a = 1, #dollarCounter do
            dollarCounter[a]:removeSelf()
            dollarCounter[a] = nil
        end
        dollarPlusSign:removeSelf()
        dollarPlusSign = nil
        livesIcon:removeSelf()
        livesIcon = nil
        for a = 1, #livesCounter do
            livesCounter[a]:removeSelf()
            livesCounter[a] = nil
        end
        livesPlusSign:removeSelf()
        livesPlusSign = nil

        for a = 1, #goldMedalCounterLabel do
            goldMedalCounterLabel[a]:removeSelf()
            goldMedalCounterLabel[a] = nil
        end

        for a = 1, #silverMedalCounterLabel do
            silverMedalCounterLabel[a]:removeSelf()
            silverMedalCounterLabel[a] = nil
        end

        gemIcon:removeSelf()
        gemIcon = nil
        if (myGameSettings["gems_discovered_second"] == true) then
            for a = 1, #gemIconCounterLabel do
                gemIconCounterLabel[a]:removeSelf()
                gemIconCounterLabel[a] = nil
            end
        end

        levelVariables.backButton:removeEventListener("tap", backBtn)
        levelVariables.backButton:removeSelf()
        levelVariables.backButton = nil
        --itemBagButton:removeSelf()
        --itemBagButton = nil
        
        for a = 1, #worldButton do
            worldButton[a]:removeEventListener("touch", goToLevel)
            worldButton[a].infoTile:removeSelf()
            worldButton[a].infoTile = nil
            if (worldButton[a].valueText) then
                worldButton[a].valueText:removeSelf()
                worldButton[a].valueText = nil
                worldButton[a].valueTextButton:removeSelf()
                worldButton[a].valueTextButton = nil
            end
            if myGameSettings["gems_discovered_second"] == true then
                if (worldButton[a].gemIcon) then
                    worldButton[a].gemIcon:removeSelf()
                    worldButton[a].gemIcon = nil
               end
            end
            if (worldButton[a].overlay) then
                worldButton[a].overlay:removeSelf()
                worldButton[a].overlay = nil
            end
            worldButton[a]:removeSelf()
            worldButton[a] = nil
        end

        if (medalChooseScreen) then
            if medalChooseScreen.showing == true then
                silverMedalButton:removeEventListener("touch", touchMedalButton)
                goldMedalButton:removeEventListener("touch", touchMedalButton)
                closeButton:removeEventListener("touch", closeMedalScreen)
            end

            medalChooseScreen:removeSelf()
            medalChooseScreen = nil
            silverMedalButton.valueText:removeSelf()
            silverMedalButton.valueText = nil
            silverMedalButton:removeSelf()
            silverMedalButton = nil
            goldMedalButton.valueText:removeSelf()
            goldMedalButton.valueText = nil
            goldMedalButton:removeSelf()
            goldMedalButton = nil
            closeButton:removeSelf()
            closeButton = nil
        end
        background:removeSelf()
        background = nil

        scrollView:removeSelf()
        scrollView = nil

        local checkGroup, loopThroughGroup

        function checkGroup (objectsGroup)
            groupCounter = 0

            for a=1, objectsGroup.numChildren do
                if (objectsGroup[a] ~= nil) then
                    groupCounter = groupCounter + 1
                end
            end
            if (groupCounter > 0) then
                loopThroughGroup(objectsGroup)
            end
        end

        function loopThroughGroup (objectsGroup)
            for a=1, objectsGroup.numChildren do
                if (objectsGroup[a] ~= nil) then
                    objectsGroup[a].alpha = 1
                    --print('xCord: ', objectsGroup[a].x, ' -- ', objectsGroup[a].y, '-', objectsGroup.numChildren)
                    --[[
                    if (objectsGroup == mainFunc.allLevelSettings.backgroundObjectsGroup) then
                        print('bg')
                        --objectsGroup:remove(objectsGroup[a])
                    elseif (objectsGroup == mainFunc.allLevelSettings.frontScreenObjectsGroup) then
                        print('frontScreen')
                    elseif (objectsGroup == mainFunc.allLevelSettings.screenObjectsGroup) then
                        print('screen')
                    elseif (objectsGroup == mainFunc.allLevelSettings.itemScreenObjectsGroup) then
                        print('itemscreen')
                    elseif (objectsGroup == mainFunc.allLevelSettings.pauseScreenObjectsGroup) then
                        print('pausescreen')
                    end
                    ]]
                    objectsGroup[a]:removeSelf()
                    objectsGroup[a] = nil
                else
                    --print('Nil ', objectsGroup.numChildren)
                    objectsGroup:remove(objectsGroup[a])
                end
            end

            checkGroup(objectsGroup)
        end
        if levelVariables.IAPScreenObjectsGroup then
            checkGroup(levelVariables.IAPScreenObjectsGroup)
        end

        levelVariables = {}
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    
        --composer.removeScene("WorldSelectScene")


        --[[
        for a = 1, #levelVariables.toolArray do
            levelVariables.toolArray[a][4] = "not-created"
        end

        if (levelVariables.toolsShown == true) then
            -- need to remove all tool images etc
        end

        if (levelVariables.objectsShown == true) then
            -- need to remove all objects images etc
        end
        ]]
        
        --[[
        scrollView:removeSelf()
        scrollView = nil
        ]]
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene