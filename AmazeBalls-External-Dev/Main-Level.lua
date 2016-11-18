local composer = require ("composer")
local scene = composer.newScene()
local widget = require("widget")
widget.setTheme ( "widget_theme_ios" )
local physics = require("physics")
-- Clear previous scene
--storyboard.isDebug = true -- can be removed from Final version
--storyboard.removeAll()
--physics.setDrawMode("hybrid")
--
system.activate("multitouch")

--------------------
--------------------
local mainFunc, levelVariables, addBackEventListenersFromIAP, buttonListener, openIAP, closeIAP, buyButtonPressed, closePurchaseScreen, toggleShapeOrToolView, backgroundMusic
local removeIAPScreenListeners


local function dummyListener(event)
    return true
end

 --- IAP RELATED STARTS
if (iapAvail) then
    IAPScript = require("modules.IAP.IAP-config")
end

local livesPurchasedFunction, coinsUpdatedFunction

function livesPurchasedFunction ()
    IAPScript.IAPFunctionsScript.updateLivesDisplay(mainFunc.ballAndButtonAndScreenCreateScript.livesCounter)
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter)
    IAPScript.IAPFunctionsScript.updateLivesPlusButton(mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton, levelVariables.openIAP)
    IAPScript.IAPFunctionsScript.updateCoinsPlusButton(mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton, levelVariables.openIAP)
end

function coinsUpdatedFunction ()
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter)
    IAPScript.IAPFunctionsScript.updateCoinsPlusButton(mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton, levelVariables.openIAP)
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
                levelVariables.addPurchasedToolToBag(nil, "inGame", mainFunc)
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

    IAPScript.IAPFunctionsScript.buyButtonPressedMain(event.target,
        IAPScript.IAPStoreConfigurationArray, 
        IAPScript.IAPToolsItemArray, 
        IAPScript.IAPShapesItemArray,
        "myTotalToolArray.json", 
        "myGameSettings.json", 
        buyButtonPressed,
        levelVariables)
end

local addBackBuyButtonListener = function (button, levelVariables)
    if button.alpha == 1 then
        button:addEventlistener("tap", levelVariables.buyButtonPressed)
    end
end

local prepareCreateYouhaveDisplay = function (screen, relevantGameDataArrayPath, xValue, yValue, relScreen, speed, displayGroup)

    local objArray = IAPScript.createYouhaveDisplay(screen, relevantGameDataArrayPath, xValue, yValue, relScreen, speed, displayGroup)

    return objArray
end


function openIAP (event)
	if (event.target.value == "Coins")
	or (event.target.value == "Lives") then
    	mainFunc.buttonListenerScript.removePauseScreenEventListeners(mainFunc, levelVariables)
    	mainFunc.originOfIAPScreen = "pauseScreen"
    else
    	mainFunc.buttonListenerScript.removeItemBagScreenEventListeners(mainFunc, levelVariables)
    	mainFunc.originOfIAPScreen = "itemBagScreen"
    end

    if (levelVariables.IAPScreenObjectsGroup) then

    else
        levelVariables.IAPScreenObjectsGroup = display.newGroup()
    end

    IAPScript.openIAPScreen(event.target.value, levelVariables, event.target.relBool)
end

function closeIAP (event)

	--recreate tool display if we´ve come back to item bag screen
	if mainFunc.allLevelSettings.itemBagIsOpen == true then
		mainFunc.globalFunctions.createItemBagToolScreenAndScroll(mainFunc, mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.currentScreen, mainFunc.buttonListenerScript.itemsImageSheet, mainFunc.buttonListenerScript.itemsSequenceData, mainFunc.ballAndButtonAndScreenCreateScript, mainFunc.allLevelSettings, mainFunc.buttonListenerScript, mainFunc.listener, "inGame")
	end
	--recreate lives counter display
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

    timer.performWithDelay(800, function ()

    	--levelVariables.addBackEventListenersFromIAP()
    end)
    
end

function addBackEventListenersFromIAP (event)
	if mainFunc.originOfIAPScreen == "itemBagScreen" then
    	mainFunc.buttonListenerScript.addBackItemBagScreenEventListeners(mainFunc, levelVariables)
    elseif mainFunc.originOfIAPScreen == "pauseScreen" then
    	mainFunc.buttonListenerScript.addBackPauseScreenEventListeners(mainFunc, levelVariables)
    end
end

    ----IAP RELATED ENDS

function toggleShapeOrToolView(event)
    mainFunc.globalFunctions.toggleShapeOrToolView(mainFunc, mainFunc.allLevelSettings, mainFunc.ballAndButtonAndScreenCreateScript, "inGame")
end

local changeToolInnerScreen = function (event)
    if (event.target.isMysteryBlockBagTab) then
        mainFunc.globalFunctions.changeMysteryBlockBagSelectedTile(mainFunc, event.target.value, event.target.index)
    else
        mainFunc.globalFunctions.changeToolSelectedTile(mainFunc.ballAndButtonAndScreenCreateScript, mainFunc.allLevelSettings, event.target.value)
        mainFunc.globalFunctions.createToolInnerScreen(mainFunc, mainFunc.ballAndButtonAndScreenCreateScript, mainFunc.allLevelSettings, mainFunc.buttonListenerScript, event.target.value, "inGame")
    end
end

local function on_Triangle_Collision( event )
    if (event.target.objectType == "shape" or event.target.objectType == "gun")
    and ( event.phase == "began" ) then
    	event.target.collision = nil
    	if (event.other.projectileType ~= "hookshot")
    	and event.other.isCollisioningWith ~= event.target.relevantShapeArrayIndex then

            if (event.other.projectileType == "bullet" and event.other.readyToCollide == false) then
            else
        		local oldDirection = event.other.direction

    			mainFunc.projectileReboundScript.detectSpecialRebound(event.target, event.other, oldDirection)

    			mainFunc.tm[event.other.projectileType][event.other.relevantArrayIndex]:cancelAll()

    			mainFunc.projectileReboundScript.detectRebound(event, mainFunc)

        		event.target.isCollisioningWith = event.target.relevantShapeArrayIndex
            end

		elseif (event.other.projectileType == "hookshot")
		and (event.other.isCollisioningWith ~= event.target.relevantShapeArrayIndex) then
    		event.other.isCollisioningWith = event.target.relevantShapeArrayIndex
    		mainFunc.tm["hookshot"][1]:cancelAll()
			mainFunc.projectileReboundScript.detectRebound(event, mainFunc)
		end
    end
end

local function autoFanTransitionListener (event)
	mainFunc.objectToBallTransitionScript.autoFanAndEtcTransition(mainFunc, shapeArray, shapeArrayParameters)
end

local function gemCollisionListener (event)
    mainFunc.objectToBallTransitionScript.gemCollision(event, mainFunc)
end

local function transitionMoveSomething (event)
   mainFunc.transitionFunctionScript.mainTransitionMoveSomething(mainFunc.allLevelSettings.currentSlidingObject, mainFunc, shapeArray, shapeArrayParameters)
end

local function closeMysteryBlockRemoveOption(event)
    mainFunc.objectListenerScript.closeMysteryBlockRemoveOption(event, mainFunc)
end

local function mysteryBlockRemoveComplete(event)
    mainFunc.objectListenerScript.mysteryBlockRemoveComplete(event, mainFunc, shapeArrayParameters, shapeArray)
end

local function mysteryBlockRemove(event)
    if event.phase == "began" then
        if event.target.shapeArrayIndex == mainFunc.ballAndButtonAndScreenCreateScript.instance2.lastFanIndex
        and mainFunc.allLevelSettings.isBallMovingState == "false" then

        else
            mainFunc.mysteryBlockRemoveTimer = timer.performWithDelay(1200, function ()
                mainFunc.mysteryBlockRemoveTimer = nil
                mainFunc.objectListenerScript.mysteryBlockRemoveOption(event, mainFunc, shapeArray, shapeArrayParameters)
            end)
        end
    elseif event.phase == "moved" then
        if event.x > event.target.x + 30
        or event.x > event.target.x - 30
        or event.x > event.target.y + 26
        or event.x > event.target.y + 26 then
            if mainFunc.mysteryBlockRemoveTimer and mainFunc.mysteryBlockRemoveTimer ~= nil then
                timer.cancel(mainFunc.mysteryBlockRemoveTimer)
            end
        end
    elseif event.phase == "ended" then
        if mainFunc.mysteryBlockRemoveTimer and mainFunc.mysteryBlockRemoveTimer ~= nil then
            timer.cancel(mainFunc.mysteryBlockRemoveTimer)
        end
    end
end

local function closeMysteryBagScreen(event)
    mainFunc.objectListenerScript.closeMysteryBagScreen(mainFunc, false, shapeArray, shapeArrayParameters)
end

local function mysteryBlockShapeListener(event)
    mainFunc.objectListenerScript.mysteryBlockShapeListener(event, mainFunc, shapeArray, shapeArrayParameters)
end

local function listener(event)
    mainFunc.objectListenerScript.objectListener(event, mainFunc, shapeArray, shapeArrayParameters)
end

local function updateMainLevelTimer(mainFunc, shapeArray, shapeArrayParameters)
    local function roundToFirstDecimal(t)
        return math.round(t*10)*0.1
    end
    local minuteStringLength = 2
    local secondStringLength = 1
    mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds = mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds - 0.1
    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds == 0 then
        if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes > 0 then
            mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds = 59.9
            mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes = mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes - 1
        end
    elseif mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds == -0.1 then
        mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds = 59.8
        mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes = mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes - 1
    end
    mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds = roundToFirstDecimal(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds)

    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes > 9 then
        minuteStringLength = 3
    elseif mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes == 0 then
        minuteStringLength = 0
    end
    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds > 9 then
        secondStringLength = 2
    end

    local levelTimeString = tostring(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds)
    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes > 0 then
        levelTimeString = tostring(mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes) .. "m" .. levelTimeString
    end

    if #levelTimeString == (minuteStringLength + secondStringLength) then
        levelTimeString = levelTimeString .. ".0"
    end

    mainFunc.ballAndButtonAndScreenCreateScript.levelTimerLabel.text.text = levelTimeString
    if mainFunc.ballAndButtonAndScreenCreateScript.levelTimeSeconds == 0 and mainFunc.ballAndButtonAndScreenCreateScript.levelTimeMinutes == 0 then
        timer.cancel(mainFunc.levelTimerUpdateTimer)
        mainFunc.projectileMovementRemoveAndRespawnScript.startBallAgain(mainFunc, true, true, shapeArray, shapeArrayParameters)
    end
end

local followShapeWithBall = function (mainFunc)
    if mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > mainFunc.allLevelSettings.currentShapeBallShouldFollow.y then
        mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y - 8
    elseif mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < mainFunc.allLevelSettings.currentShapeBallShouldFollow.y then
        mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = mainFunc.ballAndButtonAndScreenCreateScript.instance2.y + 8
    end
    if mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > mainFunc.allLevelSettings.currentShapeBallShouldFollow.x then
        mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x - 8
    elseif mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < mainFunc.ballAndButtonAndScreenCreateScript.instance2.x then
        mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = mainFunc.ballAndButtonAndScreenCreateScript.instance2.x + 8
    end
end

local spitterArrowTouch = function (event)
	mainFunc.objectListenerScript.spitterArrowTouch(event, mainFunc, shapeArray, shapeArrayParameters)
end

local function activateAutoSlideObject(mainFunc, shapeArray, shapeArrayIndex, transArrayIndex)
    local c = shapeArrayIndex
    local d = transArrayIndex
    local lengthOfArray = #mainFunc.allLevelSettings.transitionArrayIndex[d]
    shapeArray[c].transitionIsNextOrPrev = "next"
    shapeArray[c].transitionArrayIndex = d
    shapeArray[c].timePerSquare = 400
    shapeArray[c].pauseTime = 50
    if mainFunc.allLevelSettings.transitionArrayIndex[d][3]["timePerSquare"] then
        shapeArray[c].timePerSquare = mainFunc.allLevelSettings.transitionArrayIndex[d][3]["timePerSquare"]
    end
    if mainFunc.allLevelSettings.transitionArrayIndex[d][3]["pauseTime"] then
        shapeArray[c].pauseTime = mainFunc.allLevelSettings.transitionArrayIndex[d][3]["pauseTime"]
    end
    shapeArray[c].isActiveWhenSliding = true
    shapeArray[c].isAutoSlideObject = true
    shapeArray[c].shouldBallMoveInAutoSlide = false
    shapeArray[c].autoSlideIsPaused = false
    if mainFunc.allLevelSettings.transitionArrayIndex[d][3]["isActiveWhenSliding"] == false then
        shapeArray[c].isActiveWhenSliding = false
    end
    shapeArray[c].maxSlideTransitionIndex = mainFunc.allLevelSettings.transitionArrayIndex[d][lengthOfArray - 1][1]
    shapeArray[c].currentSlideTransitionIndex = mainFunc.allLevelSettings.transitionArrayIndex[d][4][1]
    shapeArray[c].autoSlideTransition = {}
    shapeArray[c].autoSlideTimer = {}
    for a = 1, #mainFunc.allLevelSettings.transitionArrayIndex[d] do
        if a > 4 and a % 2 ~= 0 then
            if mainFunc.allLevelSettings.transitionArrayIndex[d][a][1] == shapeArray[c].currentSlideTransitionIndex then
                shapeArray[c].currentSlideTransitionIndex = a
                if a == lengthOfArray - 1 then
                    shapeArray[c].transitionIsNextOrPrev = "prev"
                end
            end
        end
    end

    mainFunc.transitionFunctionScript.actionAutoSlideTimer(mainFunc, shapeArray[c], true)
end

local function activateObjectsForPlay(mainFunc, shapeArray, shapeArrayIndex)
	shape = shapeArray[shapeArrayIndex]

    function shape:tap(event)
    	if event.target.enabled == true
    	and mainFunc.allLevelSettings.mapShowCounter == 0 then
	    	if ( ( (event.target.isBallPresent == true) and (event.target.objectType == "simple" or event.target.objectType == "backFire" or event.target.objectType == "characterChangePoint"))) then
	    		--this applies to Simples
                mainFunc.objectListenerScript.objectBallActivate(event, mainFunc, shapeArray, shapeArrayParameters)
	    	elseif event.numTaps == 1
	    	and ((event.target.isBallPresent == true
				 and event.target.objectType == "spitter")
			) then
                event.target.enabled = false
                event.target:removeEventListener("tap")
                event.target:removeEventListener("touch")

                local createArrow, secondPositionArrow, fireBall
                local function createArrow()
                    local obj = display.newSprite(mainFunc.allLevelSettings.tunnelPiecesImageSheet, mainFunc.allLevelSettings.tunnelPiecesSequenceData)
                    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(obj)
                    obj:toFront()
                    obj:setSequence("whiteArrow")
                    obj.relatedSpitter = shapeArray[shapeArrayIndex]

                    return obj
                end
                local function firstPositionArrow(arrow)
                    arrow.x = shapeArray[shapeArrayIndex].x
                    arrow.y = shapeArray[shapeArrayIndex].y
                end
                local secondPositionArrow = {
                    up = function (arrow) arrow.rotation = -90 arrow.y = arrow.y - yCalc(24) end,
                    right = function (arrow) arrow.x = arrow.x + xCalc(27) end,
                    down = function (arrow) arrow.rotation = 90 arrow.y = arrow.y + yCalc(24) end,
                    left = function (arrow) arrow.rotation = 180 arrow.x = arrow.x - xCalc(27) end
                }
                if shapeArray[shapeArrayIndex].upArrow then
                    shapeArray[shapeArrayIndex].upArrow.alpha = 0
                    if shapeArray[shapeArrayIndex].upArrowClickable then
                        shapeArray[shapeArrayIndex].upArrowClickable.alpha = 1
                    else
                        shapeArray[shapeArrayIndex].upArrowClickable = createArrow()
                    end
                    firstPositionArrow(shapeArray[shapeArrayIndex].upArrowClickable)
                    secondPositionArrow["up"](shapeArray[shapeArrayIndex].upArrowClickable)
                    shapeArray[shapeArrayIndex].upArrowClickable.direction = "up"
                    shapeArray[shapeArrayIndex].upArrowClickable:addEventListener("tap", mainFunc.spitterArrowTouch)
                end
                if shapeArray[shapeArrayIndex].rightArrow then
                    shapeArray[shapeArrayIndex].rightArrow.alpha = 0
                    if shapeArray[shapeArrayIndex].rightArrowClickable then
                        shapeArray[shapeArrayIndex].rightArrowClickable.alpha = 1
                    else
                        shapeArray[shapeArrayIndex].rightArrowClickable = createArrow()
                    end
                    firstPositionArrow(shapeArray[shapeArrayIndex].rightArrowClickable)
                    secondPositionArrow["right"](shapeArray[shapeArrayIndex].rightArrowClickable)
                    shapeArray[shapeArrayIndex].rightArrowClickable.direction = "right"
                    shapeArray[shapeArrayIndex].rightArrowClickable:addEventListener("tap", mainFunc.spitterArrowTouch)
                end
                if shapeArray[shapeArrayIndex].downArrow then
                    shapeArray[shapeArrayIndex].downArrow.alpha = 0
                    if shapeArray[shapeArrayIndex].downArrowClickable then
                        shapeArray[shapeArrayIndex].downArrowClickable.alpha = 1
                    else
                        shapeArray[shapeArrayIndex].downArrowClickable = createArrow()
                    end
                    firstPositionArrow(shapeArray[shapeArrayIndex].downArrowClickable)
                    secondPositionArrow["down"](shapeArray[shapeArrayIndex].downArrowClickable)
                    shapeArray[shapeArrayIndex].downArrowClickable.direction = "down"
                    shapeArray[shapeArrayIndex].downArrowClickable:addEventListener("tap", mainFunc.spitterArrowTouch)
                end
                if shapeArray[shapeArrayIndex].leftArrow then
                    shapeArray[shapeArrayIndex].leftArrow.alpha = 0
                    if shapeArray[shapeArrayIndex].leftArrowClickable then
                        shapeArray[shapeArrayIndex].leftArrowClickable.alpha = 1
                    else
                        shapeArray[shapeArrayIndex].leftArrowClickable = createArrow()
                    end
                    firstPositionArrow(shapeArray[shapeArrayIndex].leftArrowClickable)
                    secondPositionArrow["left"](shapeArray[shapeArrayIndex].leftArrowClickable)
                    shapeArray[shapeArrayIndex].leftArrowClickable.direction = "left"
                    shapeArray[shapeArrayIndex].leftArrowClickable:addEventListener("tap", mainFunc.spitterArrowTouch)
                end

                mainFunc.thisLevelSettings.currentSpitter = shapeArrayIndex
                mainFunc.thisLevelSettings.currentArrowTimer = timer.performWithDelay(1000, function ()
                    mainFunc.objectListenerScript.deactivateSpitter(mainFunc, shapeArray, false)
                end)
	    		--shapeArray[shapeArrayIndex]:addEventListener("touch", mainFunc.objectDoubleTouchSetUp)
	    		if (shapeArray[shapeArrayIndex].canShapeSlide == true) then
                    shapeArray[shapeArrayIndex].canShapeSlide = false
	    			shapeArray[shapeArrayIndex]:removeEventListener("touch", mainFunc.listener)
                    shapeArray[shapeArrayIndex].mainFuncListenerAdded = false
	    		end
	    	elseif event.numTaps == 1
            and event.target.objectType == "manualFan" then
                if (event.target.relevantHorzScreen  == mainFunc.allLevelSettings.ballScreenHorzValue and event.target.relevantVertScreen == mainFunc.allLevelSettings.ballScreenVertValue and mainFunc.allLevelSettings.mapShowCounter == 0)
                or (mainFunc.thisLevelSettings.compassObtained == true and (event.target.relevantHorzScreen  ~= mainFunc.allLevelSettings.ballScreenHorzValue or event.target.relevantVertScreen ~= mainFunc.allLevelSettings.ballScreenVertValue)) then
                    print("onno")
                    event.target:setSequence("autoFan")
                    event.target.activeNow = true
                    if mainFunc.allLevelSettings.manualFanCounter == 0 then
                        mainFunc.allLevelSettings.manualFanCounter = 1
                    end

                    display.getCurrentStage():setFocus( nil )
                    
                    local thisFan = event.target
                    thisFan.turnOffFunction = function ()
                        thisFan:setSequence("manualFan")
                        thisFan.activeNow = false
                    end
                    event.target.activeTimer = timer.performWithDelay(750, function ()
                        thisFan.turnOffFunction()
                    end)
                end
            end
    	end
	end
    shapeArray[shapeArrayIndex]:addEventListener("tap")
end

local function deactivateObjectsForPlay(mainFunc, shapeArray, shapeArrayIndex)
	shapeArray[shapeArrayIndex]:removeEventListener("tap")
end

local function mapButtonListener (event)
    if mainFunc.allLevelSettings.manualScreenChangeCounter == 0 then
    	local resetScreenChangeCounter = function ()
			resettingScreenChangeCounter()
		end
        mainFunc.allLevelSettings.manualScreenChangeCounter = 1
		mainFunc.buttonListenerScript.mapButtonFunctionArray[event.target.name](mainFunc)
    end
end

