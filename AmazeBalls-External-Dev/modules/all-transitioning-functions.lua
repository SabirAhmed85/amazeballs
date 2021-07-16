local widget = require("widget")
local t = {}

--- WHEN TRANSITIONING SOMETHING

local switchAlphaTransparency = function (door)

    if door.enabled == "enabled" then
        transition.to(door, {alpha = 0, time = 120})
        door.enabled = "disabled"
    else
        transition.to(door, {alpha = 1, time = 120})
        door.enabled = "enabled"
    end
    
end
	t.switchAlphaTransparency = switchAlphaTransparency

local toggleAutoSlideTimer = function (mainFunc, shape)
	if #shape.autoSlideTransition > 0 then
        for z = 1, #shape.autoSlideTransition do
        	if shape.autoSlideIsPaused then
            	transition.resume(shape.autoSlideTransition[z])
            else
            	transition.pause(shape.autoSlideTransition[z])
            end
        end
    end
    if #shape.autoSlideTimer > 0 then
        for z = 1, #shape.autoSlideTimer do
        	if shape.autoSlideIsPaused then
            	timer.resume(shape.autoSlideTimer[z])
            else
            	timer.pause(shape.autoSlideTimer[z])
            end
        end
    end
    if shape.autoSlideIsPaused then
    	shape.autoSlideIsPaused = false
    else
    	shape.autoSlideIsPaused = true
    end
end
	t.toggleAutoSlideTimer = toggleAutoSlideTimer

