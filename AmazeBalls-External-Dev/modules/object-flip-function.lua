local t = {}

local positionNewFlippedObject  = function (obj, flipDirection, flipVerticalCounter, mainFunc)
	frontScreenObjectsGroup = mainFunc.allLevelSettings.frontScreenObjectsGroup
    local positionFlippedObjectArray = {
	{"flip-horizontal",1, "triangleTopRightShape", "triangleBottomRightShape", "triangleTopLeftShape", "triangleBottomLeftShape", "triangleLeftAndRightShape", 3},
	{"flip-horizontal",2, "triangleTopRightShape", "triangleBottomRightShape", "triangleTopLeftShape", "triangleBottomLeftShape", "triangleLeftAndRightShape", 2},
	{"flip-vertical",1, "triangleTopRightShape", "triangleTopLeftShape", "triangleBottomRightShape", "triangleBottomLeftShape", "triangleTopAndBottomShape", 4},
	{"flip-vertical",2, "triangleTopRightShape", "triangleTopLeftShape", "triangleBottomRightShape", "triangleBottomLeftShape", "triangleTopAndBottomShape", 2}
    }

    local newEffectiveShapeArray = {
    	triangleTopRightShape = {"triangleTopLeftShape", "triangleBottomRightShape"},
    	triangleBottomRightShape = {"triangleBottomLeftShape", "triangleTopRightShape"},
    	triangleBottomLeftShape = {"triangleBottomRightShape", "triangleTopLeftShape"},
    	triangleTopLeftShape = {"triangleTopRightShape", "triangleBottomLeftShape"},
    	triangleLeftAndRightShape = {"triangleLeftAndRightShape", "triangleLeftAndRightShape"},
    	triangleTopAndBottomShape = {"triangleTopAndBottomShape", "triangleTopAndBottomShape"}
	}
    
    thisActualFlippedObject = obj
    thisActualFlippedObject.flipped = obj.flipped
    thisActualFlippedObject.originalState = obj.originalState
    thisActualFlippedObjectName = obj.name
    thisActualFlippedObjectShape = obj.shape
    thisActualFlippedObjectTransitionArrayState = obj.transitionArrayState
    thisActualFlippedObjectDirection = flipDirection

	mainFunc.objectFunctionsScript.bombGroupCheck(mainFunc, "before", thisActualFlippedObject)

    if thisActualFlippedObjectTransitionArrayState == 1 then
	    if thisActualFlippedObjectDirection == "flip-horizontal" then
	    	thisActualFlippedObject.effectiveShape = newEffectiveShapeArray[thisActualFlippedObjectShape][0]
	    	
            if thisActualFlippedObjectShape == "triangleTopLeftShape"
            or thisActualFlippedObjectShape == "triangleBottomLeftShape" then
            	thisActualFlippedObject.relevantHorzSquare = thisActualFlippedObject.relevantHorzSquare + 1
        	elseif thisActualFlippedObjectShape == "triangleTopRightShape"
            or thisActualFlippedObjectShape == "triangleBottomRightShape" then
            	thisActualFlippedObject.relevantHorzSquare = thisActualFlippedObject.relevantHorzSquare - 1
            end
	    else
			thisActualFlippedObject.effectiveShape = newEffectiveShapeArray[thisActualFlippedObjectShape][1]

            if thisActualFlippedObjectShape == "triangleTopLeftShape"
            or thisActualFlippedObjectShape == "triangleTopRightShape" then
            	thisActualFlippedObject.relevantVertSquare = thisActualFlippedObject.relevantVertSquare + 1
        	elseif thisActualFlippedObjectShape == "triangleBottomRightShape"
            or thisActualFlippedObjectShape == "triangleBottomLeftShape" then
            	thisActualFlippedObject.relevantVertSquare = thisActualFlippedObject.relevantVertSquare - 1
            end
	    end
	else
		if thisActualFlippedObjectDirection == "flip-horizontal" then
	    	thisActualFlippedObject.effectiveShape = thisActualFlippedObjectShape

            if thisActualFlippedObjectShape == "triangleTopLeftShape"
            or thisActualFlippedObjectShape == "triangleBottomLeftShape" then
            	thisActualFlippedObject.relevantHorzSquare = thisActualFlippedObject.relevantHorzSquare - 1 
        	elseif thisActualFlippedObjectShape == "triangleTopRightShape"
            or thisActualFlippedObjectShape == "triangleBottomRightShape" then
            	thisActualFlippedObject.relevantHorzSquare = thisActualFlippedObject.relevantHorzSquare + 1
            end
	    else
			thisActualFlippedObject.effectiveShape = thisActualFlippedObjectShape

			if thisActualFlippedObjectShape == "triangleTopLeftShape"
            or thisActualFlippedObjectShape == "triangleTopRightShape" then
            	thisActualFlippedObject.relevantVertSquare = thisActualFlippedObject.relevantVertSquare - 1
        	elseif thisActualFlippedObjectShape == "triangleBottomRightShape"
            or thisActualFlippedObjectShape == "triangleBottomLeftShape" then
            	thisActualFlippedObject.relevantVertSquare = thisActualFlippedObject.relevantVertSquare + 1 
            end
	    end
	end

	mainFunc.objectFunctionsScript.bombGroupCheck(mainFunc, "after", thisActualFlippedObject)
    	
    for a = 1, #positionFlippedObjectArray do
	if thisActualFlippedObjectTransitionArrayState == positionFlippedObjectArray[a][2]
	and thisActualFlippedObjectDirection == positionFlippedObjectArray[a][1]
	and flipVerticalCounter == 0 then

	    local actualFlippedObjectValue1 = 1
	    local actualFlippedObjectValue2 = -1
	    local actualFlippedObjectValue3 = 2
	    local actualFlippedObjectValue4 = 1
	    if positionFlippedObjectArray[a][1] == "flip-horizontal" then
		flippedObjectMeasurementValue = xCalc(5.75)
		thisFlippedObjectDirection = "horizontal"
			if thisActualFlippedObject.shape == "triangleLeftAndRightShape" then
				flippedObjectMeasurementValue = xCalc(7.75)
			end
	    else
		flippedObjectMeasurementValue = yCalc(5)
		thisFlippedObjectDirection = "vertical"
			if thisActualFlippedObject.shape == "triangleTopAndBottomShape" then
				flippedObjectMeasurementValue = yCalc(7)
			end
	    end
	    
	    if thisActualFlippedObjectTransitionArrayState == 2 then
			flippedObjectMeasurementValue = flippedObjectMeasurementValue * (-1)
			actualFlippedObjectValue2 = actualFlippedObjectValue2 * (-1)
			actualFlippedObjectValue3 = 1
			actualFlippedObjectValue4 = actualFlippedObjectValue4 * (-1)
	    end
	    
	    flipVerticalCounter = 1
            if thisFlippedObjectDirection ~= "vertical" then
                thisActualFlippedObject.xScale = actualFlippedObjectValue2
            else
                thisActualFlippedObject.yScale = actualFlippedObjectValue2
            end
	    physics.removeBody(thisActualFlippedObject)
	    for z = 1, #mainFunc.shapeRelatedArrays.shapeFormingArray do
		if positionFlippedObjectArray[a][1] == "flip-horizontal" then

		    if thisActualFlippedObjectShape == positionFlippedObjectArray[a][3]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][4] then
			thisActualFlippedObject.x = thisActualFlippedObject.x - flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][5]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][6] then
			thisActualFlippedObject.x = thisActualFlippedObject.x + flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][7] then
			thisActualFlippedObject.x = thisActualFlippedObject.x - flippedObjectMeasurementValue + ((1.9/8.25) * flippedObjectMeasurementValue)
		    end
		else
		    if thisActualFlippedObjectShape == positionFlippedObjectArray[a][3]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][4] then
			thisActualFlippedObject.y = thisActualFlippedObject.y + flippedObjectMeasurementValue
                        --thisActualFlippedObject.rotation = 180
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][5]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][6] then
			thisActualFlippedObject.y = thisActualFlippedObject.y - flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][7] then
			thisActualFlippedObject.y = thisActualFlippedObject.y + flippedObjectMeasurementValue
		    end
		end
		if mainFunc.shapeRelatedArrays.shapeFormingArray[z][1] == thisActualFlippedObjectShape then
		    physics.addBody( thisActualFlippedObject, "static", { density=10, friction=1, bounce=0, shape=mainFunc.shapeRelatedArrays.shapeFormingArray[z][positionFlippedObjectArray[a][8]] } )
		end
	    end
		
	    thisActualFlippedObject.state = actualFlippedObjectValue3
	    thisActualFlippedObject.transitionArrayState = thisActualFlippedObject.transitionArrayState + actualFlippedObjectValue4
	    
	    thisFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
	    thisFlippedObjectShape = thisActualFlippedObject.shape
	    thisFlippedObjectName = thisActualFlippedObject.name
	    
	    local thisNewFlippedObjectArray = {
		{"triangleTopLeftShape", 1, 3, 2, 225, -45, 55, -60, 0, 1, 4.5},
		{"triangleTopRightShape", 1, 3, 4, -45, 225, -55, 60, 0, 0, -4.5},
		{"triangleBottomRightShape", 3, 1, 4, 45, 135, -55, 60, -4, 1, -4.5},
		{"triangleBottomLeftShape", 3, 1, 2, 135, 45, 55, -60, -4, 1, 4.5},
		{"triangleTopLeftShape", 4, 2, 3, 225, 135, -50, -1, -52, 1, 0},
		{"triangleTopRightShape", 2, 3, 4, -45, 45, -50, 1, -52, 1, 0},
		{"triangleBottomRightShape", 2, 1, 4, 45, -45, 50, -1, 52, 1, 0},
		{"triangleBottomLeftShape", 4, 1, 2, 135, -135, 50, 1, 52, 5, 0},
		{"triangleLeftAndRightShape", 1, 3, 2, 135, 45, -135, -45, -180, 180, 59},
		{"triangleLeftAndRightShape", 1, 3, 2, -135, -45, 135, 45, -180, 180, 59},
		{"triangleTopAndBottomShape", 2, 4, 1, 135, -135, 45, -45, 180, -180, 56},
		{"triangleTopAndBottomShape", 2, 4, 1, 135, -135, 45, -45, 180, -180, 56}
	    }
	    for a = 1, frontScreenObjectsGroup.numChildren do
		if frontScreenObjectsGroup[a].relatedShape == thisFlippedObjectName then
		    for t = 1, #thisNewFlippedObjectArray do
			    
			if thisNewFlippedObjectArray[t][1] == thisFlippedObjectShape
			and t < 5 then
			    if thisFlippedObjectDirection == "vertical" then
				newT = t + 4
			    else
				newT = t
			    end
			    if thisFlippedObjectTransitionArrayState == 2 then
				
			    end

			    if frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][2] then
					if thisFlippedObjectDirection == "vertical" then
					    if thisFlippedObjectTransitionArrayState == 1 then
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedObjectArray[newT][7]
					    else
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y - thisNewFlippedObjectArray[newT][7]
					    end
					else
					    if thisFlippedObjectTransitionArrayState == 1 then
							frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x - thisNewFlippedObjectArray[newT][7]
					    else
							frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + thisNewFlippedObjectArray[newT][7]
					    end
					end
			    elseif frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][3] then
					if thisFlippedObjectTransitionArrayState == 1 then
					    frontScreenObjectsGroup[a].rotation = thisNewFlippedObjectArray[newT][5]
					    frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + thisNewFlippedObjectArray[newT][8]
					    frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedObjectArray[newT][9]
					elseif thisFlippedObjectTransitionArrayState == 2 then
					    frontScreenObjectsGroup[a].rotation = thisNewFlippedObjectArray[newT][6]
					    frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x - thisNewFlippedObjectArray[newT][8]
					    frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y - thisNewFlippedObjectArray[newT][9]
					end
			    else
					frontScreenObjectsGroup[a].xScale = frontScreenObjectsGroup[a].xScale * -1
                    if thisFlippedObjectDirection == "vertical" then
				    	if thisFlippedObjectTransitionArrayState == 1 then
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedObjectArray[newT][7]
				    	else
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y - thisNewFlippedObjectArray[newT][7]
				    	end
					else
				    	if thisFlippedObjectTransitionArrayState == 1 then
                        	frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x - thisNewFlippedObjectArray[newT][11]
                        elseif thisFlippedObjectTransitionArrayState == 2 then
                        	frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + thisNewFlippedObjectArray[newT][11]
                        end
					end
					if thisFlippedObjectDirection == "vertical"
					and frontScreenObjectsGroup[a].relatedDirectionArrayIndex == 3
					and thisFlippedObjectShape == "triangleTopLeftShape" then
					    if thisFlippedObjectTransitionArrayState == 1 then
							frontScreenObjectsGroup[a].rotation = -135
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedObjectArray[newT][7]
					    else
							frontScreenObjectsGroup[a].rotation = -45
							frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y - thisNewFlippedObjectArray[newT][7]
					    end
					end
			    end
			elseif thisNewFlippedObjectArray[t][1] == thisFlippedObjectShape
			and t == 9 then
			    newT = t + (thisActualFlippedObject.originalState - 1)
			    
			    relevantFirstBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 4]
			    relevantSecondBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 6]
			    relevantThirdBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 8]
			    
			    if thisFlippedObjectTransitionArrayState == 1 then 
				thisNewFlippedDistance = thisNewFlippedObjectArray[newT][11] * -1
			    elseif thisFlippedObjectTransitionArrayState == 2 then
				thisNewFlippedDistance = thisNewFlippedObjectArray[newT][11]
			    end
			    if frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][2] then
				frontScreenObjectsGroup[a].rotation = relevantFirstBarRotation
				frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x - thisNewFlippedDistance
			    elseif frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][3] then
				frontScreenObjectsGroup[a].rotation = relevantSecondBarRotation
				frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x - thisNewFlippedDistance
				
			    elseif frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][4] then
				frontScreenObjectsGroup[a].rotation = frontScreenObjectsGroup[a].rotation + relevantThirdBarRotation
			    end
			elseif thisNewFlippedObjectArray[t][1] == thisFlippedObjectShape
			and t == 11 then
			    newT = t + (thisActualFlippedObject.originalState - 1)
			    
			    relevantFirstBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 4]
			    relevantSecondBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 6]
			    relevantThirdBarRotation = thisNewFlippedObjectArray[newT][thisActualFlippedObjectTransitionArrayState + 8]
			    
			    if thisFlippedObjectTransitionArrayState == 1 then 
				thisNewFlippedDistance = thisNewFlippedObjectArray[newT][11] * -1
			    elseif thisFlippedObjectTransitionArrayState == 2 then
				thisNewFlippedDistance = thisNewFlippedObjectArray[newT][11]
			    end
			    if frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][2] then
				frontScreenObjectsGroup[a].rotation = relevantFirstBarRotation
				frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedDistance
			    elseif frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][3] then
				frontScreenObjectsGroup[a].rotation = relevantSecondBarRotation
				frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + thisNewFlippedDistance
				
			    elseif frontScreenObjectsGroup[a].relatedDirectionArrayIndex == thisNewFlippedObjectArray[newT][4] then
				frontScreenObjectsGroup[a].rotation = frontScreenObjectsGroup[a].rotation + relevantThirdBarRotation
			    end
			end
		    end
		end
	    end
            
            if thisFlippedObjectDirection == "vertical" then
                if thisFlippedObjectTransitionArrayState == 2 then
                    thisActualFlippedObject.state = 3
                else
                    thisActualFlippedObject.state = thisActualFlippedObject.transitionArrayState
                end
            else
                thisActualFlippedObject.state = thisActualFlippedObject.transitionArrayState
            end
            
	    	thisActualFlippedObject.flipped = true

	    	if thisActualFlippedObject.isLabelled then
            
	            local repositionFlippedIndicatorTriangleArray = {
	                {"triangleTopLeftShape", -30, 30, -20, 20, 90, -90, 180, 0},
	                {"triangleTopRightShape", 30, -30, -20, 20, -90, 90, 180, 0},
	                {"triangleBottomRightShape", 30, -30, 19, -19, -90, 90, 0, 180},
	                {"triangleBottomLeftShape", -30, 30, 19, -19, 90, -90, 0, 180},
	                {"triangleLeftAndRightShape", 36, -36, 0, 0, -90, 90},
	                {"triangleTopAndBottomShape", -4, 4, -4, 4}
	            }
	            
	            for a = 1, #repositionFlippedIndicatorTriangleArray do
	                if thisActualFlippedObject.shape == repositionFlippedIndicatorTriangleArray[a][1] then
	                    
	                    if thisFlippedObjectDirection == "horizontal" then
	                        thisActualFlippedObject.flipTriangle.x = thisActualFlippedObject.flipTriangle.x + xCalc(repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 1])
	                        thisActualFlippedObject.flipTriangle.rotation = repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 5]
	                    else
	                        thisActualFlippedObject.flipTriangle.y = thisActualFlippedObject.flipTriangle.y + yCalc(repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 3])
	                        thisActualFlippedObject.flipTriangle.rotation = repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 7]
	                    end
	                    
	                end
	            end
	             
	            if thisActualFlippedObject.switchValueText then
	                local repositionFlippedSwitchNumberArray = {
	                    {"triangleTopLeftShape", -53, 53, -46, 46},
	                    {"triangleTopRightShape", 53, -53, -46, 46},
	                    {"triangleBottomRightShape", 53, -53, 46, -46},
	                    {"triangleBottomLeftShape", -53, 53, 47, -47},
	                    {"triangleLeftAndRightShape", 52, -52, 0, 0},
	                    {"triangleTopAndBottomShape", -6, 6, -6, 6}
	                }
	                
	                for a = 1, #repositionFlippedSwitchNumberArray do
	                    if thisActualFlippedObject.shape == repositionFlippedSwitchNumberArray[a][1] then
	                        
	                        if thisFlippedObjectDirection == "horizontal" then
	                            thisActualFlippedObject.switchValueText.x = thisActualFlippedObject.switchValueText.x + xCalc(repositionFlippedSwitchNumberArray[a][thisFlippedObjectTransitionArrayState + 1])
	                        else
	                            thisActualFlippedObject.switchValueText.y = thisActualFlippedObject.switchValueText.y + yCalc(repositionFlippedSwitchNumberArray[a][thisFlippedObjectTransitionArrayState + 3])
	                        end
	                        
	                    end
	                end
	            end
	        end
		end
    end
    
    if thisActualFlippedObject.isFocus ~= true then
		flipVerticalCounter = 0
    end

end
t.positionNewFlippedObject = positionNewFlippedObject

return t