function buttonListener(event)
    event.target:removeEventListener("tap", mainFunc.buttonListener)

    mainFunc.buttonListenerScript.buttonListenerBeganFunctionArray[event.target.name](mainFunc, shapeArray, shapeArrayParameters, composer, levelVariables)

	if event.target.name == "play" and event.phase == "moved" then
		mainFunc.buttonListenerScript.movedPlayPressedFunction(event, mainFunc, shapeArray)
	elseif event.target.name == "play" and event.phase == "ended" then
		mainFunc.buttonListenerScript.endedPlayPressedFunction( mainFunc, shapeArray)
	end 
end

local function mysteryBlockTouch (event)
    --if event.phase == "began" then
	   mainFunc.objectListenerScript.mysteryBlockTouchFunction(event, mainFunc, shapeArray, shapeArrayParameters)
    --end
end

local closeItemGainedScreen = function (event)
	mainFunc.objectToBallTransitionScript.closeItemGainedScreenFunction(mainFunc, shapeArray, shapeArrayParameters)
end

local function resetLevel()
    -- simply go to level1.lua scene
    composer.gotoScene( "reset", {effect = "slideDown", time = 150} )
    return true -- indicates successful touch
end

local function backToLevelMenu ()

	if (mainFunc.projectileMovementRemoveAndRespawnScript.createBulletTimer) then
		timer.cancel(mainFunc.projectileMovementRemoveAndRespawnScript.createBulletTimer)
	end
	timer.performWithDelay(100, composer.gotoScene("backToHome", "fade", 10))
end

