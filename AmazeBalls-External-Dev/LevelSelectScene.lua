local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
widget.setTheme ( "widget_theme_ios" )
-- Clear previous scene
--storyboard.removeAll()

--display.setDefault( "background", 243, 245, 177 )
display.setStatusBar( display.HiddenStatusBar )



local levelButton, totalLevels, thisLevelButton, scrollView, medalChooseScreen, silverMedalButton, goldMedalButton, scrollView, totalToolArray, toolArray, levelVariables, ItemBagBtnFunction, dollarCounter, dollarIcon, showCoinsLabel, background
local v, touchButton, playNowButton, goldLockedBG, goldLockedText, goldLockedSilverIcon, goldLockedSilverMedalCounter, silverGemIcons, goldGemIcons, goldGemCounterFirstDigit, goldGemCounterSecondDigit, silverCoinsIconArray, goldCoinsIconArray
local blackOverlay, coinCounter, lives, livesCounter, mainIconBar, medalScreenGroup, dollarPlusSign, livesPlusSign, itemBag, backBtn, goToLevel, goldMedalCounterLabel, silverMedalCounterLabel, gemIcon, openIAP, closeIAP, addBackEventListenersFromIAP, checkAvailabilityOfBuyButtonToShow, checkAvailabilityOfBuyButtonToHide, removeIAPScreenListeners
local IAPScript, prepareCreateYouhaveDisplay, addBackBuyButtonListener, buyButtonPressed, closePurchaseScreen, itemsImageSheet, itemsSequenceData, toggleShapeOrToolView, backgroundMusic
local levelButton = {}
local levelVariables = {}
local silverMedalGainedIcon = {}
local goldMedalGainedIcon = {}
local mainFunc = {}

local dummyScrollView = display.newGroup()
local backgroundObjects = display.newGroup()
local foregroundObjects = display.newGroup()
local itemScreenObjects = display.newGroup()

local mediumIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Medium-icons.png", {width = 42, height = 52, numFrames = 4, sheetContentWidth = 168, sheetContentHeight = 52})
local mediumIconsSequenceData = {
    { name = "padlock", start=1, count=1,   loopCount=1 },
    { name = "silverMedal", start=2, count=1, loopCount=1 },
    { name = "goldMedal", start=3, count=1, loopCount=1 },
    { name = "missingMedal", start=4, count=1,   loopCount=1 }
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
--myGameSettings = loadTable("myGameSettings.json")

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

local function dummyListener(event)
    return true
end

function openIAP (event)
    local button = event.target
    button:removeEventListener("tap", levelVariables.openIAP)
    timer.performWithDelay(100, function ()
        button:addEventListener("tap", levelVariables.openIAP)
    end)
    backgroundObjects:toBack()
    foregroundObjects:toBack()

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

    timer.performWithDelay(400, function ()
    	foregroundObjects:toFront()
    	backgroundObjects:toFront()
    end)
    
end

function addBackEventListenersFromIAP (event)
    --addBackBackgroundEventListeners()
end

    ----IAP RELATED ENDS


function itemBag (event)
	buttonClick(levelVariables.itemBagBtn, 8)
	levelVariables.ItemBagBtnFunction(levelVariables, nil, nil, nil, "levelSelect", nil)
	itemScreenObjects:toFront()
end

function backBtn (event)
	buttonClick(event.target, 78)
	timer.performWithDelay(100, composer.gotoScene("WorldSelectScene", {effect = "crossFade", time = 150} ))
	return true
end

function goToLevel (event)
    -- simply go to level1.lua scene
    --purge level
    
    currentLevel = thisLevelButton.value
    currentMedal = thisMedalButton.value
    currentLevelLabel = currentLevel .. "-" .. thisMedalButton.value
    composer.gotoScene( "Main-Level", "fade", 150 )
     
    return true -- indicates successful touch
end

local function touchMedalButton (event)
	thisMedalButton = event.target
	goToLevel()
end

local function touchMedalAchievedButton (event)
	local function handleButton(button, secondButton, targetAlpha)
		transition.to(button, {alpha = targetAlpha, time = 100})
		if (targetAlpha == 0) then
			button:removeEventListener("touch", touchMedalButton)
			secondButton:removeEventListener("touch", touchMedalButton)
		elseif (targetAlpha == 1) then
			button:addEventListener("touch", touchMedalButton)
			secondButton:addEventListener("touch", touchMedalButton)
		end
	end

	local function handleAchievedBar(bar, targetAlpha)
		transition.to(bar, {alpha = targetAlpha, time = 100})
	end

	if (event.target.state == "closed") then
		if event.target.value == "silver" then
			handleButton(silverPlayNowLogo, silverMedalButton, 0)
			handleAchievedBar(silverAchievedText, 1)
		else
			handleButton(goldPlayNowLogo, goldMedalButton, 0)
			handleAchievedBar(goldAchievedText, 1)
		end
		event.target:setSequence("open")
		event.target.state = "open"
	elseif (event.target.state == "open") then
		if event.target.value == "silver" then
			handleButton(silverPlayNowLogo, silverMedalButton, 1)
			handleAchievedBar(silverAchievedText, 0)
		else
			handleButton(goldPlayNowLogo, goldMedalButton, 1)
			handleAchievedBar(goldAchievedText, 0)
		end
		event.target:setSequence("closed")
		event.target.state = "closed"
	end
end

local function closeMedalScreen (event)
	silverMedalButton:removeEventListener("touch", touchMedalButton)
	closeButton:removeEventListener("touch", closeMedalScreen)

	medalChooseScreen.showing = false

	if (levelButton[v].silverGained == true) then
		silverMedalAchievedButton:removeEventListener("tap", touchMedalAchievedButton)

		if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["red_coin"] == 1 then
			silverCoinsIconArray["redCoin"].alpha = 0
		end
		if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["blue_coin"] == 1 then
			silverCoinsIconArray["blueCoin"].alpha = 0
		end
		if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["purple_coin"] == 1 then
			silverCoinsIconArray["purpleCoin"].alpha = 0
		end
	else
		--hide simple play now logo
		
	end

	if (silverPlayNowLogo.alpha == 1) then
		silverPlayNowLogo:removeEventListener("touch", touchMedalButton)
	end

	if (levelButton[v].goldGained == true) then
		goldMedalAchievedButton:removeEventListener("tap", touchMedalAchievedButton)

		if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["red_coin"] == 1 then
			goldCoinsIconArray["redCoin"].alpha = 0
		end
		if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["blue_coin"] == 1 then
			goldCoinsIconArray["blueCoin"].alpha = 0
		end
		if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["purple_coin"] == 1 then
			goldCoinsIconArray["purpleCoin"].alpha = 0
		end
		
	else
		if (levelButton[v].goldAccessible == true) then
			goldMedalButton:removeEventListener("touch", touchMedalButton)
		end
	end

	silverMedalButton:removeEventListener("touch", touchMedalButton)
	silverPlayNowLogo:removeEventListener("touch", touchMedalButton)

	if (levelButton[v].silverGained == true) then
		transition.to(silverMedalAchievedButton, {alpha = 0, time = 80, onComplete = function ()
			silverMedalAchievedButton:removeEventListener("tap", touchMedalAchievedButton)
		end})
	end

	if (levelButton[v].goldGained == true) then
		transition.to(goldMedalAchievedButton, {alpha = 0, time = 80, onComplete = function ()
			goldMedalAchievedButton:removeEventListener("tap", touchMedalAchievedButton)
		end})
	end

	if (levelButton[v].goldAccessible == true) then
		goldMedalButton:removeEventListener("touch", touchMedalButton)
		goldPlayNowLogo:removeEventListener("touch", touchMedalButton)
	end


	closeButton:removeEventListener("touch", closeMedalScreen)
    blackOverlay:removeEventListener("touch", dummyListener)
	transition.to(closeButton, {alpha = 0, time = 80, onComplete = function ()
		transition.to(medalScreenGroup, {y = medalScreenGroup.y + 30, time= 15, onComplete = function ()
			transition.to(blackOverlay, {alpha = 0, time = 80})
			transition.to(medalScreenGroup, {y = medalScreenGroup.y - display.contentHeight - 30, time = 120, onComplete = function ()

				medalChooseScreen.showing = false

				for a = 1, #levelButton do
					if (levelButton[a].silverAccessible == true) then
			        	levelButton[a]:addEventListener("tap", touchButton)
			        end
			    end

				timer.performWithDelay(500, function ()
					levelVariables.backButton:addEventListener("tap", backBtn)
                    if levelVariables.thisLevelSettings.itemBagButtonsVisible then
					   levelVariables.itemBagBtn:addEventListener("tap", itemBag)
                    end
				end)
				scrollView._view._isHorizontalScrollingDisabled = false
			end})
		end})
	end})

end

local function openMedalScreen ()
    -- effectively remove listeners from rest of screen
    transition.to(blackOverlay, {alpha = 0.55, time = 20})
    blackOverlay:addEventListener("tap", dummyListener)
    blackOverlay:addEventListener("touch", dummyListener)

    -- find out level settings
    local shapeArrayParameters = {}
    levelVariables.allLevelSettings.transitionArrayIndex = {}
    local thisLevelSilverShapeParams = require("modules.levels." .. currentWorld .. ".level" .. thisLevelButton.value .. "-silver")
    thisLevelSilverShapeParams.createLevelObjects(levelVariables, shapeArrayParameters)
    --local thisLevelGoldShapeParams = require("modules.levels." .. currentWorld .. ".level" .. thisLevelButton.value .. "-gold")

    local totalSilverGems = 0
    local totalSilverGemsGained = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["silver-achievements"]["purple_gems"]
    local totalSilverGemsGainedString = tostring(totalSilverGemsGained)
    local totalGoldGems = 0
    local totalGoldGemsGained = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["gold-achievements"]["purple_gems"]
    local totalGoldGemsGainedString = tostring(totalGoldGemsGained)

    for a = 1, #shapeArrayParameters do
        if (shapeArrayParameters[a][1] == "gem" and shapeArrayParameters[a][7] == "purple") then
            totalSilverGems = totalSilverGems + 1
        end
    end
    local totalSilverGemsString = tostring(totalSilverGems)

    local silverBestTimeMinutes = math.floor(myGameSettings[currentWorld]["levels"][thisLevelButton.value]["silver-achievements"]["best_time_seconds_left"]/60)
    local silverBestTimeSeconds = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["silver-achievements"]["best_time_seconds_left"] - (silverBestTimeMinutes*60)
    local silverFirstTimeMinutes = math.floor(myGameSettings[currentWorld]["levels"][thisLevelButton.value]["silver-achievements"]["first_time_seconds_left"]/60)
    local silverFirstTimeSeconds = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["silver-achievements"]["first_time_seconds_left"] - (silverFirstTimeMinutes*60)

    levelVariables.globalImageCreateFunctions.createLevelTimeString(silverBestTimeSeconds, silverBestTimeMinutes, silverBestTimeCounter, false)
    levelVariables.globalImageCreateFunctions.createLevelTimeString(silverFirstTimeSeconds, silverFirstTimeMinutes, silverFirstTimeCounter, false)

    local goldBestTimeMinutes = math.floor(myGameSettings[currentWorld]["levels"][thisLevelButton.value]["gold-achievements"]["best_time_seconds_left"]/60)
    local goldBestTimeSeconds = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["gold-achievements"]["best_time_seconds_left"] - (goldBestTimeMinutes*60)
    local goldFirstTimeMinutes = math.floor(myGameSettings[currentWorld]["levels"][thisLevelButton.value]["gold-achievements"]["first_time_seconds_left"]/60)
    local goldFirstTimeSeconds = myGameSettings[currentWorld]["levels"][thisLevelButton.value]["gold-achievements"]["first_time_seconds_left"] - (goldFirstTimeMinutes*60)

    levelVariables.globalImageCreateFunctions.createLevelTimeString(goldBestTimeSeconds, goldBestTimeMinutes, goldBestTimeCounter, false)
    levelVariables.globalImageCreateFunctions.createLevelTimeString(goldFirstTimeSeconds, goldFirstTimeMinutes, goldFirstTimeCounter, false)
--[[
    for a = 1, #thisLevelSilverShapeParams do
        if (thisLevelGoldShapeParams[a][1] == "gem" and thisLevelGoldShapeParams[a][7] == "purple") then
            totalGoldGems = totalGoldGems + 1
        end
    end     ]]

	v = thisLevelButton.value

    -- set sequences

	local levelCounter = tostring( thisLevelButton.value )
	if thisLevelButton.value < 10 then
		medalScreenLevelCounter[0].alpha = 0
		--medalScreenLevelCounter[1]:setSequence(levelCounter[2])
		medalScreenLevelCounter[1].x = medalChooseScreen.x - 9
	elseif thisLevelButton.value > 9
	and thisLevelButton.value < 100 then
		medalScreenLevelCounter[0].alpha = 1
		medalScreenLevelCounter[0]:setSequence(string.sub(levelCounter, #levelCounter - 1, #levelCounter - 1))
		--medalScreenLevelCounter[1]:setSequence(levelCounter[1])
		medalScreenLevelCounter[1].x = medalChooseScreen.x - 2
	end

	medalScreenLevelCounter[1]:setSequence( string.sub(levelCounter, #levelCounter, #levelCounter) )

    if totalSilverGemsGained > 9 then
        silverGemCounter[1]:setSequence(string.sub(totalSilverGemsGainedString, 1, 1) )
        silverGemCounter[2]:setSequence(string.sub(totalSilverGemsGainedString, 2, 2) )
    else
        silverGemCounter[1]:setSequence('0')
        silverGemCounter[2]:setSequence(string.sub(totalSilverGemsGainedString, 1, 1) )
    end

    if totalSilverGems > 9 then
        silverGemCounter[4]:setSequence(string.sub(totalSilverGemsString, 1, 1) )
        silverGemCounter[5]:setSequence(string.sub(totalSilverGemsString, 2, 2) )
    else
        silverGemCounter[4]:setSequence('0')
        silverGemCounter[5]:setSequence(string.sub(totalSilverGemsString, 1, 1) )
    end

    -- set alphas

    if totalSilverGems > 0 then
        silverGemLockedIcon.alpha = 0
        silverCoinsLockedIcon.alpha = 0
    else
        silverGemLockedIcon.alpha = 1
        silverCoinsLockedIcon.alpha = 1
    end
    silverAchievedText.alpha = 0
    goldAchievedText.alpha = 0

	local alphaForSilverAchievedStats = 0

	if (levelButton[v].silverGained == true) then

		silverMedalAchievedButton:setSequence("closed")
		silverMedalAchievedButton.state = "closed"

        if totalSilverGems > 0 then
		  alphaForSilverAchievedStats = 1
        end
	end

	silverGemIcons.alpha = alphaForSilverAchievedStats
    for a = 1, #silverGemCounter do
        silverGemCounter[a].alpha = alphaForSilverAchievedStats
    end

	if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["red_coin"] == 1 then
		silverCoinsIconArray["redCoin"].alpha = alphaForSilverAchievedStats
	end
	if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["blue_coin"] == 1 then
		silverCoinsIconArray["blueCoin"].alpha = alphaForSilverAchievedStats
	end
	if myGameSettings[currentWorld]["levels"][v]["silver-achievements"]["purple_coin"] == 1 then
		silverCoinsIconArray["purpleCoin"].alpha = alphaForSilverAchievedStats
	end

	silverPlayNowLogo.alpha = 1
	silverPlayNowLogo:toFront()

	local alphaForGoldAchievedStats = 0

	if (levelButton[v].goldGained == true) then

		goldMedalAchievedButton:setSequence("closed")
		goldMedalAchievedButton.state = "closed"

		alphaForGoldAchievedStats = 1
	end

	goldGemIcons.alpha = alphaForGoldAchievedStats
	goldGemCounterFirstDigit.alpha = alphaForGoldAchievedStats
	goldGemCounterSecondDigit.alpha = alphaForGoldAchievedStats
	goldBestTimeIcon.alpha = alphaForGoldAchievedStats
	for a = 1, #goldBestTimeCounter do
		goldBestTimeCounter[a].alpha = alphaForGoldAchievedStats
	end
	goldFirstTimeIcon.alpha = alphaForGoldAchievedStats
	for a = 1, #goldFirstTimeCounter do
		goldFirstTimeCounter[a].alpha = alphaForGoldAchievedStats
	end

	if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["red_coin"] == 1 then
		goldCoinsIconArray["redCoin"].alpha = alphaForGoldAchievedStats
	end
	if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["blue_coin"] == 1 then
		goldCoinsIconArray["blueCoin"].alpha = alphaForGoldAchievedStats
	end
	if myGameSettings[currentWorld]["levels"][v]["gold-achievements"]["purple_coin"] == 1 then
		goldCoinsIconArray["purpleCoin"].alpha = alphaForGoldAchievedStats
	end

	local function toggleSilverLockedStats (state)
		local relAlpha
		if (state == "show") then
			relAlpha = 1
			goldLockedSilverIcon:toFront()
			goldLockedSilverMedalCounter[1]:toFront()
			goldLockedSilverMedalCounter[2]:toFront()
			goldLockedSilverMedalCounter[3]:toFront()

			if levelButton[v].goldNeededForGold then
				goldLockedSilverIcon.y = medalChooseScreen.y + yCalc(45)
			else
				goldLockedSilverIcon.y = medalChooseScreen.y + yCalc(8)
			end
			for a = 1, #goldLockedSilverMedalCounter do
				goldLockedSilverMedalCounter[a].y = goldLockedSilverIcon.y + yCalc(6)
			end
		else
			relAlpha = 0
		end

		goldLockedSilverIcon.alpha = relAlpha
		goldLockedSilverMedalCounter[1].alpha = relAlpha
		goldLockedSilverMedalCounter[2].alpha = relAlpha
		if levelButton[v].goldNeededForGold then
			if levelButton[v].goldNeededForGold > 99 then
				goldLockedSilverMedalCounter[1].alpha = relAlpha
			end
			if levelButton[v].goldNeededForGold > 9 then
				goldLockedSilverMedalCounter[2].alpha = relAlpha
			end
		end
		goldLockedSilverMedalCounter[3].alpha = relAlpha
	end

	local function toggleGoldLockedStats (state)
		local relAlpha
		if (state == "show") then
			relAlpha = 1
			goldLockedGoldIcon:toFront()
			goldLockedGoldMedalCounter[1]:toFront()
			goldLockedGoldMedalCounter[2]:toFront()
			goldLockedGoldMedalCounter[3]:toFront()
		else
			relAlpha = 0
		end

		goldLockedGoldIcon.alpha = relAlpha
		goldLockedGoldMedalCounter[1].alpha = relAlpha
		goldLockedGoldMedalCounter[2].alpha = relAlpha
		if levelButton[v].goldNeededForGold then
			if levelButton[v].goldNeededForGold > 99 then
				goldLockedGoldMedalCounter[1].alpha = relAlpha
			end
			if levelButton[v].goldNeededForGold > 9 then
				goldLockedGoldMedalCounter[2].alpha = relAlpha
			end
		end
		goldLockedGoldMedalCounter[3].alpha = relAlpha
	end

	if (levelButton[v].goldAccessible == true) then
		goldLockedBG:toBack()
		toggleSilverLockedStats("hide")
		toggleGoldLockedStats("hide")

		goldPlayNowLogo.alpha = 1
		goldPlayNowLogo:toFront()
	else
		-- show locked requirements
		goldLockedBG:toFront()
		-- if silver is in requirements
		if levelButton[v].silverNeededForGold then
			toggleSilverLockedStats("show")
		else
			toggleSilverLockedStats("hide")
		end

		-- if gold is in requirements
		if levelButton[v].goldNeededForGold then
			toggleGoldLockedStats("show")
		else
			toggleGoldLockedStats("hide")
		end
		--[[
		goldLockedSilverIcon:toFront()
		goldLockedSilverMedalCounter[1]:toFront()
		goldLockedSilverMedalCounter[2]:toFront()
		if levelButton[v].silverNeededForGold > 99 then
			goldLockedSilverMedalCounter[1]:toFront()
		end
		if levelButton[v].silverNeededForGold > 9 then
			goldLockedSilverMedalCounter[2]:toFront()
		end
		goldLockedSilverMedalCounter[3]:toFront() ]]

		goldPlayNowLogo.alpha = 0
		goldPlayNowLogo:toBack()
	end

	transition.to(medalScreenGroup, {y = medalScreenGroup.y + display.contentHeight + 30, time = 120, onComplete = function ()
		transition.to(medalScreenGroup, {y = medalScreenGroup.y - 30, time = 15, onComplete = function ()
			silverMedalButton:addEventListener("touch", touchMedalButton)
			silverPlayNowLogo:addEventListener("touch", touchMedalButton)

			if (levelButton[v].silverGained == true) then
				transition.to(silverMedalAchievedButton, {alpha = 1, time = 100, onComplete = function ()
					silverMedalAchievedButton:addEventListener("tap", touchMedalAchievedButton)
				end})
			end

			if (levelButton[v].goldGained == true) then
				transition.to(goldMedalAchievedButton, {alpha = 1, time = 100, onComplete = function ()
					goldMedalAchievedButton:addEventListener("tap", touchMedalAchievedButton)
				end})
			end

			if (levelButton[v].goldAccessible == true) then
				goldMedalButton:addEventListener("touch", touchMedalButton)
				goldPlayNowLogo:addEventListener("touch", touchMedalButton)
			end

			medalChooseScreen.showing = true
			transition.to(closeButton, {alpha = 1, time = 100, onComplete = function ()
				closeButton:addEventListener("touch", closeMedalScreen)
			end})
		end})
	end})
end
    
function touchButton (event)
	scrollView._view._isHorizontalScrollingDisabled = true

	levelVariables.itemBagBtn:removeEventListener("tap", itemBag)
	levelVariables.backButton:removeEventListener("tap", backBtn)
    --if event.phase == "began" then
    	for a = 1, #levelButton do
	        levelButton[a]:removeEventListener("tap", touchButton)
	    end
    	thisLevelButton = event.target

    	--Medal Choose Screen

    if (medalChooseScreen) then

    else

    	medalScreenGroup = display.newGroup()

	    medalChooseScreen = display.newImageRect("images/level-images/" .. currentWorld .. "/Layout/medalChooseScreenBG.png", 200, 220)
	    	--medalChooseScreen:setReferencePoint(display.CenterReferencePoint);
	    	medalChooseScreen.anchorX = 0.5
			medalChooseScreen.anchorY = 0.5
	    	medalChooseScreen.y = (display.contentHeight / 2) - display.contentHeight
	    	medalChooseScreen.x = display.contentWidth / 2
	    	medalChooseScreen.showing = false
	    	medalScreenGroup:insert(medalChooseScreen)

	    medalScreenLevelCounter = {}

	    medalScreenLevelCounter[0] = display.newSprite(WorldStatusBarNumbersImageSheet, WorldStatusBarNumbersSequenceData)
        	medalScreenLevelCounter[0]:setSequence(3)
	    	medalScreenLevelCounter[0].anchorX = 1
	    	medalScreenLevelCounter[0].anchorY = 0.5
	    	medalScreenLevelCounter[0].xScale = 1.3
	    	medalScreenLevelCounter[0].yScale = 1.3
	    	medalScreenLevelCounter[0].x = medalChooseScreen.x + 1
	    	medalScreenLevelCounter[0].y = medalChooseScreen.y - (medalChooseScreen.contentHeight / 2) + 14
	    	medalScreenGroup:insert(medalScreenLevelCounter[0])

	    medalScreenLevelCounter[1] = display.newSprite(WorldStatusBarNumbersImageSheet, WorldStatusBarNumbersSequenceData)
        	medalScreenLevelCounter[1]:setSequence(8)
	    	medalScreenLevelCounter[1].anchorX = 0
	    	medalScreenLevelCounter[1].anchorY = 0.5
	    	medalScreenLevelCounter[1].xScale = 1.3
	    	medalScreenLevelCounter[1].yScale = 1.3
	    	medalScreenLevelCounter[1].x = medalChooseScreen.x - 2
	    	medalScreenLevelCounter[1].y = medalChooseScreen.y - (medalChooseScreen.contentHeight / 2) + 14
	    	medalScreenGroup:insert(medalScreenLevelCounter[1])

	    silverMedalButton = display.newSprite(mediumIconsImageSheet, mediumIconsSequenceData)
	    	silverMedalButton:setSequence("silverMedal")
	    	--silverMedalButton:setReferencePoint(display.TopLeftReferencePoint);
	    	silverMedalButton.anchorX = 0
			silverMedalButton.anchorY = 0
			silverMedalButton.x = medalChooseScreen.x - 73
			silverMedalButton.y = medalChooseScreen.y - 98
			silverMedalButton.value = "silver"
	    	medalScreenGroup:insert(silverMedalButton)

		goldMedalButton = display.newSprite(mediumIconsImageSheet, mediumIconsSequenceData)
	    	goldMedalButton:setSequence("goldMedal")
	    	--goldMedalButton:setReferencePoint(display.TopLeftReferencePoint);
	    	goldMedalButton.anchorX = 0
			goldMedalButton.anchorY = 0
			goldMedalButton.x = medalChooseScreen.x + 27
			goldMedalButton.y = medalChooseScreen.y - 98
			goldMedalButton.value = "gold"
	    	medalScreenGroup:insert(goldMedalButton)

		closeButton = display.newImageRect("images/central-images/buttons/medalChooseScreen-closeButton.png", 52, 38)
	    	--closeButton:setReferencePoint(display.TopLeftReferencePoint);
	    	closeButton.anchorX = 0
			closeButton.anchorY = 0
			closeButton.x = medalChooseScreen.x + xCalc(60)
			closeButton.y = medalChooseScreen.y - yCalc(130)
			closeButton.alpha = 0
	    	medalScreenGroup:insert(closeButton)

	    local silverMedalAchieveSpriteSheet = graphics.newImageSheet( "images/level-images/" .. currentWorld .. "/Buttons/MedalChooseStatsButton.png", {width = 65, height = 46, numFrames = 2, sheetContentWidth = 130, sheetContentHeight = 46})
	    local silverMedalAchieveSequenceData = {
	        { name = "closed", start=1, count=1,   loopCount=1 },
	        { name = "open", start=2, count=1, loopCount=1 }
	    }

	    local playNowImageSheet = graphics.newImageSheet( "images/level-images/" .. currentWorld .. "/Layout/PlayNowButtonAndLockedBG.png", {width = 84, height = 121, numFrames = 3})
	    local playNowSequenceData = {
	        { name = "playNowSilver", start=1, count=1,   loopCount=1 },
	        { name = "playNowGold", start=2, count=1, loopCount=1 },
	        { name = "lockedBG", start=3, count=1, loopCount=1 }
	    }

	    local achievedAndLockedLabelImageSheet = graphics.newImageSheet( "images/central-images/Icons/AchievedAndLockedLabel.png", {width = 74, height = 28, numFrames = 2, sheetContentWidth = 148, sheetContentHeight = 28})
	    local achievedAndLockedLabelSequenceData = {
	        { name = "achieved", start=1, count=1,   loopCount=1 },
	        { name = "locked", start=2, count=1, loopCount=1 }
	    }

	    silverPlayNowLogo = display.newSprite(playNowImageSheet, playNowSequenceData)
	    	silverPlayNowLogo:setSequence("playNowSilver")
	    	--silverPlayNowLogo:setReferencePoint(display.TopLeftReferencePoint);
	    	silverPlayNowLogo.anchorX = 0
			silverPlayNowLogo.anchorY = 0
			silverPlayNowLogo.x = medalChooseScreen.x - 91
			silverPlayNowLogo.y = medalChooseScreen.y - 18
			silverPlayNowLogo.value = "silver"
			medalScreenGroup:insert(silverPlayNowLogo)

	    silverAchievedText = display.newSprite(achievedAndLockedLabelImageSheet, achievedAndLockedLabelSequenceData)
	    	silverAchievedText:setSequence("achieved")
	    	--silverAchievedText:setReferencePoint(display.TopLeftReferencePoint);
	    	silverAchievedText.anchorX = 0
			silverAchievedText.anchorY = 0
			silverAchievedText.x = medalChooseScreen.x - 88
			silverAchievedText.y = medalChooseScreen.y - 43
	    	silverAchievedText.alpha = 0
	    	medalScreenGroup:insert(silverAchievedText)

	    silverMedalAchievedButton = display.newSprite(silverMedalAchieveSpriteSheet, silverMedalAchieveSequenceData)
	    	silverMedalAchievedButton.anchorX = 0
			silverMedalAchievedButton.anchorY = 0
			silverMedalAchievedButton.value = "silver"
			silverMedalAchievedButton.x = silverPlayNowLogo.x - 66
			silverMedalAchievedButton.y = silverPlayNowLogo.y + 20
			silverMedalAchievedButton.alpha = 0
	    	medalScreenGroup:insert(silverMedalAchievedButton)

	    goldPlayNowLogo = display.newSprite(playNowImageSheet, playNowSequenceData)
	    	goldPlayNowLogo:setSequence("playNowGold")
	    	--goldPlayNowLogo:setReferencePoint(display.TopLeftReferencePoint);
	    	goldPlayNowLogo.anchorX = 0
			goldPlayNowLogo.anchorY = 0
			goldPlayNowLogo.x = medalChooseScreen.x + 8
			goldPlayNowLogo.y = medalChooseScreen.y - 18
			goldPlayNowLogo.value = "gold"
	    	goldPlayNowLogo.alpha = 0
	    	medalScreenGroup:insert(goldPlayNowLogo)

	    goldAchievedText = display.newSprite(achievedAndLockedLabelImageSheet, achievedAndLockedLabelSequenceData)
	    	goldAchievedText:setSequence("achieved")
	    	--goldAchievedText:setReferencePoint(display.TopLeftReferencePoint);
	    	goldAchievedText.anchorX = 0
			goldAchievedText.anchorY = 0
			goldAchievedText.x = medalChooseScreen.x + 13
			goldAchievedText.y = medalChooseScreen.y - 43
	    	goldAchievedText.alpha = 0
	    	medalScreenGroup:insert(goldAchievedText)

	    goldMedalAchievedButton = display.newSprite(silverMedalAchieveSpriteSheet, silverMedalAchieveSequenceData)
	    	goldMedalAchievedButton.anchorX = 0
			goldMedalAchievedButton.anchorY = 0
			goldMedalAchievedButton.value = "gold"
	    	goldMedalAchievedButton.xScale = -1
			goldMedalAchievedButton.x = goldPlayNowLogo.x + 149
			goldMedalAchievedButton.y = goldPlayNowLogo.y + 20
			goldMedalAchievedButton.alpha = 0
	    	medalScreenGroup:insert(goldMedalAchievedButton)

	    goldLockedBG = display.newSprite(playNowImageSheet, playNowSequenceData)
	    	goldLockedBG:setSequence("lockedBG")
	    	--goldLockedBG:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedBG.anchorX = 0
			goldLockedBG.anchorY = 0
			goldLockedBG.x = medalChooseScreen.x + 8
			goldLockedBG.y = medalChooseScreen.y - 17
	    	medalScreenGroup:insert(goldLockedBG)

	    goldLockedText = display.newSprite(achievedAndLockedLabelImageSheet, achievedAndLockedLabelSequenceData)
	    	goldLockedText:setSequence("locked")
	    	--goldLockedText:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedText.anchorX = 0
			goldLockedText.anchorY = 0
			goldLockedText.x = medalChooseScreen.x + 13
			goldLockedText.y = medalChooseScreen.y - 43
	    	medalScreenGroup:insert(goldLockedText)

	    goldLockedSilverIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
	    	goldLockedSilverIcon:setSequence("silverMedal")
	    	--goldLockedSilverIcon:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedSilverIcon.anchorX = 0
			goldLockedSilverIcon.anchorY = 0
			goldLockedSilverIcon.x = medalChooseScreen.x + 14
			goldLockedSilverIcon.y = medalChooseScreen.y + 45
	    	medalScreenGroup:insert(goldLockedSilverIcon)

	    goldLockedSilverMedalCounter = {}

	    goldLockedSilverMedalCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[1]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedSilverMedalCounter[1].anchorX = 0
			goldLockedSilverMedalCounter[1].anchorY = 0
			goldLockedSilverMedalCounter[1].x = medalChooseScreen.x + 44
			goldLockedSilverMedalCounter[1].y = goldLockedSilverIcon.y + yCalc(6)
			goldLockedSilverMedalCounter[1].xScale = 1.1
			goldLockedSilverMedalCounter[1].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedSilverMedalCounter[1])

	    goldLockedSilverMedalCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[2]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedSilverMedalCounter[2].anchorX = 0
			goldLockedSilverMedalCounter[2].anchorY = 0
			goldLockedSilverMedalCounter[2].x = medalChooseScreen.x + 54
			goldLockedSilverMedalCounter[2].y = goldLockedSilverIcon.y + yCalc(6)
			goldLockedSilverMedalCounter[2].xScale = 1.1
			goldLockedSilverMedalCounter[2].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedSilverMedalCounter[2])

	    goldLockedSilverMedalCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[3]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedSilverMedalCounter[3].anchorX = 0
			goldLockedSilverMedalCounter[3].anchorY = 0
			goldLockedSilverMedalCounter[3].x = medalChooseScreen.x + 64
			goldLockedSilverMedalCounter[3].y = goldLockedSilverIcon.y + yCalc(6)
			goldLockedSilverMedalCounter[3].xScale = 1.1
			goldLockedSilverMedalCounter[3].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedSilverMedalCounter[3])

	    goldLockedGoldIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
	    	goldLockedGoldIcon:setSequence("goldMedal")
	    	--goldLockedSilverIcon:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedGoldIcon.anchorX = 0
			goldLockedGoldIcon.anchorY = 0
			goldLockedGoldIcon.x = medalChooseScreen.x + 14
			goldLockedGoldIcon.y = medalChooseScreen.y + 8
	    	medalScreenGroup:insert(goldLockedGoldIcon)

	    goldLockedGoldMedalCounter = {}

	    goldLockedGoldMedalCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[1]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedGoldMedalCounter[1].anchorX = 0
			goldLockedGoldMedalCounter[1].anchorY = 0
			goldLockedGoldMedalCounter[1].x = medalChooseScreen.x + 44
			goldLockedGoldMedalCounter[1].y = goldLockedGoldIcon.y + yCalc(6)
			goldLockedGoldMedalCounter[1].xScale = 1.1
			goldLockedGoldMedalCounter[1].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedGoldMedalCounter[1])

	    goldLockedGoldMedalCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[2]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedGoldMedalCounter[2].anchorX = 0
			goldLockedGoldMedalCounter[2].anchorY = 0
			goldLockedGoldMedalCounter[2].x = medalChooseScreen.x + 54
			goldLockedGoldMedalCounter[2].y = goldLockedGoldIcon.y + yCalc(6)
			goldLockedGoldMedalCounter[2].xScale = 1.1
			goldLockedGoldMedalCounter[2].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedGoldMedalCounter[2])

	    goldLockedGoldMedalCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
	    	--goldLockedSilverMedalCounter[3]:setReferencePoint(display.TopLeftReferencePoint);
	    	goldLockedGoldMedalCounter[3].anchorX = 0
			goldLockedGoldMedalCounter[3].anchorY = 0
			goldLockedGoldMedalCounter[3].x = medalChooseScreen.x + 64
			goldLockedGoldMedalCounter[3].y = goldLockedGoldIcon.y + yCalc(6)
			goldLockedGoldMedalCounter[3].xScale = 1.1
			goldLockedGoldMedalCounter[3].yScale = 1.1
	    	medalScreenGroup:insert(goldLockedGoldMedalCounter[3])


	    local levelItems2ImageSheet = graphics.newImageSheet( levelVariables.allLevelSettings.levelItems2ImageSheet, levelVariables.allLevelSettings.levelItems2ImageSheetSettings)
        local levelItems2SequenceData = levelVariables.allLevelSettings.levelItems2SequenceData

	    local digitDistance = 8
	    local relScale = 0.85

        silverGemLockedIcon = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        silverGemLockedIcon:setSequence("-")
        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
        silverGemLockedIcon.anchorX = 0
        silverGemLockedIcon.anchorY = 1
        silverGemLockedIcon.xScale = 1.5
        silverGemLockedIcon.yScale = 1.5
        silverGemLockedIcon.x = medalChooseScreen.x - 62
        silverGemLockedIcon.y = medalChooseScreen.y + yCalc(22)
            medalScreenGroup:insert(silverGemLockedIcon)

    	silverGemIcons = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        silverGemIcons:setSequence("purple")
        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
	    silverGemIcons.anchorX = 0
		silverGemIcons.anchorY = 1
        silverGemIcons.x = medalChooseScreen.x - 97
        silverGemIcons.y = medalChooseScreen.y + yCalc(28)
        silverGemIcons.xScale = 0.6
        silverGemIcons.yScale = 0.6
	    	medalScreenGroup:insert(silverGemIcons)

        silverGemCounter = {}

        for a =1, 2 do
            silverGemCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            silverGemCounter[a]:setSequence(0)
            silverGemCounter[a].anchorX = 0
            silverGemCounter[a].anchorY = 1
            if a == 1 then
                silverGemCounter[a].x = medalChooseScreen.x - 55
            else
                silverGemCounter[a].x = silverGemCounter[a-1].x + 8
            end
            silverGemCounter[a].y = medalChooseScreen.y + yCalc(19)
            silverGemCounter[a].xScale = relScale
            silverGemCounter[a].yScale = relScale
                medalScreenGroup:insert(silverGemCounter[a])
        end

        silverGemCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            silverGemCounter[3]:setSequence("/")
            silverGemCounter[3].anchorX = 0
            silverGemCounter[3].anchorY = 1
            silverGemCounter[3].x = silverGemCounter[2].x + 8
            silverGemCounter[3].y = medalChooseScreen.y + yCalc(20)
            silverGemCounter[3].xScale = relScale
            silverGemCounter[3].yScale = relScale
                medalScreenGroup:insert(silverGemCounter[3])

    	for a =1, 2 do
            silverGemCounter[a + 3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
            silverGemCounter[a + 3]:setSequence(0)
            silverGemCounter[a + 3].anchorX = 0
            silverGemCounter[a + 3].anchorY = 1
            if a == 1 then
                silverGemCounter[a + 3].x = silverGemCounter[a + 2].x + 5
            else
                silverGemCounter[a + 3].x = silverGemCounter[a + 2].x + 8
            end
            silverGemCounter[a + 3].y = medalChooseScreen.y + yCalc(19)
            silverGemCounter[a + 3].xScale = relScale
            silverGemCounter[a + 3].yScale = relScale
                medalScreenGroup:insert(silverGemCounter[a + 3])
        end

        goldGemIcons = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        goldGemIcons:setSequence("purple")
        --goldGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
	    goldGemIcons.anchorX = 0
		goldGemIcons.anchorY = 1
        goldGemIcons.x = medalChooseScreen.x + 4
        goldGemIcons.y = medalChooseScreen.y + yCalc(28)
        goldGemIcons.xScale = 0.6
        goldGemIcons.yScale = 0.6
	    	medalScreenGroup:insert(goldGemIcons)

    	goldGemCounterFirstDigit = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
    	goldGemCounterFirstDigit:setSequence(0)
        --goldGemCounterFirstDigit:setReferencePoint(display.BottomLeftReferencePoint);
	    goldGemCounterFirstDigit.anchorX = 0
		goldGemCounterFirstDigit.anchorY = 1
        goldGemCounterFirstDigit.x = medalChooseScreen.x + 67
        goldGemCounterFirstDigit.y = medalChooseScreen.y + yCalc(19)
        goldGemCounterFirstDigit.xScale = relScale
        goldGemCounterFirstDigit.yScale = relScale
	    	medalScreenGroup:insert(goldGemCounterFirstDigit)

    	goldGemCounterSecondDigit = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
    	goldGemCounterSecondDigit:setSequence(1)
        --goldGemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
	    	goldGemCounterSecondDigit.anchorX = 0
			goldGemCounterSecondDigit.anchorY = 1
        goldGemCounterSecondDigit.x = medalChooseScreen.x + 75
        goldGemCounterSecondDigit.y = medalChooseScreen.y + yCalc(19)
        goldGemCounterSecondDigit.xScale = relScale
        goldGemCounterSecondDigit.yScale = relScale
	    	medalScreenGroup:insert(goldGemCounterSecondDigit)

	    silverBestTimeIcon = display.newSprite(itemsImageSheet, itemsSequenceData)
	    	silverBestTimeIcon:setSequence("clock")
	    	silverBestTimeIcon.anchorX = 0
			silverBestTimeIcon.anchorY = 1
	        silverBestTimeIcon.x = medalChooseScreen.x - 89
	        silverBestTimeIcon.y = medalChooseScreen.y + yCalc(46.5)
	        silverBestTimeIcon.xScale = 0.37
	        silverBestTimeIcon.yScale = 0.37
	    	medalScreenGroup:insert(silverBestTimeIcon)

	    silverBestTimeCounter = {}

	    local silverBestTimeCounterString = tostring(33932.1)

    	for a = 1, #silverBestTimeCounterString do
    		local currentSequence = string.sub(silverBestTimeCounterString, a, a)
            local prevSequence = nil
            if (a > 1) then 
                prevSequence = string.sub(silverBestTimeCounterString, a - 1, a - 1) 
            end
			silverBestTimeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                if currentSequence == 9 then
                    currentSequence = "m"
                end
		    	silverBestTimeCounter[a]:setSequence(currentSequence)
		    	silverBestTimeCounter[a].anchorX = 0
				silverBestTimeCounter[a].anchorY = 1
		        silverBestTimeCounter[a].xScale = relScale
		        silverBestTimeCounter[a].yScale = relScale

		        silverBestTimeCounter[a].y = medalChooseScreen.y + yCalc(43)
		        if a == 1 then
			        silverBestTimeCounter[a].x = medalChooseScreen.x - 13 - (digitDistance * #silverBestTimeCounterString)
			    elseif currentSequence == "." then
			        silverBestTimeCounter[a].x = silverBestTimeCounter[a-1].x + digitDistance - 4
		        	silverBestTimeCounter[a].y = silverBestTimeCounter[a-1].y + yCalc(1)
		        elseif a == #silverBestTimeCounterString then
			        silverBestTimeCounter[a].x = silverBestTimeCounter[a-1].x + digitDistance - 1
                elseif currentSequence == "m" then
                    goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance + 1
		        else
					silverBestTimeCounter[a].x = silverBestTimeCounter[a-1].x + digitDistance
		        end

                if prevSequence == "9" then
                    silverBestTimeCounter[a].x = silverBestTimeCounter[a].x - 1
                end

		    	medalScreenGroup:insert(silverBestTimeCounter[a])
    	end

	    silverFirstTimeIcon = display.newSprite(itemsImageSheet, itemsSequenceData)
	    	silverFirstTimeIcon:setSequence("clock")
	    	silverFirstTimeIcon.anchorX = 0
			silverFirstTimeIcon.anchorY = 1
	        silverFirstTimeIcon.x = medalChooseScreen.x - 89
	        silverFirstTimeIcon.y = medalChooseScreen.y + yCalc(71.5)
	        silverFirstTimeIcon.xScale = 0.37
	        silverFirstTimeIcon.yScale = 0.37
	    	medalScreenGroup:insert(silverFirstTimeIcon)

	    silverFirstTimeCounter = {}

	    local silverFirstTimeCounterString = tostring(33956.8)

    	for a = 1, #silverFirstTimeCounterString do
    		local currentSequence = string.sub(silverFirstTimeCounterString, a, a)
            local prevSequence = nil
            if (a > 1) then 
                prevSequence = string.sub(silverFirstTimeCounterString, a - 1, a - 1) 
            end
			silverFirstTimeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
		    	silverFirstTimeCounter[a]:setSequence(currentSequence)
		    	silverFirstTimeCounter[a].anchorX = 0
				silverFirstTimeCounter[a].anchorY = 1
		        silverFirstTimeCounter[a].xScale = relScale
		        silverFirstTimeCounter[a].yScale = relScale

		        silverFirstTimeCounter[a].y = medalChooseScreen.y + yCalc(69)
		        if a == 1 then
			        silverFirstTimeCounter[a].x = medalChooseScreen.x - 13 - (digitDistance * #silverFirstTimeCounterString)
			    elseif currentSequence == "." then
			        silverFirstTimeCounter[a].x = silverFirstTimeCounter[a-1].x + digitDistance - 4
		        	silverFirstTimeCounter[a].y = silverFirstTimeCounter[a-1].y + yCalc(1)
		        elseif a == #silverFirstTimeCounterString then
			        silverFirstTimeCounter[a].x = silverFirstTimeCounter[a-1].x + digitDistance - 1
                elseif currentSequence == "m" then
                    silverFirstTimeCounter[a].x = silverFirstTimeCounter[a-1].x + digitDistance + 1
		        else
					silverFirstTimeCounter[a].x = silverFirstTimeCounter[a-1].x + digitDistance
		        end

                if prevSequence == "9" then
                    silverFirstTimeCounter[a].x = silverFirstTimeCounter[a].x - 1
                end

		    	medalScreenGroup:insert(silverFirstTimeCounter[a])
    	end

    	goldBestTimeIcon = display.newSprite(itemsImageSheet, itemsSequenceData)
	    	goldBestTimeIcon:setSequence("clock")
	    	goldBestTimeIcon.anchorX = 0
			goldBestTimeIcon.anchorY = 1
	        goldBestTimeIcon.x = medalChooseScreen.x + 12
	        goldBestTimeIcon.y = medalChooseScreen.y + yCalc(46.5)
	        goldBestTimeIcon.xScale = 0.37
	        goldBestTimeIcon.yScale = 0.37
	    	medalScreenGroup:insert(goldBestTimeIcon)

	    goldBestTimeCounter = {}

	    local goldBestTimeCounterString = tostring(32.1)

    	for a = 1, #goldBestTimeCounterString do
    		local currentSequence = string.sub(goldBestTimeCounterString, a, a)
            local prevSequence = nil
            if (a > 1) then 
                prevSequence = string.sub(goldBestTimeCounterString, a - 1, a - 1) 
            end
			goldBestTimeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                if currentSequence == 9 then
                    currentSequence = "m"
                end
		    	goldBestTimeCounter[a]:setSequence(string.sub(goldBestTimeCounterString, a, a))
		    	goldBestTimeCounter[a].anchorX = 0
				goldBestTimeCounter[a].anchorY = 1
		        goldBestTimeCounter[a].xScale = relScale
		        goldBestTimeCounter[a].yScale = relScale

		        goldBestTimeCounter[a].y = medalChooseScreen.y + yCalc(44)
		        if a == 1 then
			        goldBestTimeCounter[a].x = medalChooseScreen.x + 88 - (digitDistance * #goldBestTimeCounterString)
			    elseif currentSequence == "." then
			        goldBestTimeCounter[a].x = goldBestTimeCounter[a-1].x + digitDistance - 4
		        	goldBestTimeCounter[a].y = goldBestTimeCounter[a-1].y + yCalc(1)
		        elseif a == #goldBestTimeCounterString then
			        goldBestTimeCounter[a].x = goldBestTimeCounter[a-1].x + digitDistance - 1
                elseif currentSequence == "m" then
                    goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance + 1
		        else
					goldBestTimeCounter[a].x = goldBestTimeCounter[a-1].x + digitDistance
		        end

                if prevSequence == "9" then
                    goldBestTimeCounter[a].x = goldBestTimeCounter[a].x - 1
                end

		    	medalScreenGroup:insert(goldBestTimeCounter[a])
    	end

	    goldFirstTimeIcon = display.newSprite(itemsImageSheet, itemsSequenceData)
	    	goldFirstTimeIcon:setSequence("clock")
	    	goldFirstTimeIcon.anchorX = 0
			goldFirstTimeIcon.anchorY = 1
	        goldFirstTimeIcon.x = medalChooseScreen.x + 12
	        goldFirstTimeIcon.y = medalChooseScreen.y + yCalc(71.5)
	        goldFirstTimeIcon.xScale = 0.37
	        goldFirstTimeIcon.yScale = 0.37
	    	medalScreenGroup:insert(goldFirstTimeIcon)

	    goldFirstTimeCounter = {}

	    local goldFirstTimeCounterString = tostring(33932.8)

    	for a = 1, #goldFirstTimeCounterString do
    		local currentSequence = string.sub(goldFirstTimeCounterString, a, a)
            local prevSequence = nil
            if (a > 1) then 
                prevSequence = string.sub(goldFirstTimeCounterString, a - 1, a - 1) 
            end
			goldFirstTimeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
                if currentSequence == "9" then
                    currentSequence = "m"
                end
		    	goldFirstTimeCounter[a]:setSequence(currentSequence)
		    	goldFirstTimeCounter[a].anchorX = 0
				goldFirstTimeCounter[a].anchorY = 1
		        goldFirstTimeCounter[a].xScale = relScale
		        goldFirstTimeCounter[a].yScale = relScale

		        goldFirstTimeCounter[a].y = medalChooseScreen.y + yCalc(69)
		        if a == 1 then
			        goldFirstTimeCounter[a].x = medalChooseScreen.x + 87 - (digitDistance * #goldFirstTimeCounterString)
			    elseif currentSequence == "." then
			        goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance - 4
		        	goldFirstTimeCounter[a].y = goldFirstTimeCounter[a-1].y + yCalc(1)
		        elseif a == #goldFirstTimeCounterString then
			        goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance - 1
                elseif currentSequence == "m" then
                    goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance + 1
                    goldFirstTimeCounter[a].y = goldFirstTimeCounter[a-1].y
		        else
					goldFirstTimeCounter[a].x = goldFirstTimeCounter[a-1].x + digitDistance
		        end

                if prevSequence == "9" then
                    goldFirstTimeCounter[a].x = goldFirstTimeCounter[a].x - 1
                end

		    	medalScreenGroup:insert(goldFirstTimeCounter[a])
    	end

        silverCoinsLockedIcon = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        silverCoinsLockedIcon:setSequence("-")
        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
        silverCoinsLockedIcon.anchorX = 0
        silverCoinsLockedIcon.anchorY = 1
        silverCoinsLockedIcon.xScale = 1.5
        silverCoinsLockedIcon.yScale = 1.5
        silverCoinsLockedIcon.x = medalChooseScreen.x - 62
        silverCoinsLockedIcon.y = medalChooseScreen.y + yCalc(97)
            medalScreenGroup:insert(silverCoinsLockedIcon)

		silverCoinsIconArray = {}

		silverCoinsIconArray["redCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        silverCoinsIconArray["redCoin"]:setSequence("red")
        --silverCoinsIconArray["redCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	silverCoinsIconArray["redCoin"].anchorX = 0
			silverCoinsIconArray["redCoin"].anchorY = 1
        silverCoinsIconArray["redCoin"].x = medalChooseScreen.x - 77
        silverCoinsIconArray["redCoin"].y = medalChooseScreen.y + yCalc(97)
        silverCoinsIconArray["redCoin"].xScale = 0.37
        silverCoinsIconArray["redCoin"].yScale = 0.37
        silverCoinsIconArray["redCoin"].alpha = 0
        silverCoinsIconArray["redCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(silverCoinsIconArray["redCoin"])

        silverCoinsIconArray["blueCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        silverCoinsIconArray["blueCoin"]:setSequence("blueCoin")
        --silverCoinsIconArray["blueCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	silverCoinsIconArray["blueCoin"].anchorX = 0
			silverCoinsIconArray["blueCoin"].anchorY = 1
        silverCoinsIconArray["blueCoin"].x = medalChooseScreen.x - 62
        silverCoinsIconArray["blueCoin"].y = medalChooseScreen.y + yCalc(97)
        silverCoinsIconArray["blueCoin"].xScale = 0.37
        silverCoinsIconArray["blueCoin"].yScale = 0.37
        silverCoinsIconArray["blueCoin"].alpha = 0
        silverCoinsIconArray["blueCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(silverCoinsIconArray["blueCoin"])

        silverCoinsIconArray["purpleCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        silverCoinsIconArray["purpleCoin"]:setSequence("purpleCoin")
        --silverCoinsIconArray["purpleCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	silverCoinsIconArray["purpleCoin"].anchorX = 0
			silverCoinsIconArray["purpleCoin"].anchorY = 1
        silverCoinsIconArray["purpleCoin"].x = medalChooseScreen.x - 47
        silverCoinsIconArray["purpleCoin"].y = medalChooseScreen.y + yCalc(96.5)
        silverCoinsIconArray["purpleCoin"].xScale = 0.37
        silverCoinsIconArray["purpleCoin"].yScale = 0.37
        silverCoinsIconArray["purpleCoin"].alpha = 0
        silverCoinsIconArray["purpleCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(silverCoinsIconArray["purpleCoin"])


        goldCoinsIconArray = {}

		goldCoinsIconArray["redCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        goldCoinsIconArray["redCoin"]:setSequence("red")
        --goldCoinsIconArray["redCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	goldCoinsIconArray["redCoin"].anchorX = 0
			goldCoinsIconArray["redCoin"].anchorY = 1
        goldCoinsIconArray["redCoin"].x = medalChooseScreen.x + 24
        goldCoinsIconArray["redCoin"].y = medalChooseScreen.y + yCalc(97)
        goldCoinsIconArray["redCoin"].xScale = 0.35
        goldCoinsIconArray["redCoin"].yScale = 0.35
        goldCoinsIconArray["redCoin"].alpha = 0
        goldCoinsIconArray["redCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(goldCoinsIconArray["redCoin"])

        goldCoinsIconArray["blueCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        goldCoinsIconArray["blueCoin"]:setSequence("blueCoin")
        --goldCoinsIconArray["blueCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	goldCoinsIconArray["blueCoin"].anchorX = 0
			goldCoinsIconArray["blueCoin"].anchorY = 1
        goldCoinsIconArray["blueCoin"].x = medalChooseScreen.x + 39
        goldCoinsIconArray["blueCoin"].y = medalChooseScreen.y + yCalc(97)
        goldCoinsIconArray["blueCoin"].xScale = 0.35
        goldCoinsIconArray["blueCoin"].yScale = 0.35
        goldCoinsIconArray["blueCoin"].alpha = 0
        goldCoinsIconArray["blueCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(goldCoinsIconArray["blueCoin"])

        goldCoinsIconArray["purpleCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
        goldCoinsIconArray["purpleCoin"]:setSequence("purpleCoin")
        --goldCoinsIconArray["purpleCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
	    	goldCoinsIconArray["purpleCoin"].anchorX = 0
			goldCoinsIconArray["purpleCoin"].anchorY = 1
        goldCoinsIconArray["purpleCoin"].x = medalChooseScreen.x + 54
        goldCoinsIconArray["purpleCoin"].y = medalChooseScreen.y + yCalc(97)
        goldCoinsIconArray["purpleCoin"].xScale = 0.35
        goldCoinsIconArray["purpleCoin"].yScale = 0.35
        goldCoinsIconArray["purpleCoin"].alpha = 0
        goldCoinsIconArray["purpleCoin"].state = "notYetShown"
	    	medalScreenGroup:insert(goldCoinsIconArray["purpleCoin"])

	end

    openMedalScreen()
    --end
end

local function scrollListener (event)
	local phase = event.phase

	if ( phase == "began") then
		event.xStart = event.x
    elseif ( phase == "moved" ) and levelVariables.scrollLockApplied == false then
        local dx = event.x - event.xStart
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dx < -10 ) and levelVariables.currentScreenViewing ~= levelVariables.totalScreens then
            levelVariables.scrollLockApplied = true
        	scrollView:scrollToPosition( { x = (levelVariables.currentScreenViewing * -1) * display.contentWidth, time=450, onComplete = function ()
                levelVariables.scrollLockApplied = false
                levelVariables.currentScreenViewing = levelVariables.currentScreenViewing + 1
            end } )
        elseif ( dx > 10 ) and levelVariables.currentScreenViewing ~= 1 then
            levelVariables.scrollLockApplied = true
            scrollView:scrollToPosition( { x = (2 - levelVariables.currentScreenViewing) * display.contentWidth, time=450, onComplete = function ()
                levelVariables.scrollLockApplied = false
                levelVariables.currentScreenViewing = levelVariables.currentScreenViewing - 1
            end } )
        end
    end
	if event.limitReached then
        if ( event.direction == "left" ) then
        	--scrollBack to default position
        	--scrollView:scrollToPosition( { x = 480, time=400 } )
        end
	end
end

function toggleShapeOrToolView(event)
	event.target:removeEventListener("tap", levelVariables.toggleShapeOrToolView)
	timer.performWithDelay(250, function () event.target:addEventListener("tap", levelVariables.toggleShapeOrToolView) end)
	ItemBagBtnScript.toggleShapeOrToolView(levelVariables, levelVariables.allLevelSettings, levelVariables, "levelSelect")
end

function buttonListener(event)
	event.target:removeEventListener("touch", levelVariables.buttonListener)
end

local function listener (event)
	levelVariables.objectListenerScript.objectListener(event, levelVariables, nil, nil)
end

local function changeToolInnerScreen (event)
    ItemBagBtnScript.changeToolSelectedTile(levelVariables, levelVariables.allLevelSettings, event.target.value)
    ItemBagBtnScript.createToolInnerScreen(levelVariables, levelVariables, levelVariables.allLevelSettings, levelVariables.buttonListenerScript, event.target.value, "levelSelect")
end

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
    local sceneGroup = self.view
    
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Load two audio streams and one sound
        backgroundMusic = audio.loadStream( "audio/" .. currentWorld .. "-intro.wav" )

        -- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
        musicChannel["levelSelect"] = audio.play( backgroundMusic, { channel=3, loops=-1 } )

        mainFunc = {}
        levelVariables = {}
        myGameSettings = loadTable("myGameSettings.json")

        levelVariables.currentScreenViewing = 1
        levelVariables.scrollLockApplied = false
    	levelVariables.allLevelSettings = require("modules.levels.all-level-settings")
		levelVariables.allLevelSettings.createLevelSettings(levelVariables, "out-of-level")
		levelVariables.buttonListenerScript = require("modules.button-listener-functions")
		levelVariables.globalImageCreateFunctions = require("modules.global-image-creation-functions")

		itemsImageSheet = levelVariables.allLevelSettings.itemsImageSheet
		itemsSequenceData = levelVariables.allLevelSettings.itemsSequenceData
	    levelVariables.allLevelSettings.itemBagIsOpen = false
	    levelVariables.allLevelSettings.mysteryBlockBagIsOpen = false
	    levelVariables.allLevelSettings.itemScreenObjectsGroup = display.newGroup()
	    levelVariables.allLevelSettings.showingToolsArray = {}
	    levelVariables.allLevelSettings.toolArray = loadTable("myTotalToolArray.json")
	    levelVariables.allLevelSettings.showingObjectsArray = {}
	    levelVariables.allLevelSettings.objectArray = loadTable("myTotalObjectArray.json")
        levelVariables.thisLevelSettings = {}
        levelVariables.thisLevelSettings.itemBagButtonsVisible = false
        if myGameSettings["toolsDiscovered"] or myGameSettings["shapesDiscovered"] then
            levelVariables.thisLevelSettings.itemBagButtonsVisible = true
        end

	    levelVariables.changeToolInnerScreen = changeToolInnerScreen
	    levelVariables.listener = listener
	    levelVariables.buttonListener = buttonListener
        levelVariables.dummyListener = dummyListener
	    levelVariables.toggleShapeOrToolView = toggleShapeOrToolView

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
	        -- Called when the scene is still off screen (but is about to come on screen).
	        
	    -- Initialize the scene here.
	    -- Example: add display objects to "sceneGroup", add touch listeners, etc...

	    local levelConfigScript = require("modules.level-config-array")
		levelConfigArray = levelConfigScript.levelConfigArray

		levelVariables.IAPOpened = false
	    levelVariables.LivesOpened = false
	    levelVariables.CoinsOpened = false
	    levelVariables.ToolsOpened = false
	    levelVariables.ShapesOpened = false
	    levelVariables.UnlockOpened = false
	    levelVariables.itemBagIsOpen = false

	    background = display.newImageRect("images/level-images/" .. currentWorld .. "/Layout/levelSelectScene.jpg", 480, 320)
	    background.width =  display.contentWidth
	    background.height = display.contentHeight
		background.anchorX = 0
		background.anchorY = 0
	    foregroundObjects:insert(background)

	    --page title

	    local levelSelectTitleImageSheet = graphics.newImageSheet( "images/level-images/worldTitleSprite.png", {width = 300, height = 39, numFrames = 5, sheetContentWidth = 300, sheetContentHeight = 195})
	    local levelSelectTitleSequenceData = {
	        { name = "WoodyWalk", start=1, count=1,   loopCount=1 },
	        { name = "FieryFortress", start=2, count=1, loopCount=1 },
	        { name = "HyrollCastle", start=3, count=1, loopCount=1 },
	        { name = "IcyIsland", start=4, count=1, loopCount=1 },
	        { name = "BallTimore", start=5, count=1, loopCount=1 }
	    }

	    mainTitle = display.newSprite(levelSelectTitleImageSheet, levelSelectTitleSequenceData)
	    mainTitle:setSequence(currentWorld)
	    backgroundObjects:insert(mainTitle)
		mainTitle.anchorX = 0
		mainTitle.anchorY = 1
	    mainTitle.x = (12/480) * display.contentWidth
	    mainTitle.y = (47/320) * display.contentHeight

	    -- Prepare the Main Info Bar

	    mainIconBar = display.newImageRect("images/central-images/Layout/MainLivesAndCoinBar.png", ((245/480) * display.contentWidth), 41)
	    backgroundObjects:insert(mainIconBar)
		mainIconBar.anchorX = 0
		mainIconBar.anchorY = 1
	    mainIconBar.x = display.contentWidth - ((243/480) * display.contentWidth)
	    mainIconBar.y = display.contentHeight + 1

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

	    smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
	    smallIconsSequenceData = {
	        { name = "lives", start=1, count=1,   loopCount=1 },
	        { name = "gems", start=2, count=1, loopCount=1 },
	        { name = "coins", start=3, count=1, loopCount=1 },
	        { name = "goldMedal", start=4, count=1, loopCount=1 },
	        { name = "silverMedal", start=5, count=1, loopCount=1 },
	        { name = "plusButton-inactive", start=6, count=1, loopCount=1 },
	        { name = "plusButton-active", start=7, count=1, loopCount=1 },
	        { name = "question-mark", start=8, count=1, loopCount=1 }
	    }

	    WorldStatusBarNumbersImageSheet = graphics.newImageSheet( "images/level-images/" .. currentWorld .. "/Numbers/worldStatusBarNumbers.png", {width = 13, height = 14, numFrames = 10, sheetContentWidth = 130, sheetContentHeight = 14})
	    WorldStatusBarNumbersSequenceData = {
	        { name = "0", start=1, count=1,   loopCount=1 },
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
            print(dollarCounter[i])
            print(string.sub(coinCounter,a,a))
            print(a)
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
	        livesPlusSign.y = display.contentHeight  - 5
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

	   	--------------

	   	worldStatusBar = display.newImageRect("images/level-images/" .. currentWorld .. "/Layout/worldStatusBarBG.png", ((215/480) * display.contentWidth), 41)
	    --worldStatusBar:setReferencePoint(display.BottomLeftReferencePoint);
		    	worldStatusBar.anchorX = 0
				worldStatusBar.anchorY = 1
	   	worldStatusBar.x = 1
	   	worldStatusBar.y = display.contentHeight + 1
	   	backgroundObjects:insert(worldStatusBar)

	   	-----

	   	local silverMedalXVal = ((64/480) * display.contentWidth)

	   	goldMedalCounterLabel = {}

	    goldMedalCounter = 0

	    for key, val in pairs(levelConfigScript.levelConfigArray) do

	    	totalLevels = 0
	    	for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[key]) do
	    		totalLevels = totalLevels + 1
	    	end
	    	for a = 1, totalLevels do
	    		if myGameSettings[key]["levels"][a]["gold_gained"] == true then
	    			goldMedalCounter = goldMedalCounter + 1
	    		end
		    end

	    end

	    goldMedalCounter = tostring( goldMedalCounter )

	    if (#goldMedalCounter == 1) then
	    	silverMedalXVal = silverMedalXVal + ((8/480) * display.contentWidth)
	    elseif (#goldMedalCounter == 2) then
	    	silverMedalXVal = silverMedalXVal + ((4/480) * display.contentWidth)
	    elseif (#goldMedalCounter == 3) then
	    	silverMedalXVal = silverMedalXVal + 0
	    end

	    for a = 1, #goldMedalCounter do

	        goldMedalCounterLabel[a] = display.newSprite(WorldStatusBarNumbersImageSheet, WorldStatusBarNumbersSequenceData)
	        backgroundObjects:insert(goldMedalCounterLabel[a])
	        goldMedalCounterLabel[a]:setSequence(string.sub(goldMedalCounter, #goldMedalCounter - (a - 1), #goldMedalCounter - (a - 1) ))
	        --goldMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
		    	goldMedalCounterLabel[a].anchorX = 0
				goldMedalCounterLabel[a].anchorY = 1
	        goldMedalCounterLabel[a].y = dollarIcon.y - 7

	        if (a == 1) then
	        	goldMedalCounterLabel[a].x = silverMedalXVal - ((10/480) * display.contentWidth) - ((3 - #goldMedalCounter) * ((10/480) * display.contentWidth))
	        else
	        	goldMedalCounterLabel[a].x = goldMedalCounterLabel[a - 1].x - ((10/480) * display.contentWidth)
	        end

	   	end

	   	----

	   	local gemIconXVal = ((125/480) * display.contentWidth)

	   	silverMedalCounterLabel = {}

	    silverMedalCounter = 0

		totalLevels = 0
		for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[currentWorld]) do
			totalLevels = totalLevels + 1
		end
		for a = 1, totalLevels do
			if myGameSettings[currentWorld]["levels"][a]["silver_gained"] == true then
				silverMedalCounter = silverMedalCounter + 1
			end
	    end

	    silverMedalCounter = tostring( silverMedalCounter )

	    if (#silverMedalCounter == 1) then
	    	gemIconXVal = gemIconXVal + xCalc(8)
	    elseif (#silverMedalCounter == 2) then
	    	gemIconXVal = gemIconXVal + xCalc(4)
	    elseif (#silverMedalCounter == 3) then
	    	gemIconXVal = gemIconXVal
	    end

	    for a = 1, #silverMedalCounter do

	        silverMedalCounterLabel[a] = display.newSprite(WorldStatusBarNumbersImageSheet, WorldStatusBarNumbersSequenceData)
	        backgroundObjects:insert(silverMedalCounterLabel[a])
	        silverMedalCounterLabel[a]:setSequence(string.sub(silverMedalCounter, #silverMedalCounter - (a - 1), #silverMedalCounter - (a - 1) ))
	        --silverMedalCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
		    	silverMedalCounterLabel[a].anchorX = 0
				silverMedalCounterLabel[a].anchorY = 1
	        silverMedalCounterLabel[a].y = dollarIcon.y - 7

	        if (a == 1) then
	        	silverMedalCounterLabel[a].x = gemIconXVal - xCalc(10) - ((3 - #silverMedalCounter) * xCalc(10))
	        else
	        	silverMedalCounterLabel[a].x = silverMedalCounterLabel[a - 1].x - xCalc(10)
	        end

	   	end

	   	----

	   	gemIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
	   	backgroundObjects:insert(gemIcon)

	   	if (myGameSettings["gems_discovered_second"] == true) then

		        gemIcon:setSequence("gems")
		        --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
		    	gemIcon.anchorX = 0
				gemIcon.anchorY = 1
				gemIcon.xScale = 0.8
				gemIcon.yScale = 0.8
		        gemIcon.y = display.contentHeight - yCalc(7)
		        gemIcon.x = ((125/480) * display.contentWidth)
		        gemIcon.state = "coinsLabelHidden"

		    worldStatusBarEndXVal = xCalc(174)

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

		    for a = 1, #gemIconCounter do

		        gemIconCounterLabel[a] = display.newSprite(WorldStatusBarNumbersImageSheet, WorldStatusBarNumbersSequenceData)
		        backgroundObjects:insert(gemIconCounterLabel[a])
		        gemIconCounterLabel[a]:setSequence(string.sub(gemIconCounter, #gemIconCounter - (a - 1), #gemIconCounter - (a - 1) ))
		        --gemIconCounterLabel[a]:setReferencePoint(display.BottomLeftReferencePoint);
		    	gemIconCounterLabel[a].anchorX = 0
				gemIconCounterLabel[a].anchorY = 1
		        gemIconCounterLabel[a].y = dollarIcon.y - yCalc(7)

		        if (a == 1) then
		        	gemIconCounterLabel[a].x = worldStatusBarEndXVal - ((3 - #gemIconCounter) * xCalc(10))
		        else
		        	gemIconCounterLabel[a].x = gemIconCounterLabel[a - 1].x - xCalc(10)
		        end

		   	end
		else
			gemIcon:setSequence("question-mark")
	        --gemIcon:setReferencePoint(display.BottomLeftReferencePoint);
	    	gemIcon.anchorX = 0
			gemIcon.anchorY = 1
	        gemIcon.y = display.contentHeight - 5
	        gemIcon.x = xCalc(125)
	        gemIcon.state = "coinsLabelHidden"
		end
	    
	    --currentWorld = "WoodenWorld"
	    --Item Bag

	    totalToolArray = loadTable("myTotalToolArray.json")
			levelVariables.toolArray = totalToolArray

		ItemBagBtnScript = require("modules.global-button-functions")
		levelVariables.ItemBagBtnFunction = ItemBagBtnScript.globalOpenItemBagFunction

		levelVariables.objectListenerScript = require("modules.object-listener-functions")

		levelVariables.itemBagIsOpen = false


		levelVariables.itemBagScreen = display.newImageRect("images/central-images/Layout/itemBagScreen.png", 480, 320)
    		levelVariables.itemBagScreen:setFillColor(255, 255, 255)
   		 	--levelVariables.itemBagScreen:setReferencePoint(display.TopLeftReferencePoint);
	       	levelVariables.itemBagScreen.anchorX = 0.5
	       	levelVariables.itemBagScreen.anchorY = 0.5
		   	levelVariables.itemBagScreen.y = contentCentreY - display.contentHeight
		   	levelVariables.itemBagScreen.originalY = contentCentreY - display.contentHeight
		   	levelVariables.itemBagScreen.x = contentCentreX
		   	levelVariables.itemBagScreen.state = "hidden"
			levelVariables.itemBagScreen.ItemBagScreenX = contentCentreX - (480/2)

            levelVariables.itemBagScreen.itemBagScreenOverlay = display.newRect(contentCentreX, contentCentreY, display.contentWidth, display.contentHeight)
            levelVariables.itemBagScreen.itemBagScreenOverlay:setFillColor(255, 255, 255)
            --levelVariables.itemBagScreen:setReferencePoint(display.TopLeftReferencePoint);
            levelVariables.itemBagScreen.itemBagScreenOverlay.anchorX = 0.5
            levelVariables.itemBagScreen.itemBagScreenOverlay.anchorY = 0.5
            levelVariables.itemBagScreen.itemBagScreenOverlay.state = "hidden"
            levelVariables.itemBagScreen.itemBagScreenOverlay.alpha = 0

			local ItemBagScreenX = levelVariables.itemBagScreen.ItemBagScreenX

		    levelVariables.itemBagScreen.toolBg = display.newImageRect("images/central-images/Layout/itemBagScreen-ToolsBg.png", 310, 220)
		    levelVariables.itemBagScreen.toolBg.anchorX = 0
		    levelVariables.itemBagScreen.toolBg.anchorY = 0
		    levelVariables.itemBagScreen.toolBg.y = yCalc(69) - display.contentHeight
		    levelVariables.itemBagScreen.toolBg.originalY = yCalc(69) - display.contentHeight
		    levelVariables.itemBagScreen.toolBg.x = ItemBagScreenX + 26
		    levelVariables.itemBagScreen.toolBg.alpha = 0

		    levelVariables.itemBagScreen.shapeBg = display.newImageRect("images/central-images/Layout/itemBagScreen-ShapesBg.png", 310, 220)
		    levelVariables.itemBagScreen.shapeBg.anchorX = 0
		    levelVariables.itemBagScreen.shapeBg.anchorY = 0
		    levelVariables.itemBagScreen.shapeBg.y = yCalc(69) - display.contentHeight
		    levelVariables.itemBagScreen.shapeBg.originalY = yCalc(69) - display.contentHeight
		    levelVariables.itemBagScreen.shapeBg.x = ItemBagScreenX + 26
		    levelVariables.itemBagScreen.shapeBg.alpha = 0

		    levelVariables.itemBagScreen.bottomSelectedTile = display.newImageRect("images/central-images/Layout/itemBagScreen-bottomSelectedTile.png", 55, 48)
		    levelVariables.itemBagScreen.bottomSelectedTile.anchorX = 0
		    levelVariables.itemBagScreen.bottomSelectedTile.anchorY = 0
		    levelVariables.itemBagScreen.bottomSelectedTile.y = yCalc(240) - display.contentHeight
		    levelVariables.itemBagScreen.bottomSelectedTile.originalY = yCalc(240) - display.contentHeight
		    levelVariables.itemBagScreen.bottomSelectedTile.x = ItemBagScreenX + 30
		    levelVariables.itemBagScreen.bottomSelectedTile.originalX = levelVariables.itemBagScreen.bottomSelectedTile.x

		    levelVariables.itemBagScreen.bottomSelectedTileForShape = display.newImageRect("images/central-images/Layout/itemBagScreen-bottomSelectedTileShape.png", 140, 48)
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.anchorX = 0
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.anchorY = 0
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.y = yCalc(240) - display.contentHeight
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.originalY = yCalc(240) - display.contentHeight
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.x = ItemBagScreenX + 30
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.originalX = levelVariables.itemBagScreen.bottomSelectedTileForShape.x
		    levelVariables.itemBagScreen.bottomSelectedTileForShape.alpha = 0

		    levelVariables.itemBagScreen.topSelectedTile = display.newImageRect("images/central-images/Layout/itemBagScreen-topSelectedTile.png", 95, 48)
		    levelVariables.itemBagScreen.topSelectedTile.anchorX = 0
		    levelVariables.itemBagScreen.topSelectedTile.anchorY = 0
		    levelVariables.itemBagScreen.topSelectedTile.y = yCalc(70) - display.contentHeight
		    levelVariables.itemBagScreen.topSelectedTile.originalY = yCalc(70) - display.contentHeight
		    levelVariables.itemBagScreen.topSelectedTile.x = ItemBagScreenX + 26
		    levelVariables.itemBagScreen.topSelectedTile.alpha = 0

		    local toggleImageSheet = graphics.newImageSheet("images/central-images/Layout/itemBagScreen-shapeToolToggleButton.png", {width = 77, height = 43, numFrames = 2, sheetContentWidth = 154, sheetContentHeight = 43})
		    local toggleSequenceData = {
		    	{ name = "seeShapes", start=1, count=1,   loopCount=1 },
	    		{ name = "seeTools", start=2, count=1, loopCount=1 }
			}
		    levelVariables.itemBagScreen.toggleShapeOrToolButton = display.newSprite(toggleImageSheet, toggleSequenceData)
		    levelVariables.itemBagScreen.toggleShapeOrToolButton:setSequence("seeShapes")
		    levelVariables.itemBagScreen.toggleShapeOrToolButton.anchorX = 0
		    levelVariables.itemBagScreen.toggleShapeOrToolButton.anchorY = 0
		    levelVariables.itemBagScreen.toggleShapeOrToolButton.y = yCalc(11)
		    levelVariables.itemBagScreen.toggleShapeOrToolButton.x = ItemBagScreenX + 320
		    levelVariables.itemBagScreen.toggleShapeOrToolButton.alpha = 0

	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen)
        levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.itemBagScreenOverlay)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.toolBg)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.shapeBg)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.bottomSelectedTile)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.bottomSelectedTileForShape)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.topSelectedTile)
	    levelVariables.allLevelSettings.itemScreenObjectsGroup:insert(levelVariables.itemBagScreen.toggleShapeOrToolButton)

	    levelVariables.shapeRelatedArrays = require ( "modules.shape-related-arrays" )
	    levelVariables.allLevelSettings.showingToolsArray = {}
		levelVariables.allLevelSettings.showingObjectsArray = {}


	    levelVariables.seeObjectsButton = display.newImage("images/central-images/buttons/backToHome.png")
	    --levelVariables.seeObjectsButton:setReferencePoint(display.CenterCenterReferencePoint);
		    	levelVariables.seeObjectsButton.anchorX = 0.5
				levelVariables.seeObjectsButton.anchorY = 0.5
	    levelVariables.seeObjectsButton.x = levelVariables.itemBagScreen.x + 50
	    levelVariables.seeObjectsButton.y = levelVariables.itemBagScreen.y + levelVariables.itemBagScreen.contentHeight - 20
	    levelVariables.seeObjectsButton.xScale = 0.65
	    levelVariables.seeObjectsButton.yScale = 0.65
	    levelVariables.seeObjectsButton.alpha = 0
	    levelVariables.seeObjectsButton.state = "visible"

	    levelVariables.seeToolsButton = display.newImage("images/central-images/buttons/backToHome-over.png")
	    --levelVariables.seeToolsButton:setReferencePoint(display.CenterCenterReferencePoint);
		    	levelVariables.seeToolsButton.anchorX = 0.5
				levelVariables.seeToolsButton.anchorY = 0.5
	    levelVariables.seeToolsButton.x = levelVariables.itemBagScreen.x + 50
	    levelVariables.seeToolsButton.y = levelVariables.itemBagScreen.y + levelVariables.itemBagScreen.contentHeight - 20
	    levelVariables.seeToolsButton.xScale = 0.65
	    levelVariables.seeToolsButton.yScale = 0.65
	    levelVariables.seeToolsButton.alpha = 0
	    levelVariables.seeToolsButton.state = "hidden"

	    -- Tiles	

	    levelVariables.backButton = display.newImageRect("images/central-images/buttons/levelSelectBack.png", 70, 53)
	    	--levelVariables.backButton:setReferencePoint(display.CenterCenterReferencePoint);
		    	levelVariables.backButton.anchorX = 0.5
				levelVariables.backButton.anchorY = 0.5
	    	levelVariables.backButton.x = display.contentWidth - 40
	    	levelVariables.backButton.y = 29
	    	levelVariables.backButton:addEventListener("tap", backBtn)
	    	backgroundObjects:insert(levelVariables.backButton)

	    levelVariables.itemBagBtn = display.newImageRect("images/central-images/buttons/levelSelectItemBtn.png", 70, 53)
	    	--itemBagBtn:setReferencePoint(display.CenterCenterReferencePoint);
		    	levelVariables.itemBagBtn.anchorX = 0.5
				levelVariables.itemBagBtn.anchorY = 0.5
	    	levelVariables.itemBagBtn.x = display.contentWidth - 110
	    	levelVariables.itemBagBtn.y = 29
	    	levelVariables.itemBagBtn.originalX = display.contentWidth - 110
	    	levelVariables.itemBagBtn.originalY = 29
	    	levelVariables.itemBagBtn.finalX = contentCentreX - (480/2) + 427
	    	levelVariables.itemBagBtn.finalY = 33
            levelVariables.itemBagBtn.alpha = 0
            if levelVariables.thisLevelSettings.itemBagButtonsVisible then
                levelVariables.itemBagBtn.alpha = 1
	            levelVariables.itemBagBtn:addEventListener("tap", itemBag)
            end
	    	backgroundObjects:insert(levelVariables.itemBagBtn)


	    blackOverlay = display.newRect(0, 0, display.contentWidth, display.contentHeight)
		blackOverlay.anchorX = 0
		blackOverlay.anchorY = 0
	    blackOverlay:setFillColor(0, 0, 0)
	    blackOverlay.alpha = 0
	    ----

	    -------------------------
	    --Shape Objects In Game--
	    -------------------------
	    --------- SCREEN 1
	    local scrollViewPadding = (13/480) * display.contentWidth
	    local scrollViewHeight = (display.contentHeight - (scrollViewPadding * 2) - 50)
	    local scrollViewWidth = display.contentWidth
	    
	    scrollView = widget.newScrollView {
	    	top = 0,
	    	left = 0,
			verticalScrollDisabled = true,
            horizontalScrollDisabled = false,
			height = scrollViewHeight,
			width = scrollViewWidth,
	    	scrollWidth = scrollViewWidth - 46,
	    	scrollHeight = scrollViewHeight,
	    	listener = scrollListener,
			hideBackground = true
	    }

		scrollView.anchorX = 0
		scrollView.anchorY = 0
	    scrollView.x = 0
	    scrollView.y = scrollViewPadding + 41 

	    local xVal = scrollView.x + ((4/480) * display.contentWidth)
	    local originalXVal = xVal
	    local thisScreenXVal = originalXVal
	    local yVal = scrollView.y - 61
	    local originalYVal = yVal
	    
	    --Function to spawn an object

	    local tileImageSheet = graphics.newImageSheet( "images/level-images/" .. currentWorld .. "/Layout/levelSelectTile.png", {width = 125, height = 125, numFrames = 2, sheetContentWidth = 250, sheetContentHeight = 125})
	    local tileSequenceData = {
	        { name = "active", start=1, count=1,   loopCount=1 },
	        { name = "inactive", start=2, count=1,   loopCount=1 }
	    }

	    local function spawn ()
			object = display.newSprite(tileImageSheet, tileSequenceData)
			return object
	    end

	    local totalSilverMedals = 0
	    local totalGoldMedals = 0

	    totalLevels = 0
	    for secondKey, secondVal in pairs (levelConfigScript.levelConfigArray[currentWorld]) do
			totalLevels = totalLevels + 1
		end

	    for a = 1, totalLevels do
	    	if myGameSettings[currentWorld]["levels"][a]["silver_gained"] == true then
				totalSilverMedals = totalSilverMedals + 1
			end
			if myGameSettings[currentWorld]["levels"][a]["gold_gained"] == true then
				totalGoldMedals = totalGoldMedals + 1
			end
	    end

	    --Runtime:addEventListener( "enterFrame", storyboard.printMemUsage )
	    --Spawn two objects

	    silverMedalCounter = 0
	    for i = 1, totalLevels do

	    	--calculate if level is accessible

			levelButton[i] = spawn()

			levelButton[i].silverGained = myGameSettings[currentWorld]["levels"][i]["silver_gained"]
			levelButton[i].goldGained = myGameSettings[currentWorld]["levels"][i]["gold_gained"]

			levelButton[i].silverAccessible = false
			levelButton[i].goldAccessible = false

			levelButton[i].silverNeededForGold = levelConfigArray[currentWorld]["level"..i]["gold"]["silver"]
			levelButton[i].goldNeededForGold = levelConfigArray[currentWorld]["level"..i]["gold"]["gold"]

			if levelConfigArray[currentWorld]["level"..i]["silver"]["silver"] and totalSilverMedals >= levelConfigArray[currentWorld]["level"..i]["silver"]["silver"] then
	    		levelButton[i].silverAccessible = true
	    	elseif levelConfigArray[currentWorld]["level"..i]["silver"]["silver"] == nil then
	    		levelButton[i].silverAccessible = true
	    	end

	    	if levelConfigArray[currentWorld]["level"..i]["silver"]["gold"] then
	    		if totalGoldMedals < levelConfigArray[currentWorld]["level"..i]["silver"]["gold"] then
		    		levelButton[i].silverAccessible = false
		    	end
	    	end

	    	if levelConfigArray[currentWorld]["level"..i]["gold"]["silver"] then
	    		if totalSilverMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["silver"] then
		    		if levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
			    		if totalGoldMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
				    		levelButton[i].goldAccessible = true
				    	end
			    	else
			    		levelButton[i].goldAccessible = true
			    	end
		    	end
	    	else
	    		if levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
		    		if totalGoldMedals >= levelConfigArray[currentWorld]["level"..i]["gold"]["gold"] then
			    		levelButton[i].goldAccessible = true
			    	end
		    	else
		    		levelButton[i].goldAccessible = true
		    	end
	    	end
	    	

			levelButton[i]:setSequence("inactive")


	    	--levelButton[i]:setReferencePoint(display.TopLeftReferencePoint);
			levelButton[i].x = xVal
			levelButton[i].y = yVal
			
			--levelButton[i]:setReferencePoint(display.CenterCenterReferencePoint);
		    	levelButton[i].anchorX = 0.5
				levelButton[i].anchorY = 0.5
			levelButton[i].x = xVal + 62
			levelButton[i].y = yVal + 68
			levelButton[i].value = i
			levelButton[i].valueText = {}

			local levelValueString = tostring( i )

			scrollView:insert(levelButton[i])

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

			for a = 1, #levelValueString do
				levelButton[i].valueText[a] = display.newSprite(levelButtonNumberImageSheet, levelSelectNumberSequenceData)
				levelButton[i].valueText[a]:setSequence(string.sub(levelValueString, a, a))
	    	--levelButton[i].valueText:setReferencePoint(display.TopLeftReferencePoint);
		    	levelButton[i].valueText[a].anchorX = 0
				levelButton[i].valueText[a].anchorY = 0
				if (#levelValueString == 1) then
					levelButton[i].valueText[a].x = levelButton[i].x - 14
				else
					if a == 1 then
						levelButton[i].valueText[a].x = levelButton[i].x - 24
					else
						levelButton[i].valueText[a].x = levelButton[i].x - 3
					end
				end
				levelButton[i].valueText[a].y = levelButton[i].y - 47
				scrollView:insert(levelButton[i].valueText[a])
				levelButton[i].valueText[a]:toFront()
			end

			if levelButton[i].silverAccessible == true then
				silverMedalCounter = silverMedalCounter + 1

				levelButton[i]:setSequence("active")

				if myGameSettings[currentWorld]["levels"][i]["intro_complete"] == true then
				    --levelButton[i].valueText.text = levelButton[i].valueText.text .. "!"
				end

				levelButton[i].silverMedalGainedIcon = display.newSprite(mediumIconsImageSheet, mediumIconsSequenceData)
				levelButton[i].goldMedalGainedIcon = display.newSprite(mediumIconsImageSheet, mediumIconsSequenceData)

				if myGameSettings[currentWorld]["levels"][i]["silver_gained"] == true then
				    --levelButton[i].valueText.text = levelButton[i].valueText.text .. "s"
				    levelButton[i].silverMedalGainedIcon:setSequence("silverMedal")
				else
					levelButton[i].silverMedalGainedIcon:setSequence("missingMedal")
				end

				if myGameSettings[currentWorld]["levels"][i]["gold_gained"] == true then
				    --levelButton[i].valueText.text = levelButton[i].valueText.text .. "g"
				    levelButton[i].goldMedalGainedIcon:setSequence("goldMedal")
				else
				    levelButton[i].goldMedalGainedIcon:setSequence("missingMedal")
				    if levelButton[i].goldAccessible == false then
			    		levelButton[i].goldMedalGainedIcon.alpha = 0
				    end
				end

				levelButton[i].silverMedalGainedIcon.x = levelButton[i].x - 23
			    levelButton[i].silverMedalGainedIcon.y = levelButton[i].y + 18
				levelButton[i].goldMedalGainedIcon.x = levelButton[i].x + 24
			    levelButton[i].goldMedalGainedIcon.y = levelButton[i].y + 18

			    scrollView:insert(levelButton[i].silverMedalGainedIcon)
			    scrollView:insert(levelButton[i].goldMedalGainedIcon)

	        	levelButton[i]:addEventListener("tap", touchButton)
			end

			
			xVal = xVal + ((117 / 480) * display.contentWidth)
			
			
			
			if (i % 4 == 0) then
			    if (i % 8 == 0) then
					yVal = originalYVal
					thisScreenXVal = thisScreenXVal + display.contentWidth
			    else
					yVal = yVal + 116
			    end
			    xVal = thisScreenXVal
			end
	    end
	    
	    
	    foregroundObjects:insert(scrollView)

        levelVariables.totalScreens = (math.ceil(totalLevels/8))
        scrollView:setScrollWidth(display.contentWidth * levelVariables.totalScreens )

	    sceneGroup:toFront()
	    sceneGroup:insert(foregroundObjects)
	    sceneGroup:insert(backgroundObjects)
	    foregroundObjects:toFront()
	    backgroundObjects:toFront()
	    --scrollView:toFront()
	    --purge level
	    --storyboard.purgeScene( "backToHome" )
	    --storyboard.removeScene( "backToHome" )
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        audio.stop(musicChannel["levelSelect"])
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        levelVariables.itemBagBtn:removeEventListener("tap", itemBag)
	    levelVariables.backButton:removeEventListener("tap", backBtn)
	    dollarPlusSign:removeEventListener("tap", levelVariables.openIAP) 
	    livesPlusSign:removeEventListener("tap", levelVariables.openIAP)
	    for a = 1, #levelButton do
	    	levelButton[a]:removeEventListener("tap", touchButton)
	    end

		background:removeSelf()
	    background = nil

	    mainTitle:removeSelf()
	    mainTitle = nil

	    mainIconBar:removeSelf()
	    mainIconBar = nil

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

	    worldStatusBar:removeSelf()
	    worldStatusBar = nil

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

	    levelVariables.backButton:removeSelf()
	    levelVariables.backButton = nil

	    levelVariables.itemBagBtn:removeSelf()
	    levelVariables.itemBagBtn = nil

	    blackOverlay: removeSelf()
	    blackOverlay = nil
	    
	    for a = 1, #levelButton do
	        if (levelButton[a].valueText) then
	        	for b = 1, #levelButton[a].valueText do
					levelButton[a].valueText[b]:removeSelf()
					levelButton[a].valueText[b] = nil
				end
			end
			if (levelButton[a].silverMedalGainedIcon) then
				levelButton[a].silverMedalGainedIcon:removeSelf()
				levelButton[a].silverMedalGainedIcon = nil	
			end
			if (levelButton[a].goldMedalGainedIcon) then
				levelButton[a].goldMedalGainedIcon:removeSelf()
				levelButton[a].goldMedalGainedIcon = nil
			end
			levelButton[a]:removeSelf()
			levelButton[a] = nil
	    end


	    if (medalChooseScreen) then
	    	if medalChooseScreen.showing == true then
		    	silverMedalButton:removeEventListener("touch", touchMedalButton)
		    	goldMedalButton:removeEventListener("touch", touchMedalButton)
		    	closeButton:removeEventListener("touch", closeMedalScreen)
		    end

		    medalChooseScreen:removeSelf()
		    medalChooseScreen = nil
		    for a = 0, #medalScreenLevelCounter do
		    	medalScreenLevelCounter[a]:removeSelf()
		    	medalScreenLevelCounter[a] = nil
		    end

		    silverMedalButton:removeSelf()
		    silverMedalButton = nil
		    goldMedalButton:removeSelf()
		    goldMedalButton = nil
		    closeButton:removeSelf()
		    closeButton = nil
		    silverPlayNowLogo:removeSelf()
		    silverPlayNowLogo = nil
		    silverAchievedText:removeSelf()
		    silverAchievedText = nil
		    silverMedalAchievedButton:removeSelf()
		    silverMedalAchievedButton = nil
		    goldPlayNowLogo:removeSelf()
		    goldPlayNowLogo = nil
		    goldAchievedText:removeSelf()
		    goldAchievedText = nil
		    goldMedalAchievedButton:removeSelf()
		    goldMedalAchievedButton = nil
            silverGemLockedIcon:removeSelf()
            silverGemLockedIcon = nil
		    silverGemIcons:removeSelf()
		    silverGemIcons = nil
		    goldGemIcons:removeSelf()
		    goldGemIcons = nil
            for a = 1, #silverGemCounter do
                silverGemCounter[a]:removeSelf()
                silverGemCounter[a] = nil
            end
		    goldGemCounterFirstDigit:removeSelf()
		    goldGemCounterFirstDigit = nil
		    goldGemCounterSecondDigit:removeSelf()
		    goldGemCounterSecondDigit = nil
		    silverBestTimeIcon:removeSelf()
		    silverBestTimeIcon = nil
		    silverFirstTimeIcon:removeSelf()
		    silverFirstTimeIcon = nil
		    for a = 1, #silverBestTimeCounter do
		    	silverBestTimeCounter[a]:removeSelf()
		    	silverBestTimeCounter[a] = nil
		    end
		    for a = 1, #silverFirstTimeCounter do
		    	silverFirstTimeCounter[a]:removeSelf()
		    	silverFirstTimeCounter[a] = nil
		    end
		    goldBestTimeIcon:removeSelf()
		    goldBestTimeIcon = nil
		    goldFirstTimeIcon:removeSelf()
		    goldFirstTimeIcon = nil
		    for a = 1, #goldBestTimeCounter do
		    	goldBestTimeCounter[a]:removeSelf()
		    	goldBestTimeCounter[a] = nil
		    end
		    for a = 1, #goldFirstTimeCounter do
		    	goldFirstTimeCounter[a]:removeSelf()
		    	goldFirstTimeCounter[a] = nil
		    end
            silverCoinsLockedIcon:removeSelf()
            silverCoinsLockedIcon = nil
		    silverCoinsIconArray["redCoin"]:removeSelf()
		    silverCoinsIconArray["redCoin"] = nil
		    silverCoinsIconArray["blueCoin"]:removeSelf()
		    silverCoinsIconArray["blueCoin"] = nil
		    silverCoinsIconArray["purpleCoin"]:removeSelf()
		    silverCoinsIconArray["purpleCoin"] = nil
		    goldCoinsIconArray["redCoin"]:removeSelf()
		    goldCoinsIconArray["redCoin"] = nil
		    goldCoinsIconArray["blueCoin"]:removeSelf()
		    goldCoinsIconArray["blueCoin"] = nil
		    goldCoinsIconArray["purpleCoin"]:removeSelf()
		    goldCoinsIconArray["purpleCoin"] = nil
		    goldLockedBG: removeSelf()
		    goldLockedBG = nil
		    goldLockedText: removeSelf()
		    goldLockedText = nil
		    goldLockedSilverIcon: removeSelf()
		    goldLockedSilverIcon = nil
		    goldLockedSilverMedalCounter[1]: removeSelf()
		    goldLockedSilverMedalCounter[1] = nil
		    goldLockedSilverMedalCounter[2]: removeSelf()
		    goldLockedSilverMedalCounter[2] = nil
		    goldLockedSilverMedalCounter[3]: removeSelf()
		    goldLockedSilverMedalCounter[3] = nil

            goldLockedGoldIcon: removeSelf()
            goldLockedGoldIcon = nil
            goldLockedGoldMedalCounter[1]: removeSelf()
            goldLockedGoldMedalCounter[1] = nil
            goldLockedGoldMedalCounter[2]: removeSelf()
            goldLockedGoldMedalCounter[2] = nil
            goldLockedGoldMedalCounter[3]: removeSelf()
            goldLockedGoldMedalCounter[3] = nil

		end

		for a = 1, #levelVariables.toolArray do
			levelVariables.toolArray[a][4] = "not-created"
		end

		if (levelVariables.toolsShown == true) then
			-- need to remove all tool images etc
		end

		if (levelVariables.objectsShown == true) then
			-- need to remove all objects images etc
		end

		for a=1, scrollView.numChildren do
    		if (scrollView[a] ~= nil) then
    			--scrollView[a]:removeSelf()
    			--scrollView[a] = nil
	        end
	    end
		--scrollView:removeSelf()
        --scrollView = nil

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

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    --
    
    
    --scrollView:removeSelf()
    --scrollView = nil
    
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view



end

-- scene:addEventListener( "createScene", scene )
-- scene:addEventListener( "enterScene", scene )
-- scene:addEventListener( "exitScene", scene )
-- scene:addEventListener( "didExitScene", scene )

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene