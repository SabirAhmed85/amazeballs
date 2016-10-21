--- FUNCTION TO ROTATE OBJECT

local function switchAngle (event)
    if thisSwitch.rotateSwitch == "first" then
	thisSwitch.thisRotationTotal = rotationTotal
	thisSwitch.finalRotateSwitch = "second"
    else
	thisSwitch.thisRotationTotal = (360 - rotationTotal)
	thisSwitch.finalRotateSwitch = "first"
    end
    
    thisSwitch.thisFinalRotationTotal = (thisSwitch.thisRotationTotal / 90)
    if shapeArrayParameters[rotationObjectIndex][9] then
	for a = 1, #shapeFormingArray do
	    if shapeFormingArray[a][1] == shapeArrayParameters[rotationObjectIndex][7] then
		thisSwitchingObject.originalDirectionsArray = shapeArrayParameters[rotationObjectIndex][9]
		thisSwitchingObject.directionsArrayIndexVal = shapeFormingArray[a][5]
		thisSwitchingObject.thisDirectionsArray = thisSwitchingObject.directionsArrayIndexVal + thisSwitch.thisFinalRotationTotal
		if thisSwitchingObject.thisDirectionsArray > 4 then
		    thisSwitchingObject.thisDirectionsArray = thisSwitchingObject.thisDirectionsArray - 4
		end
		thisSwitchingObject.newDirectionKillArray = {}
		thisSwitchingObject.originalDirectionsArray = thisSwitchingObject.originalDirectionsArray + 6
		thisSwitchingObject.originalDirectionsArray = directionArrayIndex[thisSwitchingObject.originalDirectionsArray]
		for b = 1, #thisSwitchingObject.originalDirectionsArray do
		    if thisSwitchingObject.originalDirectionsArray[2][b] == "kill" then
			table.insert(thisSwitchingObject.newDirectionKillArray, b)
		    end
		end
		
		thisSwitchingObject.thisDirectionsArray = directionArrayIndex[thisSwitchingObject.thisDirectionsArray]
		for c = 1, #thisSwitchingObject.thisDirectionsArray do
			
			
		    for d = 1, #thisSwitchingObject.newDirectionKillArray do
			if thisSwitchingObject.newDirectionKillArray[d] == c then
			    thisSwitchingObject.newDirectionKillArray[d] = thisSwitchingObject.newDirectionKillArray[d] + thisSwitch.thisFinalRotationTotal
			    thisSwitchingObject.thisDirectionsArray[c + thisSwitch.thisFinalRotationTotal] = "kill"
			end
		    end
		end
	    end
	end
    else
	thisSwitchingObject.thisDirectionsArray = thisSwitchingObject.directionsArrayAtIndex + thisSwitch.thisFinalRotationTotal
	-- local textObj = display.newText(thisSwitchingObject.thisDirectionsArray, 0,0, nil, 14); textObj.x = 20;
	if thisSwitchingObject.thisDirectionsArray > 4 then
	    thisSwitchingObject.thisDirectionsArray = thisSwitchingObject.thisDirectionsArray - 4
	end
	thisSwitchingObject.directionsArray = directionArrayIndex[thisSwitchingObject.thisDirectionsArray]
    end
	
    if rotationCounter < thisSwitch.thisRotationTotal then
	thisSwitchingObject.rotation = thisSwitchingObject.rotation + 30
	rotationCounter = rotationCounter + 30
    else
	thisSwitch.rotateSwitch = thisSwitch.finalRotateSwitch
	Runtime:removeEventListener("enterFrame", switchAngle)
    end
end

-------------------------
-- DISPLAYING TEXT

-- A text object is created and is aligned left at point x=20
local textObj = display.newText(instance2.y, 0,0, nil, 14);
textObj:setReferencePoint(display.CenterLeftReferencePoint);
textObj.x = 20;

-- A text object is created and is aligned left at point x=20
local textObj = display.newText(triangle2.y, 0,0, nil, 14);
textObj:setReferencePoint(display.CenterLeftReferencePoint);
textObj.x = 50;


-------------------------
--  SCREEN CHANGE


if (instance2.x + instance2.contentWidth) > 520 then
	if instance2.y > 150 and direction == "right" then
	    Runtime:removeEventListener("enterFrame", moveSomething)
	    Runtime:addEventListener("enterFrame", toRightScreen)
	    instance2.y = 165
	    local textObj = display.newText(instance2.y, 0,0, nil, 14);
textObj:setReferencePoint(display.CenterLeftReferencePoint);
textObj.x = 20;
	else
	    if (instance2.x + instance2.contentWidth) > 600 then
	        instance2:translate( -600, 0)
	    end
	end
    end
    
-------------------------
--