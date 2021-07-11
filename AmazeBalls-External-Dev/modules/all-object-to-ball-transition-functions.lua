local gemCounter_FirstDigit = require("modules.ball-button-screen-create.gem-counter.gem-counter-first-digit");
local gemCounter_SecondDigit = require("modules.ball-button-screen-create.gem-counter.gem-counter-second-digit");

local t = {}

local addBackThisSwitchOnOffCounter = function (thisSwitch)
    thisSwitch.switchOnOffCounter = 0
end
	t.addBackThisSwitchOnOffCounter = addBackThisSwitchOnOffCounter

local resetFanCounter = function (obj)
    obj.autoFanCounter = 0
end
	t.resetFanCounter = resetFanCounter

local mainDoorTransition = function (mainFunc, shapeArray, shapeArrayParameters)
	local ball = mainFunc.ballBtnScreenCreate.ball;

	for b = 1, #shapeArray do
		if shapeArrayParameters[b]["type"] == "door"
		and shapeArray[b].enabled then
			local function doorTransitionSetUp (thisScreenRelevantVal, doorTransitionFactor)
				transition.to(shapeArray[b], {alpha = 0, time = 150, onComplete = function ()
					transition.to(shapeArray[b], {alpha = 1, time = 150})
				end})
			    mainFunc.tm[ball.projectileType][ball.relevantArrayIndex]:cancelAll()
	            screenChangeType = "auto"
	            thisChangeScreenDirection = shapeArrayParameters[b]["subType"]
			    if (thisScreenRelevantVal == "Vert") then
			    	ball.x = (lowerX + xCalc(30))
			    else
			    	ball.y = (higherY + yCalc(26))
			    end

	            if mainFunc.thisLevelSettings.bombInUseCounter == 0 then
			    	mainFunc.screenChangingScript.changeToRightScreen(mainFunc, shapeArray, shapeArrayParameters, screenChangeType, thisChangeScreenDirection)
			    else
			    	mainFunc.allLevelSettings.isWaitingForBombForScreenChange = true
			    	mainFunc.allLevelSettings.waitingForScreenChangeDirection = thisChangeScreenDirection
			    end
			end

			local doorTransitionSettingsArray = {
				up = function () doorTransitionSetUp("Vert", -1) end,
				right = function () doorTransitionSetUp("Horz", 1) end,
				down = function () doorTransitionSetUp("Vert", 1) end,
				left = function () doorTransitionSetUp("Horz", -1) end
			}

		    if (ball.x) > (mainFunc.allLevelSettings.rightScreenEdge - 20)
		    and ball.direction == "right"
		    and ball.character ~=  "dummyBall" 
		    and ball.character ~=  "superBall" then
		    	higherY = (((shapeArrayParameters[b]["location"]["ySquare"] - 1) * yCalc(52) ) + yCalc(30) + ((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) )
				if ball.y > higherY
				and ball.y < (higherY + 52)
				and mainFunc.allLevelSettings.ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
				and mainFunc.allLevelSettings.ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
				and mainFunc.allLevelSettings.screenTimer == 0
				and shapeArrayParameters[b]["subType"] == ball.direction then
					mainFunc.allLevelSettings.screenTimer = 1
					doorTransitionSettingsArray[shapeArrayParameters[b]["subType"]]()
				end
		    elseif (ball.x) < (mainFunc.allLevelSettings.leftScreenEdge + 20)
		    and ball.direction == "left" then
				higherY = (((shapeArrayParameters[b]["location"]["ySquare"] - 1) * yCalc(52) ) + yCalc(30) + ((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) )
				if ball.y > higherY
				and ball.y < (higherY + 52)
				and mainFunc.allLevelSettings.ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
				and mainFunc.allLevelSettings.ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
				and mainFunc.allLevelSettings.screenTimer == 0
				and shapeArrayParameters[b]["subType"] == ball.direction then
					mainFunc.allLevelSettings.screenTimer = 1
					doorTransitionSettingsArray[shapeArrayParameters[b]["subType"]]()
				end
			elseif (ball.y) < (mainFunc.allLevelSettings.topScreenEdge + 20)
		    and ball.direction == "up" then
				lowerX = (((shapeArrayParameters[b]["location"]["xSquare"] - 1) * xCalc(60) ) + xCalc(30) ) + ((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth)
				if ball.x > lowerX
				and ball.x < (lowerX + 60)
				and mainFunc.allLevelSettings.ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
				and mainFunc.allLevelSettings.ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
				and mainFunc.allLevelSettings.screenTimer == 0
				and shapeArrayParameters[b]["subType"] == ball.direction then
					mainFunc.allLevelSettings.screenTimer = 1
					doorTransitionSettingsArray[shapeArrayParameters[b]["subType"]]()
				end
			elseif (ball.y) > (mainFunc.allLevelSettings.bottomScreenEdge - 20)
		    and ball.direction == "down" then
				lowerX = (((shapeArrayParameters[b]["location"]["xSquare"] - 1) * xCalc(60) ) + xCalc(30) ) + ((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth)
				if ball.x > lowerX
				and ball.x < (lowerX + 60)
				and mainFunc.allLevelSettings.ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
				and mainFunc.allLevelSettings.ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
				and mainFunc.allLevelSettings.screenTimer == 0
				and shapeArrayParameters[b]["subType"] == "down" then
					mainFunc.allLevelSettings.screenTimer = 1
					doorTransitionSettingsArray[shapeArrayParameters[b]["subType"]]()
				end
			end
		end
	end
end
	t.mainDoorTransition = mainDoorTransition

local tunnelTransition = function (mainFunc, shapeArray, shapeArrayParameters)
	local ball = mainFunc.ballBtnScreenCreate.ball;

	for z = 1, #shapeArray do
		if shapeArray[z].objectType == "tunnel" then
		    if (ball.x) > shapeArray[z].relevantLowerX
		    and (ball.x) < (shapeArray[z].relevantHigherX)
		    and (ball.y) > shapeArray[z].relevantLowerY
		    and (ball.y) < (shapeArray[z].relevantHigherY)
	        and mainFunc.allLevelSettings.tunnelIsActive == true then

	        	local firstHorzScreen, firstHorzSquare, nextHorzScreen, nextHorzSquare

	            local function firstMoveSlow ()
	                local function moveSlow (event)
	                    local function addBackMoveSomething ()
	                    	mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(ball, mainFunc)
	                    	shapeArray[z].tunnelCircle:setSequence(shapeArray[z].colour .. "CircleOff")
				            shapeArray[z].tunnelCircle.width = xCalc(25)
				            shapeArray[z].tunnelCircle.height = yCalc(30)
	            			shapeArray[z].endTunnelCircle:setSequence(shapeArray[z].colour .. "CircleOff")
	            			shapeArray[z].endTunnelPiece.alpha = 0.55
	            			shapeArray[z].endTunnelCircle.alpha = 0.55
			            	shapeArray[z].tunnelCircle.alpha = 0.55
			            	if shapeArray[z].secondDirection ~= "none" then
				            	shapeArray[z].exitDirectionArrow.alpha = 0.55
				            end
	                        --Runtime:addEventListener( "enterFrame", moveSomething )
	                    end
	                    if mainFunc.allLevelSettings.tunnelCounter == 0 then

	                    	local function appearBall ()
		                        mainFunc.allLevelSettings.tunnelCounter = 1
		                        ball.x = ((nextHorzScreen - 1) * display.contentWidth) + (((nextHorzSquare - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth + (mainFunc.allLevelSettings.squareWidth/2) )
		                        ball.y = ((nextVertScreen - 1) * display.contentHeight) + (((nextVertSquare - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight + (mainFunc.allLevelSettings.squareHeight/2) )
		                        ball:setSequence(shapeArray[z].secondDirection)
		                        if shapeArray[z].secondDirection ~= "none" then
		                        	ball.direction = shapeArray[z].secondDirection
		                        end
		                        transition.to(ball, {alpha=1, time=250})
		                        mainFunc.allLevelSettings.tunnelIsActive = true

		                        local horzScreenDiff = nextHorzScreen - mainFunc.allLevelSettings.ballScreenHorzValue
		                        local vertScreenDiff = nextVertScreen - mainFunc.allLevelSettings.ballScreenVertValue

		                        mainFunc.allLevelSettings.leftScreenEdge = mainFunc.allLevelSettings.leftScreenEdge + (display.contentWidth * horzScreenDiff)
		                        mainFunc.allLevelSettings.rightScreenEdge = mainFunc.allLevelSettings.rightScreenEdge + (display.contentWidth * horzScreenDiff)
		                        mainFunc.allLevelSettings.topScreenEdge = mainFunc.allLevelSettings.topScreenEdge + (display.contentHeight * vertScreenDiff)
		                        mainFunc.allLevelSettings.bottomScreenEdge = mainFunc.allLevelSettings.bottomScreenEdge + (display.contentHeight * vertScreenDiff)
		                        mainFunc.allLevelSettings.ballScreenHorzValue = nextHorzScreen
		                        mainFunc.allLevelSettings.ballScreenVertValue = nextVertScreen
		                        mainFunc.thisLevelSettings.thisScreenHorzValue = mainFunc.allLevelSettings.ballScreenHorzValue
		                        mainFunc.thisLevelSettings.thisScreenVertValue = mainFunc.allLevelSettings.ballScreenVertValue
		                        --mainFunc.allLevelSettings.thisScreenHorzValue = nextHorzScreen
		                        --mainFunc.allLevelSettings.thisScreenVertValue = nextVertScreen

		                        timer.performWithDelay(700, addBackMoveSomething, 1)
	                    	end

	                    	if nextHorzScreen ~= mainFunc.allLevelSettings.ballScreenHorzValue
	                    	or nextVertScreen ~= mainFunc.allLevelSettings.ballScreenVertValue then
	                    		if mainFunc.allLevelSettings.ballScreenHorzValue > nextHorzScreen then
						            totalReturnToBallHorzTransition = (mainFunc.allLevelSettings.ballScreenHorzValue - nextHorzScreen) * display.contentWidth
						        else
						            totalReturnToBallHorzTransition = (nextHorzScreen - mainFunc.allLevelSettings.ballScreenHorzValue) * display.contentWidth
						        end

						        totalReturnToBallVertTransition = (mainFunc.allLevelSettings.ballScreenVertValue - nextVertScreen ) * display.contentHeight

						        transition.to(mainFunc.backgroundGrids, {time = 300, x = mainFunc.backgroundGrids.x + totalReturnToBallHorzTransition, y = mainFunc.backgroundGrids.y + totalReturnToBallVertTransition})
						        transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.backgroundObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.backgroundObjectsGroup.y + totalReturnToBallVertTransition})
						        transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.screenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.screenObjectsGroup.y + totalReturnToBallVertTransition})
						        transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.midScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.midScreenObjectsGroup.y + totalReturnToBallVertTransition})
						        transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {time = 300, x = mainFunc.allLevelSettings.frontScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.frontScreenObjectsGroup.y + totalReturnToBallVertTransition, onComplete = function ()
						        	timer.performWithDelay(250, appearBall)
						        end})
	                    	else
	                    		appearBall()
	                    	end
	                    end
	                    
	                end
	                
	                local function secondMoveSlow ()
	                    transition.to(ball, {alpha = 0, time=750, onComplete=moveSlow} )
	                end
	                transition.to(ball, {y=shapeArray[z].y, x=shapeArray[z].x, time=100} )
	                timer.performWithDelay(350, secondMoveSlow, 1)
	  
	            end

    			shapeArray[z].endTunnelPiece.alpha = 1
            	shapeArray[z].endTunnelCircle.alpha = 1
            	shapeArray[z].tunnelCircle.alpha = 1
            	if shapeArray[z].secondDirection ~= "none" then
            		shapeArray[z].exitDirectionArrow.alpha = 1
            	end
	            shapeArray[z].tunnelCircle:setSequence(shapeArray[z].colour .. "CircleOn")
	            shapeArray[z].tunnelCircle.width = xCalc(25)
	            shapeArray[z].tunnelCircle.height = yCalc(30)
	            shapeArray[z].endTunnelCircle:setSequence(shapeArray[z].colour .. "CircleOn")
	            mainFunc.allLevelSettings.tunnelIsActive = false
				mainFunc.allLevelSettings.tunnelCounter = 0
				firstHorzScreen = shapeArrayParameters[z]["location"]["xScreen"]
				firstVertScreen = shapeArrayParameters[z]["location"]["yScreen"]
	            firstHorzSquare = shapeArrayParameters[z]["location"]["xSquare"]
	            firstVertSquare = shapeArrayParameters[z]["location"]["ySquare"]
	            firstHorzScreenX = ((firstHorzScreen - 1) * display.contentWidth) + (((firstHorzSquare - 1) * mainFunc.allLevelSettings.squareWidth) + mainFunc.allLevelSettings.gutterWidth + (mainFunc.allLevelSettings.squareWidth/2) )
	            firstHorzScreenY = ((firstVertScreen - 1) * display.contentHeight) + (((firstVertSquare - 1) * mainFunc.allLevelSettings.squareHeight) + mainFunc.allLevelSettings.gutterHeight + (mainFunc.allLevelSettings.squareHeight/2) )
				nextHorzScreen = shapeArrayParameters[z]["subType"]
				nextVertScreen = shapeArrayParameters[z]["props"][1]
				nextHorzSquare = shapeArrayParameters[z]["props"][2]
				nextVertSquare = shapeArrayParameters[z]["props"][3]
				mainFunc.tm[ball.projectileType][ball.relevantArrayIndex]:cancelAll()
	            firstMoveSlow()
	    	end
		end
    end
end
	t.tunnelTransition = tunnelTransition

local medalGainedScreenNextButton, showToolsPickedUp, doGridMotions, showObjectsPickedUp, showGrid, hideLastSlide

function hideLastSlide (mainFunc, buttonWasClicked)
	local delayTime, fadeTime
	if buttonWasClicked then
		fadeTime = 200
		delayTime = 650
	else
		fadeTime = 300
		delayTime = 950
	end
	local fadeOptions = {alpha = 0, time = fadeTime, onComplete = function ()
		timer.performWithDelay(delayTime, function ()
			mainFunc.backToLevelMenu()
		end)
	end}

	transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 0, time = 200})

	if mainFunc.medalGainedScreen.nextButton.prevState == "firstSlide" then
		transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
	elseif mainFunc.medalGainedScreen.nextButton.prevState == "tools" then
		transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
	elseif mainFunc.medalGainedScreen.nextButton.prevState == "objects" then
		transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
	end

end

function medalGainedScreenNextButton (mainFunc, clickState)
	local fadeOptions = {alpha = 0, time = 120}

	if (mainFunc.medalGainedScreen.nextButton.currentState ~= "aboutToEnd") then
		mainFunc.medalGainedScreen.nextButton.alpha = 0
	else
		transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 0, time = 240})
	end

	local function quickHideFirstSlide ()
		local fadeOptions = {alpha = 0, time = 120}
		transition.to(mainFunc.thisFan, fadeOptions)
		transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
		transition.to(mainFunc.medalGainedScreen.timeLabel, fadeOptions)
		for a = 1, #mainFunc.medalGainedScreen.TimeCounter do
			transition.to(mainFunc.medalGainedScreen.TimeCounter[a], fadeOptions)
		end
		transition.to(mainFunc.medalGainedScreen.finalCoinsLabel, fadeOptions)
		if mainFunc.medalGainedScreen.coinsNotApplicable == false then
			transition.to(mainFunc.medalGainedScreen.coinsLabel, fadeOptions)
			for key, val in pairs(mainFunc.medalGainedScreen.CoinsIconArray) do
				transition.to(mainFunc.medalGainedScreen.CoinsIconArray[key], fadeOptions)
			end
		end
		if #mainFunc.medalGainedScreen.CoinsCounter > 0 then
			for a = 1, #mainFunc.medalGainedScreen.CoinsCounter do
				transition.to(mainFunc.medalGainedScreen.CoinsCounter[a], fadeOptions)
			end
		end
		if mainFunc.medalGainedScreen.gemsNotApplicable == false then
			transition.to(mainFunc.medalGainedScreen.GemIcons, fadeOptions)
			for a = 1, #mainFunc.medalGainedScreen.GemCounter do
				transition.to(mainFunc.medalGainedScreen.GemCounter[a], fadeOptions)
			end
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
	end

	local function quickHideGridSlide (gridType, mainFunc)
		if gridType == "tools" then
			transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
		elseif gridType == "objects" then
			transition.to(mainFunc.medalGainedScreen.message1, fadeOptions)
		end

		for a = 1, #mainFunc.gridItems do

			if (mainFunc.gridItems[a].displayObjects["directionLabel"]) then
            	for b = 1, #mainFunc.gridItems[a].displayObjects["directionLabel"] do
            		transition.to(mainFunc.gridItems[a].displayObjects["directionLabel"][b], {alpha = 0, time = 50})
            	end
            end
            if (mainFunc.gridItems[a].displayObjects["text"]) then
            	for b = 1, #mainFunc.gridItems[a].displayObjects["text"] do
                	transition.to(mainFunc.gridItems[a].displayObjects["text"][b], {alpha = 0, time = 50})
            	end
            end
            transition.to(mainFunc.gridItems[a].displayObjects["counterNumber"], {alpha = 0, time = 50})

			transition.to(mainFunc.gridItems[a], fadeOptions)
		end
	end

	local checkWhichSlideToShow = function ()
		local medalScreenOrderArray = {"firstSlide", "tools", "objects", "newWorld", "lastSlide"}
		local newMedalScreenOrderArray = {"firstSlide"}

		for a = 1, #medalScreenOrderArray do
			local key = medalScreenOrderArray[a]
			if mainFunc.medalScreenSlides[key] then
				table.insert(newMedalScreenOrderArray, key)
			end
		end

		for a = 2, #newMedalScreenOrderArray do

			local key = newMedalScreenOrderArray[a]
			if (mainFunc.medalScreenSlides[key]) then
				if (mainFunc.medalScreenSlides[key][1] == false) then
					if key == "tools" then
						showToolsPickedUp(mainFunc.medalGainedScreen.toolsToShowInEndScreenArray, mainFunc)
						return
					elseif key == "objects" then
						showObjectsPickedUp(mainFunc.medalGainedScreen.objectsToShowInEndScreenArray, mainFunc)
						return
					elseif key == "newWorld" then
						transition.to(mainFunc.medalGainedScreen.itemBagIcon, {alpha = 0, time = 120})
						return
					elseif key == "lastSlide" then
						timer.performWithDelay(350, function ()
							mainFunc.medalGainedScreen.nextButton.prevState = newMedalScreenOrderArray[a - 1]
							hideLastSlide(mainFunc, true)
						end)
						return
					end
				end
			end
		end
	end

	if (mainFunc.medalGainedScreen.nextButton.currentState == "firstSlide") then
		mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel = true
		quickHideFirstSlide()
		checkWhichSlideToShow()
	elseif mainFunc.medalGainedScreen.nextButton.currentState == "tools"
	or mainFunc.medalGainedScreen.nextButton.currentState == "objects" then
		mainFunc.medalScreenSlides[mainFunc.medalGainedScreen.nextButton.currentState][1] = true
		mainFunc.medalGainedScreen.toolGridMotionsAreCancelled = true
		quickHideGridSlide(mainFunc.medalGainedScreen.nextButton.currentState, mainFunc)

		if mainFunc.medalScreenSlides["objects"] and mainFunc.medalScreenSlides["objects"][1] == false then
			checkWhichSlideToShow()
		else
			transition.to(mainFunc.medalGainedScreen.itemBagIcon, {alpha = 0, time = 120, onComplete = function ()
				checkWhichSlideToShow()
			end})
		end

	else
		checkWhichSlideToShow()
	end
end

function doGridMotions (itemType, mainFunc)
	local relevantItemCounter = 1
	local relevantItems = mainFunc.gridItems

	function fadeItem(counter)
		if mainFunc.medalGainedScreen.toolGridMotionsAreCancelled == false then
			
			if (relevantItems[counter].displayObjects["directionLabel"]) then
            	for b = 1, #relevantItems[counter].displayObjects["directionLabel"] do
            		transition.to(relevantItems[counter].displayObjects["directionLabel"][b], {alpha = 0, time = 50})
            	end
            end
            if (relevantItems[counter].displayObjects["text"]) then
            	for b = 1, #relevantItems[counter].displayObjects["text"] do
                	transition.to(relevantItems[counter].displayObjects["text"][b], {alpha = 0, time = 50})
            	end
            end
            transition.to(relevantItems[counter].displayObjects["counterNumber"], {alpha = 0, time = 50})

			transition.to(relevantItems[counter], {alpha = 0, y = relevantItems[counter].y - 30, yScale = 0.6, xScale = 0.6, time = 100})
			if (counter < #relevantItems) then
				counter = counter + 1
				timer.performWithDelay(100, function () fadeItem(counter) end)
			else
				--reached the end
				if mainFunc.medalGainedScreen.toolGridMotionsAreCancelled == false then
					timer.performWithDelay(550, function ()
						transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 0, time = 120})
						if itemType == "tools" then
							mainFunc.toolPickedUp = false
							mainFunc.medalScreenSlides["tools"][1] = true
							transition.to(mainFunc.medalGainedScreen.message1, {alpha = 0, time = 350})
							if (mainFunc.medalScreenSlides["objects"]) then
								mainFunc.medalGainedScreen.nextButton.prevState = "showingToolsPickedUp"
								showObjectsPickedUp(mainFunc.objectsToShowInEndScreenArray, mainFunc)
							else
								transition.to(mainFunc.medalGainedScreen.itemBagIcon, {alpha = 0, time = 350})
								mainFunc.medalGainedScreen.nextButton.prevState = "tools"
								hideLastSlide(mainFunc, false)
							end
						elseif itemType == "objects" then
							mainFunc.objectPickedUp = false
							mainFunc.medalScreenSlides["objects"][1] = true

							transition.to(mainFunc.medalGainedScreen.message1, {alpha = 0, time = 350})
							transition.to(mainFunc.medalGainedScreen.itemBagIcon, {alpha = 0, time = 350})
							mainFunc.medalGainedScreen.nextButton.prevState = "objects"
							hideLastSlide(mainFunc, false)
						end
					end)
				end
			end
		end
	end

	fadeItem(relevantItemCounter)
end

function showGrid (relevantArray, itemType, mainFunc)
	local originalXVal = contentCentreX - 165
	local xVal = contentCentreX - 165
	local originalYVal = 130
	local yVal = 130
	local gridItemCounter = 1
	local thisIsShapeScreen, relItemArray

	if (itemType == "tools") then
		thisIsShapeScreen = false
		relItemArray = mainFunc.thisLevelSettings.toolArray
	else
		thisIsShapeScreen = true
		relItemArray = mainFunc.thisLevelSettings.objectArray
	end

	if (mainFunc.gridItems) then
		local function removeObj(obj)
			obj:removeSelf()
			obj = nil
		end

		for a = 1, #mainFunc.gridItems do
			removeObj(mainFunc.gridItems[a])
		end
	end

	mainFunc.gridItems = {}

	for a = 1, #relevantArray do
		toolIndex = relevantArray[a][1]

		mainFunc.gridItems[a] = mainFunc.globalImageCreateFunctions.createItemDetailedIcon(thisIsShapeScreen, relItemArray[toolIndex]["name"], "MedalGainedScreen", relItemArray, toolIndex, nil, nil)
		

		gridItem = mainFunc.gridItems[a]
		gridItem.alpha = 0

		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(gridItem)
        gridItem:toFront()

        if gridItem.displayObjects["text"] then
            for a = 1, #gridItem.displayObjects["text"] do
                mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(gridItem.displayObjects["text"][a])
                gridItem.displayObjects["text"][a].alpha = 0
                gridItem.displayObjects["text"][a]:toFront()
            end
        end

        if gridItem.displayObjects["directionLabel"] then
            for a = 1, #gridItem.displayObjects["directionLabel"] do
                mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(gridItem.displayObjects["directionLabel"][a])
                gridItem.displayObjects["directionLabel"][a].alpha = 0
                gridItem.displayObjects["directionLabel"][a]:toFront()
            end
        end

        mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(gridItem.displayObjects["counterNumber"])
        gridItem.displayObjects["counterNumber"].alpha = 0
        gridItem.displayObjects["counterNumber"]:toFront()

        mainFunc.globalImageCreateFunctions.positionItemDetailedIcon(gridItem, xVal, yVal, thisIsShapeScreen, relItemArray[toolIndex]["name"], "MedalGainedScreen", relItemArray, toolIndex, nil, nil) 


		xVal = xVal + 64
		if a % 4 == 0 then
			if a % 8 == 0 then
				yVal = originalYVal
			else
				yVal = 184
			end
			xVal = originalXVal
		end
	end

	timer.performWithDelay(500, function ()
		if (mainFunc.medalGainedScreen.itemBagIcon) then

		else
			mainFunc.medalGainedScreen.itemBagIcon = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-itemBagImage.png", 129, 105)
			mainFunc.medalGainedScreen.itemBagIcon.alpha = 0
        	mainFunc.medalGainedScreen.itemBagIcon.anchorX = 0.5
        	mainFunc.medalGainedScreen.itemBagIcon.anchorY = 0.5
        	mainFunc.medalGainedScreen.itemBagIcon.x = mainFunc.medalGainedScreen.x + 127
        	mainFunc.medalGainedScreen.itemBagIcon.y = mainFunc.medalGainedScreen.y + 32
		end

		if (mainFunc.medalGainedScreen.itemBagIcon.alpha ~= 1) then
			transition.to(mainFunc.medalGainedScreen.itemBagIcon, {alpha = 1, time = 500, onComplete = function ()
				transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 1, time = 120})
			end})
		else
			timer.performWithDelay(300, function () 
				transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 1, time = 120}) 
			end)
		end

		local function processGridSpecificItems ()
			for a = 1, #mainFunc.gridItems do
				gridItem = mainFunc.gridItems[a]
	            if (gridItem.displayObjects["directionLabel"]) then
	            	for b = 1, #gridItem.displayObjects["directionLabel"] do
	            		transition.to(gridItem.displayObjects["directionLabel"][b], {alpha = 1, time = 500})
	            	end
	            end
	            if (gridItem.displayObjects["text"]) then
	            	for b = 1, #gridItem.displayObjects["text"] do
	            		transition.to(gridItem.displayObjects["text"][a], {alpha = 1, time = 500})
	            	end
	            end
	    		transition.to(gridItem.displayObjects["counterNumber"], {alpha = 1, time = 500})
	    		transition.to(gridItem, {alpha = 1, time = 500})
	    	end
		end

		if (itemType == "tools") then
			timer.performWithDelay(300, function ()
				transition.to(mainFunc.medalGainedScreen.message1, {alpha = 1, time = 240, onComplete = function ()
					processGridSpecificItems()
		        	timer.performWithDelay(500, function ()
		        		mainFunc.medalGainedScreen.toolGridMotionsAreCancelled = false

	        			timer.performWithDelay(500, function ()
	        				doGridMotions("tools", mainFunc)
	        			end)
		        	end)
				end})
			end)
        elseif (itemType == "objects") then
        	timer.performWithDelay(300, function ()
				transition.to(mainFunc.medalGainedScreen.message1, {alpha = 1, time = 240, onComplete = function ()
		        	processGridSpecificItems()
		        	timer.performWithDelay(500, function ()
		        		mainFunc.medalGainedScreen.toolGridMotionsAreCancelled = false

	        			timer.performWithDelay(500, function ()
	        				doGridMotions("objects", mainFunc)
	        			end)

		        	end)
				end})
			end)
        end
    end)
end

function showToolsPickedUp (relevantArray, mainFunc)
	mainFunc.medalGainedScreen.nextButton.currentState = "tools"
	showGrid(relevantArray, "tools", mainFunc)
end

function showObjectsPickedUp (relevantArray, mainFunc)
	mainFunc.medalGainedScreen.nextButton.currentState = "objects"
	showGrid(relevantArray, "objects", mainFunc)

	--if there is a final popUp, show it
end

local followShapeWithBall = function (mainFunc)
	mainFunc.ballBtnScreenCreate.ball.x = mainFunc.allLevelSettings.currentShapeBallShouldFollow.x
	mainFunc.ballBtnScreenCreate.ball.y = mainFunc.allLevelSettings.currentShapeBallShouldFollow.y
end
	t.followShapeWithBall = followShapeWithBall