-- Called when the scene's view does not exist:

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
    --these 2 lines below used to be in willEnterScene, and the rest of it used to be in enterScene


    --the rest of it
    -- Load two audio streams and one sound
    backgroundMusic = audio.loadStream( "audio/" .. currentWorld .. "-main.wav" )

    -- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
    musicChannel["mainLevel"] = audio.play( backgroundMusic, { channel=4, loops=-1, fadein=2000 } )

    physics.start()

	mainFunc = {}

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

    levelVariables.IAPOpened = false
    levelVariables.LivesOpened = false
    levelVariables.CoinsOpened = false
    levelVariables.ToolsOpened = false
    levelVariables.ShapesOpened = false
    levelVariables.UnlockOpened = false
    levelVariables.itemBagIsOpen = false

	mainFunc.halfW = display.contentCenterX
	mainFunc.halfH = display.contentCenterY
	mainFunc.ox, mainFunc.oy = math.abs(display.screenOriginX), math.abs(display.screenOriginY)

	mainFunc.widget = widget

	mainFunc.tManager = require("classes.transitionManager")

	mainFunc.tm = {
	    ball = {},
	    bullet = {},
	    hookshot = {}
	}

    mainFunc.closeMysteryBlockRemoveOption = closeMysteryBlockRemoveOption
    mainFunc.mysteryBlockRemoveComplete = mysteryBlockRemoveComplete
    mainFunc.mysteryBlockRemove = mysteryBlockRemove
    mainFunc.closeMysteryBagScreen = closeMysteryBagScreen
    mainFunc.mysteryBlockShapeListener = mysteryBlockShapeListener

	mainFunc.globalFunctions = require("modules.global-button-functions")
    mainFunc.globalImageCreateFunctions = require("modules.global-image-creation-functions")
    levelVariables.globalImageCreateFunctions = mainFunc.globalImageCreateFunctions

	mainFunc.ballAndButtonAndScreenCreateScript = require("modules.ball-and-button-and-screen-create-script")
	
	levelConfigScript = require("modules.level-config-array")
    mainFunc.popUpIntroTutorial = levelConfigScript.popUpIntroTutorial
	mainFunc.levelConfigArray = levelConfigScript.levelConfigArray
	mainFunc.characterConfigArray = levelConfigScript.characterConfigArray
	mainFunc.fullCharacterConfigArray = levelConfigScript.fullCharacterConfigArray
    mainFunc.itemConfigArray = levelConfigScript.itemConfigArray
	mainFunc.worldConfigArray = levelConfigScript.worldConfigArray

	mainFunc.thisLevelSettings = require("modules.levels." .. currentWorld .. ".level" .. currentLevelLabel)

	mainFunc.allLevelSettings = require("modules.levels.all-level-settings")
		mainFunc.allLevelSettings.createLevelSettings(mainFunc, "in-level")
		shapeArray = mainFunc.allLevelSettings.shapeArray
		shapeArrayParameters = mainFunc.allLevelSettings.shapeArrayParameters
	--------------------

	local autoFanArray = {}
	local manualFanArray = {}
	local triangleArray = {}

	mainFunc.thisLevelSettings.createLevelObjects(mainFunc, shapeArrayParameters)

	local j = 0

	mainFunc.shapeRelatedArrays = require ( "modules.shape-related-arrays" )

		myGameSettings = loadTable("myGameSettings.json")

		myTotalToolArray = loadTable("myTotalToolArray.json")
			mainFunc.thisLevelSettings.toolArray = myTotalToolArray

		myTotalObjectArray = loadTable("myTotalObjectArray.json")
			mainFunc.thisLevelSettings.objectArray = myTotalObjectArray

	mainFunc.screenChangingScript = require("modules.screen-changing-functions")

	mainFunc.projectileMovementRemoveAndRespawnScript = require("modules.projectile-movement-remove-and-respawn-functions")

	mainFunc.projectileReboundScript = require("modules.projectile-rebound-functions")

    mainFunc.createLevelObjectScript = require("modules.create-level-object-functions")

        mainFunc.dummyListener = dummyListener

		mainFunc.gemCollisionListener = gemCollisionListener

		mainFunc.on_Triangle_Collision = on_Triangle_Collision

		mainFunc.closeItemGainedScreen = closeItemGainedScreen

		mainFunc.mysteryBlockTouch = mysteryBlockTouch

		mainFunc.changeToolInnerScreen = changeToolInnerScreen

        mainFunc.toggleShapeOrToolView = toggleShapeOrToolView

        mainFunc.followShapeWithBall = followShapeWithBall

	mainFunc.objectToBallTransitionScript = require("modules.all-object-to-ball-transition-functions")

	mainFunc.objectFlipScript = require ("modules.object-flip-function")


		mainFunc.autoFanTransitionListener = autoFanTransitionListener

	local function tunnelTransitionListener(event)
		mainFunc.objectToBallTransitionScript.tunnelTransition(mainFunc, shapeArray, shapeArrayParameters)
	end
		mainFunc.tunnelTransitionListener = tunnelTransitionListener

	local function doorTransition (event)
	    mainFunc.objectToBallTransitionScript.mainDoorTransition(mainFunc, shapeArray, shapeArrayParameters)
	end
		mainFunc.doorTransition = doorTransition

	--[[

	local function createAndControlLaser (event)
	    local function laserCollision (event)
	        local text = display.newText("hi", 20, 20, nil, 14)
	        if event.phase == "began" then
	            
	        local text = display.newText("hi", 20, 20, nil, 14) 
	        end
	    end
	    for a = 1, #shapeArray do
	        if shapeArrayParameters[a][1] == "laser" then
	            if shapeArrayParameters[a][7] == "down" then
	                if shapeArray[a].laserCounter == 0 then
	                    thisLaserX = shapeArray[a].x
	                    thisLaserY = shapeArray[a].y
	                    shapeArray[a].laserCounter = 1
	                end
	                if thisLaserY < display.contentHeight then
	                    shapeArray[a].laser = display.newImage("flipPositionSwitchNumber2.png")
	                    physics.addBody( shapeArray[a].laser, "static", { density=10, friction=1, bounce=0, gravity = 0 } )
	                    shapeArray[a].laser:addEventListener("collision", laserCollision)
	                    frontScreenObjectsGroup:insert( shapeArray[a].laser )
	                    shapeArray[a].laser.x = thisLaserX
	                    shapeArray[a].laser.y = thisLaserY
	                    thisLaserY = thisLaserY + 20
	                end
	            end
	        end
	    end
	end

	]]--

	mainFunc.transitionFunctionScript = require ("modules.all-transitioning-functions")

		mainFunc.transitionMoveSomething = transitionMoveSomething

	mainFunc.screenShowingScript = require ("modules.screen-showing-script")

		mainFunc.resetLevel = resetLevel
		mainFunc.backToLevelMenu = backToLevelMenu

	local eventStartY, eventStartX

	mainFunc.objectListenerScript = require("modules.object-listener-functions")

	mainFunc.objectFunctionsScript = require("modules.object-functions")

		mainFunc.listener = listener

        mainFunc.updateMainLevelTimer = updateMainLevelTimer

		mainFunc.activateObjectsForPlay = activateObjectsForPlay

        mainFunc.activateAutoSlideObject = activateAutoSlideObject

		mainFunc.deactivateObjectsForPlay = deactivateObjectsForPlay

		mainFunc.spitterArrowTouch = spitterArrowTouch


	mainFunc.buttonListenerScript = require("modules.button-listener-functions")


		mainFunc.mapButtonListener = mapButtonListener

		mainFunc.buttonListener = buttonListener

	mainFunc.objectCreateScript = require("modules.object-create-script")

    mainFunc.allLevelSettings.followShapeWithBallApplied = false

	mainFunc.thisLevelSettings.originalToolArray = loadTable("myTotalToolArray.json")
	mainFunc.thisLevelSettings.originalObjectArray = loadTable("myTotalObjectArray.json")
    mainFunc.thisLevelSettings.bombsCanExplode = true
    mainFunc.thisLevelSettings.mapObtained = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["map_obtained"]
    mainFunc.thisLevelSettings.mapObtained = true
    mainFunc.thisLevelSettings.compassObtained = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["compass_obtained"]
    mainFunc.thisLevelSettings.tutorialsToDo = {}
    mainFunc.thisLevelSettings.itemWasDiscoveredInLevel = {}
    mainFunc.thisLevelSettings.itemBagButtonsVisible = false
    if myGameSettings["toolsDiscovered"] or myGameSettings["shapesDiscovered"] then
        mainFunc.thisLevelSettings.itemBagButtonsVisible = true
    end
    mainFunc.thisLevelSettings.miscellaneousTimer = {}
    mainFunc.thisLevelSettings.miscellaneousTransition = {}
    mainFunc.thisLevelSettings.originalCoins = myGameSettings["total_coins"]

    --BOMB STUFF

    mainFunc.thisLevelSettings.bombIsInUse = false
    mainFunc.thisLevelSettings.bombInUseCounter = 0
    mainFunc.thisLevelSettings.bombIsExplodingCounter = 0

    mainFunc.thisLevelSettings.bombArray = {}


	-----------------

    mainFunc.thisLevelSettings.tunnelCounter = 0
    mainFunc.thisLevelSettings.alreadyProcessedTunnels = {}
    mainFunc.thisLevelSettings.duplicateTunnelItemsProcessed = 0
    mainFunc.thisLevelSettings.numberOfSwitchesCounter = 1

    local function createLevelObject(shapeArrayParameters, shapeArray, z, mainFunc)
        mainFunc.createLevelObjectScript.createLevelObject(shapeArrayParameters, shapeArray, z, mainFunc)
    end
        mainFunc.createLevelObject = createLevelObject
    
    local function insertGroupsIntoMainGroup(mainFunc, shapeArray, shapeArrayParameters)
        --EXT: Function occurs at start of level, to Create Level objects
        -------------------------
        --Shape Objects In Game--
        -------------------------

        local tutorialItemsToDoProcessed = {}
        --EXT: Loop through ShapeArrayParameters for initial ShapeArray objects creation
        for index = 1, #shapeArrayParameters do
            createLevelObject(shapeArrayParameters, shapeArray, index, mainFunc)

            local shapeName = shapeArrayParameters[index][1]
            if myGameSettings["tutorialDone"][shapeName] == false then
                local alreadyAddedToTutArray = false
                for a = 1, #tutorialItemsToDoProcessed do
                    if tutorialItemsToDoProcessed[a] == shapeName then
                        alreadyAddedToTutArray = true
                    end
                end
                if alreadyAddedToTutArray == false then
                    mainFunc.thisLevelSettings.tutorialsToDo[#mainFunc.thisLevelSettings.tutorialsToDo + 1] = shapeName
                    table.insert(tutorialItemsToDoProcessed, shapeName)
                end
            end
        end

        if currentWorld == "WoodyWalk" and currentLevel == 8 then

            mysteryShapesToAddArray = {
                {shapeName="shape", location={1,1,2,4}, shape="triangleTopRightShape", isBar = false},
                {shapeName="spitter", location={1,1,2,2}, directions={"up", "down", "left"}},
                {shapeName="autoFan", location={1,1,1,2}, directions={"right"}},
                {shapeName="manualFan", location={1,1,7,2}, directions={"up"}},
                {shapeName="simple", location={1,1,3,1}},
                {shapeName="shape", location={1,1,5,4}, shape="horz", isBar = true}
            }
        else
            mysteryShapesToAddArray = {}
        end

        local mysteryShapesToAddArray = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["mystery_shapes_to_add"]

        for a = 1, #mysteryShapesToAddArray do
            local newShapeObj = {}

            newShapeObj[1] = mysteryShapesToAddArray[a]["shapeName"]
            newShapeObj[2] = mysteryShapesToAddArray[a]["shapeName"] .. "_" .. mysteryShapesToAddArray[a]["location"][1] .. "_" ..mysteryShapesToAddArray[a]["location"][2] .. "_" ..mysteryShapesToAddArray[a]["location"][3] .. "_" .. mysteryShapesToAddArray[a]["location"][4]
            for b = 1, #mysteryShapesToAddArray[a]["location"] do
                newShapeObj[b + 2] = mysteryShapesToAddArray[a]["location"][b]
            end

            if mysteryShapesToAddArray[a]["shapeName"] == "spitter" then
                local upExists = false
                local rightExists = false
                local leftExists = false
                local downExists = false
                for b = 1, #mysteryShapesToAddArray[a]["directions"] do
                    if mysteryShapesToAddArray[a]["directions"][b] == "up" then
                        upExists = true
                    elseif mysteryShapesToAddArray[a]["directions"][b] == "right" then
                        rightExists = true
                    elseif mysteryShapesToAddArray[a]["directions"][b] == "down" then
                        downExists = true
                    elseif mysteryShapesToAddArray[a]["directions"][b] == "left" then
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
            elseif mysteryShapesToAddArray[a]["shapeName"] == "manualFan"
            or mysteryShapesToAddArray[a]["shapeName"] == "autoFan" then
                newShapeObj[7] = mysteryShapesToAddArray[a]["directions"][1]
            elseif mysteryShapesToAddArray[a]["shapeName"] == "shape" then
                if mysteryShapesToAddArray[a]["isBar"] == true then
                    newShapeObj[7] = "bar"
                    newShapeObj[8] = mysteryShapesToAddArray[a]["shape"]
                    newShapeObj[9] = _
                else
                    newShapeObj[7] = mysteryShapesToAddArray[a]["shape"]
                    newShapeObj[8] = 1
                    newShapeObj[9] = _
                end
            end

            shapeArrayParameters[#shapeArrayParameters + 1] = newShapeObj

            createLevelObject(shapeArrayParameters, shapeArray, #shapeArrayParameters, mainFunc)
        end

        --EXT: Create Transition Settings
        mainFunc.transitionFunctionScript.prepareTransitioningObjects(mainFunc)
       
        mainFunc.ballAndButtonAndScreenCreateScript.createBall(mainFunc)

    	-- mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = 240
    	-- mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = 275

        mainFunc.ballAndButtonAndScreenCreateScript.otherScreensAndButtonCreate(mainFunc, levelVariables, shapeArrayParameters)
        
        mainFunc.backgroundGrids = display.newGroup()

        for a = 1, mainFunc.thisLevelSettings.screenHorzTotal do
        	for b = 1, mainFunc.thisLevelSettings.screenVertTotal do
        		thisBackgroundGrid = display.newImageRect(mainFunc.allLevelSettings.backgroundImage, 480, 320)
        		thisBackgroundGrid.x = ((a - 1) * display.contentWidth) + (display.contentWidth / 2)
                thisBackgroundGrid.y = ((b - 1) * display.contentHeight) + (display.contentHeight / 2)
                thisBackgroundGrid.width = display.contentWidth + mainFunc.ox + mainFunc.ox
        		thisBackgroundGrid.height = display.contentHeight + mainFunc.oy + mainFunc.oy
        		thisBackgroundGrid.anchorX = 0.5
        		thisBackgroundGrid.anchorY = 0.5
        		mainFunc.backgroundGrids:insert(thisBackgroundGrid)
        	end
        end

        --sceneGroup:insert(mainFunc.backgroundGrid)

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.mapScreen) 

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.levelTimerLabel) 

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.levelTimerLabel.text) 

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel) 

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.map) 

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.compass)

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen)
            
    	sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.playBtn)
    
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.backBtn)
        
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.rightBtn)
        
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.leftBtn)
        
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.upBtn)
        
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.downBtn)
        
        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.randomBtn)

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.gemIcon)

        -- was it a mistake to put these into itemScreenObjectsGroup?
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTile)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTileForShape)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.topSelectedTile)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toolBg)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.shapeBg)
        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toggleShapeOrToolButton)

        --sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.shapeBg)

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBtn)

        sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenOverlay)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen)
            
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn)
                
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.resetBtn)
            
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.dollarIcon)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.livesIcon)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton)

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.livesLeftScreen)
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.lifeIcon do
            mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.lifeIcon[a])
        end
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.timesUpNotice)
        -- mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter)

        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter do
        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.dollarCounter[a])
        end
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.livesCounter do
        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.livesCounter[a])
        end

        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.levelDisplay do
            mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.levelDisplay[a])
        end

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.timeIcon)
        
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.timeCounter do
            mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.timeCounter[a])
        end

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.showGemsLabel)
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.showCoinsLabel)
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.showGemsLabel.gemIcon)
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.gemIcon)
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.gemCounterFirstDigit)
        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.gemCounterSecondDigit)
        
        if (mainFunc.thisLevelSettings.totalGems > 0) then
        	for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.gemIconCounterLabel do
	        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.gemIconCounterLabel[a])
	        end
            for key, val in pairs(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins) do
                mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins[key])
            end
            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["redCoin"]:toFront()
            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["blueCoin"]:toFront()
            mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["purpleCoin"]:toFront()
            if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["red_coin"] == 1 then
                mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["redCoin"].alpha = 1
            end
            if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["blue_coin"] == 1 then
                mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["blueCoin"].alpha = 1
            end
            if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["purple_coin"] == 1 then
                mainFunc.ballAndButtonAndScreenCreateScript.pauseScreenCoins["purpleCoin"].alpha = 1
            end
        end
        
        mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen.y = display.contentHeight
    
    
        sceneGroup:insert(mainFunc.allLevelSettings.pauseScreenObjectsGroup)
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        
        sceneGroup:insert(mainFunc.backgroundGrids)
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText do
        	mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText[a]:toFront()
        end
        
        sceneGroup:insert(mainFunc.allLevelSettings.backgroundObjectsGroup)
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        
        sceneGroup:insert(mainFunc.allLevelSettings.screenObjectsGroup)
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        
        sceneGroup:insert(mainFunc.allLevelSettings.midScreenObjectsGroup)
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        
        sceneGroup:insert(mainFunc.allLevelSettings.frontScreenObjectsGroup)

        sceneGroup:insert(mainFunc.allLevelSettings.itemScreenObjectsGroup)


    	mainFunc.ballAndButtonAndScreenCreateScript.playBtn:toFront()

        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
        for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText do
        	mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText[a]:toFront()
        end
        
    end

    local function prepareInsertGroupsIntoMain ()

    	insertGroupsIntoMainGroup(mainFunc, shapeArray, shapeArrayParameters)
    end
    
    timer.performWithDelay(300, prepareInsertGroupsIntoMain, 1)
    
    mainFunc.ballAndButtonAndScreenCreateScript = require ("modules.ball-and-button-and-screen-create-script")
    ---------  INTRO SCREEN
    mainFunc.ballAndButtonAndScreenCreateScript.createIntroScreen(currentWorld, currentLevel)
    
    sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.introScreen)

    for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText do
		sceneGroup:insert(mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText[a])
	end

	--Runtime:addEventListener( "enterFrame", composer.printMemUsage )

	--Call it at the beginning of your new scene or the first line under your .new() function

    local function delayedEnterScene ()
        
        mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
	    for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText do
        	mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText[a]:toFront()
        end
	    --purge level
	    --composer.purgeScene( "LevelSelectScene" )
	    --composer.removeScene( "LevelSelectScene" )

        if (mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton.shouldBeActive) then
            mainFunc.ballAndButtonAndScreenCreateScript.livesPlusButton:addEventListener("tap", levelVariables.openIAP)
        end
        if (mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton.shouldBeActive) then
            mainFunc.ballAndButtonAndScreenCreateScript.coinPlusButton:addEventListener("tap", levelVariables.openIAP)
        end
	    
	    -- Runtime:addEventListener("enterFrame", createAndControlLaser)
	    
	    for c=1, #shapeArray do
	        if shapeArrayParameters[c][1] == "shape"
            or shapeArrayParameters[c][1] == "gun" then
	            shapeArray[c].collision = mainFunc.on_Triangle_Collision
	            shapeArray[c]:toFront()
                if shapeArrayParameters[c][1] == "shape" then
    	            if shapeArray[c].flipTriangle then
    	                shapeArray[c].flipTriangle:toFront()
    	            end
    	            if shapeArray[c].switchValueText then
    	                shapeArray[c].switchValueText:toFront()
    	            end
                end
	        end
	    end
	    
	    mainFunc.ballAndButtonAndScreenCreateScript.mapScreen:toFront()
        mainFunc.ballAndButtonAndScreenCreateScript.levelTimerLabel:toFront()
        mainFunc.ballAndButtonAndScreenCreateScript.levelTimerLabel.text:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.map:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.compass:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.backBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.rightBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.leftBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.upBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.downBtn:toFront()
	    mainFunc.allLevelSettings.itemScreenObjectsGroup:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen:toFront()
        mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTile:toFront()
        mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.topSelectedTile:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn:toFront()
        mainFunc.ballAndButtonAndScreenCreateScript.gemIcon:toFront()
	    mainFunc.allLevelSettings.pauseScreenObjectsGroup:toFront()
	    mainFunc.ballAndButtonAndScreenCreateScript.introScreen:toFront()
	    for a = 1, #mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText do
        	mainFunc.ballAndButtonAndScreenCreateScript.introScreen.valueText[a]:toFront()
        end

	    -- if myGameSettings[currentWorld]["levels"][currentLevel]["intro_complete"] == false then
	    --     mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1
	    --     mainFunc.ballAndButtonAndScreenCreateScript.backBtn.alpha = 1
	    --     mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1
	    --     mainFunc.ballAndButtonAndScreenCreateScript.mapShowAndClockLabel.alpha = 1
	    --     mainFunc.screenChangingScript.removeIntroScreen(mainFunc, myGameSettings[currentWorld]["levels"][currentLevel]["intro_complete"], shapeArray, shapeArrayParameters)
	    -- elseif myGameSettings[currentWorld]["levels"][currentLevel]["intro_complete"] == true then
	    
	        mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1
	        mainFunc.ballAndButtonAndScreenCreateScript.backBtn.alpha = 1
	        mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1
	        mainFunc.screenChangingScript.shortScreenInitialiser(mainFunc, true, shapeArray, shapeArrayParameters)
	    
	    --end
    end
    
    timer.performWithDelay(500, delayedEnterScene, 1)


    elseif ( phase == "did" ) then

    end

