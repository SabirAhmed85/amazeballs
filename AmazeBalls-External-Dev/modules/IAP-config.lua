local t = {}
local widget = require("widget")

local createIAPToolInnerScreen, showIAPToolInnerScreenFirst, showIAPToolInnerScreenSecond, toolScreenTabPressed, hideIAPToolInnerScreen, prepareCreateYouhaveDisplay, smallIconsImageSheet, smallIconsSequenceData

local IAPToolItemsScript = require("modules.IAP-tools-item-data")
local IAPToolsItemArray = IAPToolItemsScript.IAPToolItemsArray
t.IAPToolsItemArray = IAPToolsItemArray

local IAPShapeItemsScript = require("modules.IAP-shapes-item-data")
local IAPShapesItemArray = IAPShapeItemsScript.IAPShapeItemsArray
t.IAPShapesItemArray = IAPShapesItemArray

local GlobalImageCreateScript = require("modules.global-image-creation-functions")
t.GlobalImageCreateScript = GlobalImageCreateScript

local IAPFunctionsScript = require("modules.IAP-functions")
t.IAPFunctionsScript = IAPFunctionsScript

local Global = require("modules.global-button-functions")
local GWidthCalc = Global.widthCalc
local GHeightCalc = Global.heightCalc

local buyButtonPressedMain = IAPFunctionsScript.buyButtonPressedMain

local myToolArray = loadTable("myTotalToolArray.json")
local toolArrayScript = "myTotalToolArray.json"

local myGameSettings = loadTable("myGameSettings.json")

local toolScreenDetailsArray = {
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
	t.toolScreenToolArray = toolScreenToolArray

local shapeScreenDetailsArray = {
	triangle = {true},
	bar = {true},
	autoFan = {true},
	manualFan = {true},
	spitter = {true},
	simple = {true},
	backFire = {true}
}
	t.shapeScreenDetailsArray = shapeScreenDetailsArray

local toolScreenToolArray = {
	{"bomb", true},
	{"dummyBall", true},
	{"hook", true},
	{"superBall", true},
	{"jet", true},
	{"clock", true},
	{"fireCape", true},
	{"characterSpecial", true},
	{"iceCape", true},
	{"bulletVest", true}
}
	t.toolScreenToolArray = toolScreenToolArray

local shapeScreenShapeArray = {
	{"triangle", true},
	{"bar", true},
	{"autoFan", true},
	{"manualFan", true},
	{"simple", true},
	{"backFire", true},
	{"spitter", true}
}
	t.shapeScreenShapeArray = shapeScreenShapeArray

local coinScreenStickersArray = { 
	left = {20, 40, 60},
	right = {nil, 50, 70}
}
	t.coinScreenStickersArray = coinScreenStickersArray


local IAPToolsImageSheet = graphics.newImageSheet( "images/objects/items.png", {width = 60, height = 52, numFrames = 14, sheetContentWidth = 840, sheetContentHeight = 52})
local IAPToolsSequenceData = {
	    { name = "bomb", start=1, count=1,   loopCount=1 },
	    { name = "hook", start=2, count=1, loopCount=1 },
	    { name = "jet", start=3, count=1, loopCount=1 },
	    { name = "clock", start=4, count=1, loopCount=1 },
	    { name = "firstTime-clock", start=5, count=1, loopCount=1 },
	    { name = "dummyBall", start=6, count=1, loopCount=1 },
	    { name = "superBall", start=7, count=1, loopCount=1 },
	    { name = "fireCape", start=8, count=1, loopCount=1 },
	    { name = "iceCape", start=9, count=1, loopCount=1 },
	    { name = "bulletVest", start=10, count=1, loopCount=1 },
	    { name = "characterSpecial", start=11, count=1, loopCount=1 },
	    { name = "small-present", start=12, count=1, loopCount=1 },
	    { name = "mystery-block", start=13, count=1, loopCount=1 },
	    { name = "big-present", start=14, count=1, loopCount=1 }
	}

local IAPShapesImageSheet = graphics.newImageSheet( "images/central-images/Layout/itemBagScreen-shapesSprite.png", {width = 60, height = 52, numFrames = 7, sheetContentWidth = 420, sheetContentHeight = 52})
local IAPShapesSequenceData = {
    { name = "triangle", start=1, count=1,   loopCount=1 },
    { name = "bar", start=2, count=1, loopCount=1 },
    { name = "autoFan", start=3, count=1, loopCount=1 },
    { name = "manualFan", start=4, count=1, loopCount=1 },
    { name = "spitter", start=5, count=1, loopCount=1 },
    { name = "simple", start=6, count=1, loopCount=1 },
    { name = "backFire", start=7, count=1, loopCount=1 }
}

local toolTitleImageSheet = graphics.newImageSheet( "images/central-images/IAP/Tools/toolMainTitleSprite.png", {width = 110, height = 18, numFrames = 10, sheetContentWidth = 110, sheetContentHeight = 180})
local toolTitleSequenceData = {
    { name = "bomb", start=1, count=1,   loopCount=1 },
    { name = "dummyBall", start=2, count=1, loopCount=1 },
    { name = "hook", start=3, count=1, loopCount=1 },
    { name = "superBall", start=4, count=1, loopCount=1 },
    { name = "jet", start=5, count=1, loopCount=1 },
    { name = "clock", start=6, count=1, loopCount=1 },
    { name = "fireCape", start=7, count=1, loopCount=1 },
    { name = "characterSpecial", start=8, count=1, loopCount=1 },
    { name = "iceCape", start=9, count=1, loopCount=1 },
    { name = "bulletVest", start=10, count=1, loopCount=1 }
}

local shapeTitleImageSheet = graphics.newImageSheet( "images/central-images/IAP/Shapes/shapeMainTitleSprite.png", {width = 106, height = 18, numFrames = 7, sheetContentWidth = 106, sheetContentHeight = 126})
local shapeTitleSequenceData = {
    { name = "triangle", start=1, count=1,   loopCount=1 },
    { name = "bar", start=2, count=1, loopCount=1 },
    { name = "autoFan", start=3, count=1, loopCount=1 },
    { name = "manualFan", start=4, count=1, loopCount=1 },
    { name = "spitter", start=5, count=1, loopCount=1 },
    { name = "simple", start=6, count=1, loopCount=1 },
    { name = "backFire", start=7, count=1, loopCount=1 }
}

local toolTitlePrefixImageSheet = graphics.newImageSheet( "images/central-images/IAP/Tools/toolSizeTitleSprite.png", {width = 70, height = 18, numFrames = 5, sheetContentWidth = 70, sheetContentHeight = 90})
local toolTitlePrefixSequenceData = {
    { name = "small", start=1, count=1,   loopCount=1 },
    { name = "medium", start=2, count=1, loopCount=1 },
    { name = "big", start=3, count=1, loopCount=1 },
    { name = "mega", start=4, count=1, loopCount=1 },
    { name = "square", start=4, count=1, loopCount=1 }
}

local shapeTitlePrefixImageSheet = graphics.newImageSheet( "images/central-images/IAP/Shapes/shapeSizeTitleSprite.png", {width = 70, height = 18, numFrames = 13, sheetContentWidth = 102, sheetContentHeight = 234})
local shapeTitlePrefixSequenceData = {
    { name = "1way", start=1, count=1,   loopCount=1 },
    { name = "1way", start=2, count=1, loopCount=1 },
    { name = "3way", start=3, count=1, loopCount=1 },
    { name = "4way", start=4, count=1, loopCount=1 },
    { name = "up", start=5, count=1, loopCount=1 },
    { name = "down", start=6, count=1, loopCount=1 },
    { name = "left", start=7, count=1, loopCount=1 },
    { name = "right", start=8, count=1, loopCount=1 },
    { name = "topRight", start=9, count=1, loopCount=1 },
    { name = "bottomRight", start=10, count=1, loopCount=1 },
    { name = "bottomLeft", start=11, count=1, loopCount=1 },
    { name = "topLeft", start=12, count=1, loopCount=1 },
    { name = "s", start=13, count=1, loopCount=1 }
}

local toolTitlePrefixConfigurationArray = {
	time5 = {"small", 44},
	time6 = {"medium", 65},
	time7 = {"big", 25},
	time0 = {"mega", 48},
	squares1 = {"small", 44},
	squares2 = {"medium", 65},
	squares3 = {"big", 25},
	squares4 = {"mega", 48}
}

local shapeTitlePrefixConfigurationArray = {
	time5 = {"small", 44},
	time6 = {"medium", 65},
	time7 = {"big", 25},
	time0 = {"mega", 48},
	squares1 = {"small", 44},
	squares2 = {"medium", 65},
	squares3 = {"big", 25},
	squares4 = {"mega", 48}
}

local IAPWorldsImageSheet = graphics.newImageSheet( "images/central-images/IAP/Unlock/tile_Title.png", {width = 131, height = 26, numFrames = 4, sheetContentWidth = 131, sheetContentHeight = 104})
local IAPWorldsSequenceData = {
    { name = "FieryFortress", start=1, count=1,   loopCount=1 },
    { name = "BallTimore", start=2, count=1, loopCount=1 },
    { name = "HyrollCastle", start=3, count=1, loopCount=1 },
    { name = "IcyIsland", start=4, count=1, loopCount=1 }
}

local IAPCharactersImageSheet = graphics.newImageSheet( "images/central-images/IAP/Unlock/tile_Name.png", {width = 131, height = 26, numFrames = 3, sheetContentWidth = 131, sheetContentHeight = 78})
local IAPCharactersSequenceData = {
    { name = "PrincessBoulder", start=1, count=1,   loopCount=1 },
    { name = "PuckNorris", start=2, count=1, loopCount=1 },
    { name = "RockyBallboa", start=3, count=1, loopCount=1 }
}

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

local largePriceNumbersSequenceSheet = graphics.newImageSheet( "images/central-images/IAP/Central/smallNumbersSprite.png", {width = 14, height = 17, numFrames = 12, sheetContentWidth = 168, sheetContentHeight = 17})
local largePriceNumbersSequenceData = {
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

local itemCounterImageSheet = graphics.newImageSheet( "images/central-images/Layout/itemBagScreen-itemCounter.png", {width = 30, height = 27, numFrames = 10, sheetContentWidth = 300, sheetContentHeight = 27})
local itemCounterSequenceData = {
	    { name = "triangle", start=1, count=1,   loopCount=1 },
	    { name = "bar", start=2, count=1, loopCount=1 },
	    { name = "autoFan", start=3, count=1, loopCount=1 },
	    { name = "manualFan", start=4, count=1, loopCount=1 },
	    { name = "spitter", start=5, count=1, loopCount=1 },
	    { name = "simple", start=6, count=1, loopCount=1 },
	    { name = "backFire", start=7, count=1, loopCount=1 }
	}

smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
smallIconsSequenceData = {
    { name = "Lives", start=1, count=1,   loopCount=1 },
    { name = "Coins", start=3, count=1, loopCount=1 },
    { name = "question-mark", start=8, count=1, loopCount=1 }
}

local checkBuyButtonAlpha = function (availabilityBool)
	local intendedAlpha = 1
	if availabilityBool == false then
		intendedAlpha = 0.5
	end

	return intendedAlpha
end

local IAPStoreConfigurationArray = {
	Lives = {
		left = {
			yVal = 96,
			yIncrement = 71,
			totalTiles = 3,
			tileXVal = 25,
			tileLabelAndBgW = 263,
			tileLabelAndBgH = 62,
			tile1 = {
				tileLabelAndBg = "fullLives_bg.png",
				tilePrice = 4000,
				tilePrice2 = 9.99,
				tileAlias = "fullLives",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if thisMyGameSettings["total_lives"] < thisMyGameSettings["current_max_lives"] then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)
					thisMyGameSettings = nil

					return intendedAlpha
				end
			},
			tile2 = {
				tileLabelAndBg = "plusOneLife_bg.png",
				tilePrice = 1500,
				tileAlias = "plusOneLife",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if thisMyGameSettings["total_lives"] < thisMyGameSettings["current_max_lives"] then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)
					thisMyGameSettings = nil

					return intendedAlpha
				end
			},
			tile3 = {
				tileLabelAndBg = "increaseByOne_bg.png",
				tilePrice = 9.99,
				tileAlias = "maxLifeInc",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if thisMyGameSettings["current_max_lives"] < thisMyGameSettings["total_max_lives"] then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)
					thisMyGameSettings = nil

					return intendedAlpha
				end
			}
		},
		right = {
			yVal = 95,
			yIncrement = 0,
			totalTiles = 1,
			tileXVal = 295,
			tileLabelAndBgW = 152,
			tileLabelAndBgH = 206,
			defaultTile = {
				tileLabelAndBg = "rightHand_boxBackground.png"
			},
			tile1 = {
				tilePrice = 9.99,
				tilePrice2 = 9.99,
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if thisMyGameSettings["current_max_lives"] < thisMyGameSettings["total_max_lives"] then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)
					thisMyGameSettings = nil

					return intendedAlpha
				end,
				tileAvailabilityCheckFunction2 = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if thisMyGameSettings["current_max_lives"] < thisMyGameSettings["total_max_lives"] then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)
					thisMyGameSettings = nil

					return intendedAlpha
				end
			}
		}
	},
	Coins = {
		left = {
			yVal = 93,
			yIncrement = 69,
			totalTiles = 3,
			tileXVal = 25,
			tileLabelAndBgW = 208,
			tileLabelAndBgH = 70,
			defaultTile = {
				tileLabelAndBg = "tile.png",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if (999999 - thisMyGameSettings["total_coins"]) >= button.qty then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)

					return intendedAlpha
				end
			}, 
			tile1 = {
				tilePrice = 1.49,
				tileValue = 10000
			},
			tile2 = {
				tilePrice = 5.49,
				tileValue = 45000
			},
			tile3 = {
				tilePrice = 19.49,
				tileValue = 200000,
				specialOldPrice = 49
			}
		},

		right = {
			yVal = 93,
			yIncrement = 69,
			totalTiles = 3,
			tileXVal = 240,
			tileLabelAndBgW = 208,
			tileLabelAndBgH = 70,
			defaultTile = {
				tileLabelAndBg = "tile.png",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if (999999 - thisMyGameSettings["total_coins"]) >= button.qty then
						bool = true
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)

					return intendedAlpha
				end
			},
			tile1 = {
				tilePrice = 3.49,
				tileValue = 25000
			},
			tile2 = {
				tilePrice = 9.49,
				tileValue = 90000
			},
			tile3 = {
				tilePrice = 39.49,
				tileValue = 500000
			}
		}
	},
	Unlock = {
		left = {
			yVal = 4,
			yIncrement = 77,
			totalTiles = 4,
			tileXVal = 0,
			tileLabelAndBgW = 197,
			tileLabelAndBgH = 70,
			defaultTile = {
				tileLabelAndBg = "tile.png",
				tilePrice = 1.23,
				tileTitleImageSprite = "tile_Title.png",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")

					if (thisMyGameSettings["worldUnlocked"][button.qty]) == false then
						bool = true 
					end
					local intendedAlpha = checkBuyButtonAlpha(bool)

					return intendedAlpha
				end
			},
			tile1 = {
				titleName = "FieryFortress"
			},
			tile2 = {
				titleName = "HyrollCastle"
			},
			tile3 = {
				titleName = "IcyIsland"
			},
			tile4 = {
				titleName = "BallTimore"
			}
		},

		right = {
			yVal = 4,
			yIncrement = 77,
			totalTiles = 3,
			tileXVal = 0,
			tileLabelAndBgW = 197,
			tileLabelAndBgH = 70,
			defaultTile = {
				tileLabelAndBg = "tile.png",
				tilePrice = 222,
				tileTitleImageSprite = "tile_Name.png",
				tileAvailabilityCheckFunction = function (button)
					local bool = false
					local thisMyGameSettings = loadTable("myGameSettings.json")
					if (thisMyGameSettings["characterUnlocked"][button.qty]) == false then
						bool = true 
					end

					local intendedAlpha = checkBuyButtonAlpha(bool)

					return intendedAlpha
				end
			},
			tile1 = {
				titleName = "PuckNorris"
			},
			tile2 = {
				titleName = "PrincessBoulder"
			},
			tile3 = {
				titleName = "TheShuttleMickyTake"
			}
		}
	}

}
	t.IAPStoreConfigurationArray = IAPStoreConfigurationArray

