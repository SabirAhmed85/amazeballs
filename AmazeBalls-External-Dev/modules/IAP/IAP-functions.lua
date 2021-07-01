local t = {}
local recreateYouHaveDisplay

local function updateLivesDisplay(livesCounterObj)
    local gameSettings = loadTable("myGameSettings.json")
    livesCounterObj[1]:setSequence(gameSettings["total_lives"])
    livesCounterObj[3]:setSequence(gameSettings["current_max_lives"])
end
	t.updateLivesDisplay = updateLivesDisplay

local function updateLivesPlusButton(livesPlusButton, relatedListener)
    local gameSettings = loadTable("myGameSettings.json")
    if (gameSettings["total_lives"] < gameSettings["current_max_lives"])
    or (gameSettings["current_max_lives"] < gameSettings["total_max_lives"]) then
    	livesPlusButton:setSequence("on")
    	livesPlusButton:addEventListener("tap", relatedListener)
    else
    	livesPlusButton:setSequence("off")
    	livesPlusButton:removeEventListener("tap", relatedListener)
    end
end
	t.updateLivesPlusButton = updateLivesPlusButton

local function updateScreensOtherCoinsDisplay(coinsDisplayObj)
	local gameSettings = loadTable("myGameSettings.json")
    local coinsString = tostring(gameSettings["total_coins"])
    if (#coinsString > 3) then
    	local stringStart = string.sub(coinsString, 1, #coinsString - 3)
    	local stringEnd = string.sub(coinsString, #coinsString - 2, #coinsString)

    	coinsString = stringStart .. "," .. stringEnd
    end

    for a = 1, 7 do
    	if a < (7 - (#coinsString - 1) ) then
    		coinsDisplayObj[a].alpha = 0
	    end
    end
    for a = 1, #coinsString do
    	local i = 7 - #coinsString + a
    	coinsDisplayObj[i].alpha = 1
    	coinsDisplayObj[i]:setSequence(string.sub(coinsString, a, a))
    end
end
	t.updateScreensOtherCoinsDisplay = updateScreensOtherCoinsDisplay

local function updateCoinsPlusButton(coinsPlusButton, relatedListener)
    local gameSettings = loadTable("myGameSettings.json")
    if (999999 - gameSettings["total_coins"]) > 10000 then
    	coinsPlusButton:setSequence("on")
    	coinsPlusButton:addEventListener("tap", relatedListener)
    else
    	coinsPlusButton:setSequence("off")
    	coinsPlusButton:removeEventListener("tap", relatedListener)
    end
end
	t.updateCoinsPlusButton = updateCoinsPlusButton

local reduceCoinsInGameSettings = function (levelVariables, price, myGameSettingsScript)
	
    myGameSettings["total_coins"] = myGameSettings["total_coins"] - price

	saveTable(myGameSettings, "myGameSettings.json")

    levelVariables.IAPOverlay.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay("Coins", "myGameSettings.json", 360, display.contentHeight - 28, levelVariables.IAPOverlay, "slow", levelVariables.IAPScreenObjectsGroup)
    levelVariables.IAPOverlay.youHaveDisplay.icon.xScale = 0.65
    levelVariables.IAPOverlay.youHaveDisplay.icon.yScale = 0.65
    levelVariables.IAPOverlay.youHaveDisplay.icon.x = levelVariables.IAPOverlay.youHaveDisplay.icon.x + xCalc(10)
    levelVariables.IAPOverlay.youHaveDisplay.icon.y = levelVariables.IAPOverlay.youHaveDisplay.icon.y + yCalc(5)

    levelVariables.IAPOverlay.youHaveDisplay.bg = display.newImageRect("images/central-images/IAP/Central/mainCoinsDisplay.png", 141, 28)
	levelVariables.IAPOverlay.youHaveDisplay.bg.alpha = 0
	levelVariables.IAPOverlay.youHaveDisplay.bg.anchorX = 0
	levelVariables.IAPOverlay.youHaveDisplay.bg.anchorY = 1
	levelVariables.IAPOverlay.youHaveDisplay.bg.x = xCalc(365)
	levelVariables.IAPOverlay.youHaveDisplay.bg.y = display.contentHeight
	levelVariables.IAPOverlay.youHaveDisplay.bg.originalY = display.contentHeight - display.contentHeight
	levelVariables.IAPScreenObjectsGroup:insert(levelVariables.IAPOverlay.youHaveDisplay.bg)
	levelVariables.IAPOverlay.youHaveDisplay.bg:toFront()
	levelVariables.IAPOverlay.youHaveDisplay.icon:toFront()
	for a = 1, #levelVariables.IAPOverlay.youHaveDisplay.coins do
		levelVariables.IAPOverlay.youHaveDisplay.coins[a]:toFront()
	end

    recreateYouHaveDisplay(levelVariables.IAPOverlay, "Coins")

    levelVariables.coinsUpdatedFunction()
end

local checkIfEnoughCurrencyToBuy = function (price, currencyType, myGameSettingsScript)
	local bool
	local thisMyGameSettings = loadTable(myGameSettingsScript)

	if (currencyType == "coins") and (thisMyGameSettings["total_coins"] - price < 0) then
		bool = false
	elseif (currencyType == "coins") and (thisMyGameSettings["total_coins"] - price >= 0) then
		bool = true
	end

	return bool
end

local checkIfEnoughSpaceInBagToBuy = function (qty, existingToolQty)
	local bool

	if (9 - existingToolQty >= qty) then
		bool = true
	else
		bool = false
	end

	return bool
end

local checkIfAlreadyHaveFullLives = function (myGameSettingsScript)
	local bool
	local thisMyGameSettings = loadTable(myGameSettingsScript)
	if thisMyGameSettings["total_lives"] < thisMyGameSettings["current_max_lives"] then
		bool = false
	elseif thisMyGameSettings["total_lives"] == thisMyGameSettings["current_max_lives"] then
		bool = true
	end

	return bool
end

local checkScreenButtonsAvailability = function (screen, levelVariables)
	for a = 1, #screen.leftTile do
		for b = 1, #screen.leftTile[a].buyDisplay do
			levelVariables.checkAvailabilityOfBuyButtonToShow(screen.leftTile[a].buyDisplay[b].buyButton, levelVariables)
		end
	end
	for a = 1, #screen.rightTile do
		for b = 1, #screen.rightTile[a].buyDisplay do
			levelVariables.checkAvailabilityOfBuyButtonToShow(screen.rightTile[a].buyDisplay[b].buyButton, levelVariables)
		end
	end
end

recreateYouHaveDisplay = function (screen, screenName)
	if screenName == "Lives" then
		for a = 1, #screen.youHaveDisplay do
			transition.to(screen.youHaveDisplay[a], {alpha = screen.youHaveDisplay[a].intendedAlpha, time = 500})
		end
	elseif screenName == "Coins" then
		if screen.youHaveDisplay.bg then
			transition.to(screen.youHaveDisplay.bg, {alpha = 1, time = 500})
		end
		transition.to(screen.youHaveDisplay.icon, {alpha = 1, time = 500})
		for a = 1, #screen.youHaveDisplay.coins do
			transition.to(screen.youHaveDisplay.coins[a], {alpha = 1, time = 500})
		end
	else
		-- it must be a tool or shape -- unlock screen has to no youHave display
		for a = 1, #screen.youHaveDisplay.icons do
			transition.to(screen.youHaveDisplay.icons[a], {alpha = 1, time = 500})
			for key, val in pairs(screen.youHaveDisplay.icons[a].displayObjects) do
				if key == "directionLabel" then
					for b = 1, #screen.youHaveDisplay.icons[a].displayObjects["directionLabel"] do
						transition.to(screen.youHaveDisplay.icons[a].displayObjects["directionLabel"][b], {alpha = 1, time = 500})
					end
				elseif key == "text" then
					for b = 1, #screen.youHaveDisplay.icons[a].displayObjects["text"] do
						transition.to(screen.youHaveDisplay.icons[a].displayObjects["text"][b], {alpha = 1, time = 500})
					end
				else
					transition.to(screen.youHaveDisplay.icons[a].displayObjects[key], {alpha = 1, time = 500})
				end
			end
		end

	end
end

local closePurchaseScreen = function (IAPOverlay, levelVariables)
	
	IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"].currentPurchaseScreenShowing = nil
	transition.to(IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"], {alpha = 0, time = 200, onComplete = function () 
		IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"]:toBack()
	end})

	IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"].currentPurchaseScreenShowing = nil

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
	
	transition.to(IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"], {alpha = 0, time = 200, onComplete = function ()
		IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"]:toBack()
		transition.to(IAPOverlay.purchaseScreens["canBuy"].screen, {alpha = 0, time = 200, onComplete = function ()
			IAPOverlay.purchaseScreens["canBuy"].screen:toBack()
			levelVariables.currentPurchaseFunction = nil
			levelVariables.livesPurchasedFunction()
		end})
	end})
end

local itemPurchased = function (IAPOverlay, levelVariables)
	IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"]:removeEventListener("tap", levelVariables.currentPurchaseFunction)
	IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"]:removeEventListener("tap", levelVariables.closePurchaseScreen)
end

local buyFullLives = function (myGameSettingsScript, levelVariables)
	myGameSettings = loadTable(myGameSettingsScript)
	myGameSettings["total_lives"] = myGameSettings["current_max_lives"]

	saveTable(myGameSettings, "myGameSettings.json")

	levelVariables.IAPOverlay.liveScreen.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay("Lives", "myGameSettings.json", 120, 48, levelVariables.IAPOverlay.liveScreen, "slow", levelVariables.IAPScreenObjectsGroup)

	recreateYouHaveDisplay(levelVariables.IAPOverlay.liveScreen, "Lives")
	checkScreenButtonsAvailability(levelVariables.IAPOverlay.liveScreen, levelVariables)
	closePurchaseScreen(levelVariables.IAPOverlay, levelVariables)
end

local buyPlusOneLife = function (myGameSettingsScript, levelVariables)
	myGameSettings = loadTable(myGameSettingsScript)
	myGameSettings["total_lives"] = myGameSettings["total_lives"] + 1

	saveTable(myGameSettings, "myGameSettings.json")

	levelVariables.IAPOverlay.liveScreen.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay("Lives", "myGameSettings.json", 120, 48, levelVariables.IAPOverlay.liveScreen, "slow", levelVariables.IAPScreenObjectsGroup)

	recreateYouHaveDisplay(levelVariables.IAPOverlay.liveScreen, "Lives")
	checkScreenButtonsAvailability(levelVariables.IAPOverlay.liveScreen, levelVariables)
	closePurchaseScreen(levelVariables.IAPOverlay, levelVariables)
end

local showCantPurchaseScreen = function (IAPOverlay, levelVariables, screenName)
	IAPOverlay.purchaseScreens[screenName].screen:toFront()
	transition.to(IAPOverlay.purchaseScreens[screenName].screen, {alpha = 1, time = 200, onComplete = function ()
		IAPOverlay.purchaseScreens[screenName].buttons["closeButton"].currentPurchaseScreenShowing = "cantBuy_coins"

		IAPOverlay.purchaseScreens[screenName].buttons["closeButton"]:toFront()
		transition.to(IAPOverlay.purchaseScreens[screenName].buttons["closeButton"], {alpha = 1, time = 200, onComplete = function () 
			IAPOverlay.purchaseScreens[screenName].buttons["closeButton"].currentPurchaseScreenShowing = screenName
			IAPOverlay.purchaseScreens[screenName].buttons["closeButton"]:addEventListener("tap", levelVariables.closePurchaseScreen)
		end})
	end})
end

local showPurchaseScreen = function (IAPOverlay, levelVariables, screenName)
	IAPOverlay.purchaseScreens[screenName].screen:toFront()
	transition.to(IAPOverlay.purchaseScreens[screenName].screen, {alpha = 1, time = 200, onComplete = function ()
		if (screenName == "canBuy") then
			IAPOverlay.purchaseScreens["canBuy"].icon:toFront()
			IAPOverlay.purchaseScreens["canBuy"].currencyIcon:toFront()
			for a = 1, #IAPOverlay.purchaseScreens["canBuy"].priceNumbers do
				IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a]:toFront()
			end
		end
		IAPOverlay.purchaseScreens[screenName].buttons["noButton"].currentPurchaseScreenShowing = "cantBuy_coins"

		IAPOverlay.purchaseScreens[screenName].buttons["noButton"]:toFront()
		transition.to(IAPOverlay.purchaseScreens[screenName].buttons["noButton"], {alpha = 1, time = 200, onComplete = function () 
			IAPOverlay.purchaseScreens[screenName].buttons["noButton"].currentPurchaseScreenShowing = screenName
			IAPOverlay.purchaseScreens[screenName].buttons["noButton"]:addEventListener("tap", levelVariables.closePurchaseScreen)
		end})

		IAPOverlay.purchaseScreens[screenName].buttons["yesButton"].currentPurchaseScreenShowing = "cantBuy_coins"

		IAPOverlay.purchaseScreens[screenName].buttons["yesButton"]:toFront()
		transition.to(IAPOverlay.purchaseScreens[screenName].buttons["yesButton"], {alpha = 1, time = 200, onComplete = function () 
			IAPOverlay.purchaseScreens[screenName].buttons["yesButton"].currentPurchaseScreenShowing = screenName
			IAPOverlay.purchaseScreens[screenName].buttons["yesButton"]:addEventListener("tap", levelVariables.currentPurchaseFunction)
		end})
	end})
end

local function createCanBuyScreenCoinsAndIcon (value, itemPurchasing, currency)

	local smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
	local smallIconsSequenceData = {
	    { name = "Lives", start=1, count=1,   loopCount=1 },
	    { name = "Coins", start=3, count=1, loopCount=1 },
	    { name = "question-mark", start=8, count=1, loopCount=1 }
	}

	IAPOverlay.purchaseScreens["canBuy"].currentPurchaseType = itemPurchasing

	if itemPurchasing == "lives" then
		IAPOverlay.purchaseScreens["canBuy"].icon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
		IAPOverlay.purchaseScreens["canBuy"].icon:setSequence("Lives")
		IAPOverlay.purchaseScreens["canBuy"].icon.x = xCalc(220)
		IAPOverlay.purchaseScreens["canBuy"].icon.y = yCalc(110)

		IAPOverlay.purchaseScreens["canBuy"].icon.displayObjects = {}
	end


	if (currency == "Coins") then
		IAPOverlay.purchaseScreens["canBuy"].currencyIcon = display.newSprite(smallIconsImageSheet, smallIconsSequenceData)
		IAPOverlay.purchaseScreens["canBuy"].currencyIcon:setSequence("Coins")
	end
	IAPOverlay.purchaseScreens["canBuy"].currencyIcon.x = xCalc(245)
	IAPOverlay.purchaseScreens["canBuy"].currencyIcon.y = yCalc(146)
	IAPOverlay.purchaseScreens["canBuy"].currencyIcon.xScale = 0.7
	IAPOverlay.purchaseScreens["canBuy"].currencyIcon.yScale = 0.7

	IAPOverlay.purchaseScreens["canBuy"].priceNumbers = {}
	local priceString = tostring(value)
	local smallPriceNumbersSequenceSheet = graphics.newImageSheet( "images/central-images/IAP/Central/smallNumbersSprite.png", {width = 12, height = 16, numFrames = 12, sheetContentWidth = 144, sheetContentHeight = 16})
	local smallPriceNumbersSequenceData = {
	    { name = "0", start=1, count=1,   loopCount=1 },
	    { name = "1", start=2, count=1, loopCount=1 },
	    { name = "2", start=3, count=1, loopCount=1 },
	    { name = "3", start=4, count=1, loopCount=1 },
	    { name = "4", start=5, count=1, loopCount=1 },
	    { name = "5", start=6, count=1, loopCount=1 },
	    { name = "6", start=7, count=1, loopCount=1 },
	    { name = "7", start=8, count=1, loopCount=1 },
	    { name = "8", start=9, count=1, loopCount=1 },
	    { name = "9", start=10, count=1, loopCount=1 },
	    { name = ",", start=11, count=1, loopCount=1 },
	    { name = ".", start=12, count=1, loopCount=1 }
	}

	for a = 1, #priceString do
		IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a] = display.newSprite(smallPriceNumbersSequenceSheet, smallPriceNumbersSequenceData)
		IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a]:setSequence(string.sub(priceString, a, a))
		IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a].x = xCalc(260) + (a * xCalc(10))
		IAPOverlay.purchaseScreens["canBuy"].priceNumbers[a].y = yCalc(146)
	end