end

function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        audio.stop(musicChannel["mainLevel"])
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

        local function removeObj(obj)
        	obj:removeSelf()
        	obj = nil
        end

        if (mainFunc) then

	        if (mainFunc.medalGainedScreen) then
	        	for a=1, #mainFunc.thisLevelSettings.toolArray do
	    			--It's a tool
		        	if (mainFunc.thisLevelSettings.toolArray[a]["quantity"] == 0) then
		        		table.remove(mainFunc.thisLevelSettings.toolArray, a)
		        	else
		        		mainFunc.thisLevelSettings.toolArray[a]["created"] = "not-created"
		        	end
		        end

		        for b=1, #mainFunc.thisLevelSettings.objectArray do
		        	if (mainFunc.thisLevelSettings.objectArray[b]["quantity"] == 0) then
		        		mainFunc.thisLevelSettings.objectArray:remove(mainFunc.thisLevelSettings.objectArray[b])
		        	else
		        		mainFunc.thisLevelSettings.objectArray[b]["created"] = "not-created"
		        	end
		        end

		        myTotalToolArray = mainFunc.thisLevelSettings.toolArray 
		        myTotalObjectArray = mainFunc.thisLevelSettings.objectArray
		    	saveTable(myTotalToolArray, "myTotalToolArray.json")
		    	saveTable(myTotalObjectArray, "myTotalObjectArray.json")

		    	if (mainFunc.allLevelSettings.gem_counter["purple"] > myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_gems"]) then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_gems"] = mainFunc.allLevelSettings.gem_counter["purple"]
		    	end
		    	if (mainFunc.allLevelSettings.gem_counter["redCoin"] > myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["red_coin"]) then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["red_coin"] = mainFunc.allLevelSettings.gem_counter["redCoin"]
		    	end
		    	if (mainFunc.allLevelSettings.gem_counter["blueCoin"] > myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["blue_coin"]) then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["blue_coin"] = mainFunc.allLevelSettings.gem_counter["blueCoin"]
		    	end
		    	if (mainFunc.allLevelSettings.gem_counter["purpleCoin"] > myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_coin"]) then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_coin"] = mainFunc.allLevelSettings.gem_counter["purpleCoin"]
		    	end

				if (mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["onLevelComplete"]) then
					mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["onLevelComplete"]()
				end

		        saveTable(myGameSettings, "myGameSettings.json")
	        end

            for a = 1, #mainFunc.thisLevelSettings.miscellaneousTimer do
                if mainFunc.thisLevelSettings.miscellaneousTimer[a] ~= nil then
                    timer.cancel(mainFunc.thisLevelSettings.miscellaneousTimer[a])
                end
            end
            for a = 1, #mainFunc.thisLevelSettings.miscellaneousTransition do
                if mainFunc.thisLevelSettings.miscellaneousTransition[a] ~= nil then
                    transition.cancel(mainFunc.thisLevelSettings.miscellaneousTransition[a])
                end
            end

	        --Runtime:removeEventListener( "enterFrame", composer.printMemUsage )

		    mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.pauseScreen = nil
		    
		    --Buttons
		    mainFunc.ballAndButtonAndScreenCreateScript.backBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    mainFunc.ballAndButtonAndScreenCreateScript.playBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:removeEventListener( "tap", mainFunc.buttonListener )

		    if (mainFunc.thisLevelSettings.hasToolArray == true
		    or mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.alpha > 0) then
		    	mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    	mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:removeEventListener( "tap", mainFunc.buttonListener )
		    end

		    mainFunc.ballAndButtonAndScreenCreateScript.backBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.backBtn = nil
		    mainFunc.ballAndButtonAndScreenCreateScript.playBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.playBtn = nil
		    mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.randomBtn = nil
		    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.backToMainBtn = nil
		    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.backToPlayBtn = nil
		    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn:removeSelf()
		    mainFunc.ballAndButtonAndScreenCreateScript.resetBtn = nil
		    
		    --Runtime:removeEventListener("enterFrame", moveSomething)
		    
		    for c=1, #shapeArray do
                shapeArray[c].mainFuncListenerAdded = false
		        if shapeArrayParameters[c][1] == "shape"
                or shapeArrayParameters[c][1] == "gun" then
		            shapeArray[c]:removeEventListener("collision", mainFunc.on_Triangle_Collision)
		        elseif shapeArrayParameters[c][1] == "manualFan"
		        or shapeArrayParameters[c][1] == "spitter"
		        or shapeArrayParameters[c][1] == "simple"
                or shapeArrayParameters[c][1] == "backFire" then
		            shapeArray[c]:removeEventListener( "tap", mainFunc.listener )
                    shapeArray[c].mainFuncListenerAdded = false
		        end

                if shapeArrayParameters[c][1] == "gun"
                and (mainFunc.allLevelSettings.bulletHasFired == true) then
                    timer.cancel(shapeArray[c].createBulletTimer)
                end
		        
		        for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
		            if mainFunc.allLevelSettings.transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2]
                    and shapeArray[c].mainFuncListenerAdded == true then
		                shapeArray[c]:removeEventListener("tap", mainFunc.listener)
		            end
		        end
		    end
            if #mainFunc.allLevelSettings.bullet > 0 then
                for a = 1, #mainFunc.allLevelSettings.bullet do
                    if mainFunc.allLevelSettings.bullet[a].readyToCollideTimer and mainFunc.allLevelSettings.bullet[a].readyToCollideTimer ~= nil then
                        timer.cancel(mainFunc.allLevelSettings.bullet[a].readyToCollideTimer)
                    end
                end
            end


		    local firstTotalCounter = 0
		    local firstTotalNilledCounter = 0

		    for a=1, mainFunc.allLevelSettings.backgroundObjectsGroup.numChildren do
		    		firstTotalCounter = firstTotalCounter + 1
		    		if (mainFunc.allLevelSettings.backgroundObjectsGroup[a] ~= nil) then
		    		firstTotalNilledCounter = firstTotalNilledCounter + 1
		        end
		    end
		    --print('firsttotal: ', firstTotalCounter, firstTotalNilledCounter)
		    
		    for z=1, #shapeArray do
		    	if (shapeArrayParameters[z][1] == "spitter") then
                    if shapeArray[z].upArrow then
    		    		shapeArray[z].upArrow:removeSelf()
    					shapeArray[z].upArrow = nil
                    end
                    if shapeArray[z].rightArrow then
    					shapeArray[z].rightArrow:removeSelf()
    					shapeArray[z].rightArrow = nil
                    end
                    if shapeArray[z].downArrow then
    					shapeArray[z].downArrow:removeSelf()
    					shapeArray[z].downArrow = nil
                    end
                    if shapeArray[z].leftArrow then
    					shapeArray[z].leftArrow:removeSelf()
    					shapeArray[z].leftArrow = nil
                    end
		        elseif (shapeArrayParameters[z][1] == "manualFan"
		        or shapeArrayParameters[z][1] == "autoFan") then
		        	shapeArray[z].directionIndicatorArrow:removeSelf()
		        	shapeArray[z].directionIndicatorArrow = nil
                elseif shapeArrayParameters[z][1] == "endPoint" then
                    shapeArray[z].medalPiece:removeSelf()
                    shapeArray[z].medalPiece = nil
		        end
                if shapeArray[z].isAutoSlideObject then
                    if #shapeArray[z].autoSlideTransition > 0 then
                        for a = 1, #shapeArray[z].autoSlideTransition do
                            transition.cancel(shapeArray[z].autoSlideTransition[a])
                        end
                    end
                    if #shapeArray[z].autoSlideTimer > 0 then
                        for a = 1, #shapeArray[z].autoSlideTimer do
                            timer.cancel(shapeArray[z].autoSlideTimer[a])
                        end
                    end
                end
		        shapeArray[z]:removeSelf()
				shapeArray[z] = nil
		    end

		    local secondTotalCounter = 0
		    local secondTotalNilledCounter = 0

		    for a=1, mainFunc.allLevelSettings.backgroundObjectsGroup.numChildren do
		    		secondTotalCounter = secondTotalCounter + 1
		    		if (mainFunc.allLevelSettings.backgroundObjectsGroup[a] ~= nil) then
		    		secondTotalNilledCounter = secondTotalNilledCounter + 1
		        end
		    end

		    --print('secondtotal: ', secondTotalCounter, secondTotalNilledCounter)

		    --print('total: ', mainFunc.allLevelSettings.backgroundObjectsGroup.numChildren)
		    local numChildrenCounter = 0
		    local numChildrenNilledCounter = 0

		    for a=1, mainFunc.allLevelSettings.backgroundObjectsGroup.numChildren do
		    		numChildrenCounter = numChildrenCounter + 1
		    		if (mainFunc.allLevelSettings.backgroundObjectsGroup[a] ~= nil) then
		    		numChildrenNilledCounter = numChildrenNilledCounter + 1
		        end
		    end
		    
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

		    checkGroup(mainFunc.allLevelSettings.backgroundObjectsGroup)
		    checkGroup(mainFunc.allLevelSettings.frontScreenObjectsGroup)
		    checkGroup(mainFunc.allLevelSettings.screenObjectsGroup)
		    checkGroup(mainFunc.allLevelSettings.midScreenObjectsGroup)
		    checkGroup(mainFunc.allLevelSettings.itemScreenObjectsGroup)
		    checkGroup(mainFunc.allLevelSettings.pauseScreenObjectsGroup)
		    checkGroup(mainFunc.backgroundGrids)
		    if levelVariables.IAPScreenObjectsGroup then
		    	checkGroup(levelVariables.IAPScreenObjectsGroup)
		    end

		    mainFunc.allLevelSettings.connectorArray = {}

		    shapeArray = {}
			shapeArrayParameters = {}
			transitionArrayIndex = {}

			transitionForProjectile = {
			    ball = {},
			    bullet = {},
			    hookshot = {}
			}

			physics.stop()

			if (mainFunc.medalGainedScreen) then
		    	if (mainFunc.toolOriginallyPickedUp == true)
		    	or (mainFunc.objectOriginallyPickedUp == true) then
		    		if mainFunc.medalGainedScreen.itemBagIcon then
		    			removeObj(mainFunc.medalGainedScreen.itemBagIcon)
		    		end

                    if mainFunc.gridItems then
    		    		for a = 1, #mainFunc.gridItems do
    						removeObj(mainFunc.gridItems[a])
    					end
                    end
		    	end

		    	removeObj(mainFunc.medalGainedScreen.heading)
		    	removeObj(mainFunc.medalGainedScreen.message1)
		    	removeObj(mainFunc.medalGainedScreen.finalCoinsLabel)
		    	removeObj(mainFunc.medalGainedScreen.heading)
		    	removeObj(mainFunc.medalGainedScreen.nextButton)

                removeObj(mainFunc.medalGainedScreen.timeLabel)
                for a = 1, #mainFunc.medalGainedScreen.TimeCounter do
                    removeObj(mainFunc.medalGainedScreen.TimeCounter[a])
                end

		    	if (mainFunc.medalGainedScreen.coinLabel) then
		    		removeObj(mainFunc.medalGainedScreen.coinsLabel)
                    for key, val in pairs(mainFunc.medalGainedScreen.CoinsIconArray) do
                        removeObj(mainFunc.medalGainedScreen.CoinsIconArray[key])
                    end
		    	end
		    	if (mainFunc.medalGainedScreen.GemIcons) then
		    		removeObj(mainFunc.medalGainedScreen.GemIcons)
                    for a = 1, #mainFunc.medalGainedScreen.GemCounter do
                        removeObj(mainFunc.medalGainedScreen.GemCounter[a])
                    end
		    	end
		    end

		    
		    if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
		        for a = 1, #mainFunc.tutorialPopUp do
		        	mainFunc.tutorialPopUp[a]:removeSelf()
		        	mainFunc.tutorialPopUp[a] = nil
		        end
		    end

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay = nil

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toolBg:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toolBg = nil

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.shapeBg:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.shapeBg = nil

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTile:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTile = nil

            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTileForShape:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.bottomSelectedTileForShape = nil
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.topSelectedTile:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.topSelectedTile = nil
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toggleShapeOrToolButton:removeSelf()
            mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.toggleShapeOrToolButton = nil 
		end
	    
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        
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