local prepareObjectPosition, prepareObjectAndHide, prepareObjectFromSpriteAndHide, preparePriceDisplayAndHide, obj, arrayOfObj, createScreenTilePriceElement, buyButtonPressed

prepareObjectScaling = function (obj)
	obj.width = GWidthCalc(obj.contentWidth)
	obj.height = GHeightCalc(obj.contentHeight)
end

prepareObjectPosition = function (contentCenterVal, xValue, yValue, obj, displayGroup)
	obj.anchorX = contentCenterVal
	obj.anchorY = contentCenterVal
	obj.x = GWidthCalc(xValue)
	obj.y = GHeightCalc(yValue) - display.contentHeight
	prepareObjectScaling(obj)
	obj.originalY = GHeightCalc(yValue) - display.contentHeight

	displayGroup:insert(obj)
	obj:toFront()
end

prepareObjectAndHide = function (contentCenterVal, xValue, yValue, imgSrc, imgWidth, imgHeight, displayGroup)
	
	obj = display.newImageRect(imgSrc, imgWidth, imgHeight)
	obj.alpha = 0
	prepareObjectPosition(contentCenterVal, xValue, yValue, obj, displayGroup)

	return obj
end

prepareObjectAndShow = function (contentCenterVal, xValue, yValue, imgSrc, imgWidth, imgHeight, displayGroup)
	
	obj = display.newImageRect(imgSrc, imgWidth, imgHeight)
	prepareObjectPosition(contentCenterVal, xValue, yValue, obj, displayGroup)

	return obj
end

prepareObjectFromSpriteAndHide = function (contentCenterVal, xValue, yValue, sequenceSheet, sequenceData, sequence, objValue, displayGroup)
	obj = display.newSprite(sequenceSheet, sequenceData)
	obj.alpha = 0
	obj:play()
	obj:setSequence(sequence)

	if (objValue ~= nil) then
		obj.xScale = 0.5
		obj.yScale = 0.5
	end
	

	prepareObjectPosition(contentCenterVal, xValue, yValue, obj, displayGroup)
	
	if (objValue ~= nil) then
		obj.value = objValue
	end

	return obj
end

preparePriceDisplayAndHide = function (price, priceSize, xValue, yValue, float, displayGroup)

	arrayOfObj = {}

	local incrementVal, relevantImageSheet, relevantSequenceData, priceString
	if (priceSize == "small") then
		incrementVal = 9
		smallIncrementVal = 6
		relevantImageSheet = smallPriceNumbersSequenceSheet
		relevantSequenceData = smallPriceNumbersSequenceData
	else
		incrementVal = 11
		smallIncrementVal = 9
		relevantImageSheet = largePriceNumbersSequenceSheet
		relevantSequenceData = largePriceNumbersSequenceData
	end

	priceString = tostring( price )

	if ( string.find(priceString, ".", 1, true) ~= nil ) then
		priceStringAltered = string.sub(priceString, 1, #priceString - 2 )
		priceStringAlteredEnd = string.sub(priceString, #priceString - 1, #priceString)
	else
		priceStringAltered = priceString
	end

	local formattedPriceString = ""
	for a = 1, #priceStringAltered do
		if ( a ~= 1 and (a - 1) % 3 == 0 ) then
			formattedPriceString = formattedPriceString .. ","
		end 

		formattedPriceString = formattedPriceString .. string.sub(priceStringAltered, #priceStringAltered - (a - 1), #priceStringAltered - (a - 1))
	end

	if ( string.find(priceString, ".", 1, true) ~= nil ) then
		for a = 1, #priceStringAlteredEnd do
			formattedPriceString = string.sub(priceStringAlteredEnd, a, a) .. formattedPriceString
		end
	end


	for i = 1, #formattedPriceString do
		local nextRelevantSequence, relevantSequence
		if (float == "right") then
			relevantSequence = string.sub(formattedPriceString, i, i )
		else
			relevantSequence = string.sub(formattedPriceString, #formattedPriceString - (i - 1), #formattedPriceString - (i - 1) )
		end
		if (i ~= #formattedPriceString) then
			nextRelevantSequence = string.sub(formattedPriceString, i + 1, i + 1)
		end

		relevantYValue = yValue
		if relevantSequence == "," then
			relevantYValue = yValue + 3
		elseif relevantSequence == "." then
			relevantYValue = yValue
		end
		arrayOfObj[i] = prepareObjectFromSpriteAndHide(0, xValue, relevantYValue, relevantImageSheet, relevantSequenceData, relevantSequence, nil, displayGroup)

		
		local relIncrementVal
		if (i ~= 1) then
			if nextRelevantSequence == "," or nextRelevantSequence == "."
			or relevantSequence == "," or relevantSequence == "." then
				relIncrementVal = smallIncrementVal
			else
				relIncrementVal = incrementVal
			end
		else
			if (relevantSequence == "," or relevantSequence == ".") then
				relIncrementVal = smallIncrementVal
			else
				relIncrementVal = incrementVal
			end
		end

		if (float == "left") then
			xValue = xValue + relIncrementVal
		else
			xValue = xValue - relIncrementVal
		end
	end

	if ( string.find(priceStringAltered, ".") == true ) then
		formattedPriceString = formattedPriceString + priceStringAlteredEnd
	end

	return arrayOfObj
end


createScreenTilePriceElement = function (screenName, colSide, price, priceXVal, priceYVal, priceSize, buttonXVal, buttonYVal, buyButtonShape, scrollViewScreen, currency, qty, displayGroup)
	objArray = {}

	local buyButtonWidth, buyButtonHeight

	if (buyButtonShape == "wide") then
		--this is only on the right column
		buyButtonName = "buyNow_ButtonWide.png"
		buyButtonWidth = 95
		buyButtonHeight = 33
	else
		buyButtonName = "buyNow_Button.png"
		buyButtonWidth = 55
		buyButtonHeight = 32
	end


	objArray.priceDisplay = preparePriceDisplayAndHide(price, priceSize, priceXVal, priceYVal, "right", displayGroup)


	objArray.buyButton = prepareObjectAndHide(0, buttonXVal, buttonYVal, 
		"images/central-images/IAP/Central/" .. buyButtonName, buyButtonWidth, buyButtonHeight, displayGroup)
	objArray.buyButton.value = price
	objArray.buyButton.currency = currency
	objArray.buyButton.qty = qty
	objArray.buyButton.purchaseType = screenName

	--ALL SCREENS WHICH HAVE A SCROLL
	if (toolScreenDetailsArray[screenName])
	or (shapeScreenDetailsArray[screenName]) then
		scrollViewScreen.scrollView:insert(objArray.buyButton)
		for a = 1, #objArray.priceDisplay do
			scrollViewScreen.scrollView:insert(objArray.priceDisplay[a])
		end
	elseif (screenName == "Unlock") then
		local scrollViewNum = 1
		if colSide == "right" then
			scrollViewNum = 2
		end
		scrollViewScreen.scrollView[scrollViewNum]:insert(objArray.buyButton)
		for a = 1, #objArray.priceDisplay do
			scrollViewScreen.scrollView[scrollViewNum]:insert(objArray.priceDisplay[a])
		end
	end

	return objArray
end

createScreenTileTitleElementFromSprite = function (screenName, colSide, titleXVal, titleYVal, scrollViewScreen, sequence, size, displayGroup)

	local objArray = {}

	if screenName == "Unlock" then
		if colSide == "left" then
			objArray[1] = prepareObjectFromSpriteAndHide(0, titleXVal, titleYVal, IAPWorldsImageSheet, IAPWorldsSequenceData, sequence, nil, displayGroup)
			scrollViewScreen.scrollView[1]:insert(objArray[1])
		else
			objArray[1] = prepareObjectFromSpriteAndHide(0, titleXVal, titleYVal, IAPCharactersImageSheet, IAPCharactersSequenceData, sequence, nil, displayGroup)
			scrollViewScreen.scrollView[2]:insert(objArray[1])
		end
	elseif IAPToolsItemArray[screenName] or IAPShapesItemArray[screenName] then
		local relevantSizeMeasure, relTitlePrefixImageSheet, relTitlePrefixSequenceData

		if IAPToolsItemArray[screenName] then
			relTitlePrefixImageSheet = toolTitlePrefixImageSheet
			relTitlePrefixSequenceData = toolTitlePrefixSequenceData
			relTitleImageSheet = toolTitleImageSheet
			relTitleSequenceData = toolTitleSequenceData
		elseif IAPShapesItemArray[screenName] then
			relTitlePrefixImageSheet = shapeTitlePrefixImageSheet
			relTitlePrefixSequenceData = shapeTitlePrefixSequenceData
			relTitleImageSheet = shapeTitleImageSheet
			relTitleSequenceData = shapeTitleSequenceData
		end

		if screenName == "clock"
		or screenName == "fireCape"
		or screenName == "characterSpecial"
		or screenName == "iceCape"
		or screenName == "bulletVest" then
			relevantSizeMeasure = "time"
			objArray[1] = prepareObjectFromSpriteAndHide(0, titleXVal, titleYVal, relTitlePrefixImageSheet, relTitlePrefixSequenceData, toolTitlePrefixConfigurationArray[relevantSizeMeasure .. size][1], nil, displayGroup)
			objArray[2] = prepareObjectFromSpriteAndHide(0, titleXVal + toolTitlePrefixConfigurationArray[relevantSizeMeasure .. size][2], titleYVal, relTitleImageSheet, relTitleSequenceData, sequence, nil, displayGroup)
		elseif screenName == "bomb"
		or screenName == "hook"
		or screenName == "jet" then
			relevantSizeMeasure = "squares"
			objArray[1] = prepareObjectFromSpriteAndHide(0, titleXVal, titleYVal, relTitlePrefixImageSheet, relTitlePrefixSequenceData, toolTitlePrefixConfigurationArray[relevantSizeMeasure .. size][1], nil, displayGroup)
			objArray[2] = prepareObjectFromSpriteAndHide(0, titleXVal + toolTitlePrefixConfigurationArray[relevantSizeMeasure .. size][2], titleYVal, relTitleImageSheet, relTitleSequenceData, sequence, nil, displayGroup)
		else
			objArray[1] = prepareObjectFromSpriteAndHide(0, titleXVal, titleYVal, relTitleImageSheet, relTitleSequenceData, sequence, nil, displayGroup)
		end
		
		scrollViewScreen.scrollView:insert(objArray[1])
		if objArray[2] then
			scrollViewScreen.scrollView:insert(objArray[2])
		end
	end


	return objArray
end

createScreenTileIconElement = function (screenName, columnSide, contentCenterVal, xVal, yVal, imagSrc, width, height, group, finalXScale, finalYScale, rotation)
	obj = prepareObjectAndHide(contentCenterVal, xVal, yVal, imagSrc, width, height, group)
	obj.xScale = finalXScale
	obj.yScale = finalYScale
	obj.rotation = rotation
	if screenName == "Unlock" and columnSide == "left" then
		IAPOverlay.unlockScreen.scrollView[1]:insert(obj)
	end

	return obj
end

createItemTileTextObj = function (screenName, xVal, yVal, relScreen, itemArray, displayGroup)
	local objArray = {}

	local itemQty = 1
	if (itemArray["quantity"]) then
		itemQty = itemArray["quantity"]
	end

	objArray[1] = display.newText("Qty: ", xVal, yVal, native.systemFont, 13)
	objArray[1]:setTextColor(95/255, 95/255, 95/255)
	prepareObjectPosition(0, xVal, yVal, objArray[1], displayGroup)
	relScreen.scrollView:insert(objArray[1])

	objArray[2] = display.newText(itemQty, xVal, yVal, native.systemFontBold, 13)
	objArray[2]:setTextColor(134/255, 62/255, 126/255)
	prepareObjectPosition(0, xVal + 25, yVal, objArray[2], displayGroup)
	relScreen.scrollView:insert(objArray[2])

	if screenName == "clock"
	or screenName == "fireCape"
	or screenName == "characterSpecial"
	or screenName == "iceCape"
	or screenName == "bulletVest" then
		objArray[3] = display.newText("Time: ", xVal, yVal, native.systemFont, 13)
		objArray[3]:setTextColor(95/255, 95/255, 95/255)
		prepareObjectPosition(0, xVal + 45, yVal, objArray[3], displayGroup)
		relScreen.scrollView:insert(objArray[3])

		objArray[4] = display.newText(itemArray["properties"]["seconds"] .. " sec", xVal, yVal, native.systemFontBold, 13)
		objArray[4]:setTextColor(134/255, 62/255, 126/255)
		prepareObjectPosition(0, xVal + 81, yVal, objArray[4], displayGroup)
		relScreen.scrollView:insert(objArray[4])
	elseif screenName == "bomb"
	or screenName == "hook" then
		objArray[3] = display.newText("Square(s): ", xVal, yVal, native.systemFont, 13)
		objArray[3]:setTextColor(95/255, 95/255, 95/255)
		prepareObjectPosition(0, xVal + 45, yVal, objArray[3], displayGroup)
		relScreen.scrollView:insert(objArray[3])

		objArray[4] = display.newText(itemArray["properties"]["squares"], objArray[3].x + objArray[3].contentWidth, yVal, native.systemFontBold, 13)
		objArray[4]:setTextColor(134/255, 62/255, 126/255)
		prepareObjectPosition(0, xVal + 105, yVal, objArray[4], displayGroup)
		relScreen.scrollView:insert(objArray[4])

		objArray[5] = display.newText("Dir: ", xVal, yVal, native.systemFont, 13)
		objArray[5]:setTextColor(95/255, 95/255, 95/255)
		prepareObjectPosition(0, xVal + 125, yVal, objArray[5], displayGroup)
		relScreen.scrollView:insert(objArray[5])

		objArray[6] = display.newText("", xVal, yVal, native.systemFontBold, 13)
		objArray[6]:setTextColor(134/255, 62/255, 126/255)
		prepareObjectPosition(0, xVal + 147, yVal, objArray[6], displayGroup)
		relScreen.scrollView:insert(objArray[6])

        for a = 1, #itemArray["properties"]["directions"] do
        	local thisText = tostring(itemArray["properties"]["directions"][a])
        	thisText = string.sub(thisText, 1, 1)
        	thisText = string.upper(thisText)
        	objArray[6].text = objArray[6].text .. thisText

        	if a ~= #itemArray["properties"]["directions"] then
        		objArray[6].text = objArray[6].text .. " + "
        	end
        end

	elseif screenName == "jet" then
		objArray[3] = display.newText("Dir: ", xVal, yVal, native.systemFont, 13)
		objArray[3]:setTextColor(95/255, 95/255, 95/255)
		prepareObjectPosition(0, xVal + 45, yVal, objArray[3], displayGroup)
		relScreen.scrollView:insert(objArray[3])

		objArray[4] = display.newText("", xVal, yVal, native.systemFontBold, 13)
		objArray[4]:setTextColor(134/255, 62/255, 126/255)
		prepareObjectPosition(0, xVal + 67, yVal, objArray[4], displayGroup)
		relScreen.scrollView:insert(objArray[4])

        for a = 1, #itemArray["properties"]["directions"] do
        	local thisText = tostring(itemArray["properties"]["directions"][a])
        	thisText = string.sub(thisText, 1, 1)
        	thisText = string.upper(thisText)
        	objArray[4].text = objArray[4].text .. thisText

        	if a ~= #itemArray["properties"]["directions"] then
        		objArray[4].text = objArray[4].text .. " + "
        	end
        end
	end


	return objArray
end

createYouhaveDisplay = function (screen, relevantGameDataArrayPath, xValue, yValue, relScreen, speed, displayGroup)
	if (relScreen.youHaveDisplay and screen == "Lives") then
		for a = 1, #relScreen.youHaveDisplay do
			if speed == "fast" then
				removeObj(relScreen.youHaveDisplay[a])
			else
				removeObjSlow(relScreen.youHaveDisplay[a])
			end
		end
	elseif (relScreen.youHaveDisplay and screen == "Coins") then
		if speed == "fast" then
			removeObj(relScreen.youHaveDisplay.icon)
			if relScreen.youHaveDisplay.bg then
				removeObj(relScreen.youHaveDisplay.bg)
			end
		else
			removeObjSlow(relScreen.youHaveDisplay.icon)
			if relScreen.youHaveDisplay.bg then
				removeObjSlow(relScreen.youHaveDisplay.bg)
			end
		end
		
		for a = 1, #relScreen.youHaveDisplay.coins do
			if speed == "fast" then
				removeObj(relScreen.youHaveDisplay.coins[a])
			else
				removeObjSlow(relScreen.youHaveDisplay.coins[a])
			end
		end
	elseif (relScreen.youHaveDisplay and screen ~= "Coins" and screen ~= "Lives") then
		if speed == "fast" then
			for a = 1, #relScreen.youHaveDisplay.icons do
				for key, val in pairs(relScreen.youHaveDisplay.icons[a].displayObjects) do
					if key == "directionLabel" or key == "text" then
						for b = 1, #relScreen.youHaveDisplay.icons[a].displayObjects[key] do
							removeObj(relScreen.youHaveDisplay.icons[a].displayObjects[key][b])
						end
					else
						removeObj(relScreen.youHaveDisplay.icons[a].displayObjects[key])
					end
				end
				removeObj(relScreen.youHaveDisplay.icons[a])
			end
			removeObj(relScreen.youHaveDisplay.scrollView)
		else
			for a = 1, #relScreen.youHaveDisplay.icons do
				for key, val in pairs(relScreen.youHaveDisplay.icons[a].displayObjects) do
					if key == "directionLabel" or key == "text" then
						for b = 1, #relScreen.youHaveDisplay.icons[a].displayObjects[key] do
							removeObjSlow(relScreen.youHaveDisplay.icons[a].displayObjects[key][b])
						end
					else
						removeObjSlow(relScreen.youHaveDisplay.icons[a].displayObjects[key])
					end
				end
				removeObjSlow(relScreen.youHaveDisplay.icons[a])
			end
			removeObjSlow(relScreen.youHaveDisplay.scrollView)
		end
	end

	local moveObj = function (obj)
		obj.y = obj.y + display.contentHeight
	end
	local moveObjExtra = function (obj)
		obj.y = obj.y + GHeightCalc(40)
		obj.x = obj.x - GWidthCalc(65)
	end

	local objArray = {}
	relevantGameDataArray = loadTable(relevantGameDataArrayPath)
	if screen == "Lives" then
		local livesCounter = 0
		local xVal = xValue
		for a = 1, relevantGameDataArray["current_max_lives"] do
			objArray[a] = prepareObjectFromSpriteAndHide(0, xVal, yValue, smallIconsImageSheet, smallIconsSequenceData, screen, nil, displayGroup)
			if speed == "slow" then
				moveObj(objArray[a])
			end

			if a > relevantGameDataArray["total_lives"] then
				objArray[a].intendedAlpha = 0.5
			else
				objArray[a].intendedAlpha = 1
			end

			xVal = xVal + 35
		end
	elseif screen == "Coins" then
		objArray.icon = prepareObjectFromSpriteAndHide(0, xValue, yValue, smallIconsImageSheet, smallIconsSequenceData, screen, nil, displayGroup)
		if speed == "slow" then
			moveObj(objArray.icon)
		end

		local coins = relevantGameDataArray["total_coins"]
		local coinString = tostring(coins)

		objArray.coins = preparePriceDisplayAndHide(coinString, "large", xValue + 40, yValue + 7, "left", displayGroup)
		if speed == "slow" then
			for a = 1, #objArray.coins do
				moveObj(objArray.coins[a])
			end
		end
	else

		objArray.scrollViewPadding = 4
	    
	    objArray.scrollView = widget.newScrollView {
	        top = 0,
	        left = 0,
	        verticalScrollDisabled = true,
	        height = GHeightCalc(35),
	        width = GWidthCalc(291),
	        scrollWidth = GWidthCalc(291),
	        scrollHeight = GHeightCalc(35),
	        hideBackground = true,
	        hideScrollBar = true
	    }

	    --scrollView:setReferencePoint(display.TopLeftReferencePoint);
	    objArray.scrollView.alpha = 1
	    objArray.scrollView.anchorX = 0
	    objArray.scrollView.anchorY = 0
	    objArray.scrollView.x = GWidthCalc(130)
	    objArray.scrollView.y = GHeightCalc(78)
	    objArray.scrollView.originalY = 117 - display.contentHeight
	    displayGroup:insert(objArray.scrollView)
    	objArray.scrollView:toFront()

    	local relImageSheet = IAPToolsImageSheet
    	local relSequenceData = IAPToolsSequenceData
    	local thisIsShapeScreen  = false
    	
    	if IAPShapesItemArray[screen] then
    		relImageSheet = IAPShapesImageSheet
    		relSequenceData = IAPShapesSequenceData
    		thisIsShapeScreen = true
    	end

		local thisRelevantItemArray = loadTable(relevantGameDataArrayPath)
		local objArrayCounter = 1
		local xVal = xValue - 44
		yVal = yValue - 86
		if speed == "slow" then
			yVal = 5
			xVal = xVal - 72
		end

		objArray.icons = {}
		for a = 1, #thisRelevantItemArray do
			if thisRelevantItemArray[a]["name"] == screen then

				objArray.icons[objArrayCounter] = GlobalImageCreateScript.createItemDetailedIcon(thisIsShapeScreen, screen, "IAPYouHaveDisplay" .. speed, thisRelevantItemArray, a, nil, nil)
				
				local tool = objArray.icons[objArrayCounter]
	            displayGroup:insert(tool)
	            tool:toFront()
	            objArray.scrollView:insert(tool)

	            if tool.displayObjects["text"] then
	                for a = 1, #tool.displayObjects["text"] do
	                    displayGroup:insert(tool.displayObjects["text"][a])
	                    objArray.scrollView:insert(tool.displayObjects["text"][a])
	                    tool.displayObjects["text"][a]:toFront()
	                end
	            end

	            if tool.displayObjects["directionLabel"] then
	                for a = 1, #tool.displayObjects["directionLabel"] do
	                    displayGroup:insert(tool.displayObjects["directionLabel"][a])
	                    tool.displayObjects["directionLabel"][a]:toFront()
	                    objArray.scrollView:insert(tool.displayObjects["directionLabel"][a])
	                end
	            end

	            displayGroup:insert(tool.displayObjects["counterNumber"])
	            objArray.scrollView:insert(tool.displayObjects["counterNumber"])
	            tool.displayObjects["counterNumber"]:toFront()

	            GlobalImageCreateScript.positionItemDetailedIcon(tool, xVal + 10, yVal + 13, thisIsShapeScreen, screen, "IAPYouHaveDisplay" .. speed, thisRelevantItemArray, a, nil, nil) 

				xVal = xVal + 31
				objArrayCounter = objArrayCounter + 1
			end
		end

	end

	thisMyGameSettings = nil
	return objArray
end
	t.createYouhaveDisplay = createYouhaveDisplay

removeObj = function (obj)
	obj:removeSelf()
	obj = nil
end

removeObjSlow = function (obj)
	transition.to(obj, {alpha = 0, time = 200, onComplete = function ()
		removeObj(obj)
	end})
end

hideObj = function (obj, isClosing)
	if isClosing == true then
		transition.to(obj, {y = obj.originalY, time = 100, onComplete = function ()
			obj:toBack()
			obj.alpha = 0
		end})
	else
		obj:toBack()
		obj.alpha = 0
	end
	
	if isClosing ~= true then
		obj.y = obj.originalY
	end
end

showObj = function (obj, isFirstTime)
	if isFirstTime ~= true then
		obj.y = obj.originalY + display.contentHeight
	end
	obj:toFront()
	obj.alpha = 1

	if isFirstTime == true then
		transition.to(obj, {y = obj.originalY + display.contentHeight, time = 200})
	end
end

showObjSlow = function (obj)

	obj:toFront()
	transition.to(obj, {alpha = 1, time = 200})
end


local hideObjPriceElement = function (tile, levelVariables, isClosing)

	for a = 1, #tile.buyDisplay do
		for b = 1, #tile.buyDisplay[a].priceDisplay do
			hideObj(tile.buyDisplay[a].priceDisplay[b], isClosing)
		end

		hideObj(tile.buyDisplay[a].buyButton, isClosing)

		tile.buyDisplay[a].buyButton:removeEventListener("tap", levelVariables.buyButtonPressed)
	end

end

local showObjPriceElement = function (tile, levelVariables, isToolOrShape, isFirstTime)
	for a = 1, #tile.buyDisplay do
		for b = 1, #tile.buyDisplay[a].priceDisplay do
			showObj(tile.buyDisplay[a].priceDisplay[b], isFirstTime)
		end

		showObj(tile.buyDisplay[a].buyButton, isFirstTime)
		if isToolOrShape == true then
			tile.buyDisplay[a].buyButton:addEventListener("tap", levelVariables.buyButtonPressed)
		else
			levelVariables.checkAvailabilityOfBuyButtonToShow(tile.buyDisplay[a].buyButton, levelVariables)
		end
	end
end

createIAPToolInnerScreen = function (toolScreenShowing, levelVariables, IAPOverlay, isFirstTime)

	local createScreenScrollview = function (screen, levelVariables, isFirstTime)

		screen.topBorder = prepareObjectAndHide(0, 46, 112, "images/central-images/IAP/Shapes/tile-upper.png", 380, 6, levelVariables.IAPScreenObjectsGroup)
		local relevantGameDataArrayPath
		if IAPOverlay.currentIAPToolType == "tool" then
			relevantGameDataArrayPath = "myTotalToolArray.json"
		else
			relevantGameDataArrayPath = "myTotalObjectArray.json"
		end
		screen.youHaveLabel = prepareObjectAndHide(0, 55, 91, "images/central-images/IAP/Central/youHave.png", 82, 16, levelVariables.IAPScreenObjectsGroup)
		screen.youHaveLabel.xScale = 0.9
		screen.youHaveLabel.yScale = 0.9
		screen.youHaveDisplay = createYouhaveDisplay(toolScreenShowing, relevantGameDataArrayPath, 0, 0, screen, "fast", levelVariables.IAPScreenObjectsGroup)
		screen.topBorder:toFront()

		screen.scrollViewPadding = 4
	    
	    screen.scrollView = widget.newScrollView {
	        top = 0,
	        left = 0,
	        horizontalScrollDisabled = true,
	        height = 146,
	        width = GWidthCalc(381),
	        scrollWidth = display.contentWidth,
	        scrollHeight = scrollViewHeight,
	        hideBackground = true,
	        hideScrollBar = true
	    }

	    --scrollView:setReferencePoint(display.TopLeftReferencePoint);
	    screen.scrollView.alpha = 0
	    screen.scrollView.anchorX = 0
	    screen.scrollView.anchorY = 0
	    screen.scrollView.x = GWidthCalc(46)
	    screen.scrollView.y = yCalc(117) - display.contentHeight
	    screen.scrollView.originalY = yCalc(117) - display.contentHeight
	    levelVariables.IAPScreenObjectsGroup:insert(screen.scrollView)

		screen.tile = {}

		local yVal = - 5

		local relImageSheet, relSequenceData, thisIsShapeScreen
		if IAPOverlay.currentIAPToolType == "tool" then
			relItemArray = IAPToolsItemArray
			relImageSheet = IAPToolsImageSheet
			relSequenceData = IAPToolsSequenceData
			thisIsShapeScreen = false
		else
			relItemArray = IAPShapesItemArray
			relImageSheet = IAPShapesImageSheet
			relSequenceData = IAPShapesSequenceData
			thisIsShapeScreen = true
		end
		
		for i = 1, #relItemArray[toolScreenShowing] do
			if i == 1 then
				screen.tile[i] = prepareObjectAndHide(0, 0, yVal, "images/central-images/IAP/Shapes/tile.png", 380, 60, levelVariables.IAPScreenObjectsGroup)
			else
				screen.tile[i] = prepareObjectAndHide(0, 0, yVal, "images/central-images/IAP/Shapes/tile-lower.png", 380, 60, levelVariables.IAPScreenObjectsGroup)
			end

			screen.scrollView:insert(screen.tile[i])

			local imgYVal = yVal + 14

			if (toolScreenShowing == "triangle") then
				local thisTriangleShape = relItemArray[toolScreenShowing][i]["properties"]["shape"]
				local triangleRotationArray = {
					triangleTopLeftShape = {y = 36},
					triangleTopRightShape = {y = 0},
					triangleBottomRightShape = {y = -3},
					triangleBottomLeftShape = {y = 33}
				}
				imgYVal = imgYVal + triangleRotationArray[thisTriangleShape]["y"]
			elseif toolScreenShowing == "bar" then
				local barRotationArray = {
					vert = {y = 5},
					horz = {y = -6}
				}
				imgYVal = imgYVal + barRotationArray[relItemArray[toolScreenShowing][i]["properties"]["shape"]]["y"]
			end

			screen.tile[i].mainImg = GlobalImageCreateScript.createItemDetailedIcon(thisIsShapeScreen, toolScreenShowing, "IAPItemTile", relItemArray, i, nil, nil)
				
			local tool = screen.tile[i].mainImg
            tool:toFront()
            screen.scrollView:insert(tool)

            if tool.displayObjects["text"] then
                for a = 1, #tool.displayObjects["text"] do
                    screen.scrollView:insert(tool.displayObjects["text"][a])
                    tool.displayObjects["text"][a]:toFront()
                end
            end

            if tool.displayObjects["directionLabel"] then
                for a = 1, #tool.displayObjects["directionLabel"] do
                    tool.displayObjects["directionLabel"][a]:toFront()
                    screen.scrollView:insert(tool.displayObjects["directionLabel"][a])
                end
            end

            GlobalImageCreateScript.positionItemDetailedIcon(tool, 28, imgYVal + 15, thisIsShapeScreen, toolScreenShowing, "IAPItemTile", relItemArray, i, nil, nil) 

			screen.tile[i].buyDisplay = {}

			local itemQuantity, itemPrice, itemPriceCurrency, itemPrice2Currency
			if relItemArray[toolScreenShowing][i]["quantity"] then
				itemQuantity = relItemArray[toolScreenShowing][i]["quantity"]
			else
				itemQuantity = 1
			end

			itemPrice = relItemArray[toolScreenShowing][i]["itemPrice"]
			if relItemArray[toolScreenShowing][i]["itemPriceType"] then
				itemPriceCurrency = relItemArray[toolScreenShowing][i]["itemPriceType"]
			else
				itemPriceCurrency = "coins"
			end
			
			screen.tile[i].buyDisplay[1] = createScreenTilePriceElement(toolScreenShowing, "right", itemPrice, 352, yVal + 9, "small", 315, yVal + 25, "narrow", screen, itemPriceCurrency, itemQuantity, levelVariables.IAPScreenObjectsGroup)
			screen.tile[i].buyDisplay[1].buyButton.indexArray = i
			screen.tile[i].coinDisplay = prepareObjectFromSpriteAndHide(0, 310, yVal + 9, smallIconsImageSheet, smallIconsSequenceData, "Coins", screen, levelVariables.IAPScreenObjectsGroup)
			screen.tile[i].coinDisplay.xScale = 1
			screen.tile[i].coinDisplay.yScale = 1
			screen.scrollView:insert(screen.tile[i].coinDisplay)

			if relItemArray[toolScreenShowing][i]["itemPrice2"] then
				itemPrice2 = relItemArray[toolScreenShowing][i]["itemPrice2"]
				itemPrice2Currency = relItemArray[toolScreenShowing][i]["itemPriceType"]
				screen.tile[i].buyDisplay[2] = createScreenTilePriceElement(toolScreenShowing, "right", itemPrice2, 352, yVal + 9, "small", 275, yVal + 25, "narrow", screen, itemPrice2Currency, itemQuantity, levelVariables.IAPScreenObjectsGroup)
				screen.tile[i].buyDisplay[2].buyButton.indexArray = i
			end

			screen.tile[i].text = createItemTileTextObj(toolScreenShowing, 45, yVal + 32, screen, relItemArray[toolScreenShowing][i], levelVariables.IAPScreenObjectsGroup)

			--if IAPOverlay.currentIAPToolType == "tool" then
			local itemSize = 1
			if toolScreenShowing == "clock"
			or toolScreenShowing == "fireCape"
			or toolScreenShowing == "characterSpecial"
			or toolScreenShowing == "iceCape"
			or toolScreenShowing == "bulletVest" then
				if (relItemArray[toolScreenShowing][i]["properties"]["seconds"]) then
					itemSize = relItemArray[toolScreenShowing][i]["properties"]["seconds"]
				end
			elseif toolScreenShowing == "bomb"
			or toolScreenShowing == "jet"
			or toolScreenShowing == "hook" then
				if (relItemArray[toolScreenShowing][i]["properties"]["squares"]) then
					itemSize = relItemArray[toolScreenShowing][i]["properties"]["squares"]
				end
			end
			screen.tile[i].title = createScreenTileTitleElementFromSprite(toolScreenShowing, nil, 43, yVal + 10, screen, toolScreenShowing, itemSize, levelVariables.IAPScreenObjectsGroup)

			--end

			yVal = yVal + 52
		end
		showIAPToolInnerScreenSecond(toolScreenShowing, levelVariables, IAPOverlay, screen, isFirstTime)
	end


	if IAPOverlay.currentIAPToolType == "tool" then
		if IAPOverlay.toolScreen[toolScreenShowing] then

		else
			IAPOverlay.toolScreen[toolScreenShowing] = {}
		end

		createScreenScrollview(IAPOverlay.toolScreen[toolScreenShowing], levelVariables, isFirstTime)
	
		levelVariables.toolScreenOpened[toolScreenShowing] = true
	else
		if IAPOverlay.shapeScreen[toolScreenShowing] then

		else
			IAPOverlay.shapeScreen[toolScreenShowing] = {}
		end
		createScreenScrollview(IAPOverlay.shapeScreen[toolScreenShowing], levelVariables, isFirstTime)
	
		levelVariables.shapeScreenOpened[toolScreenShowing] = true
	end
end
	t.createIAPToolInnerScreen = createIAPToolInnerScreen

hideIAPToolInnerScreen = function (toolScreenShowing, IAPOverlay, relScreen, levelVariables, isClosing)
	local relScreen, relScreenOpened
	if IAPToolsItemArray[toolScreenShowing] then
		relScreenOpened = levelVariables.toolScreenOpened
		relScreen = IAPOverlay.toolScreen
	else
		relScreenOpened = levelVariables.shapeScreenOpened
		relScreen = IAPOverlay.shapeScreen
	end
	local hideToolScreenInnerScroll = function (screen, isClosing, arrayKey)

		if (isClosing == false) then
			if IAPOverlay.currentIAPToolType == "tool" then
				relItemArray = IAPToolsItemArray
			else
				relItemArray = IAPShapesItemArray
			end
		else
			if IAPToolsItemArray[arrayKey] then
				relItemArray = IAPToolsItemArray
			elseif IAPShapesItemArray[arrayKey] then
				relItemArray = IAPShapesItemArray
			end
		end

		if myGameSettings["itemDiscovered"][arrayKey] then
			hideObj(screen.scrollView, isClosing)
			hideObj(screen.topBorder, isClosing)
			for i = 1, #relItemArray[arrayKey] do
				hideObj(screen.tile[i], isClosing)
				for key, val in pairs(screen.tile[i].mainImg.displayObjects) do
					if key ~= "directionLabel" and key ~= "text" then
						showObj(screen.tile[i].mainImg.displayObjects[key], isFirstTime)
					else
						for a = 1, #screen.tile[i].mainImg.displayObjects[key] do
							showObj(screen.tile[i].mainImg.displayObjects[key][a], isFirstTime)
						end
					end
				end
				hideObj(screen.tile[i].mainImg, isClosing)
				hideObj(screen.tile[i].coinDisplay, isClosing)
				for a = 1, #screen.tile[i].text do
					hideObj(screen.tile[i].text[a], isClosing)
				end
				if IAPOverlay.currentIAPToolType == "tool" then
					for a = 1, #screen.tile[i].title do
						hideObj(screen.tile[i].title[a], isFirstTime)
					end
				end

				hideObjPriceElement(screen.tile[i], levelVariables, isClosing)
			end

			hideObj(screen.youHaveLabel, isClosing)
			hideObj(screen.youHaveDisplay.scrollView, isClosing)
			for a = 1, #screen.youHaveDisplay.icons do
				hideObj(screen.youHaveDisplay.icons[a], isClosing)
				for key, val in pairs(screen.youHaveDisplay.icons[a].displayObjects) do
					if key ~= "directionLabel" and key ~= "text" then
						hideObj(screen.youHaveDisplay.icons[a].displayObjects[key], isClosing)
					else
						for b = 1, #screen.youHaveDisplay.icons[a].displayObjects[key] do
							hideObj(screen.youHaveDisplay.icons[a].displayObjects[key][b], isClosing)
						end
					end
				end
			end
		end
	end

	if isClosing == false then
		hideToolScreenInnerScroll(relScreen[toolScreenShowing], isClosing, toolScreenShowing)
	else
		for key, val in pairs(relScreenOpened) do
			if relScreenOpened[key] == true then
				hideToolScreenInnerScroll(relScreen[key], isClosing, key)
			end
		end
	end

end
	t.hideIAPToolInnerScreen = hideIAPToolInnerScreen


showIAPToolInnerScreenSecond = function (toolScreenShowing, levelVariables, IAPOverlay, relScreen, isFirstTime)
	local relItemScript, relItemArray
	if IAPOverlay.currentIAPToolType == "tool" then
		relItemArray = IAPToolsItemArray
		relItemScript = "myTotalToolArray.json"
		relItemScreen = IAPOverlay.toolScreen
	else
		relItemArray = IAPShapesItemArray
		relItemScript = "myTotalObjectArray.json"
		relItemScreen = IAPOverlay.shapeScreen
	end

	local showToolScreenInnerScroll = function (screen,levelVariables, isFirstTime)
		for i = 1, #relItemArray[toolScreenShowing] do
			showObj(screen.tile[i], isFirstTime)
			showObj(screen.tile[i].mainImg, isFirstTime)
			if toolScreenShowing ~= "dummyBall"
			and toolScreenShowing ~= "superBall" then
				for key, val in pairs(screen.tile[i].mainImg.displayObjects) do
					if key ~= "directionLabel" and key ~= "text" then
						showObj(screen.tile[i].mainImg.displayObjects[key], isFirstTime)
					else
						for a = 1, #screen.tile[i].mainImg.displayObjects[key] do
							showObj(screen.tile[i].mainImg.displayObjects[key][a], isFirstTime)
						end
					end
				end
			end
			showObj(screen.tile[i].coinDisplay, isFirstTime)
			for a = 1, #screen.tile[i].text do
				showObj(screen.tile[i].text[a], isFirstTime)
			end

			for a = 1, #screen.tile[i].title do
				showObj(screen.tile[i].title[a], isFirstTime)
			end

			showObjPriceElement(screen.tile[i], levelVariables, true, isFirstTime)
		end
	end


	showObj(relScreen.scrollView, isFirstTime)
	showObj(relScreen.topBorder, isFirstTime)
	showObj(relScreen.youHaveLabel, isFirstTime)

	relScreen.youHaveDisplay = createYouhaveDisplay(toolScreenShowing, relItemScript, 51, 91, relItemScreen[toolScreenShowing], "fast", levelVariables.IAPScreenObjectsGroup)
	for a = 1, #relScreen.youHaveDisplay.icons do
		showObj(relScreen.youHaveDisplay.icons[a], isFirstTime)
		for key, val in pairs(relScreen.youHaveDisplay.icons[a].displayObjects) do
			if key ~= "directionLabel" and key ~= "text" then
				showObj(relScreen.youHaveDisplay.icons[a].displayObjects[key], isFirstTime)
			else
				for b = 1, #relScreen.youHaveDisplay.icons[a].displayObjects[key] do
					showObj(relScreen.youHaveDisplay.icons[a].displayObjects[key][b], isFirstTime)
				end
			end
		end
	end

	showToolScreenInnerScroll(relScreen, levelVariables, isFirstTime)
end
	t.showIAPToolInnerScreenFirst = showIAPToolInnerScreenSecond

toolScreenTabPressed = function (event, IAPOverlay, levelVariables)
	
	if (event.target.selected == false
	and event.target.active == true) then
		event.target.selected = true
		event.target.active = false

		if IAPOverlay.currentIAPToolType == "tool" then
			prevArray = toolScreenToolArray
			prevScreen = IAPOverlay.toolScreen
		else
			prevArray = shapeScreenShapeArray
			prevScreen = IAPOverlay.shapeScreen
		end

		for i = 1, #prevArray do
			if (prevArray[i][1] ~= event.target.value) then
				prevScreen.unselectedTile[i].image.selected = false
				prevScreen.unselectedTile[i].image.active = true
			end
		end

		hideIAPToolInnerScreen(IAPOverlay.currentIAPToolScreen, IAPOverlay, prevScreen[IAPOverlay.currentIAPToolScreen], levelVariables)
		
		IAPOverlay.currentIAPToolScreen = event.target.value
		local currentArray, currentScreen, currentScreenOpened
		if IAPOverlay.currentIAPToolType == "tool" then
			currentArray = toolScreenToolArray
			currentScreen = IAPOverlay.toolScreen
			currentScreenOpened = levelVariables.toolScreenOpened

			if event.target.tabIndex < 6 then
				currentScreen.selectedTile.rotation = 0
				currentScreen.selectedTile.x = event.target.x - GWidthCalc(39.5)
				if event.target.tabIndex == 1 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x - GWidthCalc(0.5)
				elseif event.target.tabIndex == 2 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(0.5)
				elseif event.target.tabIndex == 3 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(1)
				elseif event.target.tabIndex == 4 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(1.75)
				elseif event.target.tabIndex == 5 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(2.5)
				end
				currentScreen.selectedTile.y = event.target.y - GHeightCalc(18)
				currentScreen.selectedTile.originalY = event.target.y - GHeightCalc(18)
			else
				currentScreen.selectedTile.rotation = 180
				currentScreen.selectedTile.x = event.target.x + GWidthCalc(37.5) 
				if event.target.tabIndex == 6 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(1.75)
				elseif event.target.tabIndex == 7 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(2)
				elseif event.target.tabIndex == 8 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(3)
				elseif event.target.tabIndex == 9 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(3.75)
				elseif event.target.tabIndex == 10 then
					currentScreen.selectedTile.x = currentScreen.selectedTile.x + GWidthCalc(4.5)
				end
				currentScreen.selectedTile.y = event.target.y + GHeightCalc(19)
				currentScreen.selectedTile.originalY = event.target.y + GHeightCalc(19)
			end
			
		else
			currentArray = shapeScreenShapeArray
			currentScreen = IAPOverlay.shapeScreen
			currentScreenOpened = levelVariables.shapeScreenOpened

			if event.target.tabIndex < 5 then
				currentScreen.selectedTileTop.alpha = 1
				currentScreen.selectedTileBottom.alpha = 0
				currentScreen.selectedTileTop.rotation = 0
				currentScreen.selectedTileTop.x = event.target.x - GWidthCalc(48)

				currentScreen.selectedTileTop.y = event.target.y - GHeightCalc(18)
				currentScreen.selectedTileTop.originalY = event.target.y - GHeightCalc(18)
			else
				currentScreen.selectedTileTop.alpha = 0
				currentScreen.selectedTileBottom.alpha = 1
				--currentScreen.selectedTile.rotation = 185
				currentScreen.selectedTileBottom.x = event.target.x - GWidthCalc(65.5) 

				currentScreen.selectedTileBottom.y = event.target.y - GHeightCalc(16)
				currentScreen.selectedTileBottom.originalY = event.target.y - GHeightCalc(16)
			end
		end
		local toolScreenShowing = event.target.value

		if currentScreenOpened[toolScreenShowing] == false then
			createIAPToolInnerScreen(toolScreenShowing, levelVariables, IAPOverlay, false)
		else
			showIAPToolInnerScreenSecond(toolScreenShowing, levelVariables, IAPOverlay, currentScreen[IAPOverlay.currentIAPToolScreen], false)
		end
	end
end
	t.toolScreenTabPressed = toolScreenTabPressed

local createIAPInnerScreen = function (screenShowing, levelVariables, IAPOverlay)

	local createUnlockScreenScrollView = function ()
		local objArray = {}

		for a = 1, 2 do
			IAPOverlay.unlockScreen.scrollViewPadding = 4
	    
		    objArray[a] = widget.newScrollView {
		        top = 0,
		        left = 0,
		        horizontalScrollDisabled = true,
		        height = 205,
		        width = GWidthCalc(196),
		        scrollWidth = display.contentWidth,
		        scrollHeight = scrollViewHeight,
		        hideBackground = true,
	        	hideScrollBar = true
		    }

		    --scrollView:setReferencePoint(display.TopLeftReferencePoint);
		    objArray[a].alpha = 0
		    objArray[a].anchorX = 0
		    objArray[a].anchorY = 0
		    objArray[a].x = GWidthCalc(33) + ( (a - 1) * GWidthCalc(214) )
		    objArray[a].y = yCalc(89) - display.contentHeight
		    objArray[a].originalY = yCalc(89) - display.contentHeight
		end

		return objArray
	end

	local loopThroughAndCreateTiles = function (screenShowing, columnSide)
		

		tileArray = {}
		local relArray = IAPStoreConfigurationArray[screenShowing][columnSide]
		local yVal =  relArray["yVal"]
		local relPriceArray, defaultTileArray

		for i = 1, relArray["totalTiles"] do
			tileArray[i] = {}

			if (relArray["defaultTile"]) then
				tileImgArray = "defaultTile"
				defaultTileArray = "defaultTile"
				if (relArray["defaultTile"]["tilePrice"]) then
					relPriceArray = relArray["defaultTile"]
				else
					relPriceArray = relArray["tile" .. i]
				end
			else
				tileImgArray = "tile" .. i
				relPriceArray = relArray["tile" .. i]
			end

			tileArray[i].bg = prepareObjectAndHide(0, relArray["tileXVal"], yVal, 
					"images/central-images/IAP/" .. screenShowing .. "/" .. relArray[tileImgArray]["tileLabelAndBg"], relArray["tileLabelAndBgW"], relArray["tileLabelAndBgH"], levelVariables.IAPScreenObjectsGroup)
			

			tileArray[i].buyDisplay = {}

			if (screenShowing == "Lives" and columnSide == "left") then
				tileArray[i].buyDisplay[1] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice"], relArray["tileXVal"] + 194, yVal + 35, "small", relArray["tileXVal"] + 204, yVal + 27, "narrow", nil, "coins", 1, levelVariables.IAPScreenObjectsGroup)
				tileArray[i].buyDisplay[1].buyButton.alias = relPriceArray["tileAlias"]
				tileArray[i].buyDisplay[1].buyButton.availabilityCheckFunction = relPriceArray["tileAvailabilityCheckFunction"]
				if (i == 1) then
					tileArray[i].buyDisplay[2] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice2"], relArray["tileXVal"] + 79, yVal + 35, "small", relArray["tileXVal"] + 88, yVal + 27, "narrow", nil, "coins", 1, levelVariables.IAPScreenObjectsGroup)
					tileArray[i].buyDisplay[2].buyButton.alias = relPriceArray["tileAlias"]
					tileArray[i].buyDisplay[2].buyButton.availabilityCheckFunction = relPriceArray["tileAvailabilityCheckFunction"]
				end
			elseif (screenShowing == "Lives" and columnSide == "right") then
				if (i == 1) then
					tileArray[i].buyDisplay[1] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice"], relArray["tileXVal"] + 120, yVal + 54, "large", relArray["tileXVal"] + 28, yVal + 78, "wide", nil, "coins", 1, levelVariables.IAPScreenObjectsGroup)
					tileArray[i].buyDisplay[1].buyButton.availabilityCheckFunction = relPriceArray["tileAvailabilityCheckFunction"]

					tileArray[i].buyDisplay[2] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice2"], relArray["tileXVal"] + 120, yVal + 141, "large", relArray["tileXVal"] + 28, yVal + 166, "wide", nil, "coins", 1, levelVariables.IAPScreenObjectsGroup)
					tileArray[i].buyDisplay[2].buyButton.availabilityCheckFunction = relPriceArray["tileAvailabilityCheckFunction2"]
				end
			elseif (screenShowing == "Coins") then
				if relArray["tile" .. i]["specialOldPrice"] then
					tileArray[i].specialOldPrice = preparePriceDisplayAndHide(relPriceArray["specialOldPrice"], "small", relArray["tileXVal"] + 53, yVal + 40, "left", levelVariables.IAPScreenObjectsGroup)
					tileArray[i].specialLabel = prepareObjectAndHide(0, relArray["tileXVal"] + 40, yVal + 30, 
						"images/central-images/IAP/Coins/specialLabel.png", 32, 34, levelVariables.IAPScreenObjectsGroup)
					tileArray[i].specialRect = prepareObjectAndHide(0, relArray["tileXVal"] + 73, yVal + 31, 
						"images/central-images/IAP/Coins/specialTile.png", 132, 35, levelVariables.IAPScreenObjectsGroup)
				end
				if (columnSide == "right" and i == 1) then
				else
					tileArray[i].sticker = prepareObjectAndHide(0, relArray["tileXVal"] + 168, yVal - 3, "images/central-images/IAP/Central/sticker_" .. coinScreenStickersArray[columnSide][i] .. ".png", 34, 32, levelVariables.IAPScreenObjectsGroup)
				end
				tileArray[i].title = preparePriceDisplayAndHide(relPriceArray["tileValue"], "large", relArray["tileXVal"] + 43, yVal + 10, "left", levelVariables.IAPScreenObjectsGroup)
				tileArray[i].buyDisplay[1] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice"], relArray["tileXVal"] + 138, yVal + 40, "small", relArray["tileXVal"] + 150, yVal + 33, "narrow", nil, "coins", relPriceArray["tileValue"], levelVariables.IAPScreenObjectsGroup)
				tileArray[i].buyDisplay[1].buyButton.availabilityCheckFunction = relArray["defaultTile"]["tileAvailabilityCheckFunction"]
			elseif (screenShowing == "Unlock") then
				if (myGameSettings["worldUnlocked"][relArray["tile" .. i]["titleName"]]) 
				or (myGameSettings["characterUnlocked"][relArray["tile" .. i]["titleName"]])
				or (relArray["tile" .. (i-1)] and myGameSettings["characterUnlocked"][relArray["tile" .. (i-1)]["titleName"]])
				or (relArray["tile" .. (i-1)] and myGameSettings["worldUnlocked"][relArray["tile" .. (i-1)]["titleName"]]) then
					tileArray[i].buyDisplay[1] = createScreenTilePriceElement(screenShowing, columnSide, relPriceArray["tilePrice"], relArray["tileXVal"] + 123, yVal + 43, "small", relArray["tileXVal"] + 136, yVal + 33, "narrow", IAPOverlay.unlockScreen, "coins", relArray["tile" .. i]["titleName"], levelVariables.IAPScreenObjectsGroup)
					tileArray[i].buyDisplay[1].buyButton.availabilityCheckFunction = relArray["defaultTile"]["tileAvailabilityCheckFunction"]
					tileArray[i].title = createScreenTileTitleElementFromSprite(screenShowing, columnSide, relArray["tileXVal"] + 50, yVal + 6, IAPOverlay.unlockScreen, relArray["tile" .. i]["titleName"], nil, levelVariables.IAPScreenObjectsGroup)
					if (columnSide == "left") then
						tileArray[i].image = createScreenTileIconElement(screenShowing, columnSide, 0.5, relArray["tileXVal"] + 35, yVal + 33, "images/central-images/IAP/" .. screenShowing .. "/" .. relArray["tile" .. i]["titleName"] .. "-tile.png", 70, 60, levelVariables.IAPScreenObjectsGroup, 0.9, 1, -6)
					elseif (columnSide == "right") then
						tileArray[i].image = prepareObjectFromSpriteAndHide(0.5, relArray["tileXVal"] + 30, yVal + 33, levelVariables.allLevelSettings.charactersIconsImageSheet, levelVariables.allLevelSettings.charactersIconsSequenceData, relArray["tile" .. i]["titleName"], "Unlock", levelVariables.IAPScreenObjectsGroup)
						tileArray[i].image.xScale = 0.8
						tileArray[i].image.yScale = 0.8
					end
					tileArray[i].lockedDisplayApplies = false
				else
					tileArray[i].lockedDisplay = prepareObjectAndHide(0, relArray["tileXVal"], yVal, "images/central-images/IAP/Unlock/lockedTile.png", 195, 70, levelVariables.IAPScreenObjectsGroup)
					tileArray[i].lockedDisplayApplies = true
				end
			end

			if (screenShowing == "Unlock") then
				local scrollViewNum = 1
				if columnSide == "right" then
					scrollViewNum = 2
				end
				IAPOverlay.unlockScreen.scrollView[scrollViewNum]:insert(tileArray[i].bg)
				if tileArray[i].lockedDisplayApplies == true then
					IAPOverlay.unlockScreen.scrollView[scrollViewNum]:insert(tileArray[i].lockedDisplay)
				else
					if columnSide == "right" then
						IAPOverlay.unlockScreen.scrollView[scrollViewNum]:insert(tileArray[i].image)
					end
				end
			end

			yVal = yVal + IAPStoreConfigurationArray[screenShowing][columnSide]["yIncrement"]
		end

		return tileArray
	end

	if screenShowing == "Lives" then
		IAPOverlay.liveScreen = {}

		IAPOverlay.liveScreen.mainBg = prepareObjectAndHide(0.5, 240, 173, "images/central-images/IAP/" .. screenShowing .. "/mainBg.png", 469, 290, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.liveScreen.youHaveLabel_bg = prepareObjectAndHide(0, 25, 43, "images/central-images/IAP/Lives/youHave_bg.png", 428, 40, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.liveScreen.youHaveLabel = prepareObjectAndHide(0, 35, 56, "images/central-images/IAP/Central/youHave.png", 82, 16, levelVariables.IAPScreenObjectsGroup)


		---- DEALING WITH TILES

		IAPOverlay.liveScreen.leftTile = loopThroughAndCreateTiles(screenShowing, "left", levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.liveScreen.rightTile = loopThroughAndCreateTiles(screenShowing, "right", levelVariables.IAPScreenObjectsGroup)

			----

		levelVariables.LivesOpened = true
	elseif screenShowing == "Coins" then
		IAPOverlay.coinScreen = {}

		IAPOverlay.coinScreen.mainBg = prepareObjectAndHide(0.5, 240, 173, "images/central-images/IAP/" .. screenShowing .. "/mainBg.png", 469, 290, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.coinScreen.youHaveLabel_bg = prepareObjectAndHide(0, 25, 43, "images/central-images/IAP/Coins/youHave_bg.png", 428, 40, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.coinScreen.youHaveLabel = prepareObjectAndHide(0, 35, 56, "images/central-images/IAP/Central/youHave.png", 82, 16, levelVariables.IAPScreenObjectsGroup)


		---- DEALING WITH TILES

		IAPOverlay.coinScreen.leftTile = loopThroughAndCreateTiles(screenShowing, "left", levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.coinScreen.rightTile = loopThroughAndCreateTiles(screenShowing, "right", levelVariables.IAPScreenObjectsGroup)

			----

		levelVariables.CoinsOpened = true
	elseif screenShowing == "Tools" then
		IAPOverlay.toolScreen = {}

		IAPOverlay.toolScreen.mainBg = prepareObjectAndHide(0.5, 240, 173, "images/central-images/IAP/" .. screenShowing .. "/mainBg.png", 469, 290, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.toolScreen.innerBG = prepareObjectAndHide(0.5, (240) - 4, 170, "images/central-images/IAP/Shapes/innerBg.png", 390, 196, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.toolScreen.unselectedTile = {}
		local xVal = 41
		local yVal = yCalc(43)
		local neededXVal, neededYVal, neededSequence, neededSheet, neededSequenceData

		for i = 1, #toolScreenToolArray do
			IAPOverlay.toolScreen.unselectedTile[i] = prepareObjectAndHide(0, xVal, yVal, "images/central-images/IAP/Tools/innerTile_bg.png", 78, 34, levelVariables.IAPScreenObjectsGroup)
			if i > 5 then
				IAPOverlay.toolScreen.unselectedTile[i].rotation = 180
			end
			IAPOverlay.toolScreen.unselectedTile[i].x = GWidthCalc(xVal)
			IAPOverlay.toolScreen.unselectedTile[i].y = yVal - display.contentHeight
			IAPOverlay.toolScreen.unselectedTile[i].originalY = yVal - display.contentHeight

			if (i == 5) then
				--at point of creation the selected tile is  always the first one

				IAPOverlay.toolScreen.selectedTile = prepareObjectAndHide(0, xVal, yVal - 2, "images/central-images/IAP/Tools/innerTile_bgSelected.png", 78, 35, levelVariables.IAPScreenObjectsGroup)

			end
			if (i == 1) then
				neededXVal = xVal + 40
				neededYVal = yVal
			end
			if i > 5 then
				neededYVal = yVal - 17
			else
				neededYVal = yVal + 16
			end

			if myGameSettings["itemDiscovered"][toolScreenToolArray[i][1]] then
				neededSequence = toolScreenToolArray[i][1]
				neededSheet = IAPToolsImageSheet
				neededSequenceData = IAPToolsSequenceData
			else
				neededSequence = "question-mark"
				neededSheet = smallIconsImageSheet
				neededSequenceData = smallIconsSequenceData
			end

			IAPOverlay.toolScreen.unselectedTile[i].image = prepareObjectFromSpriteAndHide(0.5, neededXVal, neededYVal, neededSheet, neededSequenceData, neededSequence, toolScreenToolArray[i][1], levelVariables.IAPScreenObjectsGroup)
			IAPOverlay.toolScreen.unselectedTile[i].image.xScale = 1
			IAPOverlay.toolScreen.unselectedTile[i].image.yScale = 1
			if myGameSettings["itemDiscovered"][toolScreenToolArray[i][1]] == false then
				IAPOverlay.toolScreen.unselectedTile[i].image.xScale = 0.9
				IAPOverlay.toolScreen.unselectedTile[i].image.yScale = 0.9
			end
			if myGameSettings["itemDiscovered"][toolScreenToolArray[i][1]] then
				IAPOverlay.toolScreen.unselectedTile[i].image.onScreenFunction = function () IAPOverlay.toolScreen.unselectedTile[i].image:addEventListener("tap", function (event) toolScreenTabPressed(event, IAPOverlay, levelVariables) end) end
				IAPOverlay.toolScreen.unselectedTile[i].image.offScreenFunction = function () IAPOverlay.toolScreen.unselectedTile[i].image:removeEventListener("tap", function (event) toolScreenTabPressed(event, IAPOverlay, levelVariables) end) end
			else
				IAPOverlay.toolScreen.unselectedTile[i].image.onScreenFunction = function () end
				IAPOverlay.toolScreen.unselectedTile[i].image.offScreenFunction = function () end
			end
			IAPOverlay.toolScreen.unselectedTile[i].image.tabIndex = i

			xVal = xVal + 78.25
			neededXVal = neededXVal + 77.5
			if i == 5 then
				neededXVal = 80
				xVal = 119
				yVal = yCalc(297)
			end
		end

		levelVariables.ToolsOpened = true
	elseif screenShowing == "Shapes" then
		IAPOverlay.shapeScreen = {}

		IAPOverlay.shapeScreen.mainBg = prepareObjectAndHide(0.5, 240, 173, "images/central-images/IAP/" .. screenShowing .. "/mainBg.png", 469, 290, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.shapeScreen.innerBG = prepareObjectAndHide(0.5, (240) - 4, 170, "images/central-images/IAP/" .. screenShowing .. "/innerBg.png", 390, 196, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.shapeScreen.unselectedTile = {}
		local xVal = 43
		local yVal = yCalc(40)
		for i = 1, #shapeScreenShapeArray do
			if (i == 1) then
				--at point of creation the selected tile is  always the first one

				IAPOverlay.shapeScreen.selectedTileBottom = prepareObjectAndHide(0, xVal, yVal - 1, "images/central-images/IAP/Shapes/innerTile_bgSelectedBottom.png", 128, 35, levelVariables.IAPScreenObjectsGroup)
				IAPOverlay.shapeScreen.selectedTileTop = prepareObjectAndHide(0, xVal, yVal + 5, "images/central-images/IAP/Shapes/innerTile_bgSelectedTop.png", 94, 35, levelVariables.IAPScreenObjectsGroup)

			end

			local neededXVal, neededYVal, neededSequence, neededSheet, neededSequenceData
			if i < 5 then
				neededXVal = xVal + 48
				neededYVal = yVal + 3
				secondNeededYVal = 16
			else
				neededXVal = xVal + 66
				neededYVal = yVal - yCalc(4)
				secondNeededYVal = yCalc(15)
			end

			if myGameSettings["itemDiscovered"][shapeScreenShapeArray[i][1]] then
				neededSequence = shapeScreenShapeArray[i][1]
				neededSheet = IAPShapesImageSheet
				neededSequenceData = IAPShapesSequenceData
			else
				neededSequence = "question-mark"
				neededSheet = smallIconsImageSheet
				neededSequenceData = smallIconsSequenceData
				if i > 4 then
					neededYVal = neededYVal + 2
				end
			end

			if i < 5 then
				IAPOverlay.shapeScreen.unselectedTile[i] = prepareObjectAndHide(0, xVal, neededYVal, "images/central-images/IAP/Shapes/innerTile_bgTop.png", 94, 35, levelVariables.IAPScreenObjectsGroup)
			else
				IAPOverlay.shapeScreen.unselectedTile[i] = prepareObjectAndHide(0, xVal, neededYVal, "images/central-images/IAP/Shapes/innerTile_bgBottom.png", 128, 35, levelVariables.IAPScreenObjectsGroup)
			end
			IAPOverlay.shapeScreen.unselectedTile[i].x = xCalc(xVal)
			IAPOverlay.shapeScreen.unselectedTile[i].y = neededYVal - display.contentHeight
			IAPOverlay.shapeScreen.unselectedTile[i].originalY = neededYVal - display.contentHeight

			IAPOverlay.shapeScreen.unselectedTile[i].image = prepareObjectFromSpriteAndHide(0.5, neededXVal, neededYVal + secondNeededYVal, neededSheet, neededSequenceData, neededSequence, shapeScreenShapeArray[i][1], levelVariables.IAPScreenObjectsGroup)
			IAPOverlay.shapeScreen.unselectedTile[i].image.xScale = 1
			IAPOverlay.shapeScreen.unselectedTile[i].image.yScale = 1
			if myGameSettings["itemDiscovered"][shapeScreenShapeArray[i][1]] == false then
				IAPOverlay.shapeScreen.unselectedTile[i].image.xScale = 1.4
				IAPOverlay.shapeScreen.unselectedTile[i].image.yScale = 1.4
			end
			if myGameSettings["itemDiscovered"][shapeScreenShapeArray[i][1]] then
				IAPOverlay.shapeScreen.unselectedTile[i].image.onScreenFunction = function () IAPOverlay.shapeScreen.unselectedTile[i].image:addEventListener("tap", function (event) toolScreenTabPressed(event, IAPOverlay, levelVariables) end) end
				IAPOverlay.shapeScreen.unselectedTile[i].image.offScreenFunction = function () IAPOverlay.shapeScreen.unselectedTile[i].image:removeEventListener("tap", function (event) toolScreenTabPressed(event, IAPOverlay, levelVariables) end) end
			else
				IAPOverlay.shapeScreen.unselectedTile[i].image.onScreenFunction = function () end
				IAPOverlay.shapeScreen.unselectedTile[i].image.offScreenFunction = function () end
			end
			IAPOverlay.shapeScreen.unselectedTile[i].image.tabIndex = i

			if i < 5 then
				xVal = xVal + 98
				neededXVal = neededXVal + 97
			else
				xVal = xVal + 131.5
				neededXVal = neededXVal + 130.5
			end
			if i == 4 then
				neededXVal = 47
				xVal = 41
				yVal = yCalc(266)
			end
		end

		levelVariables.ShapesOpened = true
	elseif screenShowing == "Unlock" then
		IAPOverlay.unlockScreen = {}

		IAPOverlay.unlockScreen.mainBg = prepareObjectAndHide(0.5, 240, 173, "images/central-images/IAP/" .. screenShowing .. "/mainBg.png", 469, 290, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.unlockScreen.leftTileBG = prepareObjectAndHide(0, 27, 44, "images/central-images/IAP/" .. screenShowing .. "/worldsTile.png", 209, 258, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.unlockScreen.rightTileBG = prepareObjectAndHide(0, 241, 44, "images/central-images/IAP/" .. screenShowing .. "/charactersTile.png", 209, 258, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.unlockScreen.scrollView = createUnlockScreenScrollView()

		---- DEALING WITH TILES

		IAPOverlay.unlockScreen.leftTile = loopThroughAndCreateTiles(screenShowing, "left")
		IAPOverlay.unlockScreen.rightTile = loopThroughAndCreateTiles(screenShowing, "right")

			----

		levelVariables.UnlockOpened = true
	end
end

local showIAPInnerScreenFirst = function (screenShowing, levelVariables, IAPOverlay)
	if screenShowing == "Lives"
	and levelVariables.LivesOpened == false then
		createIAPInnerScreen("Lives", levelVariables, IAPOverlay)
	elseif screenShowing == "Coins"
	and levelVariables.CoinsOpened == false then
		createIAPInnerScreen("Coins", levelVariables, IAPOverlay)
	elseif screenShowing == "Tools"
	and levelVariables.ToolsOpened == false then
		createIAPInnerScreen("Tools", levelVariables, IAPOverlay)
	elseif screenShowing == "Shapes"
	and levelVariables.ShapesOpened == false then
		createIAPInnerScreen("Shapes", levelVariables, IAPOverlay)
	elseif screenShowing == "Unlock"
	and levelVariables.UnlockOpened == false then
		createIAPInnerScreen("Unlock", levelVariables, IAPOverlay)
	end
end
	t.showIAPInnerScreenFirst = showIAPInnerScreenFirst

local hideIAPInnerScreen = function (screenShowing, IAPOverlay, relevantTile, relevantUnselectedTile, levelVariables, isClosing)

	if isClosing == true then
		local transitionFunction = function (obj)
			transition.to(obj, {y = obj.originalY, time = 200})
		end
		transitionFunction(topTilesBG) 
		transitionFunction(IAPOverlay.blueBg)
		transitionFunction(IAPOverlay.closeButton) 
		transitionFunction(IAPOverlay.livesTileUnselected ) 
		transitionFunction(IAPOverlay.livesTileSelected ) 
		transitionFunction(IAPOverlay.coinsTileUnselected ) 
		transitionFunction(IAPOverlay.coinsTileSelected) 
		transitionFunction(IAPOverlay.toolsTileUnselected) 
		transitionFunction(IAPOverlay.toolsTileSelected) 
		transitionFunction(IAPOverlay.shapesTileUnselected)
		transitionFunction(IAPOverlay.shapesTileSelected) 
		transitionFunction(IAPOverlay.unlockTileUnselected) 
		transitionFunction(IAPOverlay.unlockTileSelected)

		hideObj(relBg, isClosing)

		hideObj(IAPOverlay.blueBg, isClosing)

	end

	local hideWholeTile = function (tile, isClosing)
		hideObj(tile.bg, isClosing)

		hideObjPriceElement(tile, levelVariables, isClosing)
	end

	local hideLivesScreen = function ()
		hideObj(IAPOverlay.liveScreen.mainBg, isClosing)
		hideObj(IAPOverlay.liveScreen.youHaveLabel_bg, isClosing)
		hideObj(IAPOverlay.liveScreen.youHaveLabel, isClosing)
		for a = 1, #IAPOverlay.liveScreen.youHaveDisplay do
			hideObj(IAPOverlay.liveScreen.youHaveDisplay[a], isClosing)
		end

		for i = 1, 3 do
			if (i == 1) then
				hideWholeTile(IAPOverlay.liveScreen.rightTile[i], levelVariables, isClosing)
			end

			hideWholeTile(IAPOverlay.liveScreen.leftTile[i], levelVariables, isClosing)
		end
	end

	local hideCoinsScreen = function ()
		hideObj(IAPOverlay.coinScreen.mainBg, isClosing)
		hideObj(IAPOverlay.coinScreen.youHaveLabel_bg, isClosing)
		hideObj(IAPOverlay.coinScreen.youHaveLabel, isClosing)
		hideObj(IAPOverlay.coinScreen.youHaveDisplay.icon, isClosing)
		for a = 1, #IAPOverlay.coinScreen.youHaveDisplay.coins do
			hideObj(IAPOverlay.coinScreen.youHaveDisplay.coins[a], isClosing)
		end

		for i = 1, 3 do
			hideWholeTile(IAPOverlay.coinScreen.leftTile[i], isClosing)
			for a = 1, #IAPOverlay.coinScreen.leftTile[i].title do
				hideObj(IAPOverlay.coinScreen.leftTile[i].title[a], isClosing)
			end
			if i == 3 then
				hideObj(IAPOverlay.coinScreen.leftTile[i].specialLabel, isClosing)
				hideObj(IAPOverlay.coinScreen.leftTile[i].specialRect, isClosing)
				for a = 1, #IAPOverlay.coinScreen.leftTile[i].specialOldPrice do
					hideObj(IAPOverlay.coinScreen.leftTile[i].specialOldPrice[a], isClosing)
				end
			end
			if i ~= 1 then
				hideObj(IAPOverlay.coinScreen.rightTile[i].sticker, isClosing)
			end
			hideObj(IAPOverlay.coinScreen.leftTile[i].sticker, isClosing)

			hideWholeTile(IAPOverlay.coinScreen.rightTile[i], isClosing)
			for a = 1, #IAPOverlay.coinScreen.rightTile[i].title do
				hideObj(IAPOverlay.coinScreen.rightTile[i].title[a], isClosing)
			end
		end
	end

	local hideToolsScreen = function ()
		hideObj(IAPOverlay.toolScreen.mainBg, isClosing)
		hideObj(IAPOverlay.toolScreen.innerBG, isClosing)
		hideObj(IAPOverlay.toolScreen.selectedTile, isClosing)
		for i = 1, #toolScreenToolArray do
			hideObj(IAPOverlay.toolScreen.unselectedTile[i], isClosing)
			hideObj(IAPOverlay.toolScreen.unselectedTile[i].image, isClosing)
			IAPOverlay.toolScreen.unselectedTile[i].image.active = false
		end

		hideIAPToolInnerScreen(IAPOverlay.currentIAPToolScreen, IAPOverlay, IAPOverlay.toolScreen[IAPOverlay.currentIAPToolScreen], levelVariables, isClosing)

		hideObj(IAPOverlay.toolScreen.innerBG, isClosing)
	end

	local hideShapesScreen = function ()
		hideObj(IAPOverlay.shapeScreen.mainBg, isClosing)
		hideObj(IAPOverlay.shapeScreen.innerBG, isClosing)

		hideObj(IAPOverlay.shapeScreen.selectedTileTop, isClosing)
		hideObj(IAPOverlay.shapeScreen.selectedTileBottom, isClosing)
		for i = 1, #shapeScreenShapeArray do
			hideObj(IAPOverlay.shapeScreen.unselectedTile[i], isClosing)
			hideObj(IAPOverlay.shapeScreen.unselectedTile[i].image, isClosing)
			IAPOverlay.shapeScreen.unselectedTile[i].image.active = false
		end

		hideIAPToolInnerScreen(IAPOverlay.currentIAPToolScreen, IAPOverlay, IAPOverlay.shapeScreen[IAPOverlay.currentIAPToolScreen], levelVariables, isClosing)

		hideObj(IAPOverlay.shapeScreen.innerBG, isClosing)
	end

	local hideUnlockScreen = function ()
		hideObj(IAPOverlay.unlockScreen.mainBg, isClosing)
		hideObj(IAPOverlay.unlockScreen.leftTileBG, isClosing)
		hideObj(IAPOverlay.unlockScreen.rightTileBG, isClosing)

		for i = 1, 3 do
			hideWholeTile(IAPOverlay.unlockScreen.leftTile[i], isClosing)
			if IAPOverlay.unlockScreen.leftTile[i].lockedDisplayApplies then
				hideObj(IAPOverlay.unlockScreen.leftTile[i].lockedDisplay, isClosing)
			else
				hideObj(IAPOverlay.unlockScreen.leftTile[i].image, isClosing)
				for a = 1, #IAPOverlay.unlockScreen.leftTile[i].title do
					hideObj(IAPOverlay.unlockScreen.leftTile[i].title[a], isClosing)
				end
			end

			if (i ~= 4) then
				hideWholeTile(IAPOverlay.unlockScreen.rightTile[i], isClosing)
				if IAPOverlay.unlockScreen.rightTile[i].lockedDisplayApplies then
					showObj(IAPOverlay.unlockScreen.rightTile[i].lockedDisplay, isClosing)
				else
					showObj(IAPOverlay.unlockScreen.rightTile[i].image, isClosing)
					for a = 1, #IAPOverlay.unlockScreen.rightTile[i].title do
						showObj(IAPOverlay.unlockScreen.rightTile[i].title[a], isClosing)
					end
				end
			end
		end

		hideObj(IAPOverlay.unlockScreen.scrollView[1], isClosing)
		hideObj(IAPOverlay.unlockScreen.scrollView[2], isClosing)
	end

	if isClosing == false then
		if (screenShowing == "Lives") then
			hideLivesScreen()
		elseif (screenShowing == "Coins") then
			hideCoinsScreen()
		elseif (screenShowing == "Tools") then
			hideToolsScreen()
		elseif (screenShowing == "Shapes") then
			hideShapesScreen()
		elseif (screenShowing == "Unlock") then
			hideUnlockScreen()
		end
	else
		if levelVariables.LivesOpened == true then
			hideLivesScreen()
		end
		if levelVariables.CoinsOpened == true then
			hideCoinsScreen()
		end
		if levelVariables.ToolsOpened == true then
			hideToolsScreen()
		end
		if levelVariables.ShapesOpened == true then
			hideShapesScreen()
		end
		if levelVariables.UnlockOpened == true then
			hideUnlockScreen()
		end

		transition.to(IAPOverlay, {alpha = 0, time = 100})
		timer.performWithDelay(400, function ()
			levelVariables.addBackEventListenersFromIAP()
			IAPOverlay:removeEventListener("tap", levelVariables.dummyListener)
			IAPOverlay:removeEventListener("touch", levelVariables.dummyListener)
		end)

		hideObj(IAPOverlay.youHaveDisplay.bg, isClosing)
		hideObj(IAPOverlay.youHaveDisplay.icon, isClosing)
		for a = 1, #IAPOverlay.youHaveDisplay.coins do
			hideObj(IAPOverlay.youHaveDisplay.coins[a], isClosing)
		end
	end

	relevantTile.alpha = 0
	relevantUnselectedTile.alpha = 1

end
	t.hideIAPInnerScreen = hideIAPInnerScreen

local showIAPInnerScreenSecond = function (screenShowing, IAPOverlay, levelVariables, relevantTile, isFirstTime)

	local showWholeTile = function (tile, isFirstTime)
		showObj(tile.bg, isFirstTime)

		showObjPriceElement(tile, levelVariables, nil, isFirstTime)
	end

	if screenShowing == "Lives" then
		relBg = IAPOverlay.liveScreen.mainBg
	elseif screenShowing == "Coins" then
		relBg = IAPOverlay.coinScreen.mainBg
	elseif screenShowing == "Tools" then
		relBg = IAPOverlay.toolScreen.mainBg
	elseif screenShowing == "Shapes" then
		relBg = IAPOverlay.shapeScreen.mainBg
	elseif screenShowing == "Unlock" then
		relBg = IAPOverlay.unlockScreen.mainBg
	end

	if isFirstTime == true then
		local transitionFunction = function (obj)
			transition.to(obj, {y = obj.originalY + display.contentHeight, time = 200})
		end
		transitionFunction(topTilesBG) 
		transitionFunction(IAPOverlay.blueBg)
		transitionFunction(IAPOverlay.closeButton) 
		transitionFunction(IAPOverlay.livesTileUnselected ) 
		transitionFunction(IAPOverlay.livesTileSelected ) 
		transitionFunction(IAPOverlay.coinsTileUnselected ) 
		transitionFunction(IAPOverlay.coinsTileSelected) 
		transitionFunction(IAPOverlay.toolsTileUnselected) 
		transitionFunction(IAPOverlay.toolsTileSelected) 
		transitionFunction(IAPOverlay.shapesTileUnselected)
		transitionFunction(IAPOverlay.shapesTileSelected) 
		transitionFunction(IAPOverlay.unlockTileUnselected) 
		transitionFunction(IAPOverlay.unlockTileSelected)
		for key, val in pairs(IAPOverlay.purchaseScreens) do
			for secondKey, secondVal in pairs (IAPOverlay.purchaseScreens[key].buttons) do
				transitionFunction(IAPOverlay.purchaseScreens[key].buttons[secondKey])
			end
			transitionFunction(IAPOverlay.purchaseScreens[key].screen)
		end
	end

	showObj(relBg, isFirstTime)
	showObj(IAPOverlay.blueBg, isFirstTime)


	if screenShowing == "Lives" then
		showObj(IAPOverlay.liveScreen.youHaveLabel_bg, isFirstTime)
		showObj(IAPOverlay.liveScreen.youHaveLabel, isFirstTime)

		IAPOverlay.liveScreen.youHaveDisplay = createYouhaveDisplay("Lives", "myGameSettings.json", 120, 48, IAPOverlay.liveScreen, "fast", levelVariables.IAPScreenObjectsGroup)
		for a = 1, #IAPOverlay.liveScreen.youHaveDisplay do
			showObj(IAPOverlay.liveScreen.youHaveDisplay[a], isFirstTime)
			IAPOverlay.liveScreen.youHaveDisplay[a].alpha = IAPOverlay.liveScreen.youHaveDisplay[a].intendedAlpha
		end

		for i = 1, 3 do
			if (i == 1) then
				showWholeTile(IAPOverlay.liveScreen.rightTile[i], isFirstTime)
			end

			showWholeTile(IAPOverlay.liveScreen.leftTile[i], isFirstTime)
		end

	elseif screenShowing == "Coins" then
		showObj(IAPOverlay.coinScreen.youHaveLabel_bg, isFirstTime)
		showObj(IAPOverlay.coinScreen.youHaveLabel, isFirstTime)

		IAPOverlay.coinScreen.youHaveDisplay = createYouhaveDisplay("Coins", "myGameSettings.json", 120, 48, IAPOverlay.coinScreen, "fast", levelVariables.IAPScreenObjectsGroup)
		showObj(IAPOverlay.coinScreen.youHaveDisplay.icon, isFirstTime)
		for a = 1, #IAPOverlay.coinScreen.youHaveDisplay.coins do
			showObj(IAPOverlay.coinScreen.youHaveDisplay.coins[a], isFirstTime)
		end

		for i = 1, 3 do
			showWholeTile(IAPOverlay.coinScreen.rightTile[i], isFirstTime)
			for a = 1, #IAPOverlay.coinScreen.rightTile[i].title do
				showObj(IAPOverlay.coinScreen.rightTile[i].title[a], isFirstTime)
			end

			if i == 3 then
				showObj(IAPOverlay.coinScreen.leftTile[i].specialRect, isFirstTime)
			end
			showWholeTile(IAPOverlay.coinScreen.leftTile[i], isFirstTime)

			if i == 3 then
				for a = 1, #IAPOverlay.coinScreen.leftTile[i].specialOldPrice do
					showObj(IAPOverlay.coinScreen.leftTile[i].specialOldPrice[a], isFirstTime)
				end
				showObj(IAPOverlay.coinScreen.leftTile[i].specialLabel, isFirstTime)
			end
			for a = 1, #IAPOverlay.coinScreen.leftTile[i].title do
				showObj(IAPOverlay.coinScreen.leftTile[i].title[a], isFirstTime)
			end
			if i ~= 1 then
				showObj(IAPOverlay.coinScreen.rightTile[i].sticker, isFirstTime)
			end
			showObj(IAPOverlay.coinScreen.leftTile[i].sticker, isFirstTime)
		end

	elseif screenShowing == "Tools" then
		--when you go to tool Screen, the clock is always the default showing

		IAPOverlay.currentIAPToolScreen = "clock"
		IAPOverlay.currentIAPToolType = "tool"

		for i = 1, #toolScreenToolArray do
			showObj(IAPOverlay.toolScreen.unselectedTile[i], isFirstTime)
		end
		showObj(IAPOverlay.toolScreen.innerBG, isFirstTime)

		IAPOverlay.toolScreen.selectedTile.x = GWidthCalc(119.5)
		IAPOverlay.toolScreen.selectedTile.y = yCalc(299) - display.contentHeight
		IAPOverlay.toolScreen.selectedTile.originalY = yCalc(299) - display.contentHeight
		IAPOverlay.toolScreen.selectedTile.rotation = 180
		showObj(IAPOverlay.toolScreen.selectedTile, isFirstTime)

		for i = 1, #toolScreenToolArray do
			showObj(IAPOverlay.toolScreen.unselectedTile[i].image, isFirstTime)

			if toolScreenToolArray[i][2] == true then
				IAPOverlay.toolScreen.unselectedTile[i].image.onScreenFunction()
			end
			if (toolScreenToolArray[i][2] == true and toolScreenToolArray[i][1] ~= IAPOverlay.currentIAPToolScreen) then
				IAPOverlay.toolScreen.unselectedTile[i].image.selected = false
				IAPOverlay.toolScreen.unselectedTile[i].image.active = true
			elseif (toolScreenToolArray[i][2] == true and toolScreenToolArray[i][1] == IAPOverlay.currentIAPToolScreen) then
				IAPOverlay.toolScreen.unselectedTile[i].image.selected = true
				IAPOverlay.toolScreen.unselectedTile[i].image.active = false
			end
		end

		if (levelVariables.toolScreenOpened) then
			if levelVariables.toolScreenOpened["clock"] == false then
				--this means the tools screen hasn´t been opened yet
				if myGameSettings["itemDiscovered"]["clock"] then
					createIAPToolInnerScreen("clock", levelVariables, IAPOverlay, isFirstTime)
				end
			else
				if myGameSettings["itemDiscovered"]["clock"] then
					showIAPToolInnerScreenSecond("clock", levelVariables, IAPOverlay, IAPOverlay.toolScreen[IAPOverlay.currentIAPToolScreen], isFirstTime)
				end
			end
		else	
			levelVariables.toolScreenOpened = {}
			for key, val in pairs(toolScreenDetailsArray) do
				levelVariables.toolScreenOpened[key] = false
			end

			if myGameSettings["itemDiscovered"]["clock"] then
				createIAPToolInnerScreen("clock", levelVariables, IAPOverlay, isFirstTime)
			end
		end

		
	elseif screenShowing == "Shapes" then
		IAPOverlay.currentIAPToolScreen = "triangle"
		IAPOverlay.currentIAPToolType = "shape"

		for i = 1, #shapeScreenShapeArray do
			showObj(IAPOverlay.shapeScreen.unselectedTile[i], isFirstTime)
		end
		showObj(IAPOverlay.shapeScreen.innerBG, isFirstTime)

		IAPOverlay.shapeScreen.selectedTileTop.x = GWidthCalc(43)
		IAPOverlay.shapeScreen.selectedTileTop.y = yCalc(41) - display.contentHeight
		IAPOverlay.shapeScreen.selectedTileTop.originalY = yCalc(41) - display.contentHeight
		showObj(IAPOverlay.shapeScreen.selectedTileTop, isFirstTime)
		IAPOverlay.shapeScreen.selectedTileBottom:toFront()

		for i = 1, #shapeScreenShapeArray do
			showObj(IAPOverlay.shapeScreen.unselectedTile[i].image, isFirstTime)

			if shapeScreenShapeArray[i][2] == true then
				IAPOverlay.shapeScreen.unselectedTile[i].image.onScreenFunction()
			end
			if (shapeScreenShapeArray[i][2] == true and shapeScreenShapeArray[i][1] ~= IAPOverlay.currentIAPToolScreen) then
				IAPOverlay.shapeScreen.unselectedTile[i].image.selected = false
				IAPOverlay.shapeScreen.unselectedTile[i].image.active = true
			elseif (shapeScreenShapeArray[i][2] == true and shapeScreenShapeArray[i][1] == IAPOverlay.currentIAPToolScreen) then
				IAPOverlay.shapeScreen.unselectedTile[i].image.selected = true
				IAPOverlay.shapeScreen.unselectedTile[i].image.active = false
			end
		end

		if (levelVariables.shapeScreenOpened) then
			if levelVariables.shapeScreenOpened["triangle"] == false then
				--this means the Shapes screen hasn´t been opened yet
				if myGameSettings["itemDiscovered"]["triangle"] then
					createIAPToolInnerScreen("triangle", levelVariables, IAPOverlay, isFirstTime)
				end
			else
				if myGameSettings["itemDiscovered"]["triangle"] then
					showIAPToolInnerScreenSecond("triangle", levelVariables, IAPOverlay, IAPOverlay.shapeScreen[IAPOverlay.currentIAPToolScreen], isFirstTime)
				end
			end
		else	
			levelVariables.shapeScreenOpened = {}
			for key, val in pairs(shapeScreenDetailsArray) do
				levelVariables.shapeScreenOpened[key] = false
			end

			if myGameSettings["itemDiscovered"]["triangle"] then
				createIAPToolInnerScreen("triangle", levelVariables, IAPOverlay, isFirstTime)
			end
		end

		
	elseif screenShowing == "Unlock" then

		showObj(IAPOverlay.unlockScreen.leftTileBG, isFirstTime)
		showObj(IAPOverlay.unlockScreen.rightTileBG, isFirstTime)
		
		for i = 1, 4 do
			showWholeTile(IAPOverlay.unlockScreen.leftTile[i], isFirstTime)
			if IAPOverlay.unlockScreen.leftTile[i].lockedDisplayApplies then
				showObj(IAPOverlay.unlockScreen.leftTile[i].lockedDisplay, isFirstTime)
			else
				showObj(IAPOverlay.unlockScreen.leftTile[i].image, isFirstTime)
				for a = 1, #IAPOverlay.unlockScreen.leftTile[i].title do
					showObj(IAPOverlay.unlockScreen.leftTile[i].title[a], isFirstTime)
				end
			end

			if (i ~= 4) then
				showWholeTile(IAPOverlay.unlockScreen.rightTile[i], isFirstTime)
				if IAPOverlay.unlockScreen.rightTile[i].lockedDisplayApplies then
					showObj(IAPOverlay.unlockScreen.rightTile[i].lockedDisplay, isFirstTime)
				else
					showObj(IAPOverlay.unlockScreen.rightTile[i].image, isFirstTime)
					for a = 1, #IAPOverlay.unlockScreen.rightTile[i].title do
						showObj(IAPOverlay.unlockScreen.rightTile[i].title[a], isFirstTime)
					end
				end
			end
		end

		showObj(IAPOverlay.unlockScreen.scrollView[1], isFirstTime)
		showObj(IAPOverlay.unlockScreen.scrollView[2], isFirstTime)
	end

	relevantTile:toFront()
	relevantTile.alpha = 1

	IAPOverlay.closeButton:toFront()
	IAPOverlay.youHaveDisplay.bg:toFront()
	IAPOverlay.youHaveDisplay.icon:toFront()
	for a = 1, #IAPOverlay.youHaveDisplay.coins do
		IAPOverlay.youHaveDisplay.coins[a]:toFront()
	end

	levelVariables.currentIAPScreen = screenShowing
end
	t.showIAPInnerScreenSecond = showIAPInnerScreenSecond

local IAPTabPressed = function (event, levelVariables, IAPOverlay)

	if (event.target.selected == false) then
		event.target.selected = true
		event.target:removeEventListener("tap", function (event) IAPTabPressed(event, levelVariables, IAPOverlay) end)
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
		hideIAPInnerScreen(levelVariables.currentIAPScreen, IAPOverlay, relevantTile, relevantUnselectedTile, levelVariables, false)

		showIAPInnerScreenFirst(event.target.value, levelVariables, IAPOverlay)

		if event.target.value == "Lives" then
			relevantTile = IAPOverlay.livesTileSelected
		elseif event.target.value == "Coins" then
			relevantTile = IAPOverlay.coinsTileSelected

		elseif event.target.value == "Tools" then
			relevantTile = IAPOverlay.toolsTileSelected

		elseif event.target.value == "Shapes" then
			relevantTile = IAPOverlay.shapesTileSelected

		elseif event.target.value == "Unlock" then
			relevantTile = IAPOverlay.unlockTileSelected

		end

		showIAPInnerScreenSecond(event.target.value, IAPOverlay, levelVariables, relevantTile, false)
	end
end
	t.IAPTabPressed = IAPTabPressed

local openIAPScreen = function (state, levelVariables, relevantScreenOpened)
	local mainBg, imagePrefix
	if levelVariables.IAPOpened == false then
		IAPOverlay = display.newRect(display.contentWidth / 2, display.contentHeight / 2, display.contentWidth, display.contentHeight)
		levelVariables.IAPOverlay = IAPOverlay
		IAPOverlay:setFillColor(0, 0, 0)
		IAPOverlay.alpha = 0
		IAPOverlay.anchorX = 0.5
		IAPOverlay.anchorY = 0.5
		levelVariables.IAPScreenObjectsGroup:insert(IAPOverlay)
		IAPOverlay:toFront()
	end

	IAPOverlay:addEventListener("tap", levelVariables.dummyListener)
	IAPOverlay:addEventListener("touch", levelVariables.dummyListener)
    transition.to(IAPOverlay, {alpha = 0.4, time = 200})

	if levelVariables.IAPOpened == false then
	    IAPOverlay.youHaveDisplay = createYouhaveDisplay("Coins", "myGameSettings.json", 360, display.contentHeight - 28, IAPOverlay, "fast", levelVariables.IAPScreenObjectsGroup)
	    IAPOverlay.youHaveDisplay.icon.xScale = 0.65
	    IAPOverlay.youHaveDisplay.icon.yScale = 0.65
	    IAPOverlay.youHaveDisplay.icon.x = IAPOverlay.youHaveDisplay.icon.x + xCalc(10)

	    IAPOverlay.youHaveDisplay.bg = display.newImageRect("images/central-images/IAP/Central/mainCoinsDisplay.png", 141, 28)
		IAPOverlay.youHaveDisplay.bg.alpha = 0
		IAPOverlay.youHaveDisplay.bg.anchorX = 0
		IAPOverlay.youHaveDisplay.bg.anchorY = 1
		IAPOverlay.youHaveDisplay.bg.x = xCalc(365)
		IAPOverlay.youHaveDisplay.bg.y = display.contentHeight
		IAPOverlay.youHaveDisplay.bg.originalY = display.contentHeight - display.contentHeight
		levelVariables.IAPScreenObjectsGroup:insert(IAPOverlay.youHaveDisplay.bg)
		IAPOverlay.youHaveDisplay.bg:toFront()
	    IAPOverlay.youHaveDisplay.icon:toFront()
	end


    if state == "Lives" then
    	imagePrefix = "Lives"
    elseif state == "Coins" then
    	imagePrefix = "Coins"
    elseif state == "Tools" then
    	imagePrefix = "Tools"
    elseif state == "Shapes" then
    	imagePrefix = "Shapes"
    elseif state == "Unlock" then
    	imagePrefix = "Unlock"
    end

	levelVariables.currentIAPScreen = state

	if state == "Lives" then
		levelVariables.currentIAPScreen = "Lives"
    	showIAPInnerScreenFirst("Lives", levelVariables, IAPOverlay)
    elseif state == "Coins" then
    	showIAPInnerScreenFirst("Coins", levelVariables, IAPOverlay)
    elseif state == "Tools" then
    	showIAPInnerScreenFirst("Tools", levelVariables, IAPOverlay)
    elseif state == "Shapes" then
    	showIAPInnerScreenFirst("Shapes", levelVariables, IAPOverlay)
    elseif state == "Unlock" then
    	showIAPInnerScreenFirst("Unlock", levelVariables, IAPOverlay)
    end

    if levelVariables.IAPOpened == false then
    	topTilesBG = prepareObjectAndShow(0.5, 240, 15 , "images/central-images/IAP/Central/topTiles_bg.png", 439, 29, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.blueBg = prepareObjectAndShow(0.5, 240, 160 + 12, "images/central-images/IAP/Central/blueBG.png", 443, 274, levelVariables.IAPScreenObjectsGroup)

		IAPOverlay.closeButton = prepareObjectAndShow(0.5, 480 - 25.5, 63, "images/central-images/IAP/Central/closeButton.png", 32, 37, levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.closeButton.onScreenFunction = function () IAPOverlay.closeButton:addEventListener("tap", levelVariables.closeIAP) end
		IAPOverlay.closeButton.offScreenFunction = function () IAPOverlay.closeButton:removeEventListener("tap", levelVariables.closeIAP) end
		IAPOverlay.closeButton.onScreenFunction()

		IAPOverlay.purchaseScreens = {}

		IAPOverlay.purchaseScreens["cantBuy_coins"] = {}
		IAPOverlay.purchaseScreens["cantBuy_coins"].screen = prepareObjectAndHide(0.5, 240, 160, "images/central-images/IAP/Central/confirmPurchase_CantBuyScreen_coins.png", 300, 225, levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.purchaseScreens["cantBuy_coins"].buttons = {}
		IAPOverlay.purchaseScreens["cantBuy_coins"].buttons["closeButton"] = prepareObjectAndHide(0.5, 283, 220, "images/central-images/IAP/Central/confirmPurchase_OkButton.png", 111, 50, levelVariables.IAPScreenObjectsGroup)
		
		IAPOverlay.purchaseScreens["cantBuy_space"] = {}
		IAPOverlay.purchaseScreens["cantBuy_space"].screen = prepareObjectAndHide(0.5, 240, 160, "images/central-images/IAP/Central/confirmPurchase_CantBuyScreen_space.png", 300, 225, levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.purchaseScreens["cantBuy_space"].buttons = {}
		IAPOverlay.purchaseScreens["cantBuy_space"].buttons["closeButton"] = prepareObjectAndHide(0.5, 283, 220, "images/central-images/IAP/Central/confirmPurchase_OkButton.png", 111, 50, levelVariables.IAPScreenObjectsGroup)
		
		IAPOverlay.purchaseScreens["canBuy"] = {}
		IAPOverlay.purchaseScreens["canBuy"].screen = prepareObjectAndHide(0.5, 240, 160, "images/central-images/IAP/Central/confirmPurchase_Screen.png", 300, 225, levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.purchaseScreens["canBuy"].buttons = {}
		IAPOverlay.purchaseScreens["canBuy"].buttons["yesButton"] = prepareObjectAndHide(0.5, 283, 220, "images/central-images/IAP/Central/confirmPurchase_YesButton.png", 111, 50, levelVariables.IAPScreenObjectsGroup)
		IAPOverlay.purchaseScreens["canBuy"].buttons["noButton"] = prepareObjectAndHide(0.5, 167, 221, "images/central-images/IAP/Central/confirmPurchase_NoButton.png", 88, 50, levelVariables.IAPScreenObjectsGroup)

		-- Tiles

		local lowerTileY = 23
		local higherTileY = 18

		local prepareUnselectedTile = function (screenName, xVal)
			local obj

			obj = prepareObjectAndShow(0.5, xVal, higherTileY, "images/central-images/IAP/" .. screenName .. "/titleTile_unselected.png", 83, 23, levelVariables.IAPScreenObjectsGroup)
			obj.value = screenName
			obj.onScreenFunction = function () obj:addEventListener("tap", function (event) IAPTabPressed(event, levelVariables, IAPOverlay) end) end
			obj.offScreenFunction = function () obj:removeEventListener("tap", function (event) IAPTabPressed(event, levelVariables, IAPOverlay) end) end
			obj.onScreenFunction()

			if state ~= screenName then
				obj.selected = false
			else
				obj.alpha = 0
				obj.selected = true
			end

			return obj
		end

		IAPOverlay.livesTileUnselected = prepareUnselectedTile("Lives", 65)

		IAPOverlay.livesTileSelected = prepareObjectAndShow(0.5, 65, lowerTileY, "images/central-images/IAP/Lives/titleTile_selected.png", 85, 34, levelVariables.IAPScreenObjectsGroup)

		if state ~= "Lives" then
			IAPOverlay.livesTileSelected.alpha = 0
		end

		IAPOverlay.coinsTileUnselected = prepareUnselectedTile("Coins", 152)

		IAPOverlay.coinsTileSelected = prepareObjectAndShow(0.5, 152, lowerTileY, "images/central-images/IAP/Coins/titleTile_selected.png", 85, 34, levelVariables.IAPScreenObjectsGroup)

		if state ~= "Coins" then
			IAPOverlay.coinsTileSelected.alpha = 0
		end

		IAPOverlay.toolsTileUnselected = prepareUnselectedTile("Tools", 239)

		IAPOverlay.toolsTileSelected = prepareObjectAndShow(0.5, 239, lowerTileY, "images/central-images/IAP/Tools/titleTile_selected.png", 85, 34, levelVariables.IAPScreenObjectsGroup)

		if state ~= "Tools" then
			IAPOverlay.toolsTileSelected.alpha = 0
		end

		IAPOverlay.shapesTileUnselected = prepareUnselectedTile("Shapes", 326)

		IAPOverlay.shapesTileSelected = prepareObjectAndShow(0.5, 326, lowerTileY, "images/central-images/IAP/Shapes/titleTile_selected.png", 85, 34, levelVariables.IAPScreenObjectsGroup)

		if state ~= "Shapes" then
			IAPOverlay.shapesTileSelected.alpha = 0
		end

		IAPOverlay.unlockTileUnselected = prepareUnselectedTile("Unlock", 413)

		IAPOverlay.unlockTileSelected = prepareObjectAndShow(0.5, 413, lowerTileY, "images/central-images/IAP/Unlock/titleTile_selected.png", 85, 34, levelVariables.IAPScreenObjectsGroup)

		if state ~= "Unlock" then
			IAPOverlay.unlockTileSelected.alpha = 0
		end
	end

	if state == "Lives" then
    	showIAPInnerScreenSecond("Lives", IAPOverlay, levelVariables, IAPOverlay.livesTileSelected, true)
    elseif state == "Coins" then
    	showIAPInnerScreenSecond("Coins", IAPOverlay, levelVariables, IAPOverlay.coinsTileSelected, true)
    elseif state == "Tools" then
    	showIAPInnerScreenSecond("Tools", IAPOverlay, levelVariables, IAPOverlay.toolsTileSelected, true)
    elseif state == "Shapes" then
    	showIAPInnerScreenSecond("Shapes", IAPOverlay, levelVariables, IAPOverlay.shapesTileSelected, true)
    elseif state == "Unlock" then
    	showIAPInnerScreenSecond("Unlock", IAPOverlay, levelVariables, IAPOverlay.unlockTileSelected, true)
    end


	showObj(IAPOverlay.youHaveDisplay.bg, isFirstTime)
	showObj(IAPOverlay.youHaveDisplay.icon, isFirstTime)
    IAPOverlay.youHaveDisplay.icon.y = IAPOverlay.youHaveDisplay.icon.y + yCalc(5)
	for a = 1, #IAPOverlay.youHaveDisplay.coins do
		showObj(IAPOverlay.youHaveDisplay.coins[a], isFirstTime)
	end

	if levelVariables.IAPOpened == false then
		levelVariables.IAPOpened = true
	end
    
end
	t.openIAPScreen = openIAPScreen

return t