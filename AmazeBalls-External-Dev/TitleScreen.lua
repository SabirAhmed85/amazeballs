local composer = require ("composer")
local widget = require("widget")
local scene = composer.newScene()
--local facebook = require("facebook")
local fbAppId = "1494868020767014"
-- Clear previous scene
--storyboard.removeAll()

--display.setDefault( "background", 243, 245, 177 )
display.setDefault( "background", 0, 0, 0 )
display.setStatusBar( display.HiddenStatusBar )

local json = require("json")--
    
function saveTable(t, filename)
    
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    
    local file = io.open(path, "w")
    
    if file then
    
        local contents = json.encode(t)
    
        file:write( contents )
    
        io.close( file )
    
        return true
    
    else
    
        return false
    
    end
    
end
    
 
    
function loadTable(filename)
    
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    
    local contents = ""
    
    local myTable = {}
    
    local file = io.open( path, "r" )
    
    if file then
    
         -- read all contents of file into a string
    
         local contents = file:read( "*a" )
    
         myTable = json.decode(contents);
    
         io.close( file )
    
         return myTable 
    
    end
    
    return nil
    
end

local levelButton, totalLevels, thisLevelButton, scrollView, medalChooseScreen, silverMedalButton, goldMedalButton, itemBagButton, scrollView, totalToolArray, toolArray, levelVariables, ItemBagBtnFunction, socialIcons, playButton, showCoinsLabel, background
local v, touchButton, playNowButton, goldLockedBG, goldLockedText, goldLockedSilverIcon, goldLockedSilverMedalCounter, silverGemIcons, silverGemCounterFirstDigit, silverGemCounterSecondDigit, goldGemIcons, goldGemCounterFirstDigit, goldGemCounterSecondDigit, silverCoinsIconArray, goldCoinsIconArray
local blackOverlay, openIAP, prepareCreateYouhaveDisplay, addBackBuyButtonListener, buyButtonPressed, IAPScript, closeIAP, closePurchaseScreen, removeIAPScreenListeners
local backgroundMusic
local levelButton = {}
local levelVariables
local titleScreenVariables = {}
local silverMedalGainedIcon = {}
local goldMedalGainedIcon = {}

local dummyScrollView = display.newGroup()
local freeScreenGroup = display.newGroup()

local removeBackgroundEventListeners, addBackBackgroundEventListeners, openFreeScreen, openExtrasScreen, removeExtrasScreenEventListeners
local addBackExtrasScreenEventListeners, checkYDestination, checkScreenState

local iFrameContainer = null
local iFrameButtonBar = null
local iFrameCloseButton = null

local levelConfigScript = require("modules.level-config-array")
    levelConfigArray = levelConfigScript.levelConfigArray
    characterConfigArray = levelConfigScript.characterConfigArray

local gameSettingsConfigScript = require("modules.game-settings-config-array")

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
local coinsUpdatedFunction, livesPurchasedFunction

function livesPurchasedFunction ()
    IAPScript.IAPFunctionsScript.updateLivesDisplay(titleScreenVariables.extrasScreen.livesCounter)
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(titleScreenVariables.extrasScreen.dollarCounter)
end

function coinsUpdatedFunction ()
    IAPScript.IAPFunctionsScript.updateScreensOtherCoinsDisplay(titleScreenVariables.extrasScreen.dollarCounter)
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

addBackIAPToolOrBlockScreenListeners = function (screen, screenName)
    for a = 1, #screen.tile do
        screen.tile[a].buyDisplay[1].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
    end

    IAPOverlay.purchaseScreens[screenName].currentPurchaseScreenShowing = nil
end

closePurchaseScreen = function (event)
    if event.target.currentPurchaseScreenShowing == "canBuy" then
        IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons["noButton"]:removeEventListener("tap", closePurchaseScreen)
        IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].buttons["yesButton"]:removeEventListener("tap", closePurchaseScreen)

        if (event.target.currentPurchaseScreenShowing == "canBuy" 
            and IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].currentPurchaseType ~= "lives")
        or (event.target.currentPurchaseScreenShowing == "canBuy" 
            and IAPOverlay.purchaseScreens[event.target.currentPurchaseScreenShowing].currentPurchaseType == "lives"
            and IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"] == event.target) then
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
                    if IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"] == event.target then
                        livesPurchasedFunction(titleScreenVariables.extrasScreen.livesCounter)
                    end
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

    IAPScript.openIAPScreen("Lives", levelVariables, levelVariables.LivesOpened)
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

local function goToLevel (event)
    -- simply go to level1.lua scene
    --purge level
    myGameSettings["worldSelectLastWorld"] = "WoodyWalk"
    saveTable(myGameSettings, "myGameSettings.json")
    composer.gotoScene( "WorldSelectScene", { effect = "crossFade", time = 150} )
     
    return true -- indicates successful touch
end

local function scrollListener (event)
	if event.limitReached then
        if ( event.direction == "left" ) then
        	--scrollBack to default position
        	scrollView:scrollToPosition( { x = 0, time=400 } )
        end
	end
end

local function facebook (event)
    --local facebook = require("facebook")
    local options = {
        service = "facebook",
        message = "Check out this photo!",
        listener = eventListener,
        image = {
            { filename = "images/objects/level-items2.png", baseDir = system.ResourceDirectory }
        },
        url = "http://coronalabs.com"
    }
    local isFacebookAvailable = native.canShowPopup( "social", "facebook" )
    print(isFacebookAvailable, 'fb')
    if (isFacebookAvailable) then
        native.showPopUp("social", options)
    end

    local function facebookListener( event )

        print( "event.name", event.name )  --"fbconnect"
        print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
        print( "isError: " .. tostring( event.isError ) )
        print( "didComplete: " .. tostring( event.didComplete ) )

        --"session" events cover various login/logout events
        --"request" events handle calls to various Graph API calls
        --"dialog" events are standard popup boxes that can be displayed

        if ( "session" == event.type ) then
            --options are: "login", "loginFailed", "loginCancelled", or "logout"
            if ( "login" == event.phase ) then
                local access_token = event.token
                --code for tasks following a successful login
            end

        elseif ( "request" == event.type ) then
            print("facebook request")
            if ( not event.isError ) then
                local response = json.decode( event.response )
                --process response data here
            end

        elseif ( "dialog" == event.type ) then
            print( "dialog", event.response )
            --handle dialog results here
        end
    end

    facebook.login(fbAppId, facebookListener, {"user_friends", "email"})
end

function toggleWebPopUp (button, screen)
    if (iFrameContainer
    and iFrameContainer ~= null) then
        
    else
        iFrameContainer = display.newRect(0, 0, display.contentWidth, display.contentHeight)
        iFrameContainer.anchorX = 0
        iFrameContainer.anchorY = 0
        iFrameContainer.x = 0
        iFrameContainer.y = display.contentHeight + ((25/320) * display.contentHeight )
        iFrameContainer:toFront()

        iFrameButtonBar = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/frameTopBar.png", display.contentWidth, ((25/320) * display.contentHeight ) )
        iFrameButtonBar.anchorX = 0
        iFrameButtonBar.anchorY = 0
        iFrameButtonBar.x = 0
        iFrameButtonBar.y = display.contentHeight
        iFrameButtonBar:toFront()

        iFrameCloseButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/frameDoneButton.png", ((74/480) * display.contentWidth) , ((24/320) * display.contentHeight ) )
        iFrameCloseButton.anchorX = 0
        iFrameCloseButton.anchorY = 0
        iFrameCloseButton.x = ((20/320) * display.contentHeight ) 
        iFrameCloseButton.y = display.contentHeight
        iFrameCloseButton.onScreenFunction = function ()
            iFrameCloseButton:addEventListener("tap", linkPressed)
        end
        iFrameCloseButton.offScreenFunction = function ()
            iFrameCloseButton:removeEventListener("tap", linkPressed)
        end
        iFrameCloseButton:toFront()
    end

    if (iFrameButtonBar.y == 0) then

        local iFrame = native.cancelWebPopup()
        timer.performWithDelay(350, function ()
            iFrameCloseButton.offScreenFunction()
            transition.to(iFrameButtonBar, {y = display.contentHeight, time = 100})
            transition.to(iFrameCloseButton, {y = display.contentHeight, time = 100})
            transition.to(iFrameContainer, {y = display.contentHeight + ((25/320) * display.contentHeight ), time = 100, onComplete = function ()

                if (screen == titleScreenVariables.extrasScreen) then
                    addBackExtrasScreenEventListeners()
                elseif (screen == titleScreenVariables.freeScreen) then

                end
            end})
        end)
    else
        if (screen == titleScreenVariables.extrasScreen) then
            removeExtrasScreenEventListeners()
        elseif (screen == titleScreenVariables.freeScreen) then

        end


        iFrameCloseButton.onScreenFunction()
        transition.to(iFrameButtonBar, {y = 0, time = 100})
        transition.to(iFrameCloseButton, {y = 0, time = 100})
        transition.to(iFrameContainer, {y = ((25/320) * display.contentHeight ), time = 100, onComplete = function ()
            local iFrame = native.showWebPopup(0, ((25/320) * display.contentHeight ), display.contentWidth, ((295/320) * display.contentHeight ), button.iFrameUrl)
        end})
    end

    
end

function linkPressed (event)
    toggleWebPopUp(event.target, titleScreenVariables.extrasScreen)
end

local function toggleSoundSetting (event)
    if myGameSettings["soundsOn"] then
        myGameSettings["soundsOn"] = false
        event.target:setSequence("off")
    else
        myGameSettings["soundsOn"] = true
        event.target:setSequence("on")
    end
    saveTable(myGameSettings, "myGameSettings.json")
end

local function toggleMuteSetting (event)
    if myGameSettings["musicOn"] then
        myGameSettings["musicOn"] = false
        event.target:setSequence("off")
    else
        myGameSettings["musicOn"] = true
        event.target:setSequence("on")
    end
    saveTable(myGameSettings, "myGameSettings.json")
end

local deleteGameData, hideGameDataPopUp, approveGameDataRemoval, cancelGameDataRemoval

function hideGameDataPopUp (reasonHidden)
    local gameDataNotice = titleScreenVariables.extrasScreen.gameDataNotice
    gameDataNotice.cancelButton.offScreenFunction()
    gameDataNotice.approveButton.offScreenFunction()

    transition.to(gameDataNotice.note1, {alpha = 0, time = 300})
    transition.to(gameDataNotice.cancelButton, {alpha = 0, time = 300})
    transition.to(gameDataNotice.approveButton, {alpha = 0, time = 300, onComplete = function ()
        timer.performWithDelay(200, function ()
            if (reasonHidden == "cancelled") then
                transition.to(gameDataNotice, {alpha = 0, time = 300, onComplete = function ()
                    addBackExtrasScreenEventListeners()
                end})
            else
                --show additional message
                gameDataNotice.note2 = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteGameDataNote2.png", 263, 140)
                gameDataNotice.note2.alpha = 0
                gameDataNotice.note2.anchorX = 0.5
                gameDataNotice.note2.anchorY = 0.5
                gameDataNotice.note2.x = gameDataNotice.x - 5
                gameDataNotice.note2.y = gameDataNotice.y - 23

                transition.to(gameDataNotice.note2, {alpha = 1, time = 200, onComplete = function ()
                    timer.performWithDelay(1200, function ()
                        transition.to(gameDataNotice.note2, {alpha = 0, time = 250, onComplete = function ()
                            timer.performWithDelay(220, function ()
                                transition.to(gameDataNotice, {alpha = 0, time = 300, onComplete = function ()
                                    addBackExtrasScreenEventListeners()
                                end})
                            end)
                        end})
                    end)
                end})
                
            end
        end)      
    end})
end

function approveGameDataRemoval (event)
    myGameSettings = loadTable("myGameSettings.json")
    myTotalToolArray = loadTable("myTotalToolArray.json")
    myTotalObjectArray = loadTable("myTotalObjectArray.json")

    myGameSettings  = gameSettingsConfigScript.createFreshGameSettings(levelConfigArray, characterConfigArray, itemConfigArray)
    myTotalToolArray  = gameSettingsConfigScript.createFreshToolArray(levelConfigArray)
    myTotalObjectArray  = gameSettingsConfigScript.createFreshObjectArray(levelConfigArray)

    saveTable(myGameSettings, "myGameSettings.json")
    saveTable(myTotalToolArray, "myTotalToolArray.json")
    saveTable(myTotalObjectArray, "myTotalObjectArray.json")

    --- handle visual aspects affecting this screen

    titleScreenVariables.extrasScreen.muteButton:setSequence("on")
    titleScreenVariables.extrasScreen.soundButton:setSequence("on")

    livesPurchasedFunction()
    coinsUpdatedFunction()

        -- also there will be a coin counter which will need changing

    hideGameDataPopUp("approved")
end

function cancelGameDataRemoval (event)
    hideGameDataPopUp("cancelled")
end

function deleteGameData (event)
    removeExtrasScreenEventListeners()

    local function showGameDataPopUp ()
        gameDataNotice = titleScreenVariables.extrasScreen.gameDataNotice
        transition.to(gameDataNotice, {alpha = 1, time = 400, onComplete = function ()
            timer.performWithDelay(200, function ()
                transition.to(gameDataNotice.note1, {alpha = 1, time = 150, onComplete = function ()
                    transition.to(gameDataNotice.cancelButton, {alpha = 1, time = 250})
                    transition.to(gameDataNotice.approveButton, {alpha = 1, time = 250, onComplete = function ()
                        gameDataNotice.cancelButton.onScreenFunction()
                        gameDataNotice.approveButton.onScreenFunction()
                    end})
                end})
            end)
                
        end})
    end

    local function createDeleteGameDataPopUp ()
        titleScreenVariables.extrasScreen.gameDataNotice = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteGameDataPopUp.png", 320, 230)
        gameDataNotice = titleScreenVariables.extrasScreen.gameDataNotice

        gameDataNotice.alpha = 0
        gameDataNotice.anchorX = 0.5
        gameDataNotice.anchorY = 0.5
        gameDataNotice.x = display.contentWidth / 2
        gameDataNotice.y = display.contentHeight / 2

        gameDataNotice.note1 = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteGameDataNote1.png", 263, 140)
        gameDataNotice.note1.alpha = 0
        gameDataNotice.note1.anchorX = 0.5
        gameDataNotice.note1.anchorY = 0.5
        gameDataNotice.note1.x = gameDataNotice.x - 5
        gameDataNotice.note1.y = gameDataNotice.y - 23

        gameDataNotice.approveButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteGameDataYesButton.png", 108, 45)
        gameDataNotice.approveButton.alpha = 0
        gameDataNotice.approveButton.anchorX = 0.5
        gameDataNotice.approveButton.anchorY = 0.5
        gameDataNotice.approveButton.x = gameDataNotice.x + 82
        gameDataNotice.approveButton.y = gameDataNotice.y + 68
            gameDataNotice.approveButton.onScreenFunction = function ()
                gameDataNotice.approveButton:addEventListener("tap", approveGameDataRemoval)
            end
            gameDataNotice.approveButton.offScreenFunction = function ()
                gameDataNotice.approveButton:removeEventListener("tap", approveGameDataRemoval)
            end

        gameDataNotice.cancelButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteGameDataNoButton.png", 108, 45)
        gameDataNotice.cancelButton.alpha = 0
        gameDataNotice.cancelButton.anchorX = 0.5
        gameDataNotice.cancelButton.anchorY = 0.5
        gameDataNotice.cancelButton.x = gameDataNotice.x - 30
        gameDataNotice.cancelButton.y = gameDataNotice.y + 68
            gameDataNotice.cancelButton.onScreenFunction = function ()
                gameDataNotice.cancelButton:addEventListener("tap", cancelGameDataRemoval)
            end
            gameDataNotice.cancelButton.offScreenFunction = function ()
                gameDataNotice.cancelButton:removeEventListener("tap", cancelGameDataRemoval)
            end

        showGameDataPopUp()
    end


    if (titleScreenVariables.extrasScreen.gameDataNotice
    and titleScreenVariables.extrasScreen.gameDataNotice ~= null) then
        showGameDataPopUp()
    else
        createDeleteGameDataPopUp()
    end

end

function checkYDestination (object, openState)
    local screenYDestination = 0
    if openState == "closed" then -- it's about to open
        screenYDestination = object.originalY - display.contentHeight
    else
        screenYDestination = object.originalY
    end

    transition.to(object, {y = screenYDestination, time = 150, onComplete = function ()
        if openState == "closed" then -- it's actually now open
            if object.onScreenFunction
            and object.onScreenFunction ~= null then
                object.onScreenFunction()
            end
        else
            if object.offScreenFunction
            and object.offScreenFunction ~= null then
                object.offScreenFunction()
            end
        end
    end})
end

function checkScreenState (screen, relButton)
    if screen.openState == "open" then
        screen.openState = "closed"
    else
        screen.openState = "open"
    end
    if screen.openState == "closed" then
        addBackBackgroundEventListeners()
    end
end


function openFreeScreen (event)
    if titleScreenVariables.freeScreen.openState == "closed" then -- closed at start so its actually being opened
        removeBackgroundEventListeners()
    end
    
    checkYDestination(titleScreenVariables.freeScreen, titleScreenVariables.freeScreen.openState)
    checkYDestination(titleScreenVariables.freeScreen.fbLikeTile, titleScreenVariables.freeScreen.openState)
    checkYDestination(titleScreenVariables.freeScreen.fbStatusTile, titleScreenVariables.freeScreen.openState)
    checkYDestination(titleScreenVariables.freeScreen.twFollowTile, titleScreenVariables.freeScreen.openState)
    checkYDestination(titleScreenVariables.freeScreen.twTweetTile, titleScreenVariables.freeScreen.openState)
    --checkYDestination(titleScreenVariables.freeScreen.vid1Tile, titleScreenVariables.freeScreen.openState)
    --checkYDestination(titleScreenVariables.freeScreen.vid2Tile, titleScreenVariables.freeScreen.openState)
    checkYDestination(titleScreenVariables.freeScreen.closeButton, titleScreenVariables.freeScreen.openState)

    checkScreenState(titleScreenVariables.freeScreen)
end

function openExtrasScreen (event)
    if titleScreenVariables.extrasScreen.openState == "closed" then
        removeBackgroundEventListeners()
    end

    checkYDestination(titleScreenVariables.extrasScreen, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.fbPageTile, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.twPageTile, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.ytPageTile, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.muteButton, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.soundButton, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.deleteGameDataButton, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.linkButton1, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.linkButton2, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.linkButton3, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.closeButton, titleScreenVariables.extrasScreen.openState)
    checkYDestination(titleScreenVariables.extrasScreen.dollarIcon, titleScreenVariables.extrasScreen.openState)
    for a = 1, #titleScreenVariables.extrasScreen.dollarCounter do
        checkYDestination(titleScreenVariables.extrasScreen.dollarCounter[a], titleScreenVariables.extrasScreen.openState)
    end
    checkYDestination(titleScreenVariables.extrasScreen.livesIcon, titleScreenVariables.extrasScreen.openState)
    for a = 1, #titleScreenVariables.extrasScreen.livesCounter do
        checkYDestination(titleScreenVariables.extrasScreen.livesCounter[a], titleScreenVariables.extrasScreen.openState)
    end

    checkScreenState(titleScreenVariables.extrasScreen)
    
end


function removeExtrasScreenEventListeners (event)

    titleScreenVariables.extrasScreen.twPageTile.offScreenFunction()
    titleScreenVariables.extrasScreen.ytPageTile.offScreenFunction()

    titleScreenVariables.extrasScreen.muteButton.offScreenFunction()
    titleScreenVariables.extrasScreen.soundButton.offScreenFunction()
    titleScreenVariables.extrasScreen.closeButton.offScreenFunction()

    titleScreenVariables.extrasScreen.linkButton1.offScreenFunction()
    titleScreenVariables.extrasScreen.linkButton2.offScreenFunction()
    titleScreenVariables.extrasScreen.linkButton3.offScreenFunction()
end

function addBackExtrasScreenEventListeners (event)
    titleScreenVariables.extrasScreen.twPageTile.onScreenFunction()
    titleScreenVariables.extrasScreen.ytPageTile.onScreenFunction()

    titleScreenVariables.extrasScreen.muteButton.onScreenFunction()
    titleScreenVariables.extrasScreen.soundButton.onScreenFunction()
    titleScreenVariables.extrasScreen.closeButton.onScreenFunction()

    titleScreenVariables.extrasScreen.linkButton1.onScreenFunction()
    titleScreenVariables.extrasScreen.linkButton2.onScreenFunction()
    titleScreenVariables.extrasScreen.linkButton3.onScreenFunction()
end

function addBackBackgroundEventListeners ()
    playButton:addEventListener("tap", goToLevel)
    freeButton:addEventListener("tap", openFreeScreen)
    extrasButton:addEventListener("tap", openExtrasScreen)
    shopButton:addEventListener("tap", openIAP)
end

function removeBackgroundEventListeners ()
    playButton:removeEventListener("tap", goToLevel)
    freeButton:removeEventListener("tap", openFreeScreen)
    extrasButton:removeEventListener("tap", openExtrasScreen)
    shopButton:removeEventListener("tap", openIAP)
end


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
        backgroundMusic = audio.loadStream( "audio/amazeballs.wav" )

        -- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
        musicChannel["amazeballs"] = audio.play( backgroundMusic, { channel=1, loops=-1 } )

        levelVariables = {}
        levelVariables.livesPurchasedFunction = livesPurchasedFunction
        levelVariables.addBackEventListenersFromIAP = addBackEventListenersFromIAP
        levelVariables.closePurchaseScreen = closePurchaseScreen
        levelVariables.removeIAPScreenListeners = removeIAPScreenListeners
        levelVariables.openIAP = openIAP
        levelVariables.closeIAP = closeIAP
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
    	levelVariables.allLevelSettings = require("modules.levels.all-level-settings")
        levelVariables.globalImageCreateFunctions = require("modules.global-image-creation-functions")
	mainFunc = {}

    -- Tiles

    ----

    myGameSettings = loadTable("myGameSettings.json")

    local coinCounter

	if myGameSettings["total_coins"] < 10 then
		coinCounter = tostring( myGameSettings["total_coins"] )
		coinCounter = "00" .. coinCounter
	elseif myGameSettings["total_coins"] > 9
	and myGameSettings["total_coins"] < 100 then
		coinCounter = tostring( myGameSettings["total_coins"] )
		coinCounter = "0" .. coinCounter
	elseif myGameSettings["total_coins"] > 99 then
		coinCounter = tostring( myGameSettings["total_coins"] )
	end

    background = display.newImageRect("images/central-images/Layout/TitleScreen/LowerBackground.png", display.contentWidth, display.contentHeight)
    background.anchorX = 0.5
    background.anchorY = 0.5
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2
    upperBackground = display.newImageRect("images/central-images/Layout/TitleScreen/UpperBackground.png", display.contentWidth, display.contentHeight)
    upperBackground.anchorX = 0.5
    upperBackground.anchorY = 0.5
    upperBackground.x = display.contentWidth / 2
    upperBackground.y = display.contentHeight / 2
    sceneGroup:insert(background)
    sceneGroup:insert(upperBackground)

	local levelItems2ImageSheet = graphics.newImageSheet( "images/objects/level-items2.png", {width = 60, height = 52, numFrames = 4})
    local levelItems2SequenceData = {
        { name = "red", start=1, count=1,   loopCount=1 },
        { name = "blueCoin", start=2, count=1, loopCount=1 },
        { name = "purpleCoin", start=3, count=1, loopCount=1 },
        { name = "purple", start=4, count=1, loopCount=1 }
    }

    showCoinsLabel = display.newImageRect("images/central-images/Layout/TitleScreen/Logo.png", display.contentWidth, display.contentHeight)
        --showCoinsLabel:setReferencePoint(display.BottomLeftReferencePoint);
        showCoinsLabel.anchorX = 0
        showCoinsLabel.anchorY = 1
        showCoinsLabel.y = display.contentHeight
        showCoinsLabel.x = 10
        showCoinsLabel.state = "coinsLabelHidden"
        sceneGroup:insert(showCoinsLabel)

    playButton = display.newImageRect("images/central-images/Layout/TitleScreen/PlayButton.png", ((125/480) * ( display.contentWidth)), ((68/320) * display.contentHeight) )
        --playButton:setReferencePoint(display.BottomRightReferencePoint);
        playButton.anchorX = 1
        playButton.anchorY = 1
        playButton.x = display.contentWidth - 39
        playButton.y = display.contentHeight - 20
        sceneGroup:insert(playButton)

    socialIcons = {}

        socialIcons[1] = display.newImageRect("images/central-images/Layout/TitleScreen/EmailButton.png", 39, 67)
        --socialIcons[1]:setReferencePoint(display.TopRightReferencePoint);
        socialIcons[1].anchorX = 1
        socialIcons[1].anchorY = 0
        socialIcons[1].x = display.contentWidth - 170
        socialIcons[1].y = 0
        sceneGroup:insert(socialIcons[1])

        socialIcons[2] = display.newImageRect("images/central-images/Layout/TitleScreen/TweetButton.png", 39, 67)
        --socialIcons[2]:setReferencePoint(display.TopRightReferencePoint);
        socialIcons[2].anchorX = 1
        socialIcons[2].anchorY = 0
        socialIcons[2].x = display.contentWidth - 105
        socialIcons[2].y = 0
        sceneGroup:insert(socialIcons[2])

        socialIcons[3] = display.newImageRect("images/central-images/Layout/TitleScreen/FacebookButton.png", 39, 67)
        --socialIcons[3]:setReferencePoint(display.TopRightReferencePoint);
        socialIcons[3].anchorX = 1
        socialIcons[3].anchorY = 0
        socialIcons[3].x = display.contentWidth - 42
        socialIcons[3].y = 0
        sceneGroup:insert(socialIcons[3])


    freeButton = display.newImageRect("images/central-images/Layout/TitleScreen/FreeButton.png", 120, 60)
        --freeButton:setReferencePoint(display.BottomRightReferencePoint);
        freeButton.anchorX = 1
        freeButton.anchorY = 1
        freeButton.x = display.contentWidth - 40
        freeButton.y = display.contentHeight - 185
        sceneGroup:insert(freeButton)

    shopButton = display.newImageRect("images/central-images/Layout/TitleScreen/ShopButton.png", 120, 60)
        --shopButton:setReferencePoint(display.BottomRightReferencePoint);
        shopButton.anchorX = 1
        shopButton.anchorY = 1
        shopButton.x = display.contentWidth - 40
        shopButton.y = display.contentHeight - 85
        sceneGroup:insert(shopButton)

    leaderboardButton = display.newImageRect("images/central-images/Layout/TitleScreen/LeaderboardButton.png", 56, 48)
        --leaderboardButton:setReferencePoint(display.BottomRightReferencePoint);
        leaderboardButton.anchorX = 1
        leaderboardButton.anchorY = 1
        leaderboardButton.x = display.contentWidth - 100
        leaderboardButton.y = display.contentHeight - 141
        sceneGroup:insert(leaderboardButton)

    extrasButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasButton.png", 56, 48)
        --extrasButton:setReferencePoint(display.BottomRightReferencePoint);
        extrasButton.anchorX = 1
        extrasButton.anchorY = 1
        extrasButton.x = display.contentWidth - 43
        extrasButton.y = display.contentHeight - 141
        sceneGroup:insert(extrasButton)

    --Runtime:addEventListener( "enterFrame", storyboard.printMemUsage )
    --Spawn two objects

    playButton:addEventListener("tap", goToLevel)-- facebook)
    --purge level
    --storyboard.purgeScene( "backToHome" )
    --storyboard.removeScene( "backToHome" )


    ------------- 
    ------------- Set up 'Free' Screen & Button
    titleScreenVariables.freeScreen = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/background.png", display.contentWidth, display.contentHeight)
    titleScreenVariables.freeScreen.anchorX = 0.5
    titleScreenVariables.freeScreen.anchorY = 0.5
    titleScreenVariables.freeScreen.x = display.contentWidth / 2
    titleScreenVariables.freeScreen.y = (display.contentHeight / 2) + display.contentHeight
    titleScreenVariables.freeScreen.originalY = (display.contentHeight / 2) + display.contentHeight
    titleScreenVariables.freeScreen.openState = "closed"
    titleScreenVariables.freeScreen:toFront()

    titleScreenVariables.freeScreen.fbLikeTile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/fbLike.png", 92, 65)
    titleScreenVariables.freeScreen.fbLikeTile.anchorX = 0.5
    titleScreenVariables.freeScreen.fbLikeTile.anchorY = 0.5
    titleScreenVariables.freeScreen.fbLikeTile.width = xCalc(92)
    titleScreenVariables.freeScreen.fbLikeTile.height = yCalc(65)
    titleScreenVariables.freeScreen.fbLikeTile.x = xCalc(85)
    titleScreenVariables.freeScreen.fbLikeTile.y = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.fbLikeTile.originalY = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.fbLikeTile:toFront()

    titleScreenVariables.freeScreen.fbStatusTile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/fbStatus.png", 92, 65)
    titleScreenVariables.freeScreen.fbStatusTile.anchorX = 0.5
    titleScreenVariables.freeScreen.fbStatusTile.anchorY = 0.5
    titleScreenVariables.freeScreen.fbStatusTile.width = xCalc(92)
    titleScreenVariables.freeScreen.fbStatusTile.height = yCalc(65)
    titleScreenVariables.freeScreen.fbStatusTile.x = xCalc(188)
    titleScreenVariables.freeScreen.fbStatusTile.y = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.fbStatusTile.originalY = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.fbStatusTile:toFront()

    titleScreenVariables.freeScreen.twFollowTile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/twFollow.png", 92, 65)
    titleScreenVariables.freeScreen.twFollowTile.anchorX = 0.5
    titleScreenVariables.freeScreen.twFollowTile.anchorY = 0.5
    titleScreenVariables.freeScreen.twFollowTile.width = xCalc(92)
    titleScreenVariables.freeScreen.twFollowTile.height = yCalc(65)
    titleScreenVariables.freeScreen.twFollowTile.x = xCalc(292)
    titleScreenVariables.freeScreen.twFollowTile.y = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.twFollowTile.originalY = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.twFollowTile:toFront()

    titleScreenVariables.freeScreen.twTweetTile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/twTweet.png", 92, 65)
    titleScreenVariables.freeScreen.twTweetTile.anchorX = 0.5
    titleScreenVariables.freeScreen.twTweetTile.anchorY = 0.5
    titleScreenVariables.freeScreen.twTweetTile.width = xCalc(92)
    titleScreenVariables.freeScreen.twTweetTile.height = yCalc(65)
    titleScreenVariables.freeScreen.twTweetTile.x = xCalc(396)
    titleScreenVariables.freeScreen.twTweetTile.y = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.twTweetTile.originalY = (display.contentHeight / 2) + display.contentHeight - yCalc(59)
    titleScreenVariables.freeScreen.twTweetTile:toFront()