local actionAutoSlideTimer = function (mainFunc, shape, isFirstTime)
	local delayTime = 0;
	local thisTransition = mainFunc.allLevelSettings.transitionArrayIndex[shape.transitionArrayIndex];

	if isFirstTime then
		delayTime = 400
	end

	if shape.nextSlideTransitionIndex == 1 then
		shape.transitionIsNextOrPrev = "next"
	elseif shape.currentSlideTransitionIndex == #thisTransition["positionArray"] then
		shape.transitionIsNextOrPrev = "prev"
	end

	shape.nextSlideTransitionIndex = shape.transitionIsNextOrPrev == "prev" and
		shape.currentSlideTransitionIndex - 1 or
		shape.currentSlideTransitionIndex + 1;

	local currentHorzSquare = thisTransition["positionArray"][shape.currentSlideTransitionIndex][3]
	local currentVertSquare = thisTransition["positionArray"][shape.currentSlideTransitionIndex][4]
	local nextHorzSquare = thisTransition["positionArray"][shape.nextSlideTransitionIndex][3]
	local nextVertSquare = thisTransition["positionArray"][shape.nextSlideTransitionIndex][4]

    local totalXDist = (nextHorzSquare - currentHorzSquare) * 60
    local totalYDist = (nextVertSquare - currentVertSquare) * mainFunc.allLevelSettings.squareHeight
    local numSquares = nextHorzSquare - currentHorzSquare

    shape.autoSlideDirection = "horz"
    if totalXDist == 0 then
    	numSquares = nextVertSquare - currentVertSquare
    	shape.autoSlideDirection = "vert"
    end
    if numSquares < 0 then
    	numSquares = numSquares * -1
    end

    shape.autoSlideTargetX = shape.x + xCalc(totalXDist)
    shape.autoSlideTargetY = shape.y + yCalc(totalYDist)

    shape.autoSlideTimer[#shape.autoSlideTimer + 1] = timer.performWithDelay(delayTime, function ()
        shape.autoSlideTimer[#shape.autoSlideTimer] = nil
        table.remove(shape.autoSlideTimer, #shape.autoSlideTimer)

        local slideObj = function (shape, obj, isBall)
        	if shape.isActiveWhenSliding == false and obj.alpha == 1 and isBall == false then
        		obj.alpha = 0.3
        	end
        	shape.autoSlideTransition[#shape.autoSlideTransition + 1] = transition.to(obj, {y = obj.y + yCalc(totalYDist), x = obj.x + xCalc(totalXDist), time = numSquares * shape.timePerSquare, onComplete = function ()
	            shape.autoSlideTransition[#shape.autoSlideTransition] = nil
	            table.remove(shape.autoSlideTransition, #shape.autoSlideTransition)
	        end})
        end

        if shape.shouldBallMoveInAutoSlide and (shape.objectType == "simple" or shape.objectType == "backFire" or shape.objectType == "spitter") then
        	slideObj(shape, mainFunc.ballBtnScreenCreate.ball, true)
        end
        if shape.tunnelCircle then
        	slideObj(shape, shape.tunnelCircle, false)
        end
        if shape.bigDirectionArrow then
        	slideObj(shape, shape.bigDirectionArrow, false)
        end
        if shape.upArrow then
        	slideObj(shape, shape.upArrow, false)
        end
        if shape.rightArrow then
        	slideObj(shape, shape.rightArrow, false)
        end
        if shape.downArrow then
        	slideObj(shape, shape.downArrow, false)
        end
        if shape.leftArrow then
        	slideObj(shape, shape.leftArrow, false)
        end
        if shape.directionIndicatorArrow then
        	slideObj(shape, shape.directionIndicatorArrow, false)
        end
        if shape.switchValueText then
        	slideObj(shape, shape.switchValueText, false)
        end
        for a = 1, mainFunc.allLevelSettings.frontScreenObjectsGroup.numChildren do
            if mainFunc.allLevelSettings.frontScreenObjectsGroup[a].relatedShape == shape.name then
            	slideObj(shape, mainFunc.allLevelSettings.frontScreenObjectsGroup[a], false)
            end
        end
        for a=1, #mainFunc.allLevelSettings.connectorArray do
			if mainFunc.allLevelSettings.connectorArray[a].relatedShape == shape.name then
				mainFunc.allLevelSettings.connectorArray[a].alpha = 1
			end
	    end
        shape.isAutoSliding = true
        if shape.isActiveWhenSliding == false then
        	shape.enabled = false
        	if shape.objectType == "shape" then
        		shape:setSequence(shape.shape .. "-sliding")
        		shape.width = shape.origWidth
        		shape.height = shape.origHeight
        	end
        end
        shape.autoSlideTransition[#shape.autoSlideTransition + 1] = transition.to(shape, {y = shape.y + yCalc(totalYDist), x = shape.x + xCalc(totalXDist), time = numSquares * shape.timePerSquare, onComplete = function ()
            shape.enabled = true
            if shape.objectType == "shape" and (shapeArrayParameters[shape.shapeArrayIndex][7] ~= "bar" and shapeArrayParameters[shape.shapeArrayIndex][7] ~= "doubleBar") then
        		shape:setSequence(shape.shape)
        		shape.width = shape.origWidth
        		shape.height = shape.origHeight
        	end
        	if shape.tunnelCircle and shape.tunnelCircle.alpha == 0.3 then
	        	shape.tunnelCircle.alpha = 1
	        end
	        if shape.bigDirectionArrow and shape.bigDirectionArrow.alpha > 0 then
	        	shape.bigDirectionArrow.alpha = 1
	        end
	        if shape.upArrow and shape.upArrow.alpha == 0.3 then
	        	shape.upArrow.alpha = 1
	        end
	        if shape.rightArrow and shape.rightArrow.alpha == 0.3 then
	        	shape.rightArrow.alpha = 1
	        end
	        if shape.downArrow and shape.downArrow.alpha == 0.3 then
	        	shape.downArrow.alpha = 1
	        end
	        if shape.leftArrow and shape.leftArrow.alpha == 0.3 then
	        	shape.leftArrow.alpha = 1
	        end
	        if shape.directionIndicatorArrow and shape.directionIndicatorArrow.alpha > 0 then
	        	shape.directionIndicatorArrow.alpha = 1
	        end
	        for a = 1, mainFunc.allLevelSettings.frontScreenObjectsGroup.numChildren do
	            if mainFunc.allLevelSettings.frontScreenObjectsGroup[a].relatedShape == shape.name then
	            	mainFunc.allLevelSettings.frontScreenObjectsGroup[a].alpha = 1
	            end
	        end
	        for a=1, #mainFunc.allLevelSettings.connectorArray do
				if mainFunc.allLevelSettings.connectorArray[a].relatedShape == shape.name
				and mainFunc.allLevelSettings.connectorArray[a].x > (shape.x - (mainFunc.allLevelSettings.squareWidth / 2) )
				and mainFunc.allLevelSettings.connectorArray[a].x < (shape.x + (mainFunc.allLevelSettings.squareWidth / 2) )
				and mainFunc.allLevelSettings.connectorArray[a].y > (shape.y - ( mainFunc.allLevelSettings.squareHeight/2 ) )
				and mainFunc.allLevelSettings.connectorArray[a].y < (shape.y + ( mainFunc.allLevelSettings.squareHeight/2 ) ) then
				    mainFunc.allLevelSettings.connectorArray[a].alpha = 0
				elseif mainFunc.allLevelSettings.connectorArray[a].relatedShape == shape.name then
					mainFunc.allLevelSettings.connectorArray[a].alpha = 1
				end
		    end
            shape.autoSlideTransition[#shape.autoSlideTransition] = nil
            table.remove(shape.autoSlideTransition, #shape.autoSlideTransition)

            shape.isAutoSliding = false

            if mainFunc.allLevelSettings.followShapeWithBallApplied and
            mainFunc.ballBtnScreenCreate.ball.x == mainFunc.allLevelSettings.currentShapeBallShouldFollow.x and
			mainFunc.ballBtnScreenCreate.ball.y == mainFunc.allLevelSettings.currentShapeBallShouldFollow.y then
	            Runtime:removeEventListener("enterFrame", mainFunc.objectToBallTransitionScript.listener)
	            mainFunc.allLevelSettings.followShapeWithBallApplied = false
	            mainFunc.ballBtnScreenCreate.ball.x = mainFunc.allLevelSettings.currentShapeBallShouldFollow.x
				mainFunc.ballBtnScreenCreate.ball.y = mainFunc.allLevelSettings.currentShapeBallShouldFollow.y
	        end

            shape.autoSlideTimer[#shape.autoSlideTimer + 1] = timer.performWithDelay(shape.pauseTime, function ()
            	
            	shape.autoSlideTimer[#shape.autoSlideTimer] = nil
	            table.remove(shape.autoSlideTimer, #shape.autoSlideTimer)

            	shape.currentSlideTransitionIndex = shape.nextSlideTransitionIndex
                mainFunc.transitionFunctionScript.actionAutoSlideTimer(mainFunc, shape, false)
            end)
        end})
    end)
end
	t.actionAutoSlideTimer = actionAutoSlideTimer

local transitionArrayStateCheckNew = function (thisTransitionObject, mainFunc, shapeArray, shapeArrayParameters)

	local ad = thisTransitionObject.additionalCounterForDummyConnector * 2
    local d = thisTransitionObject.newDVal;
	local thisTransition = mainFunc.allLevelSettings.transitionArrayIndex[d];
	local positions = thisTransition["positionArray"];
	local tIndex = thisTransitionObject.transitionArrayState;
	
	if (thisTransition["shapeName"] == thisTransitionObject.name) then
		thisTransitionObject.thisTransitionHorzSquare = positions[tIndex+ad][3]
		thisTransitionObject.thisTransitionVertSquare = positions[tIndex+ad][4]
		thisTransitionObject.thisTransitionSquareIndex = positions[tIndex+ad][5] and positions[tIndex+ad][5] or nil
		if tIndex < #positions then
			thisTransitionObject.nextTransitionHorzSquare = positions[tIndex+1+ad][3];
			thisTransitionObject.nextTransitionVertSquare = positions[tIndex+1+ad][4];
			thisTransitionObject.nextTransitionSquareIndex = positions[tIndex+1+ad][5] and positions[tIndex+1+ad][5] or nil;
		else
			thisTransitionObject.nextTransitionHorzSquare = "null"
			thisTransitionObject.nextTransitionVertSquare = "null"
			thisTransitionObject.nextTransitionSquareIndex = nil
		end
		if tIndex > 1 then
			thisTransitionObject.prevTransitionHorzSquare = positions[tIndex-1+ad][3]
			thisTransitionObject.prevTransitionVertSquare = positions[tIndex-1+ad][4]
			thisTransitionObject.prevTransitionSquareIndex = positions[tIndex-1+ad][5] and positions[tIndex-1+ad][5] or nil;
		else
			thisTransitionObject.prevTransitionHorzSquare = "null"
			thisTransitionObject.prevTransitionVertSquare = "null"
			thisTransitionObject.prevTransitionSquareIndex = nil
		end
	end
    
    thisTransitionObject.enabled = true
    thisTransitionObject.transitionCounter = 0
    thisTransitionObject.relevantHorzSquare = thisTransitionObject.thisTransitionHorzSquare
    thisTransitionObject.relevantVertSquare = thisTransitionObject.thisTransitionVertSquare
	mainFunc.objectFunctionsScript.bombGroupCheck(mainFunc, "after", thisTransitionObject)
    mainFunc.allLevelSettings.stillTransitioningCounter = 0
    mainFunc.allLevelSettings.transitionMoveCounter = 0
    mainFunc.allLevelSettings.secondTransitionMoveCounter = 0
    for z = 1, #shapeArray do
		if shapeArrayParameters[z]["name"] == thisTransitionObject.name
		and shapeArrayParameters[z]["type"] == "shape" then
		    local function addPhysicsBodyToShape ()
		    	shapeFormingArray = mainFunc.shapeRelatedArrays.shapeFormingArray
		    	ball = mainFunc.ballBtnScreenCreate.ball
				for a = 1, #shapeFormingArray do
				    if shapeFormingArray[a][1] == shapeArrayParameters[z]["subType"] then
						if ball.x > (thisTransitionObject.x - 41)
						and ball.x < (thisTransitionObject.x + 38) 
						and ball.y > (thisTransitionObject.y - 38) 
						and ball.y < (thisTransitionObject.y + 40) then
						    timer.performWithDelay(50, addPhysicsBodyToShape, 1)
						else
						    physics.addBody( thisTransitionObject, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][2] } )
						    thisTransitionObject.isTransitioning = false
						end
				    end
				end
				thisTransitionObject.alpha = 1
		    end
		    
		    if thisTransitionObject.isTransitioning == false then
		    	timer.performWithDelay(100, addPhysicsBodyToShape, 1)
		    	thisTransitionObject.isTransitioning = true
		    end
		    
		    for a=1, #mainFunc.allLevelSettings.connectorArray do
				if mainFunc.allLevelSettings.connectorArray[a].relatedShape == thisTransitionObject.name then
				    mainFunc.allLevelSettings.connectorArray[a].alpha = 1
				end
				if mainFunc.allLevelSettings.connectorArray[a].x > (thisTransitionObject.x - (mainFunc.allLevelSettings.squareWidth / 2) )
				and mainFunc.allLevelSettings.connectorArray[a].x < (thisTransitionObject.x + (mainFunc.allLevelSettings.squareWidth / 2) )
				and mainFunc.allLevelSettings.connectorArray[a].y > (thisTransitionObject.y - ( mainFunc.allLevelSettings.squareHeight/2 ) )
				and mainFunc.allLevelSettings.connectorArray[a].y < (thisTransitionObject.y + ( mainFunc.allLevelSettings.squareHeight/2 ) ) then
				    mainFunc.allLevelSettings.connectorArray[a].alpha = 0
				end
		    end
		elseif shapeArrayParameters[z]["name"] == thisTransitionObject.name
		and shapeArrayParameters[z]["type"] ~= "shape" then
		    thisTransitionObject.alpha = 1
		    thisTransitionObject.isTransitioning = false
		    thisTransitionObject.isEnabled = true
		end
    end

    if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"] then
    	if mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onSlideAction"] then
        	mainFunc.levelConfigArray[currentWorld]["level"..currentLevel][currentMedal]["tutorial"]["onSlideAction"](mainFunc, thisTransitionObject, shapeArray)
    	end
    end

end
	t.transitionArrayStateCheckNew = transitionArrayStateCheckNew

local mainTransitionMoveSomething = function (thisTransitionObject, mainFunc, shapeArray, shapeArrayParameters, isActualConnector)
	local endTransition, prepareSimpleTransition, prepareSpitterTransition, firstSlideTransition, secondSlideTransition, moveBallWithObjectTransition, endFirstTransition

	moveBallWithObjectTransition = function (thisTransitionObject, direction, distance, slideTime)
		if thisTransitionObject.isBallPresent == true then
			if direction == "horz" then
				transition.to(mainFunc.ballBtnScreenCreate.ball, {x = mainFunc.ballBtnScreenCreate.ball.x + distance, time = slideTime})
			else
				transition.to(mainFunc.ballBtnScreenCreate.ball, {y = mainFunc.ballBtnScreenCreate.ball.y + distance, time = slideTime})
			end
		end
		if direction == "horz" then
			if mainFunc.ballBtnScreenCreate.ballDummy and thisTransitionObject.shapeArrayIndex == mainFunc.ballBtnScreenCreate.ballDummy.fanIndex then
				transition.to(mainFunc.ballBtnScreenCreate.ballDummy, {x = mainFunc.ballBtnScreenCreate.ballDummy.x + distance, time = slideTime})
			end
		else
			if mainFunc.ballBtnScreenCreate.ballDummy and thisTransitionObject.shapeArrayIndex == mainFunc.ballBtnScreenCreate.ballDummy.fanIndex then
				transition.to(mainFunc.ballBtnScreenCreate.ballDummy, {y = mainFunc.ballBtnScreenCreate.ballDummy.y + distance, time = slideTime})
			end
		end
	end

	prepareTunnelTransition = function (thisTransitionObject, direction, distance, slideTime)

		if (thisTransitionObject.tunnelCircle) then
			if direction == "horz" then
				transition.to(thisTransitionObject.tunnelCircle, {x = thisTransitionObject.tunnelCircle.x + distance, time = slideTime})
			else
				transition.to(thisTransitionObject.tunnelCircle, {y = thisTransitionObject.tunnelCircle.y + distance, time = slideTime})
			end
		end

		moveBallWithObjectTransition(thisTransitionObject, direction, distance, slideTime)
	end

	prepareSimpleTransition = function (thisTransitionObject, direction, distance, slideTime)

		if (thisTransitionObject.bigDirectionArrow) then
			if direction == "horz" then
				transition.to(thisTransitionObject.bigDirectionArrow, {x = thisTransitionObject.bigDirectionArrow.x + distance, time = slideTime})
			else
				transition.to(thisTransitionObject.bigDirectionArrow, {y = thisTransitionObject.bigDirectionArrow.y + distance, time = slideTime})
			end
		end

		moveBallWithObjectTransition(thisTransitionObject, direction, distance, slideTime)
		
	end

	prepareSpitterTransition = function (thisTransitionObject, direction, distance, slideTime)

		local thisSpitterArray = {}
		local thisSpitterDirectionArray = {}
		table.insert(thisSpitterArray, thisTransitionObject.upEnabled)
		table.insert(thisSpitterArray, thisTransitionObject.rightEnabled)
		table.insert(thisSpitterArray, thisTransitionObject.downEnabled)
		table.insert(thisSpitterArray, thisTransitionObject.leftEnabled)
		for a=1, #thisSpitterArray do
		    if thisSpitterArray[a] == true then
				if a == 1 then
				    table.insert(thisSpitterDirectionArray, thisTransitionObject.upArrow)
				elseif a == 2 then
				    table.insert(thisSpitterDirectionArray, thisTransitionObject.rightArrow)
				elseif a == 3 then
				    table.insert(thisSpitterDirectionArray, thisTransitionObject.downArrow)
				elseif a == 4 then
				    table.insert(thisSpitterDirectionArray, thisTransitionObject.leftArrow)
				end
		    else
				table.insert(thisSpitterDirectionArray, "")
		    end
		end

		for a=1, #thisSpitterArray do
		    if thisSpitterArray[a] == true then
		    	if direction == "horz" then
					transition.to(thisSpitterDirectionArray[a], {x = thisSpitterDirectionArray[a].x + distance, time = slideTime})
				else
					transition.to(thisSpitterDirectionArray[a], {y = thisSpitterDirectionArray[a].y + distance, time = slideTime})
				end	
		    end
		end

		moveBallWithObjectTransition(thisTransitionObject, direction, distance, slideTime)
	end

	firstSlideTransition = function (thisTransitionObject, numSquares, transitionNum)
		if thisTransitionObject.objectType == "shape" then
			thisTransitionObject:setSequence(thisTransitionObject.shape .. "-sliding")
			thisTransitionObject.width = thisTransitionObject.origWidth
			thisTransitionObject.height = thisTransitionObject.origHeight
		end
		
		local slideTime, distance
		local posNumSquares = numSquares

		if posNumSquares < 0 then
			posNumSquares = posNumSquares * -1
		end

		if (thisTransitionObject.objectType == "shape") then
	    	physics.removeBody( thisTransitionObject )
	    end
		if thisTransitionObject.thisTransitionDirection == "horz" then
			slideTime = xCalc(50) * posNumSquares
			distance = mainFunc.allLevelSettings.squareWidth * numSquares
	    else
			slideTime = yCalc(50) * posNumSquares
			distance = mainFunc.allLevelSettings.squareHeight * numSquares
	    end

		local sign = "plus"
		if thisTransitionObject.nextOrPrevState == "prev" then
			sign = "minus"
		end
	    if thisTransitionObject.thisTransitionDirection == "horz" then
	    	transition.to(thisTransitionObject, {x = thisTransitionObject.x + distance, time = slideTime, onComplete = function ()
	    		if transitionNum == 1 then
	    			endFirstTransition(sign, mainFunc, shapeArray, shapeArrayParameters)
	    		else
	    			endTransition(sign, mainFunc, shapeArray, shapeArrayParameters)
	    		end
	    	end})
	    else
	    	transition.to(thisTransitionObject, {y = thisTransitionObject.y + distance, time = slideTime, onComplete = function ()
	    		if transitionNum == 1 then
	    			endFirstTransition(sign, mainFunc, shapeArray, shapeArrayParameters)
	    		else
	    			endTransition(sign, mainFunc, shapeArray, shapeArrayParameters)
	    		end
	    	end})
	    end
    	if thisTransitionObject.objectType == "spitter" then
			prepareSpitterTransition(thisTransitionObject, thisTransitionObject.thisTransitionDirection, distance, slideTime)
		elseif thisTransitionObject.objectType == "tunnel" then
			prepareTunnelTransition(thisTransitionObject, thisTransitionObject.thisTransitionDirection, distance, slideTime)
		elseif thisTransitionObject.objectType == "simple" or thisTransitionObject.objectType == "backFire" then
			prepareSimpleTransition(thisTransitionObject, thisTransitionObject.thisTransitionDirection, distance, slideTime)
    	elseif thisTransitionObject.objectType == "shape" then
            for a = 1, mainFunc.allLevelSettings.frontScreenObjectsGroup.numChildren do
                if mainFunc.allLevelSettings.frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                	if thisTransitionObject.thisTransitionDirection == "horz" then

	    				transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup[a], {x = mainFunc.allLevelSettings.frontScreenObjectsGroup[a].x + distance, time = slideTime})
                    else
	    				transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup[a], {y = mainFunc.allLevelSettings.frontScreenObjectsGroup[a].y + distance, time = slideTime})
                    end
                end
            end
        elseif thisTransitionObject.objectType == "manualFan"
        or thisTransitionObject.objectType == "autoFan" then
        	if thisTransitionObject.thisTransitionDirection == "horz" then
            	transition.to(thisTransitionObject.directionIndicatorArrow, {x = thisTransitionObject.directionIndicatorArrow.x + distance, time = slideTime})
        	else
				transition.to(thisTransitionObject.directionIndicatorArrow, {y = thisTransitionObject.directionIndicatorArrow.y + distance, time = slideTime})
        	end
        end

        if thisTransitionObject.switchValueText then
        	if thisTransitionObject.thisTransitionDirection == "horz" then
        		transition.to(thisTransitionObject.switchValueText, {x = thisTransitionObject.switchValueText.x + distance, time = slideTime})
        	else
        		transition.to(thisTransitionObject.switchValueText, {y = thisTransitionObject.switchValueText.y + distance, time = slideTime})
        	end
        end
	end

	endTransition = function (sign, mainFunc, shapeArray, shapeArrayParameters)
		if isActualConnector == false then
			if thisTransitionObject.thisTransitionDirection == "horz" then
	        	thisTransitionObject.thisTransitionDirection = "vert"
	        else
	        	thisTransitionObject.thisTransitionDirection = "horz"
	        end
	        thisTransitionObject.storedTransitionDistance = thisTransitionObject.thisTransitionDistance
	        if transDirection == "horz" then
	            thisTransitionObject.storedTransitionDistance = thisTransitionObject.storedTransitionDistance * thisTransitionObject.thisTransitionXDirection
	        end

			if thisTransitionObject.nextOrPrevState == "next" and thisTransitionObject.nextTransitionSquareIndex then
                thisTransitionObject.additionalCounterForDummyConnector = thisTransitionObject.additionalCounterForDummyConnector + 1
			elseif thisTransitionObject.nextOrPrevState == "prev" and thisTransitionObject.prevTransitionSquareIndex then
                thisTransitionObject.additionalCounterForDummyConnector = thisTransitionObject.additionalCounterForDummyConnector - 1
            else
                thisTransitionObject.additionalCounterForDummyConnector = 0
            end

	    	transitionArrayStateCheckNew(thisTransitionObject, mainFunc, shapeArray, shapeArrayParameters)
	    	thisTransitionObject.additionalCounterForDummyConnector = 0

	    	if thisTransitionObject.nextOrPrevState == "next" and thisTransitionObject.nextTransitionSquareIndex then
                isActualConnector = false
                thisTransitionObject.additionalCounterForDummyConnector = thisTransitionObject.additionalCounterForDummyConnector + 1
            elseif thisTransitionObject.nextOrPrevState == "prev" and thisTransitionObject.prevTransitionSquareIndex then
                isActualConnector = false
                thisTransitionObject.additionalCounterForDummyConnector = thisTransitionObject.additionalCounterForDummyConnector - 1
            else
                isActualConnector = true
                thisTransitionObject.additionalCounterForDummyConnector = 0
            end

            if thisTransitionObject.thisTransitionDirection == "horz" then
	            if thisTransitionObject.nextTransitionHorzSquare ~= "null"
	            and thisTransitionObject.nextTransitionHorzSquare > thisTransitionObject.thisTransitionHorzSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.nextTransitionHorzSquare - thisTransitionObject.thisTransitionHorzSquare
	            elseif thisTransitionObject.nextTransitionHorzSquare ~= "null" and thisTransitionObject.nextTransitionHorzSquare < thisTransitionObject.thisTransitionHorzSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.thisTransitionHorzSquare - thisTransitionObject.nextTransitionHorzSquare
	            elseif thisTransitionObject.nextTransitionHorzSquare ~= "null" and thisTransitionObject.nextTransitionHorzSquare == thisTransitionObject.thisTransitionHorzSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.nextTransitionVertSquare - thisTransitionObject.thisTransitionVertSquare
	            end
	        elseif thisTransitionObject.thisTransitionDirection == "vert" then
	            if  thisTransitionObject.prevTransitionVertSquare ~= "null" and thisTransitionObject.prevTransitionVertSquare > thisTransitionObject.thisTransitionVertSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.prevTransitionVertSquare - thisTransitionObject.thisTransitionVertSquare
	            elseif  thisTransitionObject.prevTransitionVertSquare ~= "null" and thisTransitionObject.prevTransitionVertSquare < thisTransitionObject.thisTransitionVertSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.prevTransitionVertSquare - thisTransitionObject.thisTransitionVertSquare
	            elseif thisTransitionObject.prevTransitionVertSquare ~= "null" and thisTransitionObject.prevTransitionVertSquare == thisTransitionObject.thisTransitionVertSquare then
	                thisTransitionObject.thisTransitionDistance = thisTransitionObject.thisTransitionHorzSquare - thisTransitionObject.prevTransitionHorzSquare
	            end
	        end
            thisTransitionObject.storedTransitionDistance = thisTransitionObject.thisTransitionDistance
            if thisTransitionObject.thisTransitionDirection == "horz" then
                thisTransitionObject.storedTransitionDistance = thisTransitionObject.storedTransitionDistance
            end

	        mainFunc.transitionFunctionScript.mainTransitionMoveSomething(thisTransitionObject, mainFunc, shapeArray, shapeArrayParameters, isActualConnector)
	    else
	    	thisTransitionObject.additionalCounterForDummyConnector = 0
			if (sign == "plus") then
				thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState + 1
			else
				thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState - 1
			end
			if (thisTransitionObject.objectType == "shape") then
		    	physics.addBody( thisTransitionObject, "static", thisTransitionObject.relevantPhysicsBodyParams )
		    end
		    transitionArrayStateCheckNew(thisTransitionObject, mainFunc, shapeArray, shapeArrayParameters)

		    if thisTransitionObject.objectType == "tunnel" then
		    	thisTransitionObject.relevantLowerX = thisTransitionObject.x - (mainFunc.allLevelSettings.squareWidth/2)
		        thisTransitionObject.relevantHigherX = thisTransitionObject.x + (mainFunc.allLevelSettings.squareWidth/2)
		        thisTransitionObject.relevantLowerY = thisTransitionObject.y - (mainFunc.allLevelSettings.squareHeight/2)
		        thisTransitionObject.relevantHigherY = thisTransitionObject.y + (mainFunc.allLevelSettings.squareHeight/2)
		    end

		    if thisTransitionObject.objectType == "shape" then
				thisTransitionObject:setSequence(thisTransitionObject.shape)
				thisTransitionObject.width = thisTransitionObject.origWidth
				thisTransitionObject.height = thisTransitionObject.origHeight
			end
		end
	end

	endFirstTransition = function (sign, mainFunc, shapeArray, shapeArrayParameters)
	    secondSlideTransition()
	end

	secondSlideTransition = function ()
		if thisTransitionObject.nextOrPrevState == "next" and thisTransitionObject.thisTransitionDirection == "horz" then
		    if thisTransitionObject.nextTransitionVertSquare ~= thisTransitionObject.thisTransitionVertSquare then
		        local thisSecondTransitionDistance = thisTransitionObject.nextTransitionVertSquare - thisTransitionObject.thisTransitionVertSquare
		        thisTransitionObject.thisTransitionDirection = "vert"
		    	firstSlideTransition(thisTransitionObject, thisSecondTransitionDistance, 2)
		    else
				endTransition("plus", mainFunc, shapeArray, shapeArrayParameters)
		    end
		elseif thisTransitionObject.nextOrPrevState == "next" and thisTransitionObject.thisTransitionDirection == "vert" then
		    if thisTransitionObject.nextTransitionHorzSquare ~= thisTransitionObject.thisTransitionHorzSquare then
		        local thisSecondTransitionDistance = thisTransitionObject.thisTransitionHorzSquare - thisTransitionObject.nextTransitionHorzSquare
		        thisTransitionObject.thisTransitionDirection = "horz"
		    	firstSlideTransition(thisTransitionObject, thisSecondTransitionDistance, 2)
		    else
				endTransition("plus", mainFunc, shapeArray, shapeArrayParameters)
		    end
		elseif thisTransitionObject.nextOrPrevState == "prev" and thisTransitionObject.thisTransitionDirection == "vert" then
		    if thisTransitionObject.prevTransitionHorzSquare ~= thisTransitionObject.thisTransitionHorzSquare then
		    	local thisSecondTransitionDistance = thisTransitionObject.prevTransitionHorzSquare - thisTransitionObject.thisTransitionHorzSquare
		    	thisTransitionObject.thisTransitionDirection = "horz"
		    	firstSlideTransition(thisTransitionObject, thisSecondTransitionDistance, 2)
		    else
				endTransition("minus", mainFunc, shapeArray, shapeArrayParameters)
		    end
		elseif thisTransitionObject.nextOrPrevState == "prev" and thisTransitionObject.thisTransitionDirection == "horz" then
		    if thisTransitionObject.prevTransitionVertSquare ~= thisTransitionObject.thisTransitionVertSquare then
		    	local thisSecondTransitionDistance = thisTransitionObject.thisTransitionVertSquare - thisTransitionObject.prevTransitionVertSquare
		    	thisTransitionObject.thisTransitionDirection = "vert"
		    	firstSlideTransition(thisTransitionObject, thisSecondTransitionDistance, 2)
		    else
				endTransition("minus", mainFunc, shapeArray, shapeArrayParameters)
		    end
		else
		    if thisTransitionObject.nextOrPrevState == "next" then
				endTransition("plus", mainFunc, shapeArray, shapeArrayParameters)
		    else
				endTransition("minus", mainFunc, shapeArray, shapeArrayParameters)
		    end
		end
	end

    mainFunc.allLevelSettings.stillTransitioningCounter = 1
    
	firstSlideTransition(thisTransitionObject, thisTransitionObject.storedTransitionDistance, 1)
	object1Counter = 1

    if thisTransitionObject.isFocus == true then
		thisTransitionObject.isFocus = false
		display.getCurrentStage():setFocus( nil )
    end
end
	t.mainTransitionMoveSomething = mainTransitionMoveSomething


-- NOW CREATE TRANSITION SETTINGS
-- EXT: Loop through TransitionArrayIndex at start of Level, (after Level Object Creation)
-- And apply relevant Transitions
local prepareTransitioningObjects = function (mainFunc)
	for y = 1, #mainFunc.allLevelSettings.transitionArrayIndex do
	    local thisTransition = mainFunc.allLevelSettings.transitionArrayIndex[y];

	    if thisTransition["transitionType"] == "flip-horizontal" then
	        for z = 1, #shapeArray do
	            if shapeArray[z].name == thisTransition["shapeName"] then
	                if shapeArrayParameters[z]["props"][1] == 2 then
	                    shapeArray[z].transitionArrayState = 2
	                    shapeArray[z].originalState = 2
	                    shapeArrayParameters[z]["props"][1] = 1
	                else
	                    shapeArray[z].transitionArrayState = 1
	                    shapeArray[z].originalState = 1
	                    shapeArrayParameters[z]["props"][1] = 2
	                end
	                shapeArray[z].flipped = false
	                shapeArray[z].flipDisabled = false
	                thisFlippingShapeIndex = z
	                thisFlipTransitionDirection = "flip-horizontal"
	                mainFunc.objectCreateScript.addFlipIndicatorTriangles(mainFunc, shapeArray, shapeArrayParameters)
	                
	            end
	        end
	    elseif thisTransition["transitionType"] == "flip-vertical" then
	        for z = 1, #shapeArray do
	            if shapeArray[z].name == thisTransition["shapeName"] then
	                if shapeArrayParameters[z]["props"][1] == 2 then
	                    shapeArray[z].transitionArrayState = 2
	                    shapeArray[z].originalState = 2
	                else
	                    shapeArray[z].transitionArrayState = 1
	                    shapeArray[z].originalState = 1
	                end
	                shapeArray[z].flipped = false
	                thisFlippingShapeIndex = z
	                thisFlipTransitionDirection = "flip-vertical"
	                mainFunc.objectCreateScript.addFlipIndicatorTriangles(mainFunc, shapeArray, shapeArrayParameters)
	            end
	        end
	    elseif thisTransition["transitionType"] == "slide"
	    or thisTransition["transitionType"] == "autoSlide"
	    or thisTransition["transitionType"] == "switchSlide" then
	        local connector, shapeType
	        for z = 1, #shapeArray do
	            if shapeArray[z].name == thisTransition["shapeName"] then
	                shapeType = shapeArrayParameters[z]["type"]
	        		if shapeType == "shape" and (shapeArrayParameters[z]["subType"] == "bar" or shapeArrayParameters[z]["subType"] == "doubleBar") then
	        			shapeType = "bar"
	        		end
	            end
	        end
	        local thisSpotColour = mainFunc.allLevelSettings.shapeColourArray[shapeType];
	        local lastConnectorY, lastConnectorX, lastConnectorXSquare, lastConnectorYSquare;
	        local connectorXSquare, connectorYSquare, isActualConnector;

	        if thisTransition["props"]["labelled"] == false then

	        else
		        for x = 1, #thisTransition["positionArray"] do
					local position = thisTransition["positionArray"][x];
					connectorXSquare = position[3];
					connectorYSquare = position[4];
					isActualConnector = position[5] ~= "*";

					if isActualConnector then
						connector = display.newSprite(mainFunc.allLevelSettings.connectorSpotsImageSheet, mainFunc.allLevelSettings.connectorSpotsSequenceData)
						connector:setSequence(thisSpotColour)
						connector.height = yCalc(18)
						connector.width = xCalc(18)
						--connector:setReferencePoint(display.CenterCenterReferencePoint);
						connector.anchorX = 0.5
						connector.anchorY = 0.5
						table.insert(mainFunc.allLevelSettings.connectorArray, connector)
						connector.relatedShape = thisTransition["shapeName"];
						connector.x = ((position[1] - 1) * display.contentWidth) + (((position[3] - 1) * mainFunc.allLevelSettings.squareWidth) + (mainFunc.allLevelSettings.gutterWidth) + (mainFunc.allLevelSettings.squareWidth/2) )
						connector.xSquare = position[3]
						connector.y = ((position[2] - 1) * display.contentHeight) + (((position[4] - 1) * mainFunc.allLevelSettings.squareHeight) + (mainFunc.allLevelSettings.gutterHeight) + (mainFunc.allLevelSettings.squareHeight/2) )
						connector.ySquare = position[4]

						for z = 1, #shapeArray do
							if shapeArray[z].name == thisTransition["shapeName"]
							and (shapeArrayParameters[z]["subType"] == "bar" or shapeArrayParameters[z]["subType"] == "doubleBar") then
								if shapeArray[z].state == "horz" then
									connector.x = connector.x - (mainFunc.allLevelSettings.squareWidth / 2)
								else
									connector.y = connector.y - (mainFunc.allLevelSettings.squareHeight / 2)
								end
								if shapeArrayParameters[z]["subType"] == "doubleBar" then
									if shapeArray[z].state == "vert" then
										connector.x = connector.x - (mainFunc.allLevelSettings.squareWidth / 2)
									else
										connector.y = connector.y + (mainFunc.allLevelSettings.squareHeight / 2)
									end
								end
							elseif shapeArray[z].name == thisTransition["shapeName"]
							and shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape" then
								connector.x = connector.x + (mainFunc.allLevelSettings.squareWidth / 2)
							elseif shapeArray[z].name == thisTransition["shapeName"]
							and shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape" then
								connector.y = connector.y + (mainFunc.allLevelSettings.squareHeight / 2)
							end
						end

						connectorX = connector.x
						connectorY = connector.y
					else
						connectorX = ((position[1] - 1) * display.contentWidth) + (((position[3] - 1) * mainFunc.allLevelSettings.squareWidth) + (mainFunc.allLevelSettings.gutterWidth) + (mainFunc.allLevelSettings.squareWidth/2) )
						connectorY = ((position[2] - 1) * display.contentHeight) + (((position[4] - 1) * mainFunc.allLevelSettings.squareHeight) + (mainFunc.allLevelSettings.gutterHeight) + (mainFunc.allLevelSettings.squareHeight/2) )						
					end

					if x > 1 then
						thisConnectorHasXDistance = false
						thisConnectorXDistance = connectorXSquare - lastConnectorXSquare

						while thisConnectorXDistance > 0 do
							thisConnectorHasXDistance = true
							connectorTubeHorizontal = display.newSprite(mainFunc.allLevelSettings.horizontalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
							connectorTubeHorizontal:setSequence(thisSpotColour)
							
							if thisConnectorXDistance  == 1 then

							end

							mainFunc.allLevelSettings.backgroundObjectsGroup:insert( connectorTubeHorizontal )
							connectorTubeHorizontal.shapeType = "connectorTube"
							--connectorTubeHorizontal:setReferencePoint(display.CenterLeftReferencePoint);
							connectorTubeHorizontal.anchorX = 0
							connectorTubeHorizontal.anchorY = 0.5
							connectorTubeHorizontal.width = mainFunc.allLevelSettings.squareWidth
							connectorTubeHorizontal.height = 8
							connectorTubeHorizontal.x = lastConnectorX
							connectorTubeHorizontal.y = lastConnectorY

							for z = 1, #shapeArray do
								if shapeArray[z].name == thisTransition["shapeName"] then
									if shapeArrayParameters[z]["subType"] == "triangleTopLeftShape" or shapeArrayParameters[z]["subType"] == "triangleBottomLeftShape" then
										connectorTubeHorizontal.x = connectorTubeHorizontal.x + 4
									elseif shapeArrayParameters[z]["subType"] == "triangleBottomRightShape" or shapeArrayParameters[z]["subType"] == "triangleTopRightShape" then
										connectorTubeHorizontal.x = connectorTubeHorizontal.x - 4
									end
								end
							end

							lastConnectorX = lastConnectorX + mainFunc.allLevelSettings.squareWidth
							thisConnectorXDistance = thisConnectorXDistance - 1
						end
						
						thisConnectorYDistance = connectorYSquare - lastConnectorYSquare
						wholeConnectorYDistance = thisConnectorYDistance
						originalConnectorYDistance = thisConnectorYDistance

						if thisConnectorYDistance < 0 then
							while thisConnectorYDistance < 0 do
								print(thisConnectorYDistance, wholeConnectorYDistance, thisConnectorHasXDistance);
								if thisConnectorYDistance == wholeConnectorYDistance and thisConnectorHasXDistance then
									print("he");
									connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
								elseif thisConnectorYDistance == wholeConnectorYDistance and thisConnectorHasXDistance == false then
									if isActualConnector then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									--connectorTubeVertical.width = 52
									--connectorTubeVertical.height = 8
									elseif isActualConnector == false and wholeConnectorYDistance == 1 then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									elseif isActualConnector == false and wholeConnectorYDistance ~= 1 then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									end
								elseif thisConnectorYDistance == 1 and wholeConnectorYDistance ~= 1 then
									if isActualConnector then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									--connectorTubeVertical.width = 52
									--connectorTubeVertical.height = 8
									elseif isActualConnector == false then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									end
								elseif thisConnectorYDistance ~= wholeConnectorYDistance then
									print("h");
									connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
								end

								--[[
								if thisConnectorYDistance == wholeConnectorYDistance and thisConnectorHasXDistance == true then
									connectorTubeVertical = display.newImageRect("images/objects/shapes/connectorPieces/" .. thisSpotColour .. "-Vertical-Bottom.png", 15, 52)
								elseif thisConnectorYDistance == -1 then
									if isActualConnector then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										connectorTubeVertical:setSequence(thisSpotColour)
									elseif isActualConnector == false then
										connectorTubeVertical = display.newImageRect("images/objects/shapes/connectorPieces/" .. thisSpotColour .. "-Vertical-Bottom.png", 15, 52)
									end
								elseif thisConnectorYDistance ~= wholeConnectorYDistance then
									connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									connectorTubeVertical:setSequence(thisSpotColour)
								end
								]]
								
								connectorTubeVertical:setSequence(thisSpotColour);
								mainFunc.allLevelSettings.backgroundObjectsGroup:insert( connectorTubeVertical )
								connectorTubeVertical.shapeType = "connectorTube"
								--connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
								connectorTubeVertical.anchorX = 0
								connectorTubeVertical.anchorY = 0.5

								connectorTubeVertical.x = lastConnectorX
								if thisConnectorYDistance == wholeConnectorYDistance then

									connectorTubeVertical.height = mainFunc.allLevelSettings.squareHeight
									if thisConnectorHasXDistance == false then
										-- connectorTubeVertical.width = 8
										connectorTubeVertical.x = connectorTubeVertical.x - ((3.5/60) * mainFunc.allLevelSettings.squareWidth)
									else
										-- connectorTubeVertical.width = 17
										connectorTubeVertical.x = connectorTubeVertical.x - 10.5
									end
									connectorTubeVertical.y = lastConnectorY - (mainFunc.allLevelSettings.squareHeight/2) + 4.175
									print("jo");
								else
									print("yo");
									connectorTubeVertical.height = mainFunc.allLevelSettings.squareHeight
									-- connectorTubeVertical.width = 8
									--connectorTubeVertical.rotation = 90
									connectorTubeVertical.y = lastConnectorY - ((19/52) * mainFunc.allLevelSettings.squareHeight)
									connectorTubeVertical.x = connectorTubeVertical.x - ((2.9/60) * mainFunc.allLevelSettings.squareWidth)
								end

								lastConnectorY = lastConnectorY - mainFunc.allLevelSettings.squareHeight
								thisConnectorYDistance = thisConnectorYDistance + 1
							end
						elseif thisConnectorYDistance > 0 then
							while thisConnectorYDistance > 0 do

								local verticalBottomUsed = false
								local actuallyVerticalTop = false

								if thisConnectorYDistance == wholeConnectorYDistance and thisConnectorHasXDistance then
									connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									verticalBottomUsed = true
									actuallyVerticalTop = true
								elseif thisConnectorYDistance == wholeConnectorYDistance and thisConnectorHasXDistance == false then
									if isActualConnector then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										verticalBottomUsed = false
										actuallyVerticalTop = false
									--connectorTubeVertical.width = 52
									--connectorTubeVertical.height = 8
									elseif isActualConnector == false and wholeConnectorYDistance == 1 then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										verticalBottomUsed = true
										actuallyVerticalTop = false
									elseif isActualConnector == false and wholeConnectorYDistance ~= 1 then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										verticalBottomUsed = false
										actuallyVerticalTop = false
									end
								elseif thisConnectorYDistance == 1 and wholeConnectorYDistance ~= 1 then
									if isActualConnector then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										verticalBottomUsed = false
										actuallyVerticalTop = false
									--connectorTubeVertical.width = 52
									--connectorTubeVertical.height = 8
									elseif isActualConnector == false then
										connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.cornerConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
										verticalBottomUsed = true
										actuallyVerticalTop = false
									end
								elseif thisConnectorYDistance ~= wholeConnectorYDistance then
									connectorTubeVertical = display.newSprite(mainFunc.allLevelSettings.verticalConnectorTubesImageSheet, mainFunc.allLevelSettings.connectorTubesSequenceData)
									verticalBottomUsed = false
									actuallyVerticalTop = false
								end

								connectorTubeVertical:setSequence(thisSpotColour);
								mainFunc.allLevelSettings.backgroundObjectsGroup:insert( connectorTubeVertical )
								connectorTubeVertical.shapeType = "connectorTube"
								connectorTubeVertical.anchorX = 0
								connectorTubeVertical.anchorY = 0.5
								connectorTubeVertical.height = mainFunc.allLevelSettings.squareHeight
								if actuallyVerticalTop then
									connectorTubeVertical.yScale = -1
								end
								if verticalBottomUsed then
									-- connectorTubeVertical.width = 16
									if actuallyVerticalTop == false then
										connectorTubeVertical.xScale = -1
									end
								else
									-- connectorTubeVertical.width = 8
								end
								connectorTubeVertical.x = lastConnectorX
								if thisConnectorYDistance == wholeConnectorYDistance and isActualConnector then
									print("1");
									connectorTubeVertical.y = lastConnectorY + (mainFunc.allLevelSettings.squareHeight/2) + yCalc(2)
									connectorTubeVertical.x = connectorTubeVertical.x - ((3.5/60) * mainFunc.allLevelSettings.squareWidth)
								elseif thisConnectorYDistance == wholeConnectorYDistance and isActualConnector == false then
									print("2");
									if wholeConnectorYDistance == 1 then
										connectorTubeVertical.x = connectorTubeVertical.x + xCalc(10)
									else
										connectorTubeVertical.x = connectorTubeVertical.x - xCalc(3)
									end
									connectorTubeVertical.y = lastConnectorY + (mainFunc.allLevelSettings.squareHeight/2) + yCalc(4)
								else
									print("3");
									if (thisConnectorYDistance == originalConnectorYDistance and thisConnectorHasXDistance == true) then
										connectorTubeVertical.x = connectorTubeVertical.x - ((4/60) * mainFunc.allLevelSettings.squareWidth)
										connectorTubeVertical.y = lastConnectorY
									else
										connectorTubeVertical.y = lastConnectorY + (mainFunc.allLevelSettings.squareHeight/2) 
										connectorTubeVertical.x = connectorTubeVertical.x - ((3.5/60) * mainFunc.allLevelSettings.squareWidth)
										if verticalBottomUsed and actuallyVerticalTop == false then
											connectorTubeVertical.y = connectorTubeVertical.y + yCalc(4)
											connectorTubeVertical.x = connectorTubeVertical.x + xCalc(14.5)
											connectorX = connectorX + 2
										end
									end
								end
								if actuallyVerticalTop then
									connectorTubeVertical.x = connectorTubeVertical.x - xCalc(7.5)
									connectorTubeVertical.y = connectorTubeVertical.y - yCalc(6.5)
								end
								lastConnectorY = lastConnectorY + mainFunc.allLevelSettings.squareHeight
								thisConnectorYDistance = thisConnectorYDistance - 1
							end
						end
--[[
						if (thisSpotColour == "green" and originalConnectorYDistance ~= 0) then

							for z = 1, #shapeArray do
								if shapeArray[z].name == thisTransition["shapeName"] then
									if shapeArrayParameters[z]["subType"] == "triangleTopLeftShape" or shapeArrayParameters[z]["subType"] == "triangleTopRightShape" then
										if (originalConnectorYDistance > 0) then
											connectorTubeVertical.y = connectorTubeVertical.y
										end
									elseif shapeArrayParameters[z]["subType"] == "triangleBottomLeftShape" or shapeArrayParameters[z]["subType"] == "triangleBottomRightShape" then
										connectorTubeVertical.y = connectorTubeVertical.y
									end
								end
							end
						end
]]
						yConnectorCounter = 0
					end

					lastConnectorX = connectorX
					lastConnectorY = connectorY
					lastConnectorXSquare = connectorXSquare
					lastConnectorYSquare = connectorYSquare
					if isActualConnector == false then
						lastConnectorX = lastConnectorX + xCalc(4)
					end
						
		            for a = 1, #mainFunc.allLevelSettings.connectorArray do
		                
		                mainFunc.allLevelSettings.backgroundObjectsGroup:insert( mainFunc.allLevelSettings.connectorArray[a] )

		                for b=1, #shapeArray do
		                    if mainFunc.allLevelSettings.connectorArray[a].x > (shapeArray[b].x - (mainFunc.allLevelSettings.squareWidth/2))
		                    and mainFunc.allLevelSettings.connectorArray[a].x < (shapeArray[b].x + (mainFunc.allLevelSettings.squareWidth/2))
		                    and mainFunc.allLevelSettings.connectorArray[a].y > (shapeArray[b].y - (mainFunc.allLevelSettings.squareHeight/2) )
		                    and mainFunc.allLevelSettings.connectorArray[a].y < (shapeArray[b].y + (mainFunc.allLevelSettings.squareHeight/2) ) then
		                    	if shapeArrayParameters[b]["type"] == "shape" then
		                        	mainFunc.allLevelSettings.connectorArray[a].alpha = 0
		                        elseif shapeArrayParameters[b]["type"] == "item"
		                    	or shapeArrayParameters[b]["type"] == "gem" then
		                    		shapeArray[b]:toFront()
		                    	end
		                    end
		                end
		            end
		        end
		    end
	        
	        for z = 1, #shapeArray do
	        	--EXT: Loop through Level Objects to decide which particular TransitionHorzSquare & TransitionVertSquare the object is on
	        	-- TransitionHorzSquare means which particular horizontal stage of it's transtition this object is at
				if shapeArray[z].name == thisTransition["shapeName"] then
					local thisTransitioningObject = shapeArray[z];
					local tIndex = thisTransition["startPositionIndex"];
					local positions = thisTransition["positionArray"];

	                thisTransitioningObject.transitionArrayState = tIndex;
					thisTransitioningObject.transitionCounter = thisTransition["transitionType"] == "slide" and 0;
					thisTransitioningObject.thisTransitionHorzSquare = positions[tIndex][3];
					thisTransitioningObject.thisTransitionVertSquare = positions[tIndex][4];
					thisTransitioningObject.thisTransitionSquareIndex = tIndex;

					if tIndex < #positions then
						thisTransitioningObject.nextTransitionHorzSquare = positions[tIndex+1][3]
						thisTransitioningObject.nextTransitionVertSquare = positions[tIndex+1][4]
						thisTransitioningObject.nextTransitionSquareIndex = positions[tIndex+1][5] and positions[tIndex+1][5] or nil
					else
						thisTransitioningObject.nextTransitionHorzSquare = "null"
						thisTransitioningObject.nextTransitionVertSquare = "null"
						thisTransitioningObject.nextTransitionSquareIndex = nil
					end
					if tIndex > 1 then
						thisTransitioningObject.prevTransitionHorzSquare = positions[tIndex-1][3]
						thisTransitioningObject.prevTransitionVertSquare = positions[tIndex-1][4]
						thisTransitioningObject.prevTransitionSquareIndex = positions[tIndex-1][5] and positions[tIndex-1][5] or nil
					else
						thisTransitioningObject.prevTransitionHorzSquare = "null"
						thisTransitioningObject.prevTransitionVertSquare = "null"
						thisTransitioningObject.prevTransitionSquareIndex = nil
					end
	            end
	        end
	    end
	end
end
   	t.prepareTransitioningObjects = prepareTransitioningObjects

return t