local fanCentering = function (obj, thisFan, fanCenterTime, mainFunc)
	local ball = mainFunc.ballBtnScreenCreate.ball;

    local fanCenteringComplete  = function (obj)
        obj.fanCenteringCounter = 1
        thisFan.canShapeSlide = true
        mainFunc.allLevelSettings.spitterCounter = 0

        if thisFan.type == "autoFan"
        or thisFan.type == "manualFan" then
            mainFunc.allLevelSettings.moveSomethingCounter = 0
            if obj == ball then 
            	transition.to(obj, {xScale = 1, yScale = 1, time=210})
            end
			
            mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectileArray[obj.direction](obj, mainFunc)
            if obj == ball
            and mainFunc.allLevelSettings.followShapeWithBallApplied then
				Runtime:removeEventListener("enterFrame", mainFunc.objectToBallTransitionScript.listener)
				mainFunc.allLevelSettings.followShapeWithBallApplied = false
            end

            local tmClosure = function () resetFanCounter(obj, thisFan) 
            	ball.lastFanIndex = nil
            	thisFan.enabled = true
            	thisFan.lastBallReleaseDirection = nil
        		thisFan.canShapeSlide = true
        		thisFan.isBallPresent = false
            end
            if obj == ball then
            	timer.performWithDelay(185, tmClosure, 1)
                mainFunc.allLevelSettings.isBallMovingState = "true"
                mainFunc.allLevelSettings.shouldBallMoveState = "true"
            	thisFan.lastBallReleaseDirection = obj.direction
            end
            obj.fanCenteringCounter = 0
        		
        	if thisFan.isAutoSlideObject and thisFan.autoSlideIsPaused == false then
	            if #thisFan.autoSlideTransition > 0 then
					for a = 1, #thisFan.autoSlideTransition do
						transition.resume(thisFan.autoSlideTransition[a])
					end
				end
				if #thisFan.autoSlideTimer > 0 then
					for a = 1, #thisFan.autoSlideTimer do
						timer.resume(thisFan.autoSlideTimer[a])
					end
				end
			end
        elseif thisFan.type == "spitter"
        or thisFan.type == "simple"
        or thisFan.type == "backFire"
        or thisFan.type == "characterChangePoint" then
            thisFan.enabled = true

        elseif thisFan.type == "switch" then
        	local handleObject, goToScreen, goBackToBall, prepareScreenToHandleObject
		    local thisSwitch = thisFan
		    local lastObjIsOutsideFirstSquare = false
		    thisSwitch.secondObjProcessed = false
		    thisSwitch.lastObjProcessedIndex = thisSwitch.shapeArrayIndex
		    thisSwitch.objProcessCounter = 0

            function goToScreen(xScreenValCurrent, yScreenValCurrent, xScreenValTarget, yScreenValTarget)
            	local transTime = 300
        		totalReturnToBallHorzTransition = (xScreenValCurrent - xScreenValTarget) * display.contentWidth
		        totalReturnToBallVertTransition = (yScreenValCurrent - yScreenValTarget) * display.contentHeight
		        if totalReturnToBallHorzTransition == 0 and totalReturnToBallHorzTransition == 0 then
		        	transTime = 80
		        end

		        transition.to(mainFunc.backgroundGrids, {time = transTime, x = mainFunc.backgroundGrids.x + totalReturnToBallHorzTransition, y = mainFunc.backgroundGrids.y + totalReturnToBallVertTransition})
		        transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {time = transTime, x = mainFunc.allLevelSettings.backgroundObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.backgroundObjectsGroup.y + totalReturnToBallVertTransition})
		        transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {time = transTime, x = mainFunc.allLevelSettings.screenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.screenObjectsGroup.y + totalReturnToBallVertTransition})
		        transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {time = transTime, x = mainFunc.allLevelSettings.midScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.midScreenObjectsGroup.y + totalReturnToBallVertTransition})
		        transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {time = transTime, x = mainFunc.allLevelSettings.frontScreenObjectsGroup.x + totalReturnToBallHorzTransition, y = mainFunc.allLevelSettings.frontScreenObjectsGroup.y + totalReturnToBallVertTransition, onComplete = function ()

		        end})
        	end

            function prepareScreenToHandleObject(objToProcessIndex)
	            for c = 1, #shapeArrayParameters do
            		if shapeArrayParameters[c]["name"] == thisSwitch.objectsToProcess[objToProcessIndex][2] then
        				if shapeArrayParameters[c]["location"]["xScreen"] == shapeArrayParameters[thisSwitch.lastObjProcessedIndex][3] and shapeArrayParameters[c]["location"]["yScreen"] == shapeArrayParameters[thisSwitch.lastObjProcessedIndex][4] then
	                		timer.performWithDelay(150, function () handleObject(c, objToProcessIndex) end)
	                	else
	                		lastObjIsOutsideFirstSquare = true
	                		goToScreen(shapeArrayParameters[thisSwitch.lastObjProcessedIndex][3], shapeArrayParameters[thisSwitch.lastObjProcessedIndex][4], shapeArrayParameters[c]["location"]["xScreen"], shapeArrayParameters[c]["location"]["yScreen"])
					        
					        timer.performWithDelay(550, function () handleObject(c, objToProcessIndex) end)
	                	end
            		end
            	end
        	end

        	function handleObject(i, objToProcessIndex)
        		thisSwitch.lastObjProcessedIndex = i
        		thisSwitch.objProcessCounter = thisSwitch.objProcessCounter + 1
                if thisSwitch.objectsToProcess[objToProcessIndex][1] == "flip-horizontal"
                or thisSwitch.objectsToProcess[objToProcessIndex][1] == "flip-vertical" then
                    thisActualFlippedObjectDirection = thisSwitch.objectsToProcess[objToProcessIndex][1]
                    mainFunc.objectFlipScript.positionNewFlippedObject(shapeArray[i], thisActualFlippedObjectDirection, 0, mainFunc)
                    checkForNextObject()
                elseif thisSwitch.objectsToProcess[objToProcessIndex][1] == "door-open" then
        			mainFunc.transitionFunctionScript.switchAlphaTransparency(shapeArray[i])
		            timer.performWithDelay(250, function () checkForNextObject() end)
		        elseif thisSwitch.objectsToProcess[objToProcessIndex][1] == "toggle-slide" then
        			for a = 1, #mainFunc.allLevelSettings.transitionArrayIndex do
        				if mainFunc.allLevelSettings.transitionArrayIndex[a]["shapeName"] == shapeArray[i].name then
        					if shapeArray[i].isAutoSlideObject then
        						mainFunc.transitionFunctionScript.toggleAutoSlideTimer(mainFunc, shapeArray[i])
        					else
        						mainFunc.activateAutoSlideObject(mainFunc, shapeArray, i, a)
        					end
		            		timer.performWithDelay(20, function () checkForNextObject() end)
        				end
        			end
        		elseif thisSwitch.objectsToProcess[objToProcessIndex][1] == "slide" then
        			for a = 1, #mainFunc.allLevelSettings.transitionArrayIndex do
        				if mainFunc.allLevelSettings.transitionArrayIndex[a]["shapeName"] == shapeArray[i].name then
        					shapeArray[i].newDVal = a
                            local function startTransitionMoveSomething ()

	                            shapeArray[i].transitionCounter = 1
	                            mainFunc.allLevelSettings.stillTransitioningCounter = 1
	                            shapeArray[i].additionalCounterForDummyConnector = 0
	                            shapeArray[i].enabled = false

	                            mainFunc.objectFunctionsScript.bombGroupCheck(mainFunc, "before", shapeArray[i])

	                            local isActualConnector
	                            if shapeArray[i].nextOrPrevState == "next" and shapeArray[i].nextTransitionSquareIndex == "*" then
	                                isActualConnector = false
	                            elseif shapeArray[i].nextOrPrevState == "prev" and shapeArray[i].prevTransitionSquareIndex == "*" then
	                                isActualConnector = false
	                            else
	                                isActualConnector = true
	                            end
	                            mainFunc.transitionFunctionScript.mainTransitionMoveSomething(shapeArray[i], mainFunc, shapeArray, shapeArrayParameters, isActualConnector)
		            			timer.performWithDelay(20, function () checkForNextObject() end)
	                        end
	                        
	                        local function planTransitionMoveSomething(transXDirection, transDirection, prevOrNext )
                                shapeArray[i].thisTransitionXDirection = transXDirection
                                shapeArray[i].thisTransitionDirection = transDirection
                                shapeArray[i].nextOrPrevState = prevOrNext
                                shapeArray[i].storedTransitionDistance = shapeArray[i].thisTransitionDistance
                                if transDirection == "horz" then
                                    shapeArray[i].storedTransitionDistance = shapeArray[i].storedTransitionDistance * shapeArray[i].thisTransitionXDirection
                                end
                                startTransitionMoveSomething()
	                        end
	                        
	                        local function alternativePlanTransitionMoveSomethingSetUp(otherRelevantSquare, thisRelevantSquare, prevOrNext, transDirection)
                                if otherRelevantSquare ~= "null" and otherRelevantSquare < thisRelevantSquare then
                                    planTransitionMoveSomething(-1, transDirection, prevOrNext)
                                elseif otherRelevantSquare ~= "null" and otherRelevantSquare > thisRelevantSquare then
                                    planTransitionMoveSomething(1, transDirection, prevOrNext)
                                end
	                        end

	                        if  shapeArray[i].prevTransitionVertSquare == "null" then
	                        	shapeArray[i].switchSlideNextOrPrev = "next"
	                        end

                            if shapeArray[i].nextTransitionHorzSquare ~= "null"
	                        and shapeArray[i].nextTransitionHorzSquare > shapeArray[i].thisTransitionHorzSquare
	                        and shapeArray[i].switchSlideNextOrPrev == "next" then
	                            shapeArray[i].thisTransitionDistance = shapeArray[i].nextTransitionHorzSquare - shapeArray[i].thisTransitionHorzSquare
	                            
	                            planTransitionMoveSomething(1, "horz", "next")
	                        elseif shapeArray[i].nextTransitionHorzSquare ~= "null"
                        	and shapeArray[i].nextTransitionHorzSquare < shapeArray[i].thisTransitionHorzSquare
                        	and shapeArray[i].switchSlideNextOrPrev == "next" then
	                            shapeArray[i].thisTransitionDistance = shapeArray[i].thisTransitionHorzSquare - shapeArray[i].nextTransitionHorzSquare
	                            
	                            planTransitionMoveSomething(-1, "horz", "next")
	                        elseif shapeArray[i].nextTransitionHorzSquare ~= "null" 
	                        and shapeArray[i].nextTransitionHorzSquare == shapeArray[i].thisTransitionHorzSquare 
	                        and shapeArray[i].switchSlideNextOrPrev == "next" then
	                            shapeArray[i].thisTransitionDistance = shapeArray[i].nextTransitionVertSquare - shapeArray[i].thisTransitionVertSquare
	                            
	                            alternativePlanTransitionMoveSomethingSetUp(shapeArray[i].nextTransitionVertSquare, shapeArray[i].thisTransitionVertSquare, "next", "vert")
	                        elseif shapeArray[i].nextTransitionHorzSquare == "null" or shapeArray[i].switchSlideNextOrPrev == "prev" then
	                        	shapeArray[i].switchSlideNextOrPrev = "prev"
		                        if  shapeArray[i].prevTransitionVertSquare ~= "null" and shapeArray[i].prevTransitionVertSquare > shapeArray[i].thisTransitionVertSquare then
		                            shapeArray[i].thisTransitionDistance = shapeArray[i].prevTransitionVertSquare - shapeArray[i].thisTransitionVertSquare
		                            
		                            planTransitionMoveSomething(1, "vert", "prev")
		                        elseif  shapeArray[i].prevTransitionVertSquare ~= "null" and shapeArray[i].prevTransitionVertSquare < shapeArray[i].thisTransitionVertSquare then
		                            shapeArray[i].thisTransitionDistance = shapeArray[i].prevTransitionVertSquare - shapeArray[i].thisTransitionVertSquare
		                                    
		                            planTransitionMoveSomething(-1, "vert", "prev")
		                        elseif shapeArray[i].prevTransitionVertSquare ~= "null" and shapeArray[i].prevTransitionVertSquare == shapeArray[i].thisTransitionVertSquare then
		                            shapeArray[i].thisTransitionDistance = shapeArray[i].thisTransitionHorzSquare - shapeArray[i].prevTransitionHorzSquare
		                                        
		                            alternativePlanTransitionMoveSomethingSetUp(shapeArray[i].prevTransitionHorzSquare, shapeArray[i].thisTransitionHorzSquare, "prev", "horz")
		                        end
	                    	end
        				end
        			end
                end
        	end

        	function checkForNextObject()
        		if thisSwitch.objProcessCounter < #thisSwitch.objectsToProcess then
                    prepareScreenToHandleObject(thisSwitch.objProcessCounter + 1)
                else
                	goBackToBall(thisSwitch.lastObjProcessedIndex)
                end
        	end

        	function goBackToBall()
            	timer.performWithDelay(250, function ()
        			goToScreen(shapeArrayParameters[thisSwitch.lastObjProcessedIndex][3], shapeArrayParameters[thisSwitch.lastObjProcessedIndex][4], mainFunc.allLevelSettings.ballScreenHorzValue, mainFunc.allLevelSettings.ballScreenVertValue)
        			local transTime = 300
        			if shapeArrayParameters[thisSwitch.lastObjProcessedIndex][3] == mainFunc.allLevelSettings.ballScreenHorzValue
        			and shapeArrayParameters[thisSwitch.lastObjProcessedIndex][4] == mainFunc.allLevelSettings.ballScreenVertValue then
        				transTime = 30
        			end
        			timer.performWithDelay(transTime, function ()

						mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
            			mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectileArray[obj.direction](obj, mainFunc)

			        	if shapeArrayParameters[thisSwitch.shapeArrayIndex][8]
			        	and shapeArrayParameters[thisSwitch.shapeArrayIndex][8] == "one-way" then
			        	else
			                timer.performWithDelay(300, function () addBackThisSwitchOnOffCounter(thisSwitch) end)
			            end
        			end)
        		end)
        	end

        	prepareScreenToHandleObject(1)
        end

        if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
			if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanLanding"] then
				mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onFanLanding"](mainFunc, thisFan, shapeArray)
			end
        end
    end
    local fanYTarget = thisFan.y
    local fanXTarget = thisFan.x
    local calculateTarget = function (axis)
    	if axis == "y" then
    		local yFig = (obj.y - mainFunc.allLevelSettings.gutterHeight) / mainFunc.allLevelSettings.squareHeight
            yFig = math.floor(yFig)
            yFig = (mainFunc.allLevelSettings.squareHeight * (yFig + 0.5) ) + mainFunc.allLevelSettings.gutterHeight
            return yFig
    	elseif axis == "x" then
    		local xFig = (obj.x - mainFunc.allLevelSettings.gutterWidth) / mainFunc.allLevelSettings.squareWidth
            xFig = math.floor(xFig)
            xFig = (mainFunc.allLevelSettings.squareWidth * (xFig + 0.5) ) + mainFunc.allLevelSettings.gutterWidth
            return xFig
    	end
	end

    if thisFan.isAutoSlideObject 
    and (thisFan.objectType == "autoFan" or thisFan.objectType == "manualFan")
    and thisFan.autoSlideDirection == "horz"
    and (thisFan.direction == "up" or thisFan.direction == "down") then
    	fanXTarget = calculateTarget("x")
    elseif thisFan.isAutoSlideObject 
    and (thisFan.objectType == "autoFan" or thisFan.objectType == "manualFan")
    and thisFan.autoSlideDirection == "vert"
    and (thisFan.direction == "left" or thisFan.direction == "right") then
    	fanYTarget = calculateTarget("y")
    end
    transition.to(obj, {x = fanXTarget, y = fanYTarget, time=fanCenterTime, onComplete=fanCenteringComplete})
    
    if obj == ball then
	    if thisFan.type == "autoFan"
	    or thisFan.type == "manualFan" then
	        --transition.to(obj, {xScale = 1.15, yScale = 1.15, time=330})
	    elseif thisFan.type == "characterChangePoint" then
        	thisFan.button.alpha = 1
            thisFan.button.mainFuncListenerAdded = true
	    elseif thisFan.type == "endPoint" then

	    	if ball.character ==  "dummyBall"
	    	or ball.character ==  "superBall" then
	    		mainFunc.ballBtnScreenCreate.itemBtn.isActive = false
	            local prevImageSheet = graphics.newImageSheet( mainFunc.fullCharacterConfigArray[ballDummy.character], {width = 31, height = 34, numFrames = 4, sheetContentWidth = 124, sheetContentHeight = 34})
	            local prevSequenceData = {
	                { name = "up", start=1, count=1,   loopCount=1 },
	                { name = "right", start=2, count=1, loopCount=1 },
	                { name = "down", start=3, count=1, loopCount=1 },
	                { name = "left", start=4, count=1, loopCount=1 }
	            }

	            mainFunc.oldball = ball

	            transition.to(ballDummy, {alpha = 1, x = ballDummy.x + xCalc(10), time = 80, onComplete = function ()
	                ball = display.newSprite(prevImageSheet, prevSequenceData)
	                physics.addBody( ball, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
	                mainFunc.allLevelSettings.midScreenObjectsGroup:insert( ball )
	                ball.projectileType = "ball"
	                ball.direction = ballDummy.direction
	                ball.relevantArrayIndex = 0
	                ball.transitionId = ball.relevantArrayIndex
	                ball.gravityScale = 0
	                ball.x = ballDummy.x
	                ball.y = ballDummy.y
	                ball.isFixedRotation = true
	                ball.autoFanCounter = 0
	                ball.fanCenteringCounter = 0
	                ball.movementSpeed = 100
	                ball.transitioning = false
	                ball:play()
	                ball:toFront()
	                ball:setSequence(ballDummy.direction)
	                ball.specialConditionsArray = {}

	                ball.character = ballDummy.character

	                ballDummy:removeSelf()
	                ballDummy = nil

	                mainFunc.oldball:removeSelf()
	                mainFunc.oldball = nil

	                timer.performWithDelay(200, function ()
	                    mainFunc.allLevelSettings.specialBallActive = false
	                    mainFunc.ballBtnScreenCreate.itemBtn.isActive = true
	                end)
	            end})
	    	else
	    		if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
		            timer.pause(mainFunc.levelTimerUpdateTimer)
		        end

		        mainFunc.ballBtnScreenCreate.pauseScreenOverlay.alpha = 0.25
		        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
		        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("touch", mainFunc.dummyListener)

	    		-- not sure why this is neccessary but as soon as you put the medalPiece into the itemScreenObjGroup, it changes position and doesn't account for screen changes
	    		local oldX = thisFan.medalPiece.x
	    		local oldY = thisFan.medalPiece.y
		    	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(thisFan.medalPiece)
		    	if (mainFunc.allLevelSettings.ballScreenHorzValue - mainFunc.thisLevelSettings.ballFirstScreenHorzValue > 0) then
		    		thisFan.medalPiece.x = oldX - ( (mainFunc.allLevelSettings.ballScreenHorzValue - mainFunc.thisLevelSettings.ballFirstScreenHorzValue) * display.contentWidth)
		    	end

		    	if (mainFunc.allLevelSettings.ballScreenVertValue - mainFunc.thisLevelSettings.ballFirstScreenVertValue > 0) then
		    		thisFan.medalPiece.y = oldY - ( (mainFunc.allLevelSettings.ballScreenVertValue - mainFunc.thisLevelSettings.ballFirstScreenVertValue) * display.contentHeight)
		    	end

		    	thisFan.medalPiece:toFront()

		    	local transitionOptions = {alpha = 0, time = 300}
		    	transition.to(mainFunc.ballBtnScreenCreate.playBtn, transitionOptions)
		    	transition.to(mainFunc.ballBtnScreenCreate.randomBtn, transitionOptions)
		    	transition.to(mainFunc.ballBtnScreenCreate.backBtn, transitionOptions)

		    	mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

			    --save all collected Coins and gems, maps etc

		    	local totalTime = (mainFunc.ballBtnScreenCreate.levelTimeMinutes * 60) + mainFunc.ballBtnScreenCreate.levelTimeSeconds
		    	if myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["best_time_seconds_left"] < totalTime then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["best_time_seconds_left"] = totalTime
		    	end

		    	if mainFunc.thisLevelSettings.thisIsFirstAttempt then
		    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["first_time_seconds_left"] = totalTime
		    	end

			    if (mainFunc.thisLevelSettings.gemsGainedNamesArray) then
			    	myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"] = mainFunc.thisLevelSettings.gemsGainedNamesArray
			    end

			    if mainFunc.thisLevelSettings.gemsGainedNamesArray then
			    	if ( #mainFunc.thisLevelSettings.gemsGainedNamesArray > myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_gems"]) then
			    		myGameSettings[currentWorld]["levels"][currentLevel][currentMedal.."-achievements"]["purple_gems"] = #mainFunc.thisLevelSettings.gemsGainedNamesArray
			    	end
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

		    	if (mainFunc.thisLevelSettings.mapObtained) then
			    	myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["map_obtained"] = true
			    end

			    if (mainFunc.thisLevelSettings.compassObtained) then
			    	myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["compass_obtained"] = true
			    end

		    	--save ToolArray and ObjectArray settings
		    	for a=1, #mainFunc.thisLevelSettings.toolArray do
	    			--It's a tool
		        	if (mainFunc.thisLevelSettings.toolArray[a]["quantity"] == 0) then
		        		table.remove(mainFunc.thisLevelSettings.toolArray, a)
		        	else
		        		mainFunc.thisLevelSettings.toolArray[a]["created"] = "not-created"
		        	end

		        	if myGameSettings["toolsDiscovered"] == false then
						myGameSettings["toolsDiscovered"] = true
		        	end
		        end

		        for b=1, #mainFunc.thisLevelSettings.objectArray do
		        	if (mainFunc.thisLevelSettings.objectArray[b]["quantity"] == 0) then
		        		mainFunc.thisLevelSettings.objectArray:remove(mainFunc.thisLevelSettings.objectArray[b])
		        	else
		        		mainFunc.thisLevelSettings.objectArray[b]["created"] = "not-created"
		        	end

		        	if myGameSettings["shapesDiscovered"] == false then
						myGameSettings["shapesDiscovered"] = true
		        	end
		        end

		        for c=1, #mainFunc.thisLevelSettings.itemWasDiscoveredInLevel do
		        	local objectName = mainFunc.thisLevelSettings.itemWasDiscoveredInLevel[c]
		        	if myGameSettings["itemDiscovered"][objectName] == false then
						myGameSettings["itemDiscovered"][objectName] = true
		        	end
		        end

		        myTotalToolArray = mainFunc.thisLevelSettings.toolArray 
		        myTotalObjectArray = mainFunc.thisLevelSettings.objectArray
		    	saveTable(myTotalToolArray, "myTotalToolArray.json")
		    	saveTable(myTotalObjectArray, "myTotalObjectArray.json")

		    	myGameSettings["total_coins"] = myGameSettings["total_coins"] + mainFunc.allLevelSettings.gem_counter["coins"]

		    	myGameSettings["total_coins"] = myGameSettings["total_coins"] + (totalTime * mainFunc.allLevelSettings.coinsGainedPerTenthOfASecond)

		        myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "_gained"] = true

				if (mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["onLevelComplete"]) then
					mainFunc.levelConfigArray[currentWorld]["level" .. currentLevel][currentMedal]["onLevelComplete"]()
				end

		        saveTable(myGameSettings, "myGameSettings.json")

		    	-- prepare items to show in end screen

		    	mainFunc.medalScreenSlides = {}

		    	mainFunc.medalScreenSlides["lastSlide"] = {false}

				local toolsToShowInEndScreenArray = {}
				local toolPickedUp = false
				mainFunc.toolPickedUp = false
				mainFunc.toolOriginallyPickedUp = false

				local objectsToShowInEndScreenArray = {}
				local objectPickedUp = false
				mainFunc.objectPickedUp = false
				mainFunc.objectOriginallyPickedUp = false

		    	for a=1, #mainFunc.thisLevelSettings.toolArray do
		    		-- setting up which tools to show in final medalGainedScren
			        if mainFunc.thisLevelSettings.originalToolArray[a] then
						if mainFunc.thisLevelSettings.toolArray[a]["quantity"] > mainFunc.thisLevelSettings.originalToolArray[a]["quantity"] then
							toolPickedUp = true
							table.insert(toolsToShowInEndScreenArray, {a, mainFunc.thisLevelSettings.toolArray[a]["quantity"] - mainFunc.thisLevelSettings.originalToolArray[a]["quantity"]})
						end
					else
						if mainFunc.thisLevelSettings.toolArray[a]["quantity"] > 0 then
							toolPickedUp = true
							table.insert(toolsToShowInEndScreenArray, {a, mainFunc.thisLevelSettings.toolArray[a]["quantity"]})
						end
					end
					if toolPickedUp == true then
						mainFunc.medalScreenSlides["tools"] = {false}
					end
					mainFunc.toolOriginallyPickedUp = toolPickedUp
			        
		        end

		        for b=1, #mainFunc.thisLevelSettings.objectArray do

		        	--setting up which objects to show in final medalGainedScreen
		        	if mainFunc.thisLevelSettings.originalObjectArray[b] then
						if mainFunc.thisLevelSettings.objectArray[b]["quantity"] > mainFunc.thisLevelSettings.originalObjectArray[b]["quantity"] then
							objectPickedUp = true
							table.insert(objectsToShowInEndScreenArray, {b, mainFunc.thisLevelSettings.objectArray[b]["quantity"] - mainFunc.thisLevelSettings.originalObjectArray[b]["quantity"]})
						end
					else
						if mainFunc.thisLevelSettings.objectArray[b]["quantity"] > 0 then
							objectPickedUp = true
							table.insert(objectsToShowInEndScreenArray, {b, mainFunc.thisLevelSettings.objectArray[b]["quantity"]})
						end
					end

					mainFunc.objectsToShowInEndScreenArray = objectsToShowInEndScreenArray
					if objectPickedUp == true then
						mainFunc.medalScreenSlides["objects"] = {false}
					end
					mainFunc.objectOriginallyPickedUp = objectPickedUp
		        end

		        
		        if (myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "_gained"] == true) then
		        	mainFunc.thisLevelSettings.medalAlreadyGained = true
		        else
		        	local silverMedalCounter = 0
	    			local goldMedalCounter = 0
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

				        for a = 1, totalLevels do
				            if myGameSettings[key]["levels"][a]["silver_gained"] == true then
				                silverMedalCounter = silverMedalCounter + 1
				            end
				        end
				        
				    end

				    local thisGoldMedalCounter = goldMedalCounter
				    local thisSilverMedalCounter = silverMedalCounter

				    if (currentMedal == "silver") then
				    	thisSilverMedalCounter = thisSilverMedalCounter + 1
				    else
			    		thisGoldMedalCounter = thisGoldMedalCounter + 1
				    end

		        	for a = 1, #levelConfigScript.worldConfigArray do
	        			
					    local goldRequired = mainFunc.worldConfigArray[a][2]["gold"]
					    local silverRequired = mainFunc.worldConfigArray[a][2]["silver"]

					    if (thisSilverMedalCounter == silverRequired
					    and thisGoldMedalCounter == goldRequired) then
					    	mainFunc.medalScreenSlides["newWorld"] = {false}
					    	mainFunc.newWorldToShow = a
					   	end
		        	end
		        end

		        local function medalGainedEndLevel(thisMedalPiece, mainFunc)
		        	mainFunc.medalGainedScreen = display.newImageRect("images/central-images/Layout/somethingGainedScreen/" .. currentMedal .. "MedalGainedScreen.png", 434, 295)
		        	mainFunc.medalGainedScreen.alpha = 0
		        	mainFunc.medalGainedScreen.anchorX = 0.5
		        	mainFunc.medalGainedScreen.anchorY = 0.5
		        	mainFunc.medalGainedScreen.x = display.contentWidth / 2
		        	mainFunc.medalGainedScreen.y = display.contentHeight / 2
		        	mainFunc.medalGainedScreen.xScale = 0.1
		        	mainFunc.medalGainedScreen.yScale = 0.1
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen)
		        	thisMedalPiece:toFront()

		        	mainFunc.medalGainedScreen.heading = display.newImageRect("images/central-images/Layout/somethingGainedScreen/" .. currentMedal .. "MedalGainedScreen-Heading.png", 300, 32)
		        	mainFunc.medalGainedScreen.heading.alpha = 0
		        	mainFunc.medalGainedScreen.heading.anchorX = 0.5
		        	mainFunc.medalGainedScreen.heading.anchorY = 0.5
		        	mainFunc.medalGainedScreen.heading.x = mainFunc.medalGainedScreen.x
		        	mainFunc.medalGainedScreen.heading.y = mainFunc.medalGainedScreen.y - yCalc(115)
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.heading)

		        	mainFunc.medalGainedScreen.message1 = display.newImageRect("images/central-images/Layout/somethingGainedScreen/" .. currentMedal .. "MedalGainedScreen-Message1.png", 300, 32)
		        	mainFunc.medalGainedScreen.message1.alpha = 0
		        	mainFunc.medalGainedScreen.message1.anchorX = 0.5
		        	mainFunc.medalGainedScreen.message1.anchorY = 0.5
		        	mainFunc.medalGainedScreen.message1.x = mainFunc.medalGainedScreen.x
		        	mainFunc.medalGainedScreen.message1.y = mainFunc.medalGainedScreen.y - yCalc(70)
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.message1)


		        	-- if it's first time, do first time label too

		        	mainFunc.medalGainedScreen.nextButton = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-closeButton.png", 81, 44)
		        	mainFunc.medalGainedScreen.nextButton.alpha = 0
		        	mainFunc.medalGainedScreen.nextButton.anchorX = 0.5
		        	mainFunc.medalGainedScreen.nextButton.anchorY = 0.5
		        	mainFunc.medalGainedScreen.nextButton.x = mainFunc.medalGainedScreen.x + 147
		        	mainFunc.medalGainedScreen.nextButton.y = mainFunc.medalGainedScreen.y + yCalc(111)
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.nextButton)

		        	mainFunc.medalGainedScreen.toolsToShowInEndScreenArray = toolsToShowInEndScreenArray
					mainFunc.medalGainedScreen.toolPickedUp = toolPickedUp

					mainFunc.medalGainedScreen.objectsToShowInEndScreenArray = objectsToShowInEndScreenArray
					mainFunc.medalGainedScreen.objectPickedUp = objectPickedUp

		        	local gemsNotApplicable = true
		        	local coinsNotApplicable = true

	        		local totalGems = 0
	        		for z = 1, #shapeArrayParameters do
	        			if shapeArrayParameters[z]["type"] == "gem" and shapeArrayParameters[z]["subType"] == "purple" then
	        				totalGems = totalGems + 1
	        			end
	        			if shapeArrayParameters[z]["type"] == "gem" and shapeArrayParameters[z]["subType"] == "redCoin" then
	        				coinsNotApplicable = false
	        			end
	        		end
		        	if totalGems > 0 then
		        		gemsNotApplicable = false
		        	end
		        	mainFunc.medalGainedScreen.gemsNotApplicable = gemsNotApplicable
		        	mainFunc.medalGainedScreen.coinsNotApplicable = coinsNotApplicable

		        	local levelItems2ImageSheet = graphics.newImageSheet( mainFunc.allLevelSettings.levelItems2ImageSheet, mainFunc.allLevelSettings.levelItems2ImageSheetSettings)
    				local levelItems2SequenceData = mainFunc.allLevelSettings.levelItems2SequenceData

    				local itemsImageSheet = mainFunc.allLevelSettings.itemsImageSheet
    				local itemsSequenceData = mainFunc.allLevelSettings.itemsSequenceData

		        	if gemsNotApplicable == false then

		        		local gemCount = tostring(mainFunc.allLevelSettings.gem_counter["purple"])
		        		if mainFunc.allLevelSettings.gem_counter["purple"] < 10 then
		        			gemCount = '0' .. gemCount
		        		end
		        		local totalGemCount = tostring(totalGems)
		        		if (totalGems < 10) then
		        			totalGemCount = '0' .. totalGemCount
		        		end

				    	mainFunc.medalGainedScreen.GemIcons = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
				        mainFunc.medalGainedScreen.GemIcons:setSequence("purple")
				        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemIcons.anchorX = 0
						mainFunc.medalGainedScreen.GemIcons.anchorY = 1
				        mainFunc.medalGainedScreen.GemIcons.x = mainFunc.medalGainedScreen.x + 35
				        mainFunc.medalGainedScreen.GemIcons.y = mainFunc.medalGainedScreen.y - yCalc(20)
				        mainFunc.medalGainedScreen.GemIcons.xScale = 0.6
				        mainFunc.medalGainedScreen.GemIcons.yScale = 0.6
				        mainFunc.medalGainedScreen.GemIcons.alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemIcons)

				        mainFunc.medalGainedScreen.GemCounter = {}

				    	mainFunc.medalGainedScreen.GemCounter[1] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
				    	mainFunc.medalGainedScreen.GemCounter[1]:setSequence(string.sub(gemCount, 1, 1))
				        --silverGemCounterFirstDigit:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemCounter[1].anchorX = 0
						mainFunc.medalGainedScreen.GemCounter[1].anchorY = 1
				        mainFunc.medalGainedScreen.GemCounter[1].x = mainFunc.medalGainedScreen.x + 97
				        mainFunc.medalGainedScreen.GemCounter[1].y = mainFunc.medalGainedScreen.y - yCalc(29)
				        mainFunc.medalGainedScreen.GemCounter[1].xScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[1].yScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[1].alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemCounter[1])

				    	mainFunc.medalGainedScreen.GemCounter[2] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
				    	mainFunc.medalGainedScreen.GemCounter[2]:setSequence(string.sub(gemCount, 2, 2))
				        --silverGemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemCounter[2].anchorX = 0
						mainFunc.medalGainedScreen.GemCounter[2].anchorY = 1
				        mainFunc.medalGainedScreen.GemCounter[2].x = mainFunc.medalGainedScreen.x + 107
				        mainFunc.medalGainedScreen.GemCounter[2].y = mainFunc.medalGainedScreen.y - yCalc(29)
				        mainFunc.medalGainedScreen.GemCounter[2].xScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[2].yScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[2].alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemCounter[2])

				        mainFunc.medalGainedScreen.GemCounter[3] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
				    	mainFunc.medalGainedScreen.GemCounter[3]:setSequence("/")
				        --silverGemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemCounter[3].anchorX = 0
						mainFunc.medalGainedScreen.GemCounter[3].anchorY = 1
				        mainFunc.medalGainedScreen.GemCounter[3].x = mainFunc.medalGainedScreen.x + 117
				        mainFunc.medalGainedScreen.GemCounter[3].y = mainFunc.medalGainedScreen.y - yCalc(29)
				        mainFunc.medalGainedScreen.GemCounter[3].xScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[3].yScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[3].alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemCounter[3])

				        mainFunc.medalGainedScreen.GemCounter[4] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
				    	mainFunc.medalGainedScreen.GemCounter[4]:setSequence(string.sub(totalGemCount, 1, 1))
				        --silverGemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemCounter[4].anchorX = 0
						mainFunc.medalGainedScreen.GemCounter[4].anchorY = 1
				        mainFunc.medalGainedScreen.GemCounter[4].x = mainFunc.medalGainedScreen.x + 127
				        mainFunc.medalGainedScreen.GemCounter[4].y = mainFunc.medalGainedScreen.y - yCalc(29)
				        mainFunc.medalGainedScreen.GemCounter[4].xScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[4].yScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[4].alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemCounter[4])

				        mainFunc.medalGainedScreen.GemCounter[5] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
				    	mainFunc.medalGainedScreen.GemCounter[5]:setSequence(string.sub(totalGemCount, 2, 2))
				        --silverGemCounterSecondDigit:setReferencePoint(display.BottomLeftReferencePoint);
					    mainFunc.medalGainedScreen.GemCounter[5].anchorX = 0
						mainFunc.medalGainedScreen.GemCounter[5].anchorY = 1
				        mainFunc.medalGainedScreen.GemCounter[5].x = mainFunc.medalGainedScreen.x + 137
				        mainFunc.medalGainedScreen.GemCounter[5].y = mainFunc.medalGainedScreen.y - yCalc(29)
				        mainFunc.medalGainedScreen.GemCounter[5].xScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[5].yScale = 1.1
				        mainFunc.medalGainedScreen.GemCounter[5].alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.GemCounter[5])
		        	end

		        	mainFunc.medalGainedScreen.timeLabel = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-timeLabel.png", 150, 75)
		        	mainFunc.medalGainedScreen.timeLabel.alpha = 0
		        	mainFunc.medalGainedScreen.timeLabel.anchorX = 0.5
		        	mainFunc.medalGainedScreen.timeLabel.anchorY = 0.5
		        	mainFunc.medalGainedScreen.timeLabel.x = mainFunc.medalGainedScreen.x + 100
		        	mainFunc.medalGainedScreen.timeLabel.y = mainFunc.medalGainedScreen.y + yCalc(18)
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.timeLabel)

				    mainFunc.medalGainedScreen.TimeCounter = {}

				    local TimeCounterString = tostring("12m32.1")

			    	for a = 1, #TimeCounterString do
						mainFunc.medalGainedScreen.TimeCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
					    	mainFunc.medalGainedScreen.TimeCounter[a]:setSequence(string.sub(TimeCounterString, a, a))
					    	mainFunc.medalGainedScreen.TimeCounter[a].anchorX = 0
							mainFunc.medalGainedScreen.TimeCounter[a].anchorY = 1
					        mainFunc.medalGainedScreen.TimeCounter[a].xScale = 1.1
					        mainFunc.medalGainedScreen.TimeCounter[a].yScale = 1.1
					        mainFunc.medalGainedScreen.TimeCounter[a].alpha = 0
		        			mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.TimeCounter[a])

					        if a == 1 then
						        mainFunc.medalGainedScreen.TimeCounter[a].x = mainFunc.medalGainedScreen.x + 71
					        else
								mainFunc.medalGainedScreen.TimeCounter[a].x = mainFunc.medalGainedScreen.TimeCounter[a-1].x + 11
					        end

						    mainFunc.medalGainedScreen.TimeCounter[a].y = mainFunc.medalGainedScreen.y + yCalc(24)
					        if string.sub(TimeCounterString, a, a) == "." then
								mainFunc.medalGainedScreen.TimeCounter[a].y = mainFunc.medalGainedScreen.TimeCounter[a].y + yCalc(3)
					        end
			    	end
			    	mainFunc.globalImageCreateFunctions.createLevelTimeString(mainFunc.ballBtnScreenCreate.levelTimeSeconds, mainFunc.ballBtnScreenCreate.levelTimeMinutes, mainFunc.medalGainedScreen.TimeCounter, true)

			    	--if this is first time, show first time icon

		        	if coinsNotApplicable == false then
		        		mainFunc.medalGainedScreen.coinsLabel = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-CoinsLabel.png", 95, 27)
			        	mainFunc.medalGainedScreen.coinsLabel.alpha = 0
			        	mainFunc.medalGainedScreen.coinsLabel.anchorX = 0.5
			        	mainFunc.medalGainedScreen.coinsLabel.anchorY = 0.5
			        	mainFunc.medalGainedScreen.coinsLabel.x = mainFunc.medalGainedScreen.x + 100
			        	mainFunc.medalGainedScreen.coinsLabel.y = mainFunc.medalGainedScreen.y + yCalc(68)
			        	mainFunc.medalGainedScreen.coinsLabel.alpha = 0
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.coinsLabel)

						mainFunc.medalGainedScreen.CoinsIconArray = {}

						mainFunc.medalGainedScreen.CoinsIconArray["redCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"]:setSequence("red")
				        --mainFunc.medalGainedScreen.CoinsIconArray["redCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
					    	mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].anchorX = 0
							mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].anchorY = 1
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].x = mainFunc.medalGainedScreen.x + 53
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].y = mainFunc.medalGainedScreen.y + yCalc(80)
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].xScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].yScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].alpha = 0
				        mainFunc.medalGainedScreen.CoinsIconArray["redCoin"].state = "notYetShown"
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.CoinsIconArray["redCoin"])

				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"]:setSequence("blueCoin")
				        --mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
					    	mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].anchorX = 0
							mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].anchorY = 1
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].x = mainFunc.medalGainedScreen.x + 86
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].y = mainFunc.medalGainedScreen.y + yCalc(80)
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].xScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].yScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].alpha = 0
				        mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"].state = "notYetShown"
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.CoinsIconArray["blueCoin"])

				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"] = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"]:setSequence("purpleCoin")
				        --mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"]:setReferencePoint(display.BottomLeftReferencePoint);
					    	mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].anchorX = 0
							mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].anchorY = 1
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].x = mainFunc.medalGainedScreen.x + 118
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].y = mainFunc.medalGainedScreen.y + yCalc(80)
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].xScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].yScale = 0.44
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].alpha = 0
				        mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"].state = "notYetShown"
		        		mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.CoinsIconArray["purpleCoin"])
		        	end

		        	mainFunc.medalGainedScreen.finalCoinsLabel = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-finalCoinsLabel.png", 173, 69)
		        	mainFunc.medalGainedScreen.finalCoinsLabel.alpha = 0
		        	mainFunc.medalGainedScreen.finalCoinsLabel.anchorX = 0.5
		        	mainFunc.medalGainedScreen.finalCoinsLabel.anchorY = 0.5
		        	mainFunc.medalGainedScreen.finalCoinsLabel.x = mainFunc.medalGainedScreen.x + 85
		        	mainFunc.medalGainedScreen.finalCoinsLabel.y = mainFunc.medalGainedScreen.y + yCalc(18)
		        	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.finalCoinsLabel)

		        	mainFunc.medalGainedScreen.CoinsCounter = {}

				    local CoinsCounterString = "000,000"

			    	for a = 1, 7 do
						mainFunc.medalGainedScreen.CoinsCounter[a] = display.newSprite(MainBarNumbersImageSheet, MainBarNumbersSequenceData)
					    	mainFunc.medalGainedScreen.CoinsCounter[a]:setSequence(string.sub(CoinsCounterString, a, a))
					    	mainFunc.medalGainedScreen.CoinsCounter[a].anchorX = 0
							mainFunc.medalGainedScreen.CoinsCounter[a].anchorY = 1
					        mainFunc.medalGainedScreen.CoinsCounter[a].xScale = 1.1
					        mainFunc.medalGainedScreen.CoinsCounter[a].yScale = 1.1
					        mainFunc.medalGainedScreen.CoinsCounter[a].alpha = 0
		        			mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(mainFunc.medalGainedScreen.CoinsCounter[a])

					        if a == 1 then
						        mainFunc.medalGainedScreen.CoinsCounter[a].x = mainFunc.medalGainedScreen.x + 56
					        else
								mainFunc.medalGainedScreen.CoinsCounter[a].x = mainFunc.medalGainedScreen.CoinsCounter[a-1].x + 11
					        end

						    mainFunc.medalGainedScreen.CoinsCounter[a].y = mainFunc.medalGainedScreen.y + yCalc(24)
			    	end

			    	local function updateCoinsDisplay (newVal, makeVisible)
				    	if #newVal > 3 then
				    		local firstHalf = string.sub(newVal, 0, #newVal - 3)
				    		local secondHalf = string.sub(newVal, #newVal - 2, #newVal)
				    		newVal = firstHalf .. "," .. secondHalf
				    	end

				    	mainFunc.medalGainedScreen.CoinsCounterLength = #newVal - 1
				    	for a = 1, #newVal do
					    	mainFunc.medalGainedScreen.CoinsCounter[7 - (a - 1)]:setSequence(string.sub(newVal, #newVal - (a - 1), #newVal - (a - 1)))
				    	end

				    	if (makeVisible) then
					    	for a = 7 - mainFunc.medalGainedScreen.CoinsCounterLength, 7 do
								transition.to(mainFunc.medalGainedScreen.CoinsCounter[a], {alpha = 1, time = 200})
					    	end
					    end
				    end

				    mainFunc.medalGainedScreen.VisibleCoinsCounterValue = mainFunc.thisLevelSettings.originalCoins
				    CoinsCounterString = tostring(mainFunc.medalGainedScreen.VisibleCoinsCounterValue)
				    updateCoinsDisplay(CoinsCounterString, false)


		        	local function showMedalScreenTransitions (thisMedalPiece)
		        		transition.to(thisMedalPiece, {x = (display.contentWidth/2) - 130, time = 450})
	        			transition.to(mainFunc.medalGainedScreen.heading, {alpha = 1, time = 450, onComplete = function ()

	        				mainFunc.medalGainedScreen.nextButton.currentState = "firstSlide"
	        				transition.to(mainFunc.medalGainedScreen.nextButton, {alpha = 1, time = 450})
	        				mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel = false
	        				mainFunc.medalGainedScreen.nextButton:addEventListener("tap", function () medalGainedScreenNextButton(mainFunc, mainFunc.medalGainedScreen) end)

	        				if mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel == false then

		        				transition.to(mainFunc.medalGainedScreen.timeLabel, {alpha = 1, time = 450})
		        				for a = 1, #mainFunc.medalGainedScreen.TimeCounter do
		        					transition.to(mainFunc.medalGainedScreen.TimeCounter[a], {alpha = mainFunc.medalGainedScreen.TimeCounter[a].shouldBeAlpha, time = 450})
		        				end
		        				if coinsNotApplicable == false then
		        					transition.to(mainFunc.medalGainedScreen.coinsLabel, {alpha = 1, time = 450})
		        					for key, val in pairs(mainFunc.medalGainedScreen.CoinsIconArray) do
		        						if mainFunc.allLevelSettings.gem_counter[key] > 0 then
		        							transition.to(mainFunc.medalGainedScreen.CoinsIconArray[key], {alpha = 1, time = 450})
		        						end
		        					end
		        				end
		        				if gemsNotApplicable == false then
		        					transition.to(mainFunc.medalGainedScreen.GemIcons, {alpha = 1, time = 450})
		        					for a = 1, #mainFunc.medalGainedScreen.GemCounter do
		        						transition.to(mainFunc.medalGainedScreen.GemCounter[a], {alpha = 1, time = 450})
			        				end
		        				end
		        				mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(mainFunc.medalGainedScreen.message1, {alpha = 1, time = 450, onComplete = function ()
		        					mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
		        					if mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel == false then

			        					mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(500, function ()
			        						mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
			        						mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(thisMedalPiece, {alpha = 0, time = 500, onComplete = function ()
			        							mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
			        							if gemsNotApplicable == false then
						        					transition.to(mainFunc.medalGainedScreen.GemIcons, {x = (display.contentWidth/2) - 175, time = 550})
						        					for a = 1, #mainFunc.medalGainedScreen.GemCounter do
						        						transition.to(mainFunc.medalGainedScreen.GemCounter[a], {x = contentCentreX - 113 + (10 * (a - 1)), time = 550})
							        				end
						        				end
				        						if coinsNotApplicable == false then
						        					transition.to(mainFunc.medalGainedScreen.coinsLabel, {x = (display.contentWidth/2) - 110, time = 550})
						        					for key, val in pairs(mainFunc.medalGainedScreen.CoinsIconArray) do
						        						local nextX = 157
						        						if key == "blueCoin" then
						        							nextX = 124
						        						elseif key == "purpleCoin" then
						        							nextX = 92
						        						end
					        							transition.to(mainFunc.medalGainedScreen.CoinsIconArray[key], {x = (display.contentWidth/2) - nextX, time = 550})
						        					end
						        				end

						        				for a = 1, #mainFunc.medalGainedScreen.TimeCounter do
						        					local targetX = 139
						        					if (a ~= 1) then
						        						targetX = 139 - ( (a - 1) * 11)
						        					end
						        					transition.to(mainFunc.medalGainedScreen.TimeCounter[a], {x = (display.contentWidth/2) - targetX, time = 550})
						        				end
				        						mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(mainFunc.medalGainedScreen.timeLabel, {x = (display.contentWidth/2) - 110, time = 550, onComplete = function ()
				        							mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
				        							mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(500, function ()
				        								mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
				        								if mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel == false then
					        								mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(mainFunc.medalGainedScreen.finalCoinsLabel, {alpha = 1, time = 400, onComplete = function ()
					        									mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
					        									mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(250, function ()
					        										mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
					        										for a = 7 - mainFunc.medalGainedScreen.CoinsCounterLength, 7 do
																		mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(mainFunc.medalGainedScreen.CoinsCounter[a], {alpha = 1, time = 200, onComplete = function ()
																			mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
																		end})
															    	end

															    	function addGemsToCoins ()
															    		local totalGemsGained = mainFunc.allLevelSettings.gem_counter["purple"]
															    		local totalCoinsToAdd = totalGemsGained * mainFunc.allLevelSettings.coinsGainedPerGem
															    		mainFunc.medalGainedScreen.VisibleCoinsCounterValue = mainFunc.medalGainedScreen.VisibleCoinsCounterValue + totalCoinsToAdd
															    		local newCoinVal = mainFunc.medalGainedScreen.VisibleCoinsCounterValue
															    		updateCoinsDisplay(tostring(newCoinVal), true)

															    		local dummyGemIcon = display.newSprite(levelItems2ImageSheet, levelItems2SequenceData)
																        dummyGemIcon:setSequence("purple")
																        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
																	    dummyGemIcon.anchorX = 0
																		dummyGemIcon.anchorY = 1
																        dummyGemIcon.x = (display.contentWidth/2) - 165
																        dummyGemIcon.y = mainFunc.medalGainedScreen.y - yCalc(20)
																        dummyGemIcon.xScale = 0.6
																        dummyGemIcon.yScale = 0.6
																        dummyGemIcon.alpha = 0.8
																        mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(dummyGemIcon, {x = mainFunc.medalGainedScreen.finalCoinsLabel.x, y = mainFunc.medalGainedScreen.finalCoinsLabel.y + 7, alpha = 0.4, time = 300, onComplete = function ()
																        	mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
																        	dummyGemIcon:removeSelf()
																        	dummyGemIcon = nil
																        end})
															    		
															    		mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(1000, function ()
															    			mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
															    			addTimeToCoins()
															    		end)
															    	end

															    	function addTimeToCoins ()

															    		local totalCoinsToAdd = totalTime * mainFunc.allLevelSettings.coinsGainedPerTenthOfASecond
															    		mainFunc.medalGainedScreen.VisibleCoinsCounterValue = mainFunc.medalGainedScreen.VisibleCoinsCounterValue + totalCoinsToAdd
															    		local newCoinVal = mainFunc.medalGainedScreen.VisibleCoinsCounterValue
															    		updateCoinsDisplay(tostring(newCoinVal), true)

															    		local dummyTimeIcon = display.newSprite(itemsImageSheet, itemsSequenceData)
																        dummyTimeIcon:setSequence("clock")
																        --silverGemIcons:setReferencePoint(display.BottomLeftReferencePoint);
																	    dummyTimeIcon.anchorX = 0
																		dummyTimeIcon.anchorY = 1
																        dummyTimeIcon.x = (display.contentWidth/2) - 165
																        dummyTimeIcon.y = mainFunc.medalGainedScreen.y + yCalc(33)
																        dummyTimeIcon.xScale = 0.5
																        dummyTimeIcon.yScale = 0.5
																        dummyTimeIcon.alpha = 0.8
																        mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(dummyTimeIcon, {x = mainFunc.medalGainedScreen.finalCoinsLabel.x, y = mainFunc.medalGainedScreen.finalCoinsLabel.y + 7, alpha = 0.4, time = 300, onComplete = function ()
																        	mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
																        	dummyTimeIcon:removeSelf()
																        	dummyTimeIcon = nil
																        end})

															    		if coinsNotApplicable == false then
															    			mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(1000, function ()
															    				mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
															    				addColouredCoinsToCoins()
															    			end)
															    		else
															    			mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(1000, function ()
														    					mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
															    				finalLevelBonusHiding()
															    			end)
															    		end
															    	end

															    	function addColouredCoinsToCoins ()
															    		local coinsArray = {"redCoin", "blueCoin", "purpleCoin"}
															    		local function addColouredCoin(index)
															    			local coinName = coinsArray[index]
															    			local function goToNextCoin(index)
															    				if mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel == false then
																    				if index < #coinsArray then
																	    				addColouredCoin(index + 1)
																	    			elseif index == #coinsArray then
																						mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(1000, function ()
																	    					mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
																		    				finalLevelBonusHiding()
																		    			end)
																	    			end
																    			end
															    			end
															    			if mainFunc.allLevelSettings.gem_counter[coinName] > 0 then
															    				mainFunc.medalGainedScreen.CoinsIconArray[coinName]:toFront()
															    				mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition + 1] = transition.to(mainFunc.medalGainedScreen.CoinsIconArray[coinName], {x = mainFunc.medalGainedScreen.finalCoinsLabel.x, y = mainFunc.medalGainedScreen.finalCoinsLabel.y + 7, alpha = 0.4, time = 300, onComplete = function ()
															    					mainFunc.thisLevelSettings.miscellaneousTransition[#mainFunc.thisLevelSettings.miscellaneousTransition] = nil
															    					mainFunc.medalGainedScreen.CoinsIconArray[coinName].alpha = 0
															    					local coinsToAdd
															    					if coinName == "redCoin" then
															    						coinsToAdd = mainFunc.allLevelSettings.coinsGainedForRedCoin
															    					elseif coinName == "blueCoin" then
															    						coinsToAdd = mainFunc.allLevelSettings.coinsGainedForBlueCoin
															    					elseif coinName == "purpleCoin" then
															    						coinsToAdd = mainFunc.allLevelSettings.coinsGainedForPurpleCoin
															    					end
																		    		mainFunc.medalGainedScreen.VisibleCoinsCounterValue = mainFunc.medalGainedScreen.VisibleCoinsCounterValue + coinsToAdd
																		    		local newCoinVal = mainFunc.medalGainedScreen.VisibleCoinsCounterValue
																		    		updateCoinsDisplay(tostring(newCoinVal), true)
															    					mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(100, function ()
															    						mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
															    						goToNextCoin(index)
															    					end)
														    					end})
															    			else
															    				goToNextCoin(index)
															    			end
															    		end

															    		addColouredCoin(1)
															    	end

															    	function finalLevelBonusHiding ()
															    		timer.performWithDelay(250, function ()
							        										if gemsNotApplicable == false then
													        					transition.to(mainFunc.medalGainedScreen.GemIcons, {alpha = 0, time = 450})
													        					for a = 1, #mainFunc.medalGainedScreen.GemCounter do
													        						transition.to(mainFunc.medalGainedScreen.GemCounter[a], {alpha = 0, time = 450})
														        				end
													        				end
											        						if coinsNotApplicable == false then
													        					transition.to(mainFunc.medalGainedScreen.coinsLabel, {alpha = 0, time = 450})
													        					for key, val in pairs(mainFunc.medalGainedScreen.CoinsIconArray) do
												        							transition.to(mainFunc.medalGainedScreen.CoinsIconArray[key], {alpha = 0, time = 450})
													        					end
													        				end
							        										transition.to(mainFunc.medalGainedScreen.timeLabel, {alpha = 0, time = 500})
							        										for a = 1, #mainFunc.medalGainedScreen.TimeCounter do
													        					transition.to(mainFunc.medalGainedScreen.TimeCounter[a], {alpha = 0, time = 500})
													        				end
													        				for a = 7 - mainFunc.medalGainedScreen.CoinsCounterLength, 7 do
																				transition.to(mainFunc.medalGainedScreen.CoinsCounter[a], {alpha = 0, time = 200})
																	    	end
							        										transition.to(mainFunc.medalGainedScreen.finalCoinsLabel, {alpha = 0, time = 500, onComplete = function ()
							        											transition.to(mainFunc.medalGainedScreen.message1, {alpha = 0, time = 500})

							        											if mainFunc.medalGainedScreen.nextButton.firstSlideShouldCancel == false then
									        										--if they have picked up items, show it
										        									if (mainFunc.medalScreenSlides["tools"]) then
										        										showToolsPickedUp(toolsToShowInEndScreenArray, mainFunc)
										        									elseif (mainFunc.medalScreenSlides["objects"]) then
										        										showObjectsPickedUp(objectsToShowInEndScreenArray, mainFunc)
										        									else

										        									-- or if there is a third thing that is supposed to show
										        									-- on this level, (from level config array), then show it

										        									-- or go back to main menu
										        										mainFunc.medalGainedScreen.nextButton.prevState = "firstSlide"
										        										hideLastSlide(mainFunc, false)
										        									end
									        									end
								        									end})
							        									end)
															    	end

															    	mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer + 1] = timer.performWithDelay(1000, function () 
															    		mainFunc.thisLevelSettings.miscellaneousTimer[#mainFunc.thisLevelSettings.miscellaneousTimer] = nil
															    		if gemsNotApplicable == false and mainFunc.allLevelSettings.gem_counter["purple"] > 0 then
															    			addGemsToCoins()
																    	else
																    		addTimeToCoins()
																    	end
															    	end)
															    	
					        									end)
					        								end})
														end
				        							end)
				        						end})
			        						end})
			        					end)

									end
				        			
				        		end})

							end

	        			end})
					end

					transition.to(thisMedalPiece, {xScale = 1.35, yScale = 1.35, time = 500, onComplete = function ()
						transition.to(thisMedalPiece, {xScale = 1.25, yScale = 1.25, time = 500, onComplete = function ()
							transition.to(thisMedalPiece, {xScale = 1.45, yScale = 1.45, time = 500, onComplete = function ()
								thisMedalPiece:toFront()
							end})
						end})
					end})
					thisMedalPiece.anchorX = 0.5
					thisMedalPiece.anchorY = 0.5
					local thisScreenXCentre =(display.contentWidth / 2)
					local thisScreenYCentre = (display.contentHeight / 2)
					transition.to(thisMedalPiece, {x = display.contentWidth / 2, y = display.contentHeight / 2, time = 1500, onComplete = function ()
						transition.to(thisMedalPiece, {xScale = 1.6, yScale = 1.6, time = 500})
						transition.to(mainFunc.medalGainedScreen, {alpha = 1, time = 150})
			        	transition.to(mainFunc.medalGainedScreen, {yScale = 1, xScale = 1, time = 300, onComplete = function ()
			        		timer.performWithDelay(700, function ()
			        			mainFunc.thisFan = thisMedalPiece
								showMedalScreenTransitions(thisMedalPiece)
			        		end)
			        	end})
					end})
		        end

		        timer.performWithDelay(350, function () medalGainedEndLevel(thisFan.medalPiece, mainFunc) end)
		    end
	    end
	end
    
end
	t.fanCentering = fanCentering

local prepareForFanCentering = function (obj, shapeIndex, fanCenterTime, fanCentering, mainFunc, shapeArray, shapeArrayParameters)
    mainFunc.tm[obj.projectileType][obj.relevantArrayIndex]:cancelAll()
    obj.autoFanCounter = 1
    obj.fanCenteringCounter = 0
    shapeArray[shapeIndex].type = shapeArrayParameters[shapeIndex]["type"];
    fanCentering(obj, shapeArray[shapeIndex], fanCenterTime, mainFunc)
    --bullet[a]:setSequence(bullet[a].direction)
    if not hasValue({ "simple", "backFire", "characterChangePoint", "switch" }, shapeArrayParameters[shapeIndex]["type"]) then
    	obj.direction = shapeArray[shapeIndex].direction
    end
    
    if (obj == mainFunc.ballBtnScreenCreate.ball) then
        mainFunc.allLevelSettings.isBallMovingState = "false"
        mainFunc.allLevelSettings.shouldBallMoveState = "false"
        shapeArray[shapeIndex].isBallPresent = true

        obj:setSequence(obj.direction)
    end
    
    if shapeArrayParameters[shapeIndex]["type"] == "spitter" then
        spitterCounter = 0
    end
end

local gemCollision = function (event, mainFunc)
	local target = event.target;

	if event.other == mainFunc.ballBtnScreenCreate.ball
    and mainFunc.allLevelSettings.gemCounter == 0 then
        local function addBackGemCounter ()
            mainFunc.allLevelSettings.gemCounter = 0 
        end 

		local handleGemTransition = function ()
			target.alpha = 0
			timer.performWithDelay(1, function ()
				target.x = 9000
				target.y = 9000
				physics.removeBody(event.target)
			end)

			if (target.gemType == "purple") then
				target.circle.xScale = 0.5;
				target.circle.yScale = 0.5;
				target.circle.alpha = 0.7;
			else
				target.backBoard.alpha = 0.7
				target.backBoard.xScale = 0.7
				target.backBoard.yScale = 0.7
			end
		end

        local hideGemsLabels = function ()
			if (event.target.gemType == "purple") then
        		mainFunc.ballBtnScreenCreate.hideGemsLabelTransition = transition.to(mainFunc.ballBtnScreenCreate.showGemsLabel, {y = mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150, onComplete = function ()
	        		mainFunc.ballBtnScreenCreate.hideGemsLabelTransition = nil
	        		mainFunc.ballBtnScreenCreate.gemsLabelCounterTimer = timer.performWithDelay(1000, function ()
	        			mainFunc.ballBtnScreenCreate.gemsLabelCounterTimer = nil

	        			transition.to(mainFunc.ballBtnScreenCreate.showGemsLabel, {y = mainFunc.ballBtnScreenCreate.showGemsLabel.y - mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150})
	    				transition.to(mainFunc.ballBtnScreenCreate.showGemsLabel.gemIcon, {y = mainFunc.ballBtnScreenCreate.showGemsLabel.gemIcon.y - mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150})
			        	transition.to(mainFunc.ballBtnScreenCreate.gemCounterFirstDigit, {y = mainFunc.ballBtnScreenCreate.gemCounterFirstDigit.y - mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150})
	        			transition.to(mainFunc.ballBtnScreenCreate.gemCounterSecondDigit, {y = mainFunc.ballBtnScreenCreate.gemCounterSecondDigit.y - mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150})
	        			
        				mainFunc.ballBtnScreenCreate.showGemsLabel.state = "hidden"
	        		end)
	        	end})
			else
				mainFunc.ballBtnScreenCreate.hideCoinsLabelTransition = transition.to(mainFunc.ballBtnScreenCreate.showCoinsLabel, {y = mainFunc.ballBtnScreenCreate.showGemsLabel.contentHeight, time = 150, onComplete = function ()
	        		mainFunc.ballBtnScreenCreate.hideCoinsLabelTransition = nil
	        		mainFunc.ballBtnScreenCreate.coinsLabelCounterTimer = timer.performWithDelay(1000, function ()
	        			mainFunc.ballBtnScreenCreate.coinsLabelCounterTimer = nil

			        	for key,val in pairs(mainFunc.ballBtnScreenCreate.coinIcons) do
			        		transition.to(mainFunc.ballBtnScreenCreate.coinIcons[key], {y = mainFunc.ballBtnScreenCreate.coinIcons[key].y - mainFunc.ballBtnScreenCreate.showCoinsLabel.contentHeight, time = 150})
			       		end
	        			transition.to(mainFunc.ballBtnScreenCreate.showCoinsLabel, {y = mainFunc.ballBtnScreenCreate.showCoinsLabel.y - mainFunc.ballBtnScreenCreate.showCoinsLabel.contentHeight, time = 150})
	        			
        				mainFunc.ballBtnScreenCreate.showCoinsLabel.state = "hidden"
	        		end)
	        	end})
			end
    	end

        local showGemsLabels = function ()

        	if (event.target.gemType == "purple") then
        		if mainFunc.ballBtnScreenCreate.hideGemsLabelTransition ~= nil then
	        		transition.cancel(mainFunc.ballBtnScreenCreate.hideGemsLabelTransition)
	        	end
	        	if mainFunc.ballBtnScreenCreate.gemsLabelCounterTimer ~= nil then
	        		timer.cancel(mainFunc.ballBtnScreenCreate.gemsLabelCounterTimer)
	        	end
        	
        		mainFunc.ballBtnScreenCreate.showGemsLabel.alpha = 1
        		mainFunc.ballBtnScreenCreate.showGemsLabel.state = "showing"
        		mainFunc.labelToRemove = mainFunc.ballBtnScreenCreate.showGemsLabel
        		
        		mainFunc.allLevelSettings.gem_counter["coins"] = mainFunc.allLevelSettings.gem_counter["coins"] + mainFunc.allLevelSettings.coinsGainedPerGem
        		if (mainFunc.thisLevelSettings.gemsGainedNamesArray) then

        		else
        			mainFunc.thisLevelSettings.gemsGainedNamesArray = myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"]["gems_gained_array"]
        		end
        		local gemExistsInGemsGainedArray = false
        		for a = 1, #mainFunc.thisLevelSettings.gemsGainedNamesArray do
        			if mainFunc.thisLevelSettings.gemsGainedNamesArray[a] == event.target.fullName then
						gemExistsInGemsGainedArray = true
        			end
        		end
        		if gemExistsInGemsGainedArray == false then
        			table.insert(mainFunc.thisLevelSettings.gemsGainedNamesArray, event.target.fullName)
        		end

        		-- change display things

        		local gemCounterString = tostring(mainFunc.allLevelSettings.gem_counter["purple"])
        		if mainFunc.allLevelSettings.gem_counter["purple"] > 9 then
        			mainFunc.ballBtnScreenCreate.gemIconCounterLabel[1]:setSequence(string.sub(gemCounterString, 1, 1) )
        			mainFunc.ballBtnScreenCreate.gemIconCounterLabel[2]:setSequence(string.sub(gemCounterString, 2, 2)  )
        		else
        			mainFunc.ballBtnScreenCreate.gemIconCounterLabel[2]:setSequence(gemCounterString)
        		end

        		local secondDigit = (mainFunc.allLevelSettings.gem_counter["purple"] % 10);
        		local firstDigit = (mainFunc.allLevelSettings.gem_counter["purple"] - secondDigit) / 10;

    			mainFunc.ballBtnScreenCreate.gemCounterSecondDigit:removeSelf()
    			mainFunc.ballBtnScreenCreate.gemCounterSecondDigit = nil
    			mainFunc.ballBtnScreenCreate.gemCounterSecondDigit = gemCounter_SecondDigit(false, secondDigit, mainFunc.ballBtnScreenCreate.showGemsLabel.x);

        		if mainFunc.allLevelSettings.gem_counter["purple"] > 9 then
        			if (secondDigit == 0) then
        				mainFunc.ballBtnScreenCreate.gemCounterFirstDigit:removeSelf()
	        			mainFunc.ballBtnScreenCreate.gemCounterFirstDigit = nil
	        			mainFunc.ballBtnScreenCreate.gemCounterFirstDigit = gemCounter_FirstDigit(false, firstDigit,  mainFunc.ballBtnScreenCreate.showGemsLabel.x);
        			end
        			mainFunc.ballBtnScreenCreate.gemCounterFirstDigit.alpha = 1
        		end

        		mainFunc.ballBtnScreenCreate.gemIcon:toFront()

        		for a = 1, #mainFunc.ballBtnScreenCreate.gemIconCounterLabel do
        			mainFunc.ballBtnScreenCreate.gemIconCounterLabel[a].alpha = 1
        		end
        		mainFunc.ballBtnScreenCreate.showGemsLabel.gemIcon.alpha = 1
        		mainFunc.ballBtnScreenCreate.gemCounterSecondDigit.alpha = 1

        		transition.to(mainFunc.ballBtnScreenCreate.showGemsLabel.gemIcon, {y = 30, time = 150})

        		transition.to(mainFunc.ballBtnScreenCreate.gemCounterFirstDigit, {y = 20, time = 150})
        		transition.to(mainFunc.ballBtnScreenCreate.gemCounterSecondDigit, {y = 20, time = 150})
        	elseif (event.target.gemType ~= "purple") then

	        	if mainFunc.ballBtnScreenCreate.hideCoinsLabelTransition ~= nil then
	        		transition.cancel(mainFunc.ballBtnScreenCreate.hideCoinsLabelTransition)
	        	end
	        	if mainFunc.ballBtnScreenCreate.coinsLabelCounterTimer ~= nil then
	        		timer.cancel(mainFunc.ballBtnScreenCreate.coinsLabelCounterTimer)
	        	end

        		mainFunc.ballBtnScreenCreate.showCoinsLabel.alpha = 1
        		mainFunc.ballBtnScreenCreate.showCoinsLabel.state = "showing"
        		mainFunc.labelToRemove = mainFunc.ballBtnScreenCreate.showCoinsLabel
				
        		if event.target.gemType == "redCoin" then
        			mainFunc.allLevelSettings.gem_counter["coins"] = mainFunc.allLevelSettings.gem_counter["coins"] + mainFunc.allLevelSettings.coinsGainedForRedCoin
        		elseif event.target.gemType == "blueCoin" then
        			mainFunc.allLevelSettings.gem_counter["coins"] = mainFunc.allLevelSettings.gem_counter["coins"] + mainFunc.allLevelSettings.coinsGainedForBlueCoin
        		elseif event.target.gemType == "purpleCoin" then
        			mainFunc.allLevelSettings.gem_counter["coins"] = mainFunc.allLevelSettings.gem_counter["coins"] + mainFunc.allLevelSettings.coinsGainedForPurpleCoin
        		end
        		mainFunc.ballBtnScreenCreate.pauseScreenCoins[event.target.gemType].alpha = 1

        		for a = 1, #mainFunc.ballBtnScreenCreate.coinIcons do
        			if (mainFunc.ballBtnScreenCreate.coinIcons[a].state == "shown") then
        				mainFunc.ballBtnScreenCreate.coinIcons[a].alpha = 1
        			end
        		end
        		for key,val in pairs(mainFunc.ballBtnScreenCreate.coinIcons) do
        			if (mainFunc.ballBtnScreenCreate.coinIcons[key].state == "shown") then
        				mainFunc.ballBtnScreenCreate.coinIcons[key].alpha = 1
        			end
        		end

        		mainFunc.ballBtnScreenCreate.coinIcons[event.target.gemType].alpha = 1
        		mainFunc.ballBtnScreenCreate.coinIcons[event.target.gemType].state = "shown"
        		for key,val in pairs(mainFunc.ballBtnScreenCreate.coinIcons) do
			        transition.to(mainFunc.ballBtnScreenCreate.coinIcons[key], {y = 23, time = 150})
    			end
        		
    		end

    		hideGemsLabels();
    	end

        target:removeEventListener("collision", mainFunc.gemCollisionListener)
        mainFunc.allLevelSettings.gemCounter = 1

        mainFunc.allLevelSettings.gem_counter[target.gemType] = mainFunc.allLevelSettings.gem_counter[target.gemType] + 1

		handleGemTransition();
    	showGemsLabels();

        timer.performWithDelay(50, addBackGemCounter)
    end
end
	t.gemCollision = gemCollision

local closeItemGainedScreenFunction = function (mainFunc, shapeArray, shapeArrayParameters)
	if (mainFunc.allLevelSettings.itemBagIsOpen == true) then
		local isSingleItem = false
		mainFunc.allLevelSettings.itemBagIsOpen = false
		screen = mainFunc.ballBtnScreenCreate.itemGainedScreen
		if #screen.itemArray == 1 then
			isSingleItem = true
		end

		for a = 1, #screen.itemArray do
			thisItem = screen.itemArray[a]

			if thisItem.displayObjects then
				if thisItem.displayObjects["directionLabel"] then
					for b = 1, #thisItem.displayObjects["directionLabel"] do
	            		thisItem.displayObjects["directionLabel"][b]:removeSelf()
	            		thisItem.displayObjects["directionLabel"][b] = nil
	                end
				end
				if thisItem.displayObjects["text"] then
					for b = 1, #thisItem.displayObjects["text"] do
	            		thisItem.displayObjects["text"][b]:removeSelf()
	            		thisItem.displayObjects["text"][b] = nil
	                end
				end
				if thisItem.displayObjects["counterNumber"] then
					--transition.to(thisItem.displayObjects["counterNumber"], {alpha = 0, time = 70})
					thisItem.displayObjects["counterNumber"]:removeSelf()
				end
			end

			transition.to(thisItem, {alpha = 0, time = 70, onComplete = function ()
				thisItem:removeSelf()
			end})
		end

	    transition.to(screen, {alpha = 0, time = 100, onComplete = function ()
	        screen.itemGainedText.alpha = 0
	        screen.itemGainedText:removeSelf()

	        screen.closeButton.alpha = 0
	        screen.closeButton:removeSelf()

	        screen:setFillColor(255, 255, 255)

	        if isSingleItem and myGameSettings["tutorialDone"][screen.itemName] == false then
	        	mainFunc.tutorialPopUp = {}
	        	mainFunc.popUpTimer = {}

	        	mainFunc.popUpIntroTutorial(mainFunc, 1, screen.itemName, mainFunc.allLevelSettings.tutorialPopUpParams[screen.itemName], false)
	    	end
	    end})

	    if isSingleItem == false or myGameSettings["tutorialDone"][screen.itemName] == true then
		    local function delayedAddBackListeners ()

			    mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
			    
			    mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

			    mainFunc.buttonListenerScript.addBackButtonListenersForItemGained(mainFunc)

			    mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay.alpha = 0
	        	mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
	        	mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)

			end

			timer.performWithDelay(300, delayedAddBackListeners)

	    	if mainFunc.thisLevelSettings.itemBagButtonsVisible then
		        mainFunc.ballBtnScreenCreate.itemBtn:addEventListener( "tap", mainFunc.buttonListener )
	    		transition.to(mainFunc.ballBtnScreenCreate.itemBtn, {alpha=1, time=400})
	    		if (mainFunc.ballBtnScreenCreate.itemBtn.img
	    		and mainFunc.ballBtnScreenCreate.itemBtn.img ~= nil) then
	    			transition.to(mainFunc.ballBtnScreenCreate.itemBtn.img, {alpha=1, time=400})
	    		end
	    		
	    		transition.to(mainFunc.ballBtnScreenCreate.itemBagBtn, {alpha=1, time=400})
				mainFunc.ballBtnScreenCreate.itemBagBtn:addEventListener( "tap", mainFunc.buttonListener )
		        mainFunc.thisLevelSettings.hasToolArray = true
		    end

		    if mainFunc.thisLevelSettings.mapObtained == true then
	    		--transition.to(mainFunc.ballBtnScreenCreate.playBtn, {alpha=1, time=400})
		    end
		end
	end
end
	t.closeItemGainedScreenFunction = closeItemGainedScreenFunction

local itemGainedFunction = function (mainFunc, shapeArray, shapeArrayParameters, itemType, itemLabel, relevantShapeArrayIndex, relevantToolArrayCounter)
    if (mainFunc.allLevelSettings.itemBagIsOpen == false and itemLabel ~= 'coins') then
    	display.getCurrentStage():setFocus( nil )
        mainFunc.allLevelSettings.itemBagIsOpen = true

    	mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay.alpha = 0.05
        mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballBtnScreenCreate.itemBagScreen.itemBagScreenOverlay:addEventListener("touch", mainFunc.dummyListener)

    	local screen = mainFunc.ballBtnScreenCreate.itemGainedScreen
    	mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(screen)

		screen.closeButton = display.newImageRect("images/central-images/Layout/somethingGainedScreen/medalGainedScreen-closeButton.png", 81, 44)
		screen.closeButton.y = screen.contentHeight - 51
		screen.closeButton.x = screen.x + 147
		screen.closeButton.alpha = 0
		mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(screen.closeButton)
		screen.closeButton:toFront()

    	screen.itemArray = {}
    	screen.itemYVal = 165
    	if relevantShapeArrayIndex ~= nil then
    		-- this is an item-present, multiple items
    		local itemNum = #shapeArrayParameters[relevantShapeArrayIndex][8]
    		if #shapeArrayParameters[relevantShapeArrayIndex][8] > 5 then
    			itemNum = 5
    		end
    		screen.itemXVal = display.contentWidth/2 - (28 * itemNum)
    		screen.originalItemXVal = display.contentWidth/2 - (28 * itemNum)
    		if #shapeArrayParameters[relevantShapeArrayIndex][8] > 5 then
	    		screen.itemYVal = 130
	    	end
    	else
    		screen.itemXVal = 170
    		screen.originalItemXVal = 170
    	end

    	if mainFunc.thisLevelSettings.itemBagButtonsVisible then
	        mainFunc.ballBtnScreenCreate.itemBtn:removeEventListener( "touch", mainFunc.buttonListener )
    		transition.to(mainFunc.ballBtnScreenCreate.itemBtn, {alpha=0, time=200})
    		if (mainFunc.ballBtnScreenCreate.itemBtn.img
    		and mainFunc.ballBtnScreenCreate.itemBtn.img ~= nil) then
    			transition.to(mainFunc.ballBtnScreenCreate.itemBtn.img, {alpha=0, time=400})
    		end
			mainFunc.ballBtnScreenCreate.itemBtn:removeEventListener( "touch", mainFunc.buttonListener )
    		transition.to(mainFunc.ballBtnScreenCreate.itemBagBtn, {alpha=0, time=200})
			mainFunc.ballBtnScreenCreate.itemBagBtn:removeEventListener( "tap", mainFunc.buttonListener )
	        mainFunc.thisLevelSettings.hasToolArray = true
	    end

        mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

        mainFunc.buttonListenerScript.removeShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

	    mainFunc.buttonListenerScript.removeButtonListenersForItemGained(mainFunc)

		screen.xScale = 0.3
		screen.yScale = 0.3
        transition.to(screen, {xScale = 1, yScale = 1, alpha = 1, time = 100, onComplete = function ()
        	screen.itemGainedText = display.newImageRect("images/central-images/Layout/somethingGainedScreen/itemGainedScreen-Heading.png", 273, 32)
			screen.itemGainedText.y = 55
			screen.itemGainedText.x = contentCentreX

			if relevantShapeArrayIndex ~= nil then
				local itemToShowCounter = 1
				for a = 1, #shapeArrayParameters[relevantShapeArrayIndex][8] do
					mainFunc.thisLevelSettings.itemBagButtonsVisible = true
					local name, thisIsShape
					if shapeArrayParameters[relevantShapeArrayIndex][8][a][1] == "item" then
						name = shapeArrayParameters[relevantShapeArrayIndex][8][a][2]
						thisIsShape = false
					else
						name = shapeArrayParameters[relevantShapeArrayIndex][8][a][1]
						thisIsShape = true
					end

					item = mainFunc.globalImageCreateFunctions.createItemDetailedIcon(thisIsShape, name, "ItemGainedScreenMulti", shapeArrayParameters[relevantShapeArrayIndex][8], a, nil, nil)
					item.itemType = name
					if myGameSettings["itemDiscovered"][item.itemType] then
						table.insert(mainFunc.thisLevelSettings.itemWasDiscoveredInLevel, item.itemType)
					end

					mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item)
			        item:toFront()

			        if item.displayObjects["text"] then
			            for a = 1, #item.displayObjects["text"] do
			                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["text"][a])
			                item.displayObjects["text"][a]:toFront()
			            end
			        end

			        if item.displayObjects["directionLabel"] then
			            for a = 1, #item.displayObjects["directionLabel"] do
			                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["directionLabel"][a])
			                item.displayObjects["directionLabel"][a]:toFront()
			            end
			        end

			        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["counterNumber"])
			        item.displayObjects["counterNumber"]:toFront()

			        mainFunc.globalImageCreateFunctions.positionItemDetailedIcon(item, screen.itemXVal, screen.itemYVal, thisIsShape, name, "ItemGainedScreenMulti", shapeArrayParameters[relevantShapeArrayIndex][8], a, nil, nil) 
					

					screen.itemXVal = screen.itemXVal + 70
					if itemToShowCounter % 5 == 0 then
						screen.itemXVal = screen.originalItemXVal
						screen.itemYVal = screen.itemYVal + 60
					end
					itemToShowCounter = itemToShowCounter + 1

					local itemBagScreenArrayCounter = 0
					for a = 1, #screen.itemArray do
			            itemBagScreenArrayCounter = itemBagScreenArrayCounter + 1
			        end

			        screen.itemArray[itemBagScreenArrayCounter + 1] = item
				end

			else

				if itemType == "toolItem" then
					mainFunc.thisLevelSettings.itemBagButtonsVisible = true
					item = mainFunc.globalImageCreateFunctions.createItemDetailedIcon(false, mainFunc.thisLevelSettings.toolArray[relevantToolArrayCounter]["name"], "ItemGainedScreen", mainFunc.thisLevelSettings.toolArray, relevantToolArrayCounter, nil, nil)
					item.itemType = mainFunc.thisLevelSettings.toolArray[relevantToolArrayCounter]["name"]
					screen.itemName = item.itemType
					if myGameSettings["itemDiscovered"][item.itemType] then
						table.insert(mainFunc.thisLevelSettings.itemWasDiscoveredInLevel, item.itemType)
					end

					mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item)
			        item:toFront()

			        if item.displayObjects["text"] then
			            for a = 1, #item.displayObjects["text"] do
			                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["text"][a])
			                item.displayObjects["text"][a]:toFront()
			            end
			        end

			        if item.displayObjects["directionLabel"] then
			            for a = 1, #item.displayObjects["directionLabel"] do
			                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["directionLabel"][a])
			                item.displayObjects["directionLabel"][a]:toFront()
			            end
			        end

			        mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(item.displayObjects["counterNumber"])
			        item.displayObjects["counterNumber"]:toFront()

			        mainFunc.globalImageCreateFunctions.positionItemDetailedIcon(item, contentCentreX, contentCentreY, false, mainFunc.thisLevelSettings.toolArray[relevantToolArrayCounter]["name"], "ItemGainedScreen", mainFunc.thisLevelSettings.toolArray, relevantToolArrayCounter, nil, nil) 
				elseif itemType == "levelItem" then
					mainFunc.buttonListenerScript.createToolImage(nil, nil, mainFunc, "itemGained", itemType, itemLabel)
					if itemLabel == "map" then
        				mainFunc.thisLevelSettings.mapObtained = true
						mainFunc.screenChangingScript.mapButtonStateCheck(mainFunc)
					elseif itemLabel == "compass" then
        				mainFunc.thisLevelCompassObtained = true
					end
				end

				local itemBagScreenArrayCounter = 0
				for a = 1, #screen.itemArray do
		            itemBagScreenArrayCounter = itemBagScreenArrayCounter + 1
		        end

		        screen.itemArray[itemBagScreenArrayCounter + 1] = item

			end

			screen.closeButton.alpha = 1
			screen.closeButton:addEventListener("tap", mainFunc.closeItemGainedScreen)
        end})
    end
end
	t.itemGainedFunction = itemGainedFunction


local autoFanAndEtcTransition = function (mainFunc, shapeArray, shapeArrayParameters)
	local ball = mainFunc.ballBtnScreenCreate.ball;

	for b = 1, #shapeArray do
		if (mainFunc.allLevelSettings.ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
		and mainFunc.allLevelSettings.ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"])
		and (shapeArrayParameters[b]["type"] == "autoFan"
		    or (shapeArrayParameters[b]["type"] == "spitter")
		    or (shapeArrayParameters[b]["type"] == "endPoint")
		    or (shapeArrayParameters[b]["type"] == "characterChangePoint")
		    or (shapeArrayParameters[b]["type"] == "manualFan" and shapeArray[b].activeNow == true)
		    or (shapeArrayParameters[b]["type"] == "simple")
		    or (shapeArrayParameters[b]["type"] == "backFire")
		) then

	    	if  (ball.x) > (shapeArray[b].x  - (mainFunc.allLevelSettings.squareWidth / 2) - 24) and
			(ball.x) < (shapeArray[b].x  + (mainFunc.allLevelSettings.squareWidth / 2) + 24) and
			ball.y > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2) - 15) and
			ball.y < (shapeArray[b].y  + (mainFunc.allLevelSettings.squareHeight / 2) + 10) and
	        shapeArray[b].enabled == true and
			(ball.direction ~= shapeArray[b].lastBallReleaseDirection
			or (ball.direction == shapeArray[b].lastBallReleaseDirection
				and ball.lastFanIndex ~= b) ) then

				if  (ball.x > (shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth / 2) - 24)
					and ball.direction == "right"
					and ball.y > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2) - 5)
					and ball.y < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight / 2) + 5))
				or (ball.x < (shapeArray[b].x  + (mainFunc.allLevelSettings.squareWidth / 2) + 24)
					and ball.direction == "left"
					and ball.y > (shapeArray[b].y  - (mainFunc.allLevelSettings.squareHeight / 2) - 5)
					and ball.y < (shapeArray[b].y  + (mainFunc.allLevelSettings.squareHeight / 2) + 5))
				or (ball.y > (shapeArray[b].y  - (mainFunc.allLevelSettings.squareHeight / 2) - 15)
					and ball.direction == "down"
					and ball.x > (shapeArray[b].x  - (mainFunc.allLevelSettings.squareWidth / 2) - 7)
					and ball.x < (shapeArray[b].x  + (mainFunc.allLevelSettings.squareWidth / 2) + 5))
				or (ball.y < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight / 2) + 18)
					and ball.direction == "up"
					and ball.x > (shapeArray[b].x  - (mainFunc.allLevelSettings.squareWidth / 2) - 7)
					and ball.x < (shapeArray[b].x  + (mainFunc.allLevelSettings.squareWidth / 2) + 5)) then
					if (mainFunc.allLevelSettings.isBallMovingState == "true") then
        				shapeArray[b].shouldBallMoveInAutoSlide = true

						if shapeArrayParameters[b]["type"] == "autoFan"
						or shapeArrayParameters[b]["type"] == "manualFan"
						or shapeArrayParameters[b]["type"] == "spitter"
						or shapeArrayParameters[b]["type"] == "simple"
						or shapeArrayParameters[b]["type"] == "backFire" then
							shapeArray[b].canShapeSlide = false
						end
					else

					end
				end
			    if ball.x > (shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth / 2) ) and
				ball.x < (shapeArray[b].x + (mainFunc.allLevelSettings.squareWidth / 2)) and
				ball.y > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2)) and
				ball.y < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight / 2)) then
					shapeArray[b].enabled = false
					mainFunc.allLevelSettings.spitterCounter = 1
					if (shapeArrayParameters[b]["type"] == "spitter" and
					shapeArray[b].isBallPresent == false) or
					(shapeArrayParameters[b]["type"] == "characterChangePoint" and
					shapeArray[b].isBallPresent == false) or
					(shapeArrayParameters[b]["type"] == "manualFan" and
					shapeArray[b].activeNow == true) or
					(shapeArrayParameters[b]["type"] ~= "spitter" and
					shapeArrayParameters[b]["type"] ~= "manualFan") then
						mainFunc.allLevelSettings.isBallMovingState = "false"
        				shapeArray[b].isBallPresent = true

			            if shapeArray[b].isAutoSlideObject then
			            	mainFunc.allLevelSettings.currentShapeBallShouldFollow = shapeArray[b]
			            	local listener = function ()
			            		if ball.x > mainFunc.allLevelSettings.currentShapeBallShouldFollow.x + 20 then
			            			ball.x = ball.x - 7
			            		end
			            		if ball.x < mainFunc.allLevelSettings.currentShapeBallShouldFollow.x - 20 then
			            			ball.x = ball.x + 7
			            		end
			            		if ball.y > mainFunc.allLevelSettings.currentShapeBallShouldFollow.y + 20 then
			            			ball.y = ball.y - 7
			            		end
			            		if ball.y < mainFunc.allLevelSettings.currentShapeBallShouldFollow.y - 20 then
			            			ball.y = ball.y + 7
			            		end

			            		if ball.x < mainFunc.allLevelSettings.currentShapeBallShouldFollow.x + 20
			            		and ball.x > mainFunc.allLevelSettings.currentShapeBallShouldFollow.x then
			            			ball.x = mainFunc.allLevelSettings.currentShapeBallShouldFollow.x
			            		end
			            		if ball.x > mainFunc.allLevelSettings.currentShapeBallShouldFollow.x - 20
			            		and ball.x < mainFunc.allLevelSettings.currentShapeBallShouldFollow.x then
			            			ball.x = mainFunc.allLevelSettings.currentShapeBallShouldFollow.x
			            		end
			            		if ball.y < mainFunc.allLevelSettings.currentShapeBallShouldFollow.y + 20
			            		and ball.y > mainFunc.allLevelSettings.currentShapeBallShouldFollow.y then
			            			ball.y = mainFunc.allLevelSettings.currentShapeBallShouldFollow.y
			            		end
			            		if ball.y > mainFunc.allLevelSettings.currentShapeBallShouldFollow.y - 20
			            		and ball.y < mainFunc.allLevelSettings.currentShapeBallShouldFollow.y then
			            			ball.y = mainFunc.allLevelSettings.currentShapeBallShouldFollow.y
			            		end
			            	end
			            	mainFunc.objectToBallTransitionScript.listener = listener
			            	if mainFunc.allLevelSettings.followShapeWithBallApplied == false then
			            		Runtime:addEventListener("enterFrame", mainFunc.objectToBallTransitionScript.listener)
			            		mainFunc.allLevelSettings.followShapeWithBallApplied = true
			            		mainFunc.allLevelSettings.shapeToBeFollowedIndex = shapeArray[b].shapeArrayIndex
			            	end
			            end

						if (shapeArrayParameters[b]["type"] == "backFire") or (shapeArrayParameters[b]["type"] == "simple") or (shapeArrayParameters[b]["type"] == "characterChangePoint") then
							if (shapeArrayParameters[b]["type"] == "backFire") then
					        	if ball.direction == "up" then
					        		ball.direction = "down"
					        	elseif ball.direction == "right" then
					        		ball.direction = "left"
					        	elseif ball.direction == "down" then
					        		ball.direction = "up"
					        	elseif ball.direction == "left" then
					        		ball.direction = "right"
					        	end
					        end
							local secondArrowArray = {
								up = function () shapeArray[b].bigDirectionArrow.rotation = 0 shapeArray[b].bigDirectionArrow.y = shapeArray[b].bigDirectionArrow.y - ( (28/320) * display.contentHeight ) end,
								right = function () shapeArray[b].bigDirectionArrow.rotation = 90 shapeArray[b].bigDirectionArrow.x = shapeArray[b].bigDirectionArrow.x + ( (32/480) * display.contentWidth ) end,
								down = function () shapeArray[b].bigDirectionArrow.rotation = 180 shapeArray[b].bigDirectionArrow.y = shapeArray[b].bigDirectionArrow.y + ( (28/320) * display.contentHeight ) end,
								left = function () shapeArray[b].bigDirectionArrow.rotation = 270 shapeArray[b].bigDirectionArrow.x = shapeArray[b].bigDirectionArrow.x - ( (32/480) * display.contentWidth ) end
							}

							if shapeArray[b].bigDirectionArrow then
							else
								shapeArray[b].bigDirectionArrow = display.newImageRect("images/objects/arrows.png", 27, 17)
								mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(shapeArray[b].bigDirectionArrow)
							end
							shapeArray[b].bigDirectionArrow.alpha = 1
							shapeArray[b].bigDirectionArrow.x = shapeArray[b].x
							shapeArray[b].bigDirectionArrow.y = shapeArray[b].y
							shapeArray[b].bigDirectionArrow:toFront()
							shapeArray[b].lastBallReleaseDirection = ball.direction

							secondArrowArray[ball.direction]()
							if shapeArrayParameters[b]["type"] == "characterChangePoint" then
								shapeArray[b].bigDirectionArrow.rotation = shapeArray[b].bigDirectionArrow.rotation - 90
							end
						end

						local fanCenterTime = 120
			            if shapeArray[b].isAutoSliding and shapeArray[b].autoSlideIsPaused == false then
			            	fanCenterTime = 10
			            	if shapeArray[b].bigDirectionArrow then
				            	local xDist = shapeArray[b].bigDirectionArrow.x - shapeArray[b].autoSlideTargetX
				            	local yDist = shapeArray[b].bigDirectionArrow.y - shapeArray[b].autoSlideTargetY
				            	local numSquares
				            	if shapeArray[b].autoSlideDirection == "horz" then
				            		yDist = 0
				            		numSquares = xDist / mainFunc.allLevelSettings.squareWidth
				            	else
				            		xDist = 0
				            		numSquares = yDist / mainFunc.allLevelSettings.squareHeight
				            	end
				            	if numSquares < 0 then
				            		numSquares = numSquares * -1
				            	end

				            	local function completeAutoSlide (obj)
				            		if shapeArray[b].autoSlideDirection == "horz" then
				            			shapeArray[b].autoSlideTransition[#shapeArray[b].autoSlideTransition + 1] = transition.to(obj, {x = obj.x - xDist, time = shapeArray[b].timePerSquare * numSquares})
				            		else
				            			shapeArray[b].autoSlideTransition[#shapeArray[b].autoSlideTransition + 1] = transition.to(obj, {y = obj.y - yDist, time = shapeArray[b].timePerSquare * numSquares})
				            		end
				            	end

			            		completeAutoSlide(shapeArray[b].bigDirectionArrow)
			            		--completeAutoSlide(ball)
				            end
				        end

						ball.lastFanIndex = b
						if shapeArrayParameters[b]["type"] == "autoFan" or shapeArrayParameters[b]["type"] == "manualFan" then
							shapeArray[b].lastBallReleaseDirection = shapeArrayParameters[b]["subType"]
							if shapeArray[b].isAutoSlideObject then
								if #shapeArray[b].autoSlideTransition > 0 then
									for a = 1, #shapeArray[b].autoSlideTransition do
										transition.pause(shapeArray[b].autoSlideTransition[a])
									end
								end
								if #shapeArray[b].autoSlideTimer > 0 then
									for a = 1, #shapeArray[b].autoSlideTimer do
										timer.pause(shapeArray[b].autoSlideTimer[a])
									end
								end
							end
						end
						shapeArray[b].shapeArrayIndex = b
						mainFunc.allLevelSettings.isBallMovingState = "false"
						
		            	prepareForFanCentering(ball, b, fanCenterTime, fanCentering, mainFunc, shapeArray, shapeArrayParameters)
			    	end
			    end
			end
		    for a = 1, #mainFunc.allLevelSettings.bullet do
		        if mainFunc.allLevelSettings.bullet[a].x > (shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth/2) ) and
				mainFunc.allLevelSettings.bullet[a].x < (shapeArray[b].x  + (mainFunc.allLevelSettings.squareWidth/2) ) and
				mainFunc.allLevelSettings.bullet[a].y > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight/2) ) and
				mainFunc.allLevelSettings.bullet[a].y < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight/2) ) and
		        shapeArray[b].enabled == true and
				mainFunc.allLevelSettings.bullet[a].autoFanCounter == 0 and
		        (shapeArrayParameters[b]["type"] ~= "characterChangePoint") then
		            prepareForFanCentering(mainFunc.allLevelSettings.bullet[a], b, 40, fanCentering, mainFunc, shapeArray, shapeArrayParameters)
		        end
		    end
		elseif shapeArrayParameters[b]["type"] == "switch" then
	        if  (ball.x) > (shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth / 2) - 10 )
	        and (ball.x) < (shapeArray[b].x + (mainFunc.allLevelSettings.squareWidth / 2) + 10 )
	        and (ball.y) > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2) - 5)
	        and (ball.y) < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight / 2) + 5)
		    and ball.character ~=  "dummyBall" then
		    	if mainFunc.thisLevelSettings.mapObtained == true then
	            	mainFunc.ballBtnScreenCreate.playBtn.alpha = 0.4
	            end
	            mainFunc.ballBtnScreenCreate.randomBtn.alpha = 0.4
	            mainFunc.allLevelSettings.pauseButtonsEnabled = false
	        end
		    if shapeArray[b].switchCounter == 0 then
				if  ball.x > shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth / 2)
				and ball.x < shapeArray[b].x + (mainFunc.allLevelSettings.squareWidth / 2)
				and ball.y > shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2)
				and ball.y < shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight / 2)
		    	and ball.character ~=  "dummyBall" 
				and shapeArray[b].switchOnOffCounter == 0 then
				    local thisSwitch = shapeArray[b]

					mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
				    thisSwitch.switchOnOffCounter = 1

		            switchSequence = thisSwitch.sequence
		            if switchSequence == "on" then
		                thisSwitch:setSequence("off")
		                if thisSwitch.isLabelled then
		                	thisSwitch.switchValueText:setSequence("off")
		                end
		            else
		                thisSwitch:setSequence("on")
		                if thisSwitch.isLabelled then
		                	thisSwitch.switchValueText:setSequence("on")
		                end
		            end  

		            prepareForFanCentering(ball, b, 40, fanCentering, mainFunc, shapeArray, shapeArrayParameters) 
				end
		    end
	    elseif shapeArrayParameters[b]["type"] == "item" then
	        if  ball.x > shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth / 2) - 5
			and ball.x < shapeArray[b].x + (mainFunc.allLevelSettings.squareWidth / 2)
			and ball.y > shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight / 2) - 5
			and ball.y < shapeArray[b].y + (mainFunc.allLevelSettings.squareWidth / 2)
	        and ball.character ~= "dummyBall" then
	        	if shapeArray[b].isObtained == false then
	        		shapeArray[b].isObtained = true

					local handleRelatedItemVisuals = function (itemName)
						if itemName == "map" then
							for a = 1, #shapeArray do
								if (shapeArrayParameters[a]["name"] == "mystery-block") then
									transition.to(shapeArray[a], {alpha = 1, time = 400})
									shapeArray[a]:toBack()
									shapeArray[a]:addEventListener("tap", mainFunc.mysteryBlockTouch)
								end
							end
							if currentMedal == "silver" then
								mainFunc.ballBtnScreenCreate.mapShowAndClockLabel.map:setSequence("partialMap")
							else
								mainFunc.ballBtnScreenCreate.mapShowAndClockLabel.map:setSequence("fullMap")
							end
						elseif itemName == "compass" then
							mainFunc.ballBtnScreenCreate.mapShowAndClockLabel.compass:setSequence("compass")
						end
					end
		        	
					local function handleItemVisuals()
						if shapeArrayParameters[b]["name"] ~= "mystery-block" then
							shapeArray[b].alpha = 0
							shapeArray[b].x = 9000
							shapeArray[b].y = 9000
							shapeArray[b].backBoard.xScale = 0.75
							shapeArray[b].backBoard.yScale = 0.75
							shapeArray[b].backBoard.alpha = 0.5
						end

						if shapeArrayParameters[b]["name"] == "map" or shapeArrayParameters[b]["name"] == "compass" then
							handleRelatedItemVisuals();
						end
					end

		            local function processItem (thisArray)
		            	if thisArray[2] == "bomb" then
		            		thisItemsObject = {name = thisArray[2], properties = {squares = thisArray[8], directions = thisArray[9]}, quantity = thisArray[10]}
		            		thisItemsIncrease = thisArray[10]
		            	elseif thisArray[2] == "hook" then 
		            		thisItemsObject = {name = thisArray[2], properties = {directions = {thisArray[8]}, squares = thisArray[9]}, quantity = thisArray[10]}
		            		thisItemsIncrease = thisArray[10]
		            	elseif thisArray[2] == "jet" then

		            		thisItemsObject = {name = thisArray[2], properties = {directions = {thisArray[8]} }, quantity = thisArray[9]}
		            		thisItemsIncrease = thisArray[9] 
		            	elseif thisArray[1] == "item"
		            	and thisArray[2] ~= "bomb"
		            	and thisArray[2] ~= "hook"
		            	and thisArray[2] ~= "jet" then
		            		thisItemsObject = {name = thisArray[2], properties = {seconds = thisArray[8]}, quantity = thisArray[9]}
		            		thisItemsIncrease = thisArray[9]
		            	elseif thisArray[1] ~= "item" then
		            		if thisArray[1] == "triangle"
		            		or thisArray[1] == "autoFan"
		            		or thisArray[1] == "manualFan"
		            		or thisArray[1] == "spitter" then
		            			if thisArray[1] == "triangle"
		            			or thisArray[1] == "bar" then
		            				local breakableBool
		            				if (#thisArray < 3) then
			            				breakableBool = false
			            			else
			            				breakableBool = true
			            			end
		            				thisItemsObject = {name = thisArray[1], properties = {shape = thisArray[2], breakable = breakableBool} }
		            			else
		            				if thisArray[1] == "autoFan"
		            				or thisArray[1] == "manualFan" then
			            				thisItemsObject = {name = thisArray[1], properties = {directions = {thisArray[2]} } }
		            				elseif thisArray[1] == "spitter" then
			            				thisItemsObject = {name = thisArray[1], properties = {directions = thisArray[2]} }
		            				end
		            			end
		            			thisItemsIncrease = 1
		            		end
		            	end

	            		local function checkIfItemAlreadyInBag (newObj, existingObjFromBag)
	            			itemMatch = true
	            			for key, val in pairs (existingObjFromBag["properties"]) do
	            				if key == "directions" then
	            					if #existingObjFromBag["properties"][key] == #newObj["properties"][key] then
	            						for b = 1, #existingObjFromBag["properties"][key] do
		            						if existingObjFromBag["properties"][key][b] ~= newObj["properties"][key][b] then
			            						itemMatch = false
			            					end
		            					end
	            					else
	            						itemMatch = false
	            					end
	            				else
	            					if existingObjFromBag["properties"][key] ~= newObj["properties"][key] then
	            						itemMatch = false
	            					end
	            				end
	            			end

	            			return itemMatch
	            		end

		            	if (thisArray[1] == "item") then

			            	itemAlreadyInToolsArray = false
			            	for a = 1, #mainFunc.thisLevelSettings.toolArray do
			            		if mainFunc.thisLevelSettings.toolArray[a]["name"] == thisItemsObject["name"] then
									itemMatch = checkIfItemAlreadyInBag(thisItemsObject, mainFunc.thisLevelSettings.toolArray[a])

			            			if itemMatch then
			            				itemAlreadyInToolsArray = true

			            				mainFunc.thisLevelSettings.toolArray[a]["quantity"] = mainFunc.thisLevelSettings.toolArray[a]["quantity"] + thisItemsIncrease
			            				if (mainFunc.thisLevelSettings.toolArray[a]["quantity"] > 9) then
			            					mainFunc.thisLevelSettings.toolArray[a]["quantity"] = 9
			            				end

			            				if (mainFunc.ballBtnScreenCreate.itemBtn.relevantShapeArrayCounterForItem == a) then
			            					mainFunc.ballBtnScreenCreate.itemBtn.counterImg:removeSelf()
							                mainFunc.ballBtnScreenCreate.itemBtn.counterImg = nil

							                mainFunc.ballBtnScreenCreate.itemBtn.counterImg = display.newImage("images/objects/imageNumber" .. mainFunc.thisLevelSettings.toolArray[a][3] .. ".png")
							                mainFunc.allLevelSettings.itemScreenObjectsGroup:insert(mainFunc.ballBtnScreenCreate.itemBtn.counterImg)
							                itemBtnCounterImage = mainFunc.ballBtnScreenCreate.itemBtn.counterImg
							                itemBtnCounterImage.x = mainFunc.ballBtnScreenCreate.itemBtn.x
							                itemBtnCounterImage.y = mainFunc.ballBtnScreenCreate.itemBtn.y - 10
							                itemBtnCounterImage.xScale = 0.5
							                itemBtnCounterImage.yScale = 0.5
			            				end

			            				if shapeArrayParameters[b]["name"] ~= "small-present"
			            				and shapeArrayParameters[b]["name"] ~= "big-present" then
			            					shapeArray[b].relevantToolArrayCounter = a
			            				else
			            					shapeArray[b].relevantToolIndexArrayCounter = 0
						            		for z = 1, #shapeArray[b].relevantToolIndexArray do
						            			shapeArray[b].relevantToolIndexArrayCounter = shapeArray[b].relevantToolIndexArrayCounter + 1
						            		end
						            		shapeArray[b].relevantToolIndexArray[shapeArray[b].relevantToolIndexArrayCounter + 1] = a
			            				end
			            			end

			            		end
			            	end

			            	toolArrayCounter = 0
			            	for a = 1, #mainFunc.thisLevelSettings.toolArray do
			            		toolArrayCounter = toolArrayCounter + 1
			            	end
			            	table.insert(thisArray, b)

			            	if itemAlreadyInToolsArray == false then
				            	if thisArray[2] == "bomb" then
				            		mainFunc.thisLevelSettings.toolArray[toolArrayCounter + 1] = {name = thisArray[2], properties = {squares = thisArray[8], directions = thisArray[9]}, quantity = thisArray[10], created = "not-ccreated = reated"}
				            	elseif thisArray[2] == "hook" then 
				            		mainFunc.thisLevelSettings.toolArray[toolArrayCounter + 1] = {name = thisArray[2], properties = {directions = {thisArray[8]}, squares = thisArray[9]}, quantity = thisArray[10], created = "not-created"} 
				            	elseif thisArray[2] == "jet" then 
				            		mainFunc.thisLevelSettings.toolArray[toolArrayCounter + 1] = {name = thisArray[2], properties = {directions = {thisArray[8]}}, quantity = thisArray[9], created = "not-created"} 
				            	else
				            		mainFunc.thisLevelSettings.toolArray[toolArrayCounter + 1] = {name = thisArray[2], properties = {seconds = thisArray[8]}, quantity = thisArray[9], created = "not-created"}
				            	end

				            	if shapeArrayParameters[b]["name"] == "small-present"
				            	or shapeArrayParameters[b]["name"] == "big-present" then
				            		shapeArray[b].relevantToolIndexArrayCounter = 0
				            		for z = 1, #shapeArray[b].relevantToolIndexArray do
				            			shapeArray[b].relevantToolIndexArrayCounter = shapeArray[b].relevantToolIndexArrayCounter + 1
				            		end
				            		shapeArray[b].relevantToolIndexArray[shapeArray[b].relevantToolIndexArrayCounter + 1] = toolArrayCounter + 1
				            	else
				            		shapeArray[b].relevantToolArrayCounter = toolArrayCounter + 1
				            	end
			            	end

			            	if (mainFunc.ballBtnScreenCreate.itemBagBtn.alpha < 1) then
				            	--
					    		if (mainFunc.ballBtnScreenCreate.itemBtn.img
					    		and mainFunc.ballBtnScreenCreate.itemBtn.img ~= nil) then
					    			transition.to(mainFunc.ballBtnScreenCreate.itemBtn.img, {alpha=0, time=400})
					    		end

						        mainFunc.thisLevelSettings.hasToolArray = true
					    	end
			            else
			            	itemAlreadyInToolsArray = false
			            	for a = 1, #mainFunc.thisLevelSettings.objectArray do
			            			
			            		if mainFunc.thisLevelSettings.objectArray[a]["name"] == thisItemsObject["name"] then
			            			itemMatch = checkIfItemAlreadyInBag(thisItemsObject, mainFunc.thisLevelSettings.objectArray[a])

			            			if itemMatch then
			            				itemAlreadyInToolsArray = true

			            				mainFunc.thisLevelSettings.objectArray[a]["quantity"] = mainFunc.thisLevelSettings.objectArray[a]["quantity"] + thisItemsIncrease
			            				if (mainFunc.thisLevelSettings.objectArray[a]["quantity"] > 9) then
			            					mainFunc.thisLevelSettings.objectArray[a]["quantity"] = 9
			            				end
			            				if shapeArrayParameters[b]["name"] ~= "small-present"
			            				and shapeArrayParameters[b]["name"] ~= "big-present" then
			            					shapeArray[b].relevantToolArrayCounter = a
			            				else
			            					shapeArray[b].relevantToolIndexArrayCounter = 0
						            		for z = 1, #shapeArray[b].relevantToolIndexArray do
						            			shapeArray[b].relevantToolIndexArrayCounter = shapeArray[b].relevantToolIndexArrayCounter + 1
						            		end
						            		shapeArray[b].relevantToolIndexArray[shapeArray[b].relevantToolIndexArrayCounter + 1] = a
			            				end
			            			end

			            		end
			            	end

			            	objectArrayCounter = 0
			            	for a = 1, #mainFunc.thisLevelSettings.objectArray do
			            		objectArrayCounter = objectArrayCounter + 1
			            	end
			            	table.insert(thisArray, b)

			            	if itemAlreadyInToolsArray == false then
				            	if thisArray[1] == "triangle"
				            	or thisArray[1] == "autoFan"
				            	or thisArray[1] == "manualFan" then
				            		if (thisArray[1] == "triangle" or thisArray[1] == "bar") then
				            			local breakableBool
				            			if #thisArray == 4 then
				            				breakableBool = true
				            			else
				            				breakableBool = false
				            			end
				            			mainFunc.thisLevelSettings.objectArray[objectArrayCounter + 1] = {name = thisArray[1], properties = {shape = thisArray[2], breakable = breakableBool}, quantity = 1, created = "not-created"}
				            		else
				            			mainFunc.thisLevelSettings.objectArray[objectArrayCounter + 1] = {name = thisArray[1], properties = {directions = {thisArray[2]} }, quantity = 1, created = "not-created"}
				            		end
				            	elseif thisArray[1] == "spitter" then
				            		mainFunc.thisLevelSettings.objectArray[objectArrayCounter + 1] = {name = thisArray[1], properties = {directions = thisArray[2] }, quantity = 1, created = "not-created"}
				            	end
				            	if shapeArrayParameters[b]["name"] == "big-present"
				            	or shapeArrayParameters[b]["name"] == "small-present" then
				            		shapeArray[b].relevantToolIndexArrayCounter = 0
				            		for z = 1, #shapeArray[b].relevantToolIndexArray do
				            			shapeArray[b].relevantToolIndexArrayCounter = shapeArray[b].relevantToolIndexArrayCounter + 1
				            		end
				            		shapeArray[b].relevantToolIndexArray[shapeArray[b].relevantToolIndexArrayCounter + 1] = objectArrayCounter + 1
				            	else
				            		shapeArray[b].relevantToolArrayCounter = objectArrayCounter + 1
				            	end
			            	end
			            end

	                	mainFunc.allLevelSettings.midScreenObjectsGroup:remove( shapeArray[b] )
	                	mainFunc.allLevelSettings.itemScreenObjectsGroup:insert( shapeArray[b] )
	                	-- mainFunc.allLevelSettings.itemScreenObjectsGroup:toFront()
		            end

					local saveUpdatedSettings = function (levelSettingsKey, gameSettingsKey)
						mainFunc.thisLevelSettings[levelSettingsKey] = true
		            	myGameSettings[currentWorld]["levels"][currentLevel][currentMedal .. "-achievements"][gameSettingsKey] = true
		            	saveTable(myGameSettings, "myGameSettings.json")
					end

					handleItemVisuals();

		            if shapeArrayParameters[b]["name"] == "map" then
						saveUpdatedSettings("mapObtained", "map_obtained");
		            elseif shapeArrayParameters[b]["name"] == "compass" then
						saveUpdatedSettings("compassObtained", "compass_obtained");
		            elseif hasValue({ "bomb", "clock", "jet", "hook" }, shapeArrayParameters[b]["name"]) then
		            	processItem(shapeArrayParameters[b])
		            elseif hasValue({ "big-present", "small-present" }, shapeArrayParameters[b]["name"]) then
		            	shapeArray[b].relevantToolIndexArray = {}
		            	-- for a = 1, #shapeArrayParameters[b]["props"][1] do
		            	-- 	processItem(shapeArrayParameters[b]["props"][1][1])
		            	-- end
		            end

		            local toolAlreadyGainedOnceArray = {
		            	{"clock", mainFunc.thisLevelSettings.clocktimeGainedOnce},
		            	{"bomb", mainFunc.thisLevelSettings.bombGainedOnce},
		            	{"hook", mainFunc.thisLevelSettings.hookshotGainedOnce},
		            	{"jet", mainFunc.thisLevelSettings.jetpackGainedOnce}
		        	}

		            if hasValue({ "bomb", "clock", "jet", "hook", "big-present", "small-present" }, shapeArrayParameters[b]["name"]) then
		            	if shapeArrayParameters[b]["name"] ~= "big-present"
		            	and shapeArrayParameters[b]["name"] ~= "small-present" then
		            		local itemPickedUp = false
							for c=1, #mainFunc.thisLevelSettings.itemWasDiscoveredInLevel do
					        	local objectName = mainFunc.thisLevelSettings.itemWasDiscoveredInLevel[c]
					        	if objectName == shapeArrayParameters[b]["name"] then
					        		itemPickedUp = true
					        	end
					        end
	            			if myGameSettings["tutorialDone"][shapeArrayParameters[b]["name"]] == false and itemPickedUp == false then
	            				mainFunc.thisLevelSettings.itemWasDiscoveredInLevel[#mainFunc.thisLevelSettings.itemWasDiscoveredInLevel + 1] = shapeArrayParameters[b]["name"]
	            				mainFunc.thisLevelSettings.itemBagButtonsVisible = true
	            				itemGainedFunction(mainFunc, shapeArray, shapeArrayParameters, "toolItem", nil,  nil, shapeArray[b].relevantToolArrayCounter)
	            			else
	            				-- JUST DO ANIMATION TO SHOW ITEM HAS BEEN GAINED
	            				if mainFunc.thisLevelSettings.itemBagButtonsVisible == false then
	            					mainFunc.thisLevelSettings.itemBagButtonsVisible = true
	            					transition.to(mainFunc.ballBtnScreenCreate.itemBtn, {alpha = 1, time = 200})
		            				transition.to(mainFunc.ballBtnScreenCreate.itemBagBtn, {alpha = 1, time = 200, onComplete = function ()
		            					mainFunc.ballBtnScreenCreate.itemBagBtn:addEventListener("tap", mainFunc.buttonListener)
		            					mainFunc.ballBtnScreenCreate.itemBtn:addEventListener("tap", mainFunc.buttonListener)
		            				end})
		            			end
	            			end
			            else
            				itemGainedFunction(mainFunc, shapeArray, shapeArrayParameters, "toolItem", nil, b, shapeArray[b].relevantToolIndexArray[a])
			            end
		            else
		            	if shapeArrayParameters[b]["name"] ~= "mystery-block" then
		            		itemGainedFunction(mainFunc, shapeArray, shapeArrayParameters, "levelItem", shapeArray[b].itemLabel, nil, shapeArray[b].relevantToolArrayCounter)
		            	end
		            end
	        	end
	        end
	    end
	end
end
	t.autoFanAndEtcTransition = autoFanAndEtcTransition

return t