--[[
    titleScreenVariables.freeScreen.vid1Tile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeButton.png", 240, 190)
    titleScreenVariables.freeScreen.vid1Tile.anchorX = 0.5
    titleScreenVariables.freeScreen.vid1Tile.anchorY = 0.5
    titleScreenVariables.freeScreen.vid1Tile.x = 123
    titleScreenVariables.freeScreen.vid1Tile.y = (display.contentHeight / 2) + display.contentHeight + 60
    titleScreenVariables.freeScreen.vid1Tile.originalY = (display.contentHeight / 2) + display.contentHeight + 60
    titleScreenVariables.freeScreen.vid1Tile:toFront()

    titleScreenVariables.freeScreen.vid2Tile = display.newImageRect("images/central-images/Layout/TitleScreen/FreeButton.png", 240, 190)
    titleScreenVariables.freeScreen.vid2Tile.anchorX = 0.5
    titleScreenVariables.freeScreen.vid2Tile.anchorY = 0.5
    titleScreenVariables.freeScreen.vid2Tile.x = 356
    titleScreenVariables.freeScreen.vid2Tile.y = (display.contentHeight / 2) + display.contentHeight + 60
    titleScreenVariables.freeScreen.vid2Tile.originalY = (display.contentHeight / 2) + display.contentHeight + 60
    titleScreenVariables.freeScreen.vid2Tile:toFront()
    ]]

    titleScreenVariables.freeScreen.closeButton = display.newImageRect("images/central-images/Layout/TitleScreen/FreeScreen/close.png", 41, 31)
    titleScreenVariables.freeScreen.closeButton.anchorX = 0.5
    titleScreenVariables.freeScreen.closeButton.anchorY = 0.5
    titleScreenVariables.freeScreen.closeButton.x = display.contentWidth - xCalc(45)
    titleScreenVariables.freeScreen.closeButton.y = display.contentHeight + yCalc(20)
    titleScreenVariables.freeScreen.closeButton.originalY = display.contentHeight + yCalc(20)
    titleScreenVariables.freeScreen.closeButton:toFront()

    sceneGroup:insert(titleScreenVariables.freeScreen)

        ---- Button
    titleScreenVariables.freeScreen.closeButton:addEventListener("tap", openFreeScreen)
    freeButton:addEventListener("tap", openFreeScreen)


    ------------- Set up 'Extras' Screen & Button

    titleScreenVariables.extrasScreen = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/background.png", display.contentWidth, display.contentHeight)
    titleScreenVariables.extrasScreen.anchorX = 0.5
    titleScreenVariables.extrasScreen.anchorY = 0.5
    titleScreenVariables.extrasScreen.x = display.contentWidth / 2
    titleScreenVariables.extrasScreen.y = (display.contentHeight / 2) + display.contentHeight
    titleScreenVariables.extrasScreen.originalY = (display.contentHeight / 2) + display.contentHeight
    titleScreenVariables.extrasScreen.openState = "closed"
    titleScreenVariables.extrasScreen:toFront()

    -- Coins and Lives
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

    titleScreenVariables.extrasScreen.dollarIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        titleScreenVariables.extrasScreen.dollarIcon:setSequence("coins")
        titleScreenVariables.extrasScreen.dollarIcon.anchorX = 0
        titleScreenVariables.extrasScreen.dollarIcon.anchorY = 0
        titleScreenVariables.extrasScreen.dollarIcon.x = xCalc(50)
        titleScreenVariables.extrasScreen.dollarIcon.y = yCalc(50) + display.contentHeight
        titleScreenVariables.extrasScreen.dollarIcon.originalY = yCalc(50) + display.contentHeight

    titleScreenVariables.extrasScreen.dollarCounter = {}

    for a = 1, 7 do
        local distanceDifference = 10

        titleScreenVariables.extrasScreen.dollarCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        titleScreenVariables.extrasScreen.dollarCounter[a]:setSequence("0")
        titleScreenVariables.extrasScreen.dollarCounter[a].anchorX = 0
        titleScreenVariables.extrasScreen.dollarCounter[a].anchorY = 0
        titleScreenVariables.extrasScreen.dollarCounter[a].y = titleScreenVariables.extrasScreen.dollarIcon.y + 8
        titleScreenVariables.extrasScreen.dollarCounter[a].originalY = titleScreenVariables.extrasScreen.dollarIcon.y + 8

        if (a == 1) then
            titleScreenVariables.extrasScreen.dollarCounter[a].x = titleScreenVariables.extrasScreen.dollarIcon.x + xCalc(30) + (distanceDifference * (6 - #coinCounter) )
        else
            titleScreenVariables.extrasScreen.dollarCounter[a].x = titleScreenVariables.extrasScreen.dollarCounter[a - 1].x + distanceDifference
        end

        if a < (7 - (#coinCounter - 1) ) then
            titleScreenVariables.extrasScreen.dollarCounter[a].alpha = 0
        end

    end

    for a = 1, #coinCounter do
        local i = 7 - #coinCounter + a
        titleScreenVariables.extrasScreen.dollarCounter[i]:setSequence(string.sub(coinCounter, a, a))
    end

    -------------

    local lives = myGameSettings["total_lives"]
    local totalLivesAllowed = myGameSettings["current_max_lives"]

    titleScreenVariables.extrasScreen.livesIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
        titleScreenVariables.extrasScreen.livesIcon:setSequence("lives")
        --livesIcon:setReferencePoint(display.BottomLeftReferencePoint);
        titleScreenVariables.extrasScreen.livesIcon.anchorX = 0
        titleScreenVariables.extrasScreen.livesIcon.anchorY = 0
        titleScreenVariables.extrasScreen.livesIcon.x = xCalc(50)
        titleScreenVariables.extrasScreen.livesIcon.y = yCalc(85) + display.contentHeight
        titleScreenVariables.extrasScreen.livesIcon.originalY = yCalc(85) + display.contentHeight

    titleScreenVariables.extrasScreen.livesCounter = {}

    titleScreenVariables.extrasScreen.livesCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        titleScreenVariables.extrasScreen.livesCounter[1]:setSequence(tostring(lives))
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        titleScreenVariables.extrasScreen.livesCounter[1].anchorX = 0
        titleScreenVariables.extrasScreen.livesCounter[1].anchorY = 0
        titleScreenVariables.extrasScreen.livesCounter[1].y = titleScreenVariables.extrasScreen.livesIcon.y + 9
        titleScreenVariables.extrasScreen.livesCounter[1].originalY = titleScreenVariables.extrasScreen.livesIcon.y  + 9
        titleScreenVariables.extrasScreen.livesCounter[1].x = titleScreenVariables.extrasScreen.livesIcon.x + xCalc(30)

    titleScreenVariables.extrasScreen.livesCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        titleScreenVariables.extrasScreen.livesCounter[2]:setSequence("/")
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        titleScreenVariables.extrasScreen.livesCounter[2].anchorX = 0
        titleScreenVariables.extrasScreen.livesCounter[2].anchorY = 0
        titleScreenVariables.extrasScreen.livesCounter[2].y = titleScreenVariables.extrasScreen.livesIcon.y + 10
        titleScreenVariables.extrasScreen.livesCounter[2].originalY = titleScreenVariables.extrasScreen.livesIcon.y + 10
        titleScreenVariables.extrasScreen.livesCounter[2].x = titleScreenVariables.extrasScreen.livesIcon.x + xCalc(40)

    titleScreenVariables.extrasScreen.livesCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
        titleScreenVariables.extrasScreen.livesCounter[3]:setSequence(tostring(totalLivesAllowed))
        --livesCounter[a]:setReferencePoint(display.BottomLeftReferencePoint);
        titleScreenVariables.extrasScreen.livesCounter[3].anchorX = 0
        titleScreenVariables.extrasScreen.livesCounter[3].anchorY = 0
        titleScreenVariables.extrasScreen.livesCounter[3].y = titleScreenVariables.extrasScreen.livesIcon.y + 9
        titleScreenVariables.extrasScreen.livesCounter[3].originalY = titleScreenVariables.extrasScreen.livesIcon.y + 9
        titleScreenVariables.extrasScreen.livesCounter[3].x = titleScreenVariables.extrasScreen.livesIcon.x + xCalc(48)

    -- Social
    titleScreenVariables.extrasScreen.fbPageTile = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/fb.png", 54, 49)
    titleScreenVariables.extrasScreen.fbPageTile.anchorX = 0.5
    titleScreenVariables.extrasScreen.fbPageTile.anchorY = 0.5
    titleScreenVariables.extrasScreen.fbPageTile.x = ((288/480) * display.contentWidth )
    titleScreenVariables.extrasScreen.fbPageTile.y = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.fbPageTile.originalY = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.fbPageTile:toFront()

    titleScreenVariables.extrasScreen.twPageTile = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/tw.png", 54, 49)
    titleScreenVariables.extrasScreen.twPageTile.anchorX = 0.5
    titleScreenVariables.extrasScreen.twPageTile.anchorY = 0.5
    titleScreenVariables.extrasScreen.twPageTile.x = ((353/480) * display.contentWidth )
    titleScreenVariables.extrasScreen.twPageTile.y = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.twPageTile.originalY = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.twPageTile.iFrameUrl = "http://www.twitter.com"
        titleScreenVariables.extrasScreen.twPageTile.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.twPageTile:addEventListener("tap", linkPressed)
        end
        titleScreenVariables.extrasScreen.twPageTile.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.twPageTile:removeEventListener("tap", linkPressed)
        end
    titleScreenVariables.extrasScreen.twPageTile:toFront()

    titleScreenVariables.extrasScreen.ytPageTile = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/yt.png", 54, 49)
    titleScreenVariables.extrasScreen.ytPageTile.anchorX = 0.5
    titleScreenVariables.extrasScreen.ytPageTile.anchorY = 0.5
    titleScreenVariables.extrasScreen.ytPageTile.x = ((418/480) * display.contentWidth )
    titleScreenVariables.extrasScreen.ytPageTile.y = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.ytPageTile.originalY = (display.contentHeight / 2) + display.contentHeight - 45
    titleScreenVariables.extrasScreen.ytPageTile.iFrameUrl = "http://www.youtube.com"
        titleScreenVariables.extrasScreen.ytPageTile.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.ytPageTile:addEventListener("tap", linkPressed)
        end
        titleScreenVariables.extrasScreen.ytPageTile.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.ytPageTile:removeEventListener("tap", linkPressed)
        end
    titleScreenVariables.extrasScreen.ytPageTile:toFront()
    ---
    --- Settings

    local muteButtonImageSheet = graphics.newImageSheet( "images/central-images/Layout/TitleScreen/ExtrasScreen/muteButton.png", {width = 65, height = 57, numFrames = 2, sheetContentWidth = 130, sheetContentHeight = 57})
    local muteButtonSequenceData = {
        { name = "on", start=1, count=1,   loopCount=1 },
        { name = "off", start=2, count=1, loopCount=1 }
    }

    local soundButtonImageSheet = graphics.newImageSheet( "images/central-images/Layout/TitleScreen/ExtrasScreen/soundButton.png", {width = 65, height = 57, numFrames = 2, sheetContentWidth = 130, sheetContentHeight = 57})
    local soundButtonSequenceData = {
        { name = "on", start=1, count=1,   loopCount=1 },
        { name = "off", start=2, count=1, loopCount=1 }
    }

    titleScreenVariables.extrasScreen.muteButton = display.newSprite(muteButtonImageSheet, muteButtonSequenceData)
    titleScreenVariables.extrasScreen.muteButton.anchorX = 0
    titleScreenVariables.extrasScreen.muteButton.anchorY = 0.5
    titleScreenVariables.extrasScreen.muteButton.width = xCalc(65)
    titleScreenVariables.extrasScreen.muteButton.height = yCalc(57)
    titleScreenVariables.extrasScreen.muteButton.x = xCalc(53)
    titleScreenVariables.extrasScreen.muteButton.y = (display.contentHeight / 2) + display.contentHeight + 37
    titleScreenVariables.extrasScreen.muteButton.originalY = (display.contentHeight / 2) + display.contentHeight + 37
        titleScreenVariables.extrasScreen.muteButton.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.muteButton:addEventListener("tap", toggleMuteSetting)
        end
        titleScreenVariables.extrasScreen.muteButton.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.muteButton:removeEventListener("tap", toggleMuteSetting)
        end
    if myGameSettings["musicOn"] then
        titleScreenVariables.extrasScreen.muteButton:setSequence("on")
    else
        titleScreenVariables.extrasScreen.muteButton:setSequence("off")
    end
    titleScreenVariables.extrasScreen.muteButton:toFront()

    titleScreenVariables.extrasScreen.deleteGameDataButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/deleteDataButton.png", 151, 56)
    titleScreenVariables.extrasScreen.deleteGameDataButton.anchorX = 0
    titleScreenVariables.extrasScreen.deleteGameDataButton.anchorY = 0.5
    titleScreenVariables.extrasScreen.deleteGameDataButton.width = xCalc(151)
    titleScreenVariables.extrasScreen.deleteGameDataButton.height = yCalc(56)
    titleScreenVariables.extrasScreen.deleteGameDataButton.x = xCalc(53)
    titleScreenVariables.extrasScreen.deleteGameDataButton.y = (display.contentHeight / 2) + display.contentHeight + 103
    titleScreenVariables.extrasScreen.deleteGameDataButton.originalY = (display.contentHeight / 2) + display.contentHeight + 103
        titleScreenVariables.extrasScreen.deleteGameDataButton.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.deleteGameDataButton:addEventListener("tap", deleteGameData)
        end
        titleScreenVariables.extrasScreen.deleteGameDataButton.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.deleteGameDataButton:removeEventListener("tap", deleteGameData)
        end
    titleScreenVariables.extrasScreen.deleteGameDataButton:toFront()

    titleScreenVariables.extrasScreen.soundButton = display.newSprite(soundButtonImageSheet, soundButtonSequenceData)
    titleScreenVariables.extrasScreen.soundButton.anchorX = 1
    titleScreenVariables.extrasScreen.soundButton.anchorY = 0.5
    titleScreenVariables.extrasScreen.soundButton.width = xCalc(65)
    titleScreenVariables.extrasScreen.soundButton.height = yCalc(57)
    titleScreenVariables.extrasScreen.soundButton.x = titleScreenVariables.extrasScreen.deleteGameDataButton.x + titleScreenVariables.extrasScreen.deleteGameDataButton.width
    titleScreenVariables.extrasScreen.soundButton.y = (display.contentHeight / 2) + display.contentHeight + 37
    titleScreenVariables.extrasScreen.soundButton.originalY = (display.contentHeight / 2) + display.contentHeight + 37
        titleScreenVariables.extrasScreen.soundButton.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.soundButton:addEventListener("tap", toggleSoundSetting)
        end
        titleScreenVariables.extrasScreen.soundButton.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.soundButton:removeEventListener("tap", toggleSoundSetting)
        end
    if myGameSettings["soundsOn"] then
        titleScreenVariables.extrasScreen.soundButton:setSequence("on")
    else
        titleScreenVariables.extrasScreen.soundButton:setSequence("off")
    end
    titleScreenVariables.extrasScreen.soundButton:toFront()
    ---
    --- Links
    titleScreenVariables.extrasScreen.linkButton1 = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/newsButton.png", 139, 47)
    titleScreenVariables.extrasScreen.linkButton1.anchorX = 0.5
    titleScreenVariables.extrasScreen.linkButton1.anchorY = 0.5
    titleScreenVariables.extrasScreen.linkButton1.x = xCalc(384)
    titleScreenVariables.extrasScreen.linkButton1.y = (display.contentHeight / 2) + display.contentHeight + 20
    titleScreenVariables.extrasScreen.linkButton1.originalY = (display.contentHeight / 2) + display.contentHeight + 20
    titleScreenVariables.extrasScreen.linkButton1.iFrameUrl = "http://www.thenightlightstudio.co.uk"
        titleScreenVariables.extrasScreen.linkButton1.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton1:addEventListener("tap", linkPressed)
        end
        titleScreenVariables.extrasScreen.linkButton1.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton1:removeEventListener("tap", linkPressed)
        end
    titleScreenVariables.extrasScreen.linkButton1:toFront()

    titleScreenVariables.extrasScreen.linkButton2 = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/aboutButton.png", 139, 47)
    titleScreenVariables.extrasScreen.linkButton2.anchorX = 0.5
    titleScreenVariables.extrasScreen.linkButton2.anchorY = 0.5
    titleScreenVariables.extrasScreen.linkButton2.x = ((384/480) * display.contentWidth )
    titleScreenVariables.extrasScreen.linkButton2.y = (display.contentHeight / 2) + display.contentHeight + 71
    titleScreenVariables.extrasScreen.linkButton2.originalY = (display.contentHeight / 2) + display.contentHeight + 71
    titleScreenVariables.extrasScreen.linkButton2.iFrameUrl = "http://www.google.co.uk"
    titleScreenVariables.extrasScreen.linkButton2.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton2:addEventListener("tap", linkPressed)
        end
        titleScreenVariables.extrasScreen.linkButton2.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton2:removeEventListener("tap", linkPressed)
        end
    titleScreenVariables.extrasScreen.linkButton2:toFront()

    titleScreenVariables.extrasScreen.linkButton3 = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/moreGamesButton.png", 139, 47)
    titleScreenVariables.extrasScreen.linkButton3.anchorX = 0.5
    titleScreenVariables.extrasScreen.linkButton3.anchorY = 0.5
    titleScreenVariables.extrasScreen.linkButton3.x = ((384/480) * display.contentWidth )
    titleScreenVariables.extrasScreen.linkButton3.y = (display.contentHeight / 2) + display.contentHeight + 122
    titleScreenVariables.extrasScreen.linkButton3.originalY = (display.contentHeight / 2) + display.contentHeight + 122
    titleScreenVariables.extrasScreen.linkButton3.iFrameUrl = "http://www.thenightlightstudio.co.uk"
    titleScreenVariables.extrasScreen.linkButton3.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton3:addEventListener("tap", linkPressed)
        end
        titleScreenVariables.extrasScreen.linkButton3.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.linkButton3:removeEventListener("tap", linkPressed)
        end
    titleScreenVariables.extrasScreen.linkButton3:toFront()

    titleScreenVariables.extrasScreen.closeButton = display.newImageRect("images/central-images/Layout/TitleScreen/ExtrasScreen/close.png", 41, 31)
    titleScreenVariables.extrasScreen.closeButton.anchorX = 0.5
    titleScreenVariables.extrasScreen.closeButton.anchorY = 0.5
    titleScreenVariables.extrasScreen.closeButton.x = display.contentWidth - xCalc(45)
    titleScreenVariables.extrasScreen.closeButton.y = display.contentHeight + yCalc(20)
    titleScreenVariables.extrasScreen.closeButton.originalY = display.contentHeight + yCalc(20)
        titleScreenVariables.extrasScreen.closeButton.onScreenFunction = function ()
            titleScreenVariables.extrasScreen.closeButton:addEventListener("tap", openExtrasScreen)
        end
        titleScreenVariables.extrasScreen.closeButton.offScreenFunction = function ()
            titleScreenVariables.extrasScreen.closeButton:removeEventListener("tap", openExtrasScreen)
        end
    titleScreenVariables.extrasScreen.closeButton:toFront()

    sceneGroup:insert(titleScreenVariables.extrasScreen)

        ---- Button
    extrasButton:addEventListener("tap", openExtrasScreen)

    shopButton:addEventListener("tap", openIAP)

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
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        audio.stop( musicChannel["amazeballs"] )
        -- Called immediately after scene goes off screen.
    
        --composer.removeScene("WorldSelectScene")

        local function removeDisplayObject (DisplayObject)
        	DisplayObject:removeSelf()
        	DisplayObject = nil
        end
        
        removeDisplayObject(background)
        removeDisplayObject(upperBackground)
        removeDisplayObject(showCoinsLabel)
        removeDisplayObject(playButton)
        for a = 1, #socialIcons do
        	removeDisplayObject(socialIcons[a])
        end
        removeDisplayObject(shopButton)
        removeDisplayObject(leaderboardButton)
        removeDisplayObject(extrasButton)
        removeDisplayObject(freeButton)

        if (titleScreenVariables.extrasScreen
        and titleScreenVariables.extrasScreen ~= null) then

            if (titleScreenVariables.extrasScreen.gameDataNotice
            and titleScreenVariables.extrasScreen.gameDataNotice ~= null) then

            end

            -- remove extrasScreen objects
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
        if levelVariables.IAPScreenObjectsGroup then
            checkGroup(levelVariables.IAPScreenObjectsGroup)
        end

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