end


local buyButtonPressedMain = function (buyButton, IAPStoreConfigurationArray, IAPToolsItemArray, IAPShapesItemArray, toolArrayScript, myGameSettingsScript, buyButtonPressed, levelVariables)
	
	if IAPStoreConfigurationArray[buyButton.purchaseType] then
		-- the purchase is either lives, coins or unlock screen

		if (buyButton.purchaseType == "Lives") then
			
			if buyButton.alias == "fullLives" then
				if buyButton.currency == "coins" then
					local haveEnoughCurrencyToBuy = checkIfEnoughCurrencyToBuy(buyButton.value, "coins", myGameSettingsScript)
					if (haveEnoughCurrencyToBuy == true) then
						levelVariables.currentPurchaseFunction = function (event)
							itemPurchased(IAPOverlay, levelVariables)
							reduceCoinsInGameSettings(levelVariables, buyButton.value, myGameSettingsScript)
							buyFullLives(myGameSettingsScript, levelVariables)
						end
						createCanBuyScreenCoinsAndIcon(buyButton.value, "lives", "Coins")
						showPurchaseScreen(IAPOverlay, levelVariables, "canBuy")
					else
						showCantPurchaseScreen(IAPOverlay, levelVariables, "cantBuy_coins")
					end
				else

				end
			elseif buyButton.alias == "plusOneLife" then
				local haveEnoughCurrencyToBuy = checkIfEnoughCurrencyToBuy(buyButton.value, "coins", myGameSettingsScript)
				if (haveEnoughCurrencyToBuy == true) then
					levelVariables.currentPurchaseFunction = function (event)
						itemPurchased(IAPOverlay, levelVariables)
						reduceCoinsInGameSettings(levelVariables, buyButton.value, myGameSettingsScript)
						buyPlusOneLife(myGameSettingsScript, levelVariables)
					end
					createCanBuyScreenCoinsAndIcon(buyButton.value, "lives", "Coins")
					showPurchaseScreen(IAPOverlay, levelVariables, "canBuy")
				else
					showCantPurchaseScreen(IAPOverlay, levelVariables, "cantBuy_coins")
				end
			elseif buyButton.alias == "maxLifeInc" then
				myGameSettings = loadTable(myGameSettingsScript)
				myGameSettings["current_max_lives"] = myGameSettings["current_max_lives"] + 1

				saveTable(myGameSettings, "myGameSettings.json")

				levelVariables.IAPOverlay.liveScreen.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay("Lives", "myGameSettings.json", 120, 48, levelVariables.IAPOverlay.liveScreen, "slow", levelVariables.IAPScreenObjectsGroup)

				timer.performWithDelay(1000, function ()
					recreateYouHaveDisplay(levelVariables.IAPOverlay.liveScreen, "Lives")
					checkScreenButtonsAvailability(levelVariables.IAPOverlay.liveScreen, levelVariables)
				end)
			end
		elseif (buyButton.purchaseType == "Coins") then
			--[[
			myGameSettings = loadTable(myGameSettingsScript)
			myGameSettings["total_coins"] = myGameSettings["total_coins"] + buyButton.qty

			saveTable(thisMyGameSettings, "myGameSettings.json")
			]]
			reduceCoinsInGameSettings(levelVariables, buyButton.qty * -1, myGameSettingsScript)
			levelVariables.IAPOverlay.coinScreen.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay("Coins", "myGameSettings.json", 120, 48, levelVariables.IAPOverlay.coinScreen, "slow", levelVariables.IAPScreenObjectsGroup)

			timer.performWithDelay(1000, function ()
				recreateYouHaveDisplay(levelVariables.IAPOverlay.coinScreen, "Coins")
				checkScreenButtonsAvailability(levelVariables.IAPOverlay.coinScreen, levelVariables)
			end)
		end
		
	else

		if IAPToolsItemArray[buyButton.purchaseType] or IAPShapesItemArray[buyButton.purchaseType] then
			local myRelItemScript, thisIsShapeScreen, relItemArray
			if IAPToolsItemArray[buyButton.purchaseType] then
				-- it´s a tool
				thisIsShapeScreen = false
				myRelItemScript = "myTotalToolArray.json"
				levelVariables.IAPOverlay.currentToolScreen = levelVariables.IAPOverlay.toolScreen[buyButton.purchaseType]
				relItemArray = IAPToolsItemArray
			elseif IAPShapesItemArray[buyButton.purchaseType] then
				thisIsShapeScreen = true
				myRelItemScript = "myTotalObjectArray.json"
				levelVariables.IAPOverlay.currentToolScreen = levelVariables.IAPOverlay.shapeScreen[buyButton.purchaseType]
				relItemArray = IAPShapesItemArray
			end

			local myRelItemArray = loadTable(myRelItemScript)

			local checkIfToolExists = function (toolObject, itemArrayScript)
				local result = {}
				result.bool = false
				result.index = nil

				local currentMyToolArray = loadTable(itemArrayScript)

				for a = 1, #currentMyToolArray do
					result.bool = false
					local allPropertiesSame = false
					--print("bit", toolObject[1], currentMyToolArray[a][1], currentMyToolArray[a][3])
					if toolObject["name"] == currentMyToolArray[a]["name"] then
						allPropertiesSame = true
		    			for key, val in pairs (currentMyToolArray[a]["properties"]) do
		    				if key == "directions" then
		    					if #currentMyToolArray[a]["properties"][key] == #toolObject["properties"][key] then
		    						for b = 1, #currentMyToolArray[a]["properties"][key] do
		        						if currentMyToolArray[a]["properties"][key][b] ~= toolObject["properties"][key][b] then
		            						allPropertiesSame = false
		            					end
		        					end
		    					else
		    						allPropertiesSame = false
		    					end
		    				else
		    					if currentMyToolArray[a]["properties"][key] ~= toolObject["properties"][key] then
		    						allPropertiesSame = false
		    					end
		    				end
		    			end

	    				if allPropertiesSame then
	    					result.bool = true
							result.index = a
							return result
	    				end
					end
				end

				result.bool = false
				result.index = nil

				return result
			end

			--build object to put into player´s toolArray
			local toolObject = {}

			toolObject["name"] = buyButton.purchaseType
			toolObject["properties"] = {}

			if (buyButton.purchaseType == "bomb")
			or (buyButton.purchaseType == "hook")
			or (buyButton.purchaseType == "jet") then
				local directionArray = IAPToolsItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["directions"]
				toolObject["properties"]["directions"] = {}
				for a = 1, #directionArray do
					toolObject["properties"]["directions"][a] = directionArray[a]
				end
			elseif (buyButton.purchaseType == "autoFan")
			or (buyButton.purchaseType == "manualFan")
			or (buyButton.purchaseType == "spitter") then
				local directionArray = IAPShapesItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["directions"]
				toolObject["properties"]["directions"] = {}
				for a = 1, #directionArray do
					toolObject["properties"]["directions"][a] = directionArray[a]
				end
			elseif (buyButton.purchaseType == "clock")
			or (buyButton.purchaseType == "fireCape")
			or (buyButton.purchaseType == "characterSpecial")
			or (buyButton.purchaseType == "iceCape")
			or (buyButton.purchaseType == "bulletVest") then
				toolObject["properties"]["seconds"] = IAPToolsItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["seconds"]
			elseif (buyButton.purchaseType == "triangle")
			or (buyButton.purchaseType == "bar") then
				toolObject["properties"]["shape"] = IAPShapesItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["shape"]
				toolObject["properties"]["breakable"] = IAPShapesItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["breakable"]
			end

			if (buyButton.purchaseType == "bomb")
			or (buyButton.purchaseType == "hook")
			or (buyButton.purchaseType == "jet") then
				toolObject["properties"]["squares"] = IAPToolsItemArray[buyButton.purchaseType][buyButton.indexArray]["properties"]["squares"]
			end

			local haveEnoughCurrencyToBuy = checkIfEnoughCurrencyToBuy(buyButton.value, "coins", myGameSettingsScript)

			local doesToolExistResult = checkIfToolExists(toolObject, myRelItemScript)

			if (haveEnoughCurrencyToBuy == true) then
				local haveEnoughSpaceInBagToBuy
				if doesToolExistResult.bool == true then
					haveEnoughSpaceInBagToBuy = checkIfEnoughSpaceInBagToBuy(buyButton.qty, myRelItemArray[doesToolExistResult.index]["quantity"])
				else
					haveEnoughSpaceInBagToBuy = true
				end
				if haveEnoughSpaceInBagToBuy == false then
					showCantPurchaseScreen(IAPOverlay, levelVariables, "cantBuy_space")
				else
					levelVariables.addPurchasedToolToBag = function (event, screenViewName, mainFunc)
						if (doesToolExistResult.bool == true) then

							myRelItemArray[doesToolExistResult.index]["quantity"] = myRelItemArray[doesToolExistResult.index]["quantity"] + buyButton.qty

							saveTable(myRelItemArray, myRelItemScript)

							if screenViewName == "inGame" then
								if thisIsShapeScreen then
									mainFunc.thisLevelSettings.objectArray[doesToolExistResult.index]["quantity"] = mainFunc.thisLevelSettings.objectArray[doesToolExistResult.index]["quantity"] + buyButton.qty
									mainFunc.thisLevelSettings.originalObjectArray[doesToolExistResult.index]["quantity"] = mainFunc.thisLevelSettings.originalObjectArray[doesToolExistResult.index]["quantity"] + buyButton.qty
								else
									mainFunc.thisLevelSettings.toolArray[doesToolExistResult.index]["quantity"] = mainFunc.thisLevelSettings.toolArray[doesToolExistResult.index]["quantity"] + buyButton.qty
									mainFunc.thisLevelSettings.originalToolArray[doesToolExistResult.index]["quantity"] = mainFunc.thisLevelSettings.originalToolArray[doesToolExistResult.index]["quantity"] + buyButton.qty
								end
							end
						else

							toolObject["quantity"] = buyButton.qty

							toolObject["created"] = "not-created"

							local itemArrayCounter = 0
							for a = 1, #myRelItemArray do
								itemArrayCounter = itemArrayCounter + 1
							end

							myRelItemArray[itemArrayCounter + 1] = toolObject

							saveTable(myRelItemArray, myRelItemScript)

							myNewToolArray = loadTable(myRelItemScript)

							if screenViewName == "inGame" then
								if thisIsShapeScreen then
									local itemArrayCounter = 0
									for a = 1, #mainFunc.thisLevelSettings.objectArray do
										itemArrayCounter = itemArrayCounter + 1
									end
									mainFunc.thisLevelSettings.objectArray[itemArrayCounter + 1] = toolObject
									itemArrayCounter = 0
									for a = 1, #mainFunc.thisLevelSettings.originalObjectArray do
										itemArrayCounter = itemArrayCounter + 1
									end
									mainFunc.thisLevelSettings.originalObjectArray[itemArrayCounter + 1] = toolObject
								else
									local itemArrayCounter = 0
									for a = 1, #mainFunc.thisLevelSettings.toolArray do
										itemArrayCounter = itemArrayCounter + 1
									end
									mainFunc.thisLevelSettings.toolArray[itemArrayCounter + 1] = toolObject
									itemArrayCounter = 0
									for a = 1, #mainFunc.thisLevelSettings.originalToolArray do
										itemArrayCounter = itemArrayCounter + 1
									end
									mainFunc.thisLevelSettings.originalToolArray[itemArrayCounter + 1] = toolObject
								end

								if (mainFunc.allLevelSettings.itemBagIsOpen) then
									mainFunc.globalFunctions.createToolInnerScreen(mainFunc, mainFunc.ballBtnScreenCreate, mainFunc.allLevelSettings, mainFunc.buttonListenerScript, mainFunc.ballBtnScreenCreate.itemBagScreen.currentScreen, "inGame")
								end
							end

						end
						reduceCoinsInGameSettings(levelVariables, buyButton.value, myGameSettingsScript)

						levelVariables.IAPOverlay.currentToolScreen.youHaveDisplay = levelVariables.prepareCreateYouhaveDisplay(buyButton.purchaseType, myRelItemScript, 120, 48, levelVariables.IAPOverlay.currentToolScreen, "slow", levelVariables.IAPScreenObjectsGroup)
						timer.performWithDelay(1000, function () 
							recreateYouHaveDisplay(levelVariables.IAPOverlay.currentToolScreen, buyButton.purchaseType)
							--addBackScreenBuyButtonsListener(levelVariables.IAPOverlay.currentToolScreen)
						end)
					end

					--about to Purchase, create purchase screen
					IAPOverlay.purchaseScreens["canBuy"].icon = levelVariables.globalImageCreateFunctions.createItemDetailedIcon(thisIsShapeScreen, buyButton.purchaseType, "IAPPurchaseScreen", relItemArray, buyButton.indexArray, nil, nil)

					levelVariables.globalImageCreateFunctions.positionItemDetailedIcon(IAPOverlay.purchaseScreens["canBuy"].icon, xCalc(220), yCalc(110), thisIsShapeScreen, buyButton.purchaseType, "IAPPurchaseScreen", relItemArray, buyButton.indexArray, nil, nil)

					createCanBuyScreenCoinsAndIcon(buyButton.value, "item", "Coins")
					

					IAPOverlay.purchaseScreens["canBuy"].screen:toFront()
					transition.to(IAPOverlay.purchaseScreens["canBuy"].screen, {alpha = 1, time = 200, onComplete = function ()
						IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"].currentPurchaseScreenShowing = "canBuy"
						IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"].currentPurchaseScreenShowing = "canBuy"

						IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"]:toFront()
						transition.to(IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"], {alpha = 1, time = 200, onComplete = function () 
							IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"]:addEventListener("tap", levelVariables.closePurchaseScreen)
						end})
						IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"]:toFront()
						transition.to(IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"], {alpha = 1, time = 200, onComplete = function () 
							IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"]:addEventListener("tap", levelVariables.closePurchaseScreen)
						end})
					end})
				end
			else
				showCantPurchaseScreen(IAPOverlay, levelVariables, "cantBuy_coins")
			end
		else	
			-- it´s a shape
			local shapeObject = {}
		end
	end

end
	t.buyButtonPressedMain = buyButtonPressedMain

return t