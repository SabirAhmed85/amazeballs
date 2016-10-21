local storyboard = require ("storyboard")
local widget = require("widget")
local physics = require "physics"
physics.start()
local scene = storyboard.newScene()

--physics.setDrawMode("hybrid")

system.activate("multitouch")

local backgroundGrid

local shapeArray = {}
local shapeArrayParameters = {}
local connectorArray = {}
local transitionArrayIndex = {}

local autoFanArray = {}
local manualFanArray = {}
local triangleArray = {}

local j = 0

local pauseScreen

local directionArray = {
    "up",
    "right",
    "down",
    "left"
}

local shapeFormingArray = {
    {"triangleTopLeftShape", {24,-24, 24,24, -24,24}, {-24,-24, 24,24, -24,24}, {24,-24, 24,24, -24,-24}, 1},
    {"triangleTopRightShape", {-24,-24, 24,24, -24,24}, {24,-24, 24,24, -24,24}, {24,-24, -24,24, -24,-24}, 2},
    {"triangleBottomRightShape", {-24,-24, 24,-24, -24,24}, {-24,-24, 24,-24, 24,24}, {-24,-24, 24,24, -24,24}, 3},
    {"triangleBottomLeftShape", {-24,-24, 24,-24, 24,24}, {-24,-24, 24,-24, -24,24}, {24,-24, 24,24, -24,24}, 4},
    {"triangleLeftAndRightShape", { -24,-48, 24,0, -24,48 }, { 24,48, -24,0, 24,-48 }, { 24,48, -24,0, 24,-48 }, 5},
    {"triangleTopAndBottomShape", { -48,24, 0,-24, 48,24 }, { 0,24, -48,-24, 48,-24 }, { 0,24, -48,-24, 48,-24 }, 6}
}


local directionArrayIndex = {
    -- NO NEED TO CHANGE THESE 6 DIRECTION OPTIONS
    
    {	{1}, {
	"down",
	"up",
	"left",
	"right"
	},
	{2}, {
	"down",
	"left",
	"right",
	"up"
	},
	{3}, {
	"left",
	"down",
	"up",
	"right"
	}
    },
    {	{1}, {
	"down",
	"left",
	"right",
	"up"
	},
	{2}, {
	"down",
	"up",
	"left",
	"right"
	},
	{3}, {
	"right",
	"left",
	"up",
	"down"
	}
    },
    {	{1}, {
	"right",
	"left",
	"up",
	"down"
	},
	{2}, {
	"left",
	"down",
	"up",
	"right"
	},
	{3}, {
	"down",
	"left",
	"right",
	"up"
	}
    },
    {	{1}, {
	"left",
	"down",
	"up",
	"right"
	},
	{2}, {
	"right",
	"left",
	"up",
	"down"
	},
	{3}, {
	"down",
	"up",
	"left",
	"right"
	}
    },
    {	{1}, {
	    "right",
	    "left",
	    "right",
	    "specialRule",
	    "",
	    "",
	    "up",
	    "down"
	},
	{2},{
	    "left",
	    "specialRule",
	    "left",
	    "right",
	    "up",
	    "down",
	    "",
	    ""
	}
    },
    {	{1}, {
	    "down",
	    "up",
	    "specialRule",
	    "up",
	    "",
	    "",
	    "left",
	    "right"
	},
	{2},{
	    "specialRule",
	    "down",
	    "up",
	    "down",
	    "left",
	    "right",
	    "",
	    ""
	}
    }
    
    -- PUT YOUR CUSTOM DIRECTION OPTIONS HERE
    ,
    -- put the comma above into the code if you have added custom styles
    
    {	{1},{
	    "down",
	    "kill",
	    "right",
	    "up"
	},
	{2},{
	    "down",
	    "up",
	    "left",
	    "kill"
	}
    }
    
    ,
    
    {	{1},{
	    "left",
	    "down",
	    "up",
	    "kill"
	},
	{2},{
	    "right",
	    "kill",
	    "up",
	    "down"
	}
    }
    
    ,
    
    {	{1},{
	    "kill",
	    "left", 
	    "right",
	    "up"
	},
	{2},{
	    "right",
	    "kill",
	    "up",
	    "down"
	},
        {3},{
	    "right",
	    "left",
	    "kill",
	    "down"
	}
    }
    
    ,
    
    {	{1},{
	    "kill",
	    "up", 
	    "left",
	    "right"
	},
	{2},{
	    "right",
	    "kill",
	    "up",
	    "down"
	}
    }
    
    ,
    
    {	{1},{
	    "down",
	    "kill",
	    "right",
	    "up"
	},
	{2},{
	    "down",
	    "up",
	    "left",
	    "kill"
	}
    }
    
    ,
    
    {	{1},{
	    "right",
	    "kill",
	    "up",
	    "down"
	}
    }
    
    ,
    
    {	{1},{
	    "specialRule",
	    "up",
	    "specialRule",
	    "up",
	    "left",
	    "kill",
	    "down",
	    "kill"
	},
	{2},{
	    "specialRule",
	    "down",
	    "up",
	    "down",
	    "",
	    "",
	    "left",
	    "kill"
	}
    }
    
    -- every time you enter a new Array, put the comma into the code before it, same as above
}


currentLevel = 2

local screenHorzTotal = 2
local screenVertTotal = 3
local ballFirstScreenHorzValue = 2
local ballFirstScreenVertValue = 2
local ballFirstHorzSquare = 4
local ballFirstVertSquare = 5
local ballFirstDirection = "up"
local initialDirection = "up"

local backgroundObjectsGroup = display.newGroup()
local screenObjectsGroup = display.newGroup()
local midScreenObjectsGroup = display.newGroup()
local frontScreenObjectsGroup = display.newGroup()
local pauseScreenObjectsGroup = display.newGroup()

local thisScreenHorzValue = 1
local thisScreenVertValue = 1
local ballScreenHorzValue = ballFirstScreenHorzValue
local ballScreenVertValue = ballFirstScreenVertValue
local screenInitialiserHorzValue = 1
local screenInitialiserVertValue = 1

local screenInitialiserInTransition = false
local nextScreenInitialiserTransition = "horizontal"
local screenInitialiserHorzTransition = "incomplete"
local screenInitialiserVertTransition = "incomplete"
local relevantHorzScreen = screenHorzTotal
local returnToBallScreenVertTransitionOver = false
local returnToBallScreenHorzTransitionOver = false

local thisSwitch = null
local screenChangeType = null
local ballActivateButtonSet = false
local pauseButtonsEnabled = true
local isSomethingTransitioning = false
local tunnelIsActive = true
local numberOfScreens

local ballspeed = 13

local lifeCounter = 1
local object1Counter = 0
local screenTimer = 0
local directionCounter = 0
local mapShowCounter = 0
local initialReturnToBallScreenCounter = 0
local mainScreenChangeSpeed = display.contentWidth / 12

local edgesTransitionscounter = 0
local manualScreenChangeCounter = 0
local tunnelCounter = 0
local moveslow_Counter = 1
local moveSomethingCounter = 0
local direction = initialDirection

local flipVerticalCounter = 0

local fanCenteringCounter = 0
local autoFanCounter = 0
local manualFanCounter = 0

local stillTransitioningCounter = 0
local transitionMoveCounter = 0
local secondTransitionMoveCounter = 0

local returnToBallVertTransition = 0
local returnToBallHorzTransition = 0

local numberOfSwitchesCounter = 1

local rightScreenEdge = (ballScreenHorzValue * display.contentWidth) + 26
local leftScreenEdge = ((ballScreenHorzValue - 1) * display.contentWidth)
local topScreenEdge = ((ballScreenVertValue - 1) * display.contentHeight)
local bottomScreenEdge = (ballScreenVertValue * display.contentHeight) + 30

local killBar, playBtn, mapScreen, connector, connectorTubeHorizontal, connectorTubeVertical, instance2, randomBtn, resetBtn, backBtn, rightBtn, spitter, autoFan, triangle, switch, triangle3, triangle2, manualFan, door1, triangle2_s2
local pressCount = 0
local playCounter = 0
local isBallMovingState = "false"

myGameSettings = loadTable("myGameSettings.json")

local function mapButtonTransparencyCheck (event)
    if rightBtn.isVisibleState == true then
        transition.to (rightBtn, {alpha=1, time=200})
    else
        transition.to (rightBtn, {alpha=0, time=200})
    end
    
    if leftBtn.isVisibleState == true then
        transition.to (leftBtn, {alpha=1, time=200})
    else
        transition.to (leftBtn, {alpha=0, time=200})
    end
    
    if upBtn.isVisibleState == true then
        transition.to (upBtn, {alpha=1, time=200})
    else
        transition.to (upBtn, {alpha=0, time=200})
    end
    
    if downBtn.isVisibleState == true then
        transition.to (downBtn, {alpha=1, time=200})
    else
        transition.to (downBtn, {alpha=0, time=200})
    end
end

local function mapButtonStateCheck (event)
    
    if thisScreenHorzValue ~= 1 then
        leftBtn.isVisibleState = true
    else
        leftBtn.isVisibleState = false
    end
    
    if thisScreenHorzValue ~= screenHorzTotal then
        rightBtn.isVisibleState = true
    else
        rightBtn.isVisibleState = false
    end
    
    if thisScreenVertValue ~= 1 then
        upBtn.isVisibleState = true
    else
        upBtn.isVisibleState = false
    end
    
    if thisScreenVertValue ~= screenVertTotal then
        downBtn.isVisibleState = true
    else
        downBtn.isVisibleState = false
    end
    
    if mapScreen.state == "mapShowing" then
        mapButtonTransparencyCheck()
    end
end

local function returnViewToBallScreen (event)

    local function respawnBall()
        thisScreenHorzValue = ballFirstScreenHorzValue
        thisScreenVertValue = ballFirstScreenVertValue
        ballScreenHorzValue = ballFirstScreenHorzValue
        ballScreenVertValue = ballFirstScreenVertValue
        mapButtonStateCheck()
        pressCount = 0
        playBtn.alpha = 1
        lifeCounter = lifeCounter + 1
        backBtn:setSequence("go")
    end
    local targetXTransition, targetYTransition
    if thisScreenHorzValue ~= ballFirstScreenHorzValue then
        
        if thisScreenHorzValue > ballFirstScreenHorzValue then
            totalReturnToBallHorzTransition = (thisScreenHorzValue - ballFirstScreenHorzValue) * display.contentWidth
        else
            totalReturnToBallHorzTransition = (ballFirstScreenHorzValue - thisScreenHorzValue) * display.contentWidth
        end
        targetXTransition = backgroundObjectsGroup.x - totalReturnToBallHorzTransition
        leftScreenEdge = leftScreenEdge + totalReturnToBallHorzTransition
        rightScreenEdge = rightScreenEdge + totalReturnToBallHorzTransition
    
    else
        targetXTransition = backgroundObjectsGroup.x
    end
    
    if thisScreenVertValue ~= ballFirstScreenVertValue then
        if thisScreenVertValue > ballFirstScreenVertValue then
            totalReturnToBallVertTransition = (thisScreenVertValue - ballFirstScreenVertValue) * display.contentHeight
        else
            totalReturnToBallVertTransition = (ballFirstScreenVertValue - thisScreenVertValue) * display.contentHeight
        end
        targetYTransition = backgroundObjectsGroup.y + totalReturnToBallVertTransition
        topScreenEdge = topScreenEdge - totalReturnToBallVertTransition
        bottomScreenEdge = bottomScreenEdge - totalReturnToBallVertTransition
    else
        targetYTransition = backgroundObjectsGroup.y
    end
    
    transition.to(backgroundObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
    transition.to(screenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
    transition.to(midScreenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
    transition.to(frontScreenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400, onComplete=respawnBall})
end

local function startBallAgain (event)
    Runtime:removeEventListener( "enterFrame", moveSomething )
    Runtime:removeEventListener("enterFrame", edgesTransitions)
    direction = initialDirection
    instance2:setSequence(direction)
    instance2.x = (((ballFirstScreenHorzValue - 1) * display.contentWidth) + ((ballFirstHorzSquare - 1) * 60) + 60)
    instance2.y = (((ballFirstScreenVertValue - 1) * display.contentHeight) + ((ballFirstVertSquare - 1) * 52) + 60)
    if ballActivateButtonSet == true then
        
    end
    timer.performWithDelay(300, returnViewToBallScreen, 1)
end

local function moveSomething (event)
    if shouldBallMoveState == "true" then
	if (direction) == "up" then
	    instance2.y = instance2.y - ballspeed
	    
	elseif (direction) == "down" then
	    instance2.y = instance2.y + ballspeed
	    
	elseif (direction) == "left" then
	    instance2.x = instance2.x - ballspeed
	    
	elseif (direction) == "right" then
	    instance2.x = instance2.x + ballspeed
	end
    end
    
end

local function specialRuleFunction(event)
	
    if oldDirection == "left" then
    
	if instance2.y > (thisObject.y) then
	    
	    direction = thisObject.directionsArray[thisObjectState * 2][8]
		    
	elseif instance2.y < (thisObject.y) then
		    
	    direction = thisObject.directionsArray[thisObjectState * 2][7]
		    
	end
    
    elseif oldDirection == "right" then
	
	if instance2.y > (thisObject.y) then
	    
	    direction = thisObject.directionsArray[thisObjectState * 2][6]
		    
	elseif instance2.y < (thisObject.y) then
		    
	    direction = thisObject.directionsArray[thisObjectState * 2][5]
		    
	end
	
    elseif oldDirection == "down" then
	
	if instance2.x > (thisObject.x) then
	    
	    direction = thisObject.directionsArray[thisObjectState * 2][8]
		    
	elseif instance2.x < (thisObject.x) then
		    
	    direction = thisObject.directionsArray[thisObjectState * 2][7]
		    
	end
	
    elseif oldDirection == "up" then
	
	if instance2.x > (thisObject.x) then
	    
	    direction = thisObject.directionsArray[thisObjectState * 2][6]
		    
	elseif instance2.x < (thisObject.x) then
		    
	    direction = thisObject.directionsArray[thisObjectState * 2][5]
		    
	end
	
    end
    
    instance2:setSequence(direction)
    
    if direction == "kill" then
	shouldBallMoveState = "false"
        isBallMovingState = "false"
	timer.performWithDelay( 0, startBallAgain, 1 )
	direction = "up"
    end
    
end

local function reboundsFunction(event)

    Runtime:removeEventListener( "enterFrame", moveSomething )
    
    for a = 1, #newDirectionArray do
	if newDirectionArray[a][1] == thisObjectState then
	    
	    for i = 1, #directionArray do
			
		if directionArray[i] == oldDirection then
		    direction = newDirectionArray[a+1][i]
                    if direction ~= "specialRule" then
                        instance2:setSequence(direction)
                    end
		    if direction == "kill" then
			shouldBallMoveState = "false"
                        isBallMovingState = "false"
			timer.performWithDelay( 0, startBallAgain, 1 )
		    elseif direction == "specialRule" then
			timer.performWithDelay( 0, specialRuleFunction, 1 )
		    else
			directionCounter = 1
		    end
		end
			
	    end
	
	end
    
    end
    
    if (shouldBallMoveState) == "true" then
	Runtime:addEventListener( "enterFrame", moveSomething )
    end
end

local function on_Triangle_Collision( event )

    newDirectionArray = event.target.directionsArray
    oldDirection = direction
    thisObjectState = event.target.state
    
    if ( event.phase == "began" ) then
	thisObject = event.target
	thisObjectShape = event.target.shape
	timer.performWithDelay(0, reboundsFunction)
	
    end
    
end


local function switchAlphaTransparency (event)

    if thisSwitchingObject.enabled == "enabled" then
        transition.to(thisSwitchingObject, {alpha = 0, time = 200})
        thisSwitchingObject.enabled = "disabled"
    else
        transition.to(thisSwitchingObject, {alpha = 1, time = 200})
        thisSwitchingObject.enabled = "enabled"
    end
    
end

local function changeToRightScreen (event)
    
    local function finishScreenChange ()
        if screenChangeType == "auto" then
            Runtime:addEventListener("enterFrame", moveSomething)
        end
        manualScreenChangeCounter = 0 
        mapButtonStateCheck()
    end
    
    if screenChangeType == "auto" then
        screenChangeTime = 400    
    else
        screenChangeTime = 275
    end
    
    if thisChangeScreenDirection == "right"
    or thisChangeScreenDirection == "left" then
        if thisChangeScreenDirection == "left" then
            thisNewScreenChangeTarget = backgroundObjectsGroup.x + display.contentWidth
        else
            thisNewScreenChangeTarget = backgroundObjectsGroup.x - display.contentWidth
        end
	transition.to(backgroundObjectsGroup, {x=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(screenObjectsGroup, {x=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(midScreenObjectsGroup, {x=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(frontScreenObjectsGroup, {x=thisNewScreenChangeTarget, time=screenChangeTime, onComplete=finishScreenChange})
    elseif thisChangeScreenDirection == "up"
    or thisChangeScreenDirection == "down" then
        if thisChangeScreenDirection == "up" then
            thisNewScreenChangeTarget = backgroundObjectsGroup.y + display.contentHeight
        else
            thisNewScreenChangeTarget = backgroundObjectsGroup.y - display.contentHeight
        end
	transition.to(backgroundObjectsGroup, {y=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(screenObjectsGroup, {y=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(midScreenObjectsGroup, {y=thisNewScreenChangeTarget, time=screenChangeTime})
        transition.to(frontScreenObjectsGroup, {y=thisNewScreenChangeTarget, time=screenChangeTime, onComplete=finishScreenChange})
    end
    
end

local function resetFanCounter (event)
    autoFanCounter = 0
end

local function fanCentering (event)

    if (instance2.x) > (thisFan.x + 31) then
	instance2.x = instance2.x - 2
    elseif (instance2.x) < (thisFan.x + 29) then
	instance2.x = instance2.x + 2
    else
	fanXCenteringComplete = true
    end
    
    if (instance2.y) > (thisFan.y + 27) then
	instance2.y = instance2.y - 2
    elseif (instance2.y) < (thisFan.y + 25) then
	instance2.y = instance2.y + 2
    else
	fanYCenteringComplete = true
    end
    
    if fanYCenteringComplete == true and fanXCenteringComplete == true then
	if fanCenteringCounter == 0 then
	    fanCenteringCounter = 1
	    autoFanCounter = 1
	    timer.performWithDelay(100, resetFanCounter)
	    if thisFan.type == "autoFan" or thisFan.type == "manualFan" then
		if shouldBallMoveState == "true" then
		    Runtime:addEventListener( "enterFrame", moveSomething )
		    moveSomethingCounter = 0
		else
		    moveSomethingCounter = 1
		end
	    elseif thisFan.type == "spitter" then
		thisFan.enabled = true
	    end
	end
	Runtime:removeEventListener( "enterFrame", fanCentering )
    end
end





local function positionNewFlippedObject ()
    local positionFlippedObjectArray = {
	{"flip-horizontal",1, "triangleTopRightShape", "triangleBottomRightShape", "triangleTopLeftShape", "triangleBottomLeftShape", "triangleLeftAndRightShape", 3},
	{"flip-horizontal",2, "triangleTopRightShape", "triangleBottomRightShape", "triangleTopLeftShape", "triangleBottomLeftShape", "triangleLeftAndRightShape", 2},
	{"flip-vertical",1, "triangleTopRightShape", "triangleTopLeftShape", "triangleBottomRightShape", "triangleBottomLeftShape", "triangleTopAndBottomShape", 4},
	{"flip-vertical",2, "triangleTopRightShape", "triangleTopLeftShape", "triangleBottomRightShape", "triangleBottomLeftShape", "triangleTopAndBottomShape", 2}
    }
    	
    for a = 1, #positionFlippedObjectArray do
	if thisActualFlippedObjectTransitionArrayState == positionFlippedObjectArray[a][2]
	and thisActualFlippedObjectDirection == positionFlippedObjectArray[a][1]
	and flipVerticalCounter == 0 then
	    local actualFlippedObjectValue1 = 1
	    local actualFlippedObjectValue2 = -1
	    local actualFlippedObjectValue3 = 2
	    local actualFlippedObjectValue4 = 1
	    if positionFlippedObjectArray[a][1] == "flip-horizontal" then
		flippedObjectMeasurementValue = 9
		thisFlippedObjectDirection = "horizontal"
	    else
		flippedObjectMeasurementValue = 8
		thisFlippedObjectDirection = "vertical"
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
	    for z = 1, #shapeFormingArray do
		if positionFlippedObjectArray[a][1] == "flip-horizontal" then
		    if thisActualFlippedObjectShape == positionFlippedObjectArray[a][3]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][4] then
			thisActualFlippedObject.x = thisActualFlippedObject.x - flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][5]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][6] then
			thisActualFlippedObject.x = thisActualFlippedObject.x + flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][7] then
			thisActualFlippedObject.x = thisActualFlippedObject.x - flippedObjectMeasurementValue
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
		if shapeFormingArray[z][1] == thisActualFlippedObjectShape then
		    physics.addBody( thisActualFlippedObject, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[z][positionFlippedObjectArray[a][8]] } )
		end
	    end
		
	    thisActualFlippedObject.state = actualFlippedObjectValue3
	    thisActualFlippedObject.transitionArrayState = thisActualFlippedObject.transitionArrayState + actualFlippedObjectValue4
	    
	    thisFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
	    thisFlippedObjectShape = thisActualFlippedObject.shape
	    thisFlippedObjectName = thisActualFlippedObject.name
	    
	    local thisNewFlippedObjectArray = {
		{"triangleTopLeftShape", 1, 3, 2, 225, -45, 55, -60, 0, 1, 3},
		{"triangleTopRightShape", 1, 3, 4, -45, 225, -55, 60, 0, 0, 0},
		{"triangleBottomRightShape", 3, 1, 4, 45, 135, -55, 60, -4, 1, 0},
		{"triangleBottomLeftShape", 3, 1, 2, 135, 45, 55, -60, -4, 1, 0},
		{"triangleTopLeftShape", 4, 2, 3, 225, 135, -50, -1, -52, 1, 0},
		{"triangleTopRightShape", 2, 3, 4, -45, 45, -50, 1, -52, 1, 0},
		{"triangleBottomRightShape", 2, 1, 4, 45, -45, 50, -1, 52, 1, 0},
		{"triangleBottomLeftShape", 4, 1, 2, 135, -135, 50, 1, 52, 1, 0},
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
            
            local repositionFlippedIndicatorTriangleArray = {
                {"triangleTopLeftShape", -26, 26, -20, 20, 90, -90, 180, 0},
                {"triangleTopRightShape", 26, -26, -20, 20, -90, 90, 180, 0},
                {"triangleBottomRightShape", 26, -26, 19, -19, -90, 90, 0, 180},
                {"triangleBottomLeftShape", -26, 26, 19, -19, 90, -90, 0, 180},
                {"triangleLeftAndRightShape", 28, -28, 0, 0, -90, 90},
                {"triangleTopAndBottomShape", -4, 4, -4, 4}
            }
            
            for a = 1, #repositionFlippedIndicatorTriangleArray do
                if thisActualFlippedObject.shape == repositionFlippedIndicatorTriangleArray[a][1] then
                    
                    if thisFlippedObjectDirection == "horizontal" then
                        thisActualFlippedObject.flipTriangle.x = thisActualFlippedObject.flipTriangle.x + repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 1]
                        thisActualFlippedObject.flipTriangle.rotation = repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 5]
                    else
                        thisActualFlippedObject.flipTriangle.y = thisActualFlippedObject.flipTriangle.y + repositionFlippedIndicatorTriangleArray[a][thisFlippedObjectTransitionArrayState + 3]
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
                    {"triangleTopAndBottomShape", -4, 4, -4, 4}
                }
                
                for a = 1, #repositionFlippedSwitchNumberArray do
                    if thisActualFlippedObject.shape == repositionFlippedSwitchNumberArray[a][1] then
                        
                        if thisFlippedObjectDirection == "horizontal" then
                            thisActualFlippedObject.switchValueText.x = thisActualFlippedObject.switchValueText.x + repositionFlippedSwitchNumberArray[a][thisFlippedObjectTransitionArrayState + 1]
                        else
                            thisActualFlippedObject.switchValueText.y = thisActualFlippedObject.switchValueText.y + repositionFlippedSwitchNumberArray[a][thisFlippedObjectTransitionArrayState + 3]
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

local function addBackThisSwitchOnOffCounter (event)
    if thisSwitch ~= null then
        thisSwitch.switchOnOffCounter = 0
    end
end

local function addBackButtonFunctionality(event)
    playBtn.alpha = 1
    randomBtn.alpha = 1
    pauseButtonsEnabled = true
end

local function autoFanTransition(event)
    
    for b = 1, #shapeArray do
	
	if shapeArrayParameters[b][1] == "autoFan" or shapeArrayParameters[b][1] == "spitter" then
	    if  (instance2.x) > shapeArray[b].x and
		(instance2.x) < (shapeArray[b].x + 60) and
		instance2.y > shapeArray[b].y and
		instance2.y < (shapeArray[b].y + 39) and
                shapeArray[b].enabled == true and
		autoFanCounter == 0 then
                    shapeArray[b].isBallPresent = true
		    Runtime:removeEventListener( "enterFrame", moveSomething )
		    fanXCenteringComplete = false
		    fanYCenteringComplete = false
		    fanCenteringCounter = 0
		    thisFan = shapeArray[b]
		    thisFan.type = shapeArrayParameters[b][1]
		    Runtime:addEventListener( "enterFrame", fanCentering )
		    direction = shapeArray[b].direction
                    instance2:setSequence(direction)
		    
		    if shapeArrayParameters[b][1] == "spitter" then
			spitterCounter = 0
		    end
	    end
	elseif shapeArrayParameters[b][1] == "switch" then
            if  (instance2.x) > (shapeArray[b].x - 10)
            and (instance2.x) < (shapeArray[b].x + 65)
            and (instance2.y) > (shapeArray[b].y - 15)
            and (instance2.y) < (shapeArray[b].y + 42) then
                playBtn.alpha = 0.4
                randomBtn.alpha = 0.4
                pauseButtonsEnabled = false
            end
	    if shapeArray[b].switchCounter == 0 then
		if  (instance2.x) > shapeArray[b].x - 10
		and (instance2.x) < (shapeArray[b].x + 70)
		and instance2.y > shapeArray[b].y
		and instance2.y < (shapeArray[b].y + 39)
		and shapeArray[b].switchOnOffCounter == 0 then
		    thisSwitch = shapeArray[b]
                    switchSequence = thisSwitch.sequence
                    if switchSequence == "on" then
                        thisSwitch:setSequence("off")
                        thisSwitch.switchValueText:setSequence("off")
                    else
                        thisSwitch:setSequence("on")
                        thisSwitch.switchValueText:setSequence("on")
                    end
		    thisSwitch.switchOnOffCounter = 1
                    for a = 1, #shapeArray do
                        if shapeArrayParameters[a][2] == shapeArrayParameters[b][8] then
                            thisSwitchingObject = shapeArray[a]
                            if shapeArrayParameters[b][7] == "flip-horizontal"
                            or shapeArrayParameters[b][7] == "flip-vertical" then
                                thisActualFlippedObject = shapeArray[a]
                                thisActualFlippedObjectName = thisActualFlippedObject.name
                                thisActualFlippedObjectShape = thisActualFlippedObject.shape
                                thisActualFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
                                thisActualFlippedObjectDirection = shapeArrayParameters[b][7]
                                positionNewFlippedObject()
                                if shapeArrayParameters[b][10] then
                                    for c = 1, #shapeArray do
                                        if shapeArrayParameters[c][2] == shapeArrayParameters[b][10] then
                                            thisSwitchingObject = shapeArray[c]
                                            thisActualFlippedObject = shapeArray[c]
                                            thisActualFlippedObjectName = thisActualFlippedObject.name
                                            thisActualFlippedObjectShape = thisActualFlippedObject.shape
                                            thisActualFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
                                            if shapeArrayParameters[b][11] then
                                                thisActualFlippedObjectDirection = shapeArrayParameters[b][11]
                                            else
                                                thisActualFlippedObjectDirection = shapeArrayParameters[b][7]
                                            end
                                            positionNewFlippedObject()
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if shapeArrayParameters[b][9] == "one-way" then
                        shapeArray[b].switchCounter = 1
                    end
                    if shapeArrayParameters[b][7] == "door-open" then
                        switchAlphaTransparency()
                    end
                    if shapeArrayParameters[b][9] ~= "one-way" then
                        timer.performWithDelay(300, addBackThisSwitchOnOffCounter)
                    end
                    
                    timer.performWithDelay(200, addBackButtonFunctionality)
                    
		end
	    end
	end
    end
    
end

local function tunnelTransition(event)

    for z = 1, #shapeArray do
	if shapeArray[z].objectType == "tunnel" then
	    if (instance2.x) > shapeArray[z].relevantLowerX
	    and (instance2.x) < (shapeArray[z].relevantHigherX)
	    and (instance2.y) > shapeArray[z].relevantLowerY
	    and (instance2.y) < (shapeArray[z].relevantHigherY)
	    and direction == shapeArray[z].firstDirection
            and tunnelIsActive == true then
                local function firstMoveSlow ()
                    local function moveSlow (event)
                        local function addBackMoveSomething ()
                            Runtime:addEventListener( "enterFrame", moveSomething )
                        end
                        if tunnelCounter == 0 then
                            tunnelCounter = 1
                            instance2.x = ((nextHorzScreen - 1) * display.contentWidth) + (((nextHorzSquare - 1) * 60) + 30 + 30)
                            instance2.y = ((nextVertScreen - 1) * display.contentHeight) + (((nextVertSquare - 1) * 52) + 30 + 26)
                            direction = nextDirection
                            transition.to(instance2, {alpha=1, time=250})
                            tunnelIsActive = true
                            timer.performWithDelay(700, addBackMoveSomething, 1)
                        end
                        
                    end
                    
                    local function secondMoveSlow ()
                        transition.to(instance2, {alpha = 0, time=750, onComplete=moveSlow} )
                    end
                    transition.to(instance2, {y=firstHorzScreenY, x=firstHorzScreenX, time=100} )
                    timer.performWithDelay(350, secondMoveSlow, 1)
                end

                tunnelIsActive = false
		tunnelCounter = 0
		nextDirection = shapeArrayParameters[z][10]
		nextHorzScreen = shapeArrayParameters[z][3]
		nextVertScreen = shapeArrayParameters[z][4]
                firstHorzSquare = shapeArrayParameters[z][5]
                firstVertSquare = shapeArrayParameters[z][6]
                firstHorzScreenX = ((nextHorzScreen - 1) * display.contentWidth) + (((firstHorzSquare - 1) * 60) + 30 + 30)
                firstHorzScreenY = ((nextVertScreen - 1) * display.contentHeight) + (((firstVertSquare - 1) * 52) + 30 + 26)
		nextHorzSquare = shapeArrayParameters[z][7]
		nextVertSquare = shapeArrayParameters[z][8]
		Runtime:removeEventListener( "enterFrame", moveSomething )
                timer.performWithDelay(0, firstMoveSlow, 1)
	    end
	end
    end
    
end


local function edgesTransitions(event)
    
    if  (instance2.x + instance2.contentWidth) > rightScreenEdge and direction == "right" or
	(instance2.x + instance2.contentWidth) < leftScreenEdge and direction == "left" or
	(instance2.y) < topScreenEdge and direction == "up" or
	(instance2.y + instance2.contentHeight) > bottomScreenEdge  and direction == "down" then
	    Runtime:removeEventListener( "enterFrame", moveSomething )
	    if (instance2.x + instance2.contentWidth) > rightScreenEdge and direction == "right" then
		instance2:translate( -520, 0)
	    elseif (instance2.x + instance2.contentWidth) < leftScreenEdge and direction == "left" then
		instance2:translate( 520, 0)
	    elseif (instance2.y) < topScreenEdge and direction == "up" then
		instance2:translate( 0, 340)
	    elseif (instance2.y + instance2.contentHeight) > bottomScreenEdge  and direction == "down" then
	        instance2:translate( 0, -340)
	    end
	    Runtime:addEventListener( "enterFrame", moveSomething )
    end
    
end

local function addEdgesTransitions (event)

    Runtime:addEventListener( "enterFrame", edgesTransitions )
	    
end

local function doorTransition (event)
    for b = 1, #shapeArray do
	if shapeArrayParameters[b][1] == "door" then
	    thisChangeScreenDirection = shapeArrayParameters[b][7]
	    if shapeArray[b].enabled == "enabled" then
		if shapeArrayParameters[b][7] == "right" then
		    if (instance2.x + instance2.contentWidth) > (rightScreenEdge - 30)
		    and direction == "right" then
			higherY = (((shapeArrayParameters[b][6] - 1) * 52) + 30 + ((shapeArrayParameters[b][4] - 1) * display.contentHeight) )
			if instance2.y > higherY
			and instance2.y < (higherY + 52)
			and ballScreenHorzValue == shapeArrayParameters[b][3]
			and ballScreenVertValue == shapeArrayParameters[b][4]
			and screenTimer == 0 then
			    ballScreenHorzValue = ballScreenHorzValue + 1
			    thisScreenHorzValue = thisScreenHorzValue + 1
			    rightScreenEdge = rightScreenEdge + (1 * display.contentWidth)
			    leftScreenEdge = leftScreenEdge + (1 * display.contentWidth)
			    Runtime:removeEventListener("enterFrame", moveSomething)
			    Runtime:removeEventListener("enterFrame", edgesTransitions)
			    timer.performWithDelay(100, addEdgesTransitions, 1)
                            screenChangeType = "auto"
			    changeToRightScreen()
			    instance2.y = (higherY + 26)
			end
		    end
		elseif shapeArrayParameters[b][7] == "left" then
		    if (instance2.x + instance2.contentWidth) < (leftScreenEdge + 30)
		    and direction == "left" then
			higherY = (((shapeArrayParameters[b][6] - 1) * 52) + 30 + ((shapeArrayParameters[b][4] - 1) * display.contentHeight) )
			if instance2.y > higherY
			and instance2.y < (higherY + 52)
			and ballScreenHorzValue == shapeArrayParameters[b][3]
			and ballScreenVertValue == shapeArrayParameters[b][4]
			and screenTimer == 0 then
			    ballScreenHorzValue = ballScreenHorzValue - 1
			    thisScreenHorzValue = thisScreenHorzValue - 1
			    rightScreenEdge = rightScreenEdge - (1 * display.contentWidth)
			    leftScreenEdge = leftScreenEdge - (1 * display.contentWidth)
			    Runtime:removeEventListener("enterFrame", moveSomething)
			    Runtime:removeEventListener("enterFrame", edgesTransitions)
			    timer.performWithDelay(100, addEdgesTransitions, 1)
                            screenChangeType = "auto"
			    changeToRightScreen()
			    instance2.y = (higherY + 26)
			end
		    end
		elseif shapeArrayParameters[b][7] == "up" then
		    if (instance2.y) < (topScreenEdge + 30)
		    and direction == "up" then
			lowerX = (((shapeArrayParameters[b][5] - 1) * 60) + 30) + ((shapeArrayParameters[b][3] - 1) * display.contentWidth)
			if instance2.x > lowerX
			and instance2.x < (lowerX + 60)
			and ballScreenVertValue == shapeArrayParameters[b][4]
			and ballScreenHorzValue == shapeArrayParameters[b][3]
			and screenTimer == 0 then
			    Runtime:removeEventListener("enterFrame", moveSomething)
			    Runtime:removeEventListener("enterFrame", edgesTransitions)
			    ballScreenVertValue = ballScreenVertValue - 1
			    thisScreenVertValue = thisScreenVertValue - 1
			    topScreenEdge = topScreenEdge - (1 * display.contentHeight)
			    bottomScreenEdge = bottomScreenEdge - (1 * display.contentHeight)
			    timer.performWithDelay(100, addEdgesTransitions, 1)
                            screenChangeType = "auto"
                            changeToRightScreen()
			    instance2.x = (lowerX + 30)
			end
		    end
		elseif shapeArrayParameters[b][7] == "down" then
		    if (instance2.y + instance2.contentHeight) > (bottomScreenEdge - 30)
		    and direction == "down" then
			lowerX = (((shapeArrayParameters[b][5] - 1) * 60) + 30) + ((shapeArrayParameters[b][3] - 1) * display.contentWidth)
			if instance2.x > lowerX
			and instance2.x < (lowerX + 60)
			and ballScreenVertValue == shapeArrayParameters[b][4]
			and ballScreenHorzValue == shapeArrayParameters[b][3]
			and screenTimer == 0 then
			    ballScreenVertValue = ballScreenVertValue + 1
			    thisScreenVertValue = thisScreenVertValue + 1
			    topScreenEdge = topScreenEdge + (1 * display.contentHeight)
			    bottomScreenEdge = bottomScreenEdge + (1 * display.contentHeight)
			    Runtime:removeEventListener("enterFrame", moveSomething)
			    Runtime:removeEventListener("enterFrame", edgesTransitions)
			    timer.performWithDelay(100, addEdgesTransitions, 1)
                            screenChangeType = "auto"
			    changeToRightScreen()
			    instance2.x = (lowerX + 30)
			end
		    end
		end
	    end
	end
    end
end




local function transitionArrayStateChecknew ()
    d=thisTransitionObject.newDVal
			
    thisArrayCount = 0
    for a=1, #transitionArrayIndex[d] do
	thisArrayCount = thisArrayCount + 1	    
    end
			
    for e=5, #transitionArrayIndex[d] do
	if e % 2 ~= 0 then
	    if transitionArrayIndex[d][e][1] == thisTransitionObject.transitionArrayState
	    and transitionArrayIndex[d][1][1] == thisTransitionObject.name then
		thisTransitionObject.thisTransitionHorzSquare = transitionArrayIndex[d][e+1][3]
		thisTransitionObject.thisTransitionVertSquare = transitionArrayIndex[d][e+1][4]
		if e < (thisArrayCount - 2) then
		    thisTransitionObject.nextTransitionHorzSquare = transitionArrayIndex[d][e+3][3]
		    thisTransitionObject.nextTransitionVertSquare = transitionArrayIndex[d][e+3][4]
		else
		    thisTransitionObject.nextTransitionHorzSquare = "null"
		    thisTransitionObject.nextTransitionVertSquare = "null"
		end
		if e > 6 then
		    thisTransitionObject.prevTransitionHorzSquare = transitionArrayIndex[d][e-1][3]
		    thisTransitionObject.prevTransitionVertSquare = transitionArrayIndex[d][e-1][4]
		else
		    thisTransitionObject.prevTransitionHorzSquare = "null"
		    thisTransitionObject.prevTransitionVertSquare = "null"
		end
		if thisTransitionObject.nextTransitionHorzSquare == "null" then
	    
		end
	    end
	end
    end
    
    thisTransitionObject.enabled = true
    stillTransitioningCounter = 0
    transitionMoveCounter = 0
    secondTransitionMoveCounter = 0
    for z = 1, #shapeArray do
	if shapeArrayParameters[z][2] == thisTransitionObject.name
	and shapeArrayParameters[z][1] == "shape" then
	    local function addPhysicsBodyToShape ()
		for a = 1, #shapeFormingArray do
		    if shapeFormingArray[a][1] == shapeArrayParameters[z][7] then
			if instance2.x > (thisTransitionObject.x - 41)
			and instance2.x < (thisTransitionObject.x + 38) 
			and instance2.y > (thisTransitionObject.y - 38) 
			and instance2.y < (thisTransitionObject.y + 40) then
			    timer.performWithDelay(50, addPhysicsBodyToShape, 1)
			    local textObj = display.newText("hi", 0,0, nil, 14);
			    textObj.x = 20
			else
			    physics.addBody( thisTransitionObject, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][2] } )
			    thisTransitionObject:addEventListener("collision", on_Triangle_Collision)
			end   
		    end
		end
		thisTransitionObject.alpha = 1
	    end
	    
	    timer.performWithDelay(100, addPhysicsBodyToShape, 1)
	    
	    for a=1, #connectorArray do
		if connectorArray[a].relatedShape == thisTransitionObject.name then
		    connectorArray[a].alpha = 1
		end
		if connectorArray[a].x > (thisTransitionObject.x - 20)
		and connectorArray[a].x < (thisTransitionObject.x + 30)
		and connectorArray[a].y > (thisTransitionObject.y - 20)
		and connectorArray[a].y < (thisTransitionObject.y + 30) then
		    connectorArray[a].alpha = 0
		end
	    end
	elseif shapeArrayParameters[z][2] == thisTransitionObject.name
	and shapeArrayParameters[z][1] ~= "shape" then
	    thisTransitionObject.alpha = 1
	end
    end
end

local function transitionMoveSomething ()

    stillTransitioningCounter = 1
    
    thisTransitionObject.enabled = false
    physics.removeBody( thisTransitionObject )
    
    if thisTransitionDirection == "horz" then
	squareLength = 60
	transitionMoveCounterSpeed = 30
    else
	squareLength = 52
	transitionMoveCounterSpeed = 26
    end
    
    if transitionMoveCounter < (squareLength * storedTransitionDistance) then
        if thisTransitionDirection == "horz" then
	    thisTransitionObject.x = thisTransitionObject.x + (30 * thisTransitionXDirection)
	    if thisTransitionObject.objectType == "spitter" then
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
			thisSpitterDirectionArray[a].x = thisSpitterDirectionArray[a].x + (30 * thisTransitionXDirection)	
		    end
		end
		if thisTransitionObject.isBallPresent == true then
		    instance2.x = instance2.x + (30 * thisTransitionXDirection)
		end
	    elseif thisTransitionObject.objectType == "shape" then
                for a = 1, frontScreenObjectsGroup.numChildren do
                    if frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                        frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + (30 * thisTransitionXDirection)
                    end
                end
            elseif thisTransitionObject.objectType == "manualFan"
            or thisTransitionObject.objectType == "autoFan" then
                thisTransitionObject.directionIndicatorArrow.x = thisTransitionObject.directionIndicatorArrow.x + (30 * thisTransitionXDirection)
            end
        else
	    thisTransitionObject.y = thisTransitionObject.y + (26 * thisTransitionXDirection)
	    if thisTransitionObject.objectType == "spitter" then
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
			thisSpitterDirectionArray[a].y = thisSpitterDirectionArray[a].y + (26 * thisTransitionXDirection)	
		    end
		end
		if thisTransitionObject.isBallPresent == true then
		    instance2.y = instance2.y + (26 * thisTransitionXDirection)
		end
            elseif thisTransitionObject.objectType == "shape" then
                for a = 1, frontScreenObjectsGroup.numChildren do
                    if frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                        frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + (26 * thisTransitionXDirection)
                    end
                end
            elseif thisTransitionObject.objectType == "manualFan"
            or thisTransitionObject.objectType == "autoFan" then
                thisTransitionObject.directionIndicatorArrow.y = thisTransitionObject.directionIndicatorArrow.y + (26 * thisTransitionXDirection)
	    end
        end
	transitionMoveCounter = transitionMoveCounter + transitionMoveCounterSpeed
	object1Counter = 1
    else
        if nextOrPrev == "next" and thisTransitionDirection == "horz" then
	    if thisTransitionObject.nextTransitionVertSquare ~= thisTransitionObject.thisTransitionVertSquare then
	        thisSecondTransitionDistance = thisTransitionObject.thisTransitionVertSquare - thisTransitionObject.nextTransitionVertSquare
		if thisSecondTransitionDistance < 0 then
		    thisTransitionXDirection = 1
		    thisSecondTransitionDistance = thisSecondTransitionDistance * (-1)
		else
		    thisTransitionXDirection = -1
		end
		if secondTransitionMoveCounter < (52 * thisSecondTransitionDistance) then
		    thisTransitionObject.y = thisTransitionObject.y + (13 * thisTransitionXDirection)
		    if thisTransitionObject.objectType == "spitter" then
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
				thisSpitterDirectionArray[a].y = thisSpitterDirectionArray[a].y + (13 * thisTransitionXDirection)	
			    end
			end
			if thisTransitionObject.isBallPresent == true then
			    instance2.y = instance2.y + (13 * thisTransitionXDirection)
			end
                    elseif thisTransitionObject.objectType == "shape" then
                        for a = 1, frontScreenObjectsGroup.numChildren do
                            if frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                                frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + (13 * thisTransitionXDirection)
                            end
                        end
                    elseif thisTransitionObject.objectType == "manualFan"
                    or thisTransitionObject.objectType == "autoFan" then
                        thisTransitionObject.directionIndicatorArrow.y = thisTransitionObject.directionIndicatorArrow.y + (13 * thisTransitionXDirection)
		    end
		    secondTransitionMoveCounter = secondTransitionMoveCounter + 13
		else
		    thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState + 1
		    timer.performWithDelay(0, transitionArrayStateChecknew, 1)
		    Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
		end
	    else
		thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState + 1
		timer.performWithDelay(0, transitionArrayStateChecknew, 1)
		Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
	    end
	elseif nextOrPrev == "prev" and thisTransitionDirection == "vert" then
	    if thisTransitionObject.prevTransitionHorzSquare ~= thisTransitionObject.thisTransitionHorzSquare then
	        thisSecondTransitionDistance = thisTransitionObject.thisTransitionHorzSquare - thisTransitionObject.prevTransitionHorzSquare
		if thisSecondTransitionDistance < 0 then
		    thisTransitionXDirection = 1
		    thisSecondTransitionDistance = thisSecondTransitionDistance * (-1)
		else
		    thisTransitionXDirection = -1
		end
		if secondTransitionMoveCounter < (60 * thisSecondTransitionDistance) then
		    thisTransitionObject.x = thisTransitionObject.x + (20 * thisTransitionXDirection)
		    if thisTransitionObject.objectType == "spitter" then
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
				thisSpitterDirectionArray[a].x = thisSpitterDirectionArray[a].x + (20 * thisTransitionXDirection)	
			    end
			end
			if thisTransitionObject.isBallPresent == true then
			    instance2.x = instance2.x + (20 * thisTransitionXDirection)
			end
                    elseif thisTransitionObject.objectType == "shape" then
                        for a = 1, frontScreenObjectsGroup.numChildren do
                            if frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                                frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + (20 * thisTransitionXDirection)
                            end
                        end
                    elseif thisTransitionObject.objectType == "manualFan"
                    or thisTransitionObject.objectType == "autoFan" then
                        thisTransitionObject.directionIndicatorArrow.x = thisTransitionObject.directionIndicatorArrow.x + (20 * thisTransitionXDirection)
		    end
		    secondTransitionMoveCounter = secondTransitionMoveCounter + 20
		else
		    thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState - 1
		    timer.performWithDelay(0, transitionArrayStateChecknew, 1)
		    Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
		end
	    else
		thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState - 1
		timer.performWithDelay(0, transitionArrayStateChecknew, 1)
		Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
	    end
	else
	    if nextOrPrev == "next" then
		thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState + 1
	    else
		thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState - 1
	    end
	    timer.performWithDelay(0, transitionArrayStateChecknew, 1)
	    Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
	end
    end
    if thisTransitionObject.isFocus == true then
	thisTransitionObject.isFocus = false
	display.getCurrentStage():setFocus( nil )
    end 
end

local function showPauseScreen (event)
    if pauseScreen.state == "unpaused" then
	if pauseScreen.y > 0 then
	    pauseScreen.y = pauseScreen.y - (display.contentHeight/10)
	    pauseScreenObjectsGroup.y = pauseScreenObjectsGroup.y - (display.contentHeight/10)
	else
	    Runtime:removeEventListener("enterFrame", showPauseScreen)
	    pauseScreen.state = "paused"
	end
    else
	if pauseScreen.y < display.contentHeight then
	    pauseScreen.y = pauseScreen.y + (display.contentHeight/10)
	    pauseScreenObjectsGroup.y = pauseScreenObjectsGroup.y + (display.contentHeight/10)
	else
	    Runtime:removeEventListener("enterFrame", showPauseScreen)
	    if isBallMovingState == "true"
            and mapScreen.state == "mapHidden" then
		Runtime:addEventListener("enterFrame", moveSomething)
		Runtime:addEventListener( "enterFrame", edgesTransitions )
	    end
	    shouldBallMoveState = "true"
	    pauseScreen.state = "unpaused"
	end
    end
end

function resetLevel()

    -- simply go to level1.lua scene
    storyboard.gotoScene( "reset", "slideDown", 50 )
     
    return true -- indicates successful touch

end


local function listener(event)
        
    for d=1, #transitionArrayIndex do
        if (transitionArrayIndex[d][2][1] == "flip-horizontal"
        or transitionArrayIndex[d][2][1] == "flip-vertical")
        and event.target.name == transitionArrayIndex[d][1][1] then
            if instance2.x > (event.target.x - 60)
            and instance2.x < (event.target.x + 60)
            and instance2.y > (event.target.y - 60)
            and instance2.y < (event.target.y + 60) then
                event.target.flipDisabled = true
                thisFlippedCounterObject = event.target
                local function addThisCounterBack ()
                    thisFlippedCounterObject.flipDisabled = false
                end
                timer.performWithDelay(400, addThisCounterBack)
            else
                if event.phase == "began"
                and event.target.flipDisabled ~= true then
                    display.getCurrentStage():setFocus(event.target)
                    event.target.isFocus = true
                    thisActualFlippedObject = event.target
                    thisActualFlippedObject.flipped = event.target.flipped
                    thisActualFlippedObject.originalState = event.target.originalState
                    thisActualFlippedObjectName = event.target.name
                    thisActualFlippedObjectShape = event.target.shape
                    thisActualFlippedObjectTransitionArrayState = event.target.transitionArrayState
                    thisActualFlippedObjectDirection = transitionArrayIndex[d][2][1]
                    
                    positionNewFlippedObject()
                else
                    if event.target.isFocus == true then
                        flipVerticalCounter = 0
                        event.target.isFocus = false
                        display.getCurrentStage():setFocus( nil )
                    end
                end
            end
        elseif transitionArrayIndex[d][2][1] == "slide" then
            if event.target.name == transitionArrayIndex[d][1][1] and stillTransitioningCounter == 0 then
                if event.phase == "began"
                and ballActivateButtonSet == false then
                    thisTransitionObject = event.target
                    thisTransitionObject.objectType = event.target.objectType
                    thisTransitionObject.enabled = event.target.enabled
                    thisTransitionObject.alpha = event.target.alpha
                    thisTransitionObject.newDVal = d
                    transitionMoveCounter = 0
                    object1Counter = 0
                    eventStartX = event.x
                    eventStartY = event.y
                    eventStartTime = event.time
                    
                elseif event.phase == "moved"
                and stillTransitioningCounter == 0
                and ballActivateButtonSet == false then
                    
                    display.getCurrentStage():setFocus(event.target)
                    event.target.isFocus = true
                    eventMove = "true"
                    eventNewX = event.x
                    eventNewY = event.y
                    eventEndTime = event.time
                    ySwipe = eventNewY - eventStartY
                    xSwipe = eventNewX - eventStartX
                    eventTotalTime = eventEndTime - eventStartTime
                    
                    if event.target.nextTransitionHorzSquare ~= "null"
                    and event.target.nextTransitionHorzSquare > event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.nextTransitionHorzSquare - event.target.thisTransitionHorzSquare
                        
                        if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 350 then
                            if (xSwipe) > 10 and object1Counter == 0 then
                                thisTransitionXDirection = 1
                                thisTransitionDirection = "horz"
                                nextOrPrev = "next"
                                if thisTransitionDistance < 0 then
                                    storedTransitionDistance = (thisTransitionDistance) * -1
                                else
                                    storedTransitionDistance = thisTransitionDistance
                                end
                                if stillTransitioningCounter == 0 then
                                    stillTransitioningCounter = 1
                                    Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                end
                            end
                        end
                    elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare < event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.thisTransitionHorzSquare - event.target.nextTransitionHorzSquare
                        
                        if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 350 then
                            if (xSwipe) < -10 and object1Counter == 0 then
                                thisTransitionXDirection = -1
                                nextOrPrev = "next"
                                thisTransitionDirection = "horz"
                                if thisTransitionDistance < 0 then
                                    storedTransitionDistance = (thisTransitionDistance) * -1
                                else
                                    storedTransitionDistance = thisTransitionDistance
                                end
                                if stillTransitioningCounter == 0 then
                                    stillTransitioningCounter = 1
                                    Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                end
                            end
                        end
                    elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare == event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.nextTransitionVertSquare - event.target.thisTransitionVertSquare
                        
                        if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 350 then
                            if event.target.nextTransitionVertSquare ~= "null" and event.target.nextTransitionVertSquare < event.target.thisTransitionVertSquare then
                                if (ySwipe) < -10 and object1Counter == 0 then
                                    thisTransitionXDirection = -1
                                    nextOrPrev = "next"
                                    thisTransitionDirection = "vert"
                                    if thisTransitionDistance < 0 then
                                        storedTransitionDistance = (thisTransitionDistance) * -1
                                    else
                                        storedTransitionDistance = thisTransitionDistance
                                    end
                                    if stillTransitioningCounter == 0 then
                                        stillTransitioningCounter = 1
                                        Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                    end
                                end
                            elseif event.target.nextTransitionVertSquare ~= "null" and event.target.nextTransitionVertSquare > event.target.thisTransitionVertSquare then
                                if (ySwipe) > 10 and object1Counter == 0 then
                                    thisTransitionXDirection = 1
                                    nextOrPrev = "next"
                                    thisTransitionDirection = "vert"
                                    if thisTransitionDistance < 0 then
                                        storedTransitionDistance = (thisTransitionDistance) * -1
                                    else
                                        storedTransitionDistance = thisTransitionDistance
                                    end
                                    if stillTransitioningCounter == 0 then
                                        stillTransitioningCounter = 1
                                        Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                    end
                                end
                            end
                        end
                    end
                    
                    if  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare > event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.prevTransitionVertSquare - event.target.thisTransitionVertSquare
                        
                        if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 350 then
                            if (ySwipe) > 10 and object1Counter == 0 then
                                thisTransitionXDirection = 1
                                nextOrPrev = "prev"
                                thisTransitionDirection = "vert"
                                if thisTransitionDistance < 0 then
                                    storedTransitionDistance = (thisTransitionDistance) * -1
                                else
                                    storedTransitionDistance = thisTransitionDistance
                                end
                                if stillTransitioningCounter == 0 then
                                    stillTransitioningCounter = 1
                                    Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                end
                            end
                        end
                    elseif  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare < event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.thisTransitionVertSquare - event.target.prevTransitionVertSquare
                                
                        if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 350 then
                            if (ySwipe) < -10 and object1Counter == 0 then
                                thisTransitionXDirection = -1
                                nextOrPrev = "prev"
                                thisTransitionDirection = "vert"
                                if thisTransitionDistance < 0 then
                                    storedTransitionDistance = (thisTransitionDistance) * -1
                                else
                                    storedTransitionDistance = thisTransitionDistance
                                end
                                if stillTransitioningCounter == 0 then
                                    stillTransitioningCounter = 1
                                    Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                end
                            end
                        end
                    elseif event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare == event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.prevTransitionHorzSquare - event.target.thisTransitionHorzSquare
                                    
                        if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 350 then
                            if event.target.prevTransitionHorzSquare ~= "null" and event.target.prevTransitionHorzSquare < event.target.thisTransitionHorzSquare then
                                if (xSwipe) < -10 and object1Counter == 0 then
                                    thisTransitionXDirection = -1
                                    nextOrPrev = "prev"
                                    thisTransitionDirection = "horz"
                                    if thisTransitionDistance < 0 then
                                        storedTransitionDistance = (thisTransitionDistance) * (-1)
                                    else
                                        storedTransitionDistance = thisTransitionDistance
                                    end
                                    if stillTransitioningCounter == 0 then
                                        stillTransitioningCounter = 1
                                        Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                    end
                                end
                            elseif event.target.prevTransitionHorzSquare ~= "null" and event.target.prevTransitionHorzSquare > event.target.thisTransitionHorzSquare then
                                if (ySwipe) > 10 and object1Counter == 0 then
                                    thisTransitionXDirection = 1
                                    nextOrPrev = "prev"
                                    thisTransitionDirection = "horz"
                                    if thisTransitionDistance < 0 then
                                        storedTransitionDistance = (thisTransitionDistance) * -1
                                    else
                                        storedTransitionDistance = thisTransitionDistance
                                    end
                                    if stillTransitioningCounter == 0 then
                                        stillTransitioningCounter = 1
                                        Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                                    end
                                    
                                end
                            end
                        end
                    end
                else
                    if event.target.isFocus == true then
                        event.target.isFocus = false
                        display.getCurrentStage():setFocus( nil )
                    end 
                end
            end
        end
    end

    for c=1, #shapeArray do
        local function centerManualFan ()
            Runtime:removeEventListener( "enterFrame", moveSomething )
            fanXCenteringComplete = false
            fanYCenteringComplete = false
            fanCenteringCounter = 0
            thisFan = event.target
            thisFan.type = event.target.objectType
            Runtime:addEventListener( "enterFrame", fanCentering )
            direction = event.target.direction
            instance2:setSequence(direction)
        end
        local function minorFanListener ()
            if (instance2.x) > (event.target.x - 10)
            and (instance2.x) < (event.target.x + 10 + 60)
            and (instance2.y) > (event.target.y - 6)
            and (instance2.y) < (event.target.y + 6 + 52)
            and event.target.isEnabledNow == true then
                centerManualFan()
                Runtime:removeEventListener("enterFrame", minorFanListener)
            end
        end
        if event.target == shapeArray[c] then
            if  event.target.objectType == "manualFan"
            and ballActivateButtonSet == true then
                if event.phase == "began" then
                    shapeArray[c]:setSequence("on")
                    event.target.isEnabledNow = true
                    if manualFanCounter == 0 then
                        manualFanCounter = 1
                        Runtime:addEventListener("enterFrame", minorFanListener)
                    end
                elseif event.phase == "moved" then
                    
                    --event.target.isFocus = true
                    --display.getCurrentStage():setFocus( event.target , event.target.name )
                    
                    if event.x > (shapeArray[c].x + (shapeArray[c].contentWidth - 5) - ((shapeArrayParameters[c][3] - 1) * display.contentWidth))
                    or event.x < (shapeArray[c].x + 5 - ((shapeArrayParameters[c][3] - 1) * display.contentWidth))
                    or event.y > (shapeArray[c].y + (shapeArray[c].contentHeight - 5) - ((shapeArrayParameters[c][4] - 1) * display.contentHeight)) 
                    or event.y < (shapeArray[c].y + 5 - ((shapeArrayParameters[c][4] - 1) * display.contentHeight)) then
                        manualFanCounter = 0
                        shapeArray[c].isEnabledNow = false
                        Runtime:removeEventListener("enterFrame", minorFanListener)
                        shapeArray[c]:setSequence("off")
                    elseif event.x < (shapeArray[c].x + (shapeArray[c].contentWidth - 5) - ((shapeArrayParameters[c][3] - 1) * display.contentWidth))
                    and event.x > (shapeArray[c].x + 5 - ((shapeArrayParameters[c][3] - 1) * display.contentWidth))
                    and event.y < (shapeArray[c].y + (shapeArray[c].contentHeight - 5) - ((shapeArrayParameters[c][4] - 1) * display.contentHeight)) 
                    and event.y > (shapeArray[c].y + 5 - ((shapeArrayParameters[c][4] - 1) * display.contentHeight)) then
                        if (instance2.x) > (event.target.x - 10)
                        and (instance2.x) < (event.target.x + 10 + 60)
                        and (instance2.y) > (event.target.y - 6)
                        and (instance2.y) < (event.target.y + 6 + 52)
                        and event.target.enabled == true
                        and manualFanCounter == 0 then
                            manualFanCounter = 1
                            centerManualFan()
                        end
                        shapeArray[c]:setSequence("on")
                    end

                elseif event.phase == "ended" then
                    Runtime:removeEventListener("enterFrame", minorFanListener)
                    manualFanCounter = 0
                    shapeArray[c].isEnabledNow = false
                    shapeArray[c]:setSequence("off")
                    display.getCurrentStage():setFocus( nil )
                end
            elseif event.target.objectType == "spitter"
            and event.target.enabled == true
            and ballActivateButtonSet == true then
                if event.phase == "began" then
                    eventStartX = event.x
                    eventStartY = event.y
                    eventStartTime = event.time
                elseif event.phase == "moved" then
                    Runtime:removeEventListener("enterFrame", autoFanTransition)
                    eventNewX = event.x
                    eventNewY = event.y
                    eventEndTime = event.time
                    ySwipe = eventNewY - eventStartY
                    xSwipe = eventNewX - eventStartX
                    eventTotalTime = eventEndTime - eventStartTime
                    
                    local function moveBallFromSpitter()
                        spitterCounter = 1
                        Runtime:addEventListener( "enterFrame", moveSomething)
                        thisBallSpitter.isBallPresent = false
                    end
                    
                    if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) > 10 and (eventTotalTime) < 600 then
                        if (xSwipe) > 7 and spitterCounter == 0 and event.target.rightEnabled == true and event.target.isBallPresent == true and shouldBallMoveState == "true" then
                            direction = "right"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        elseif (xSwipe) < -7 and spitterCounter == 0 and event.target.leftEnabled == true and event.target.isBallPresent == true and shouldBallMoveState == "true" then
                            direction = "left"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        end
                    end
                    
                    if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) > 10 and (eventTotalTime) < 600 then
                        if (ySwipe) > 7 and spitterCounter == 0 and event.target.downEnabled == true and event.target.isBallPresent == true and shouldBallMoveState == "true" then
                            direction = "down"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        elseif (ySwipe) < -7 and spitterCounter == 0 and event.target.upEnabled == true and event.target.isBallPresent == true and shouldBallMoveState == "true" then
                            direction = "up"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        end
                    end
                    
                    local function addBackAutoFan ()
                        Runtime:addEventListener("enterFrame", autoFanTransition)
                    end
                    
                    timer.performWithDelay(90, addBackAutoFan, 1)
                    
                    instance2:setSequence(direction)
                end
            end
        end
    end
    
end

local function mapButtonListener (event)
    if event.target.name == "mapLeftButton" then
        if event.phase == "began" then
            if thisScreenHorzValue > 1 and manualScreenChangeCounter == 0 then
                manualScreenChangeCounter = 1
                thisScreenHorzValue = thisScreenHorzValue - 1
                screenChangeSpeed = mainScreenChangeSpeed
                screenChangeType = "manual"
                thisChangeScreenDirection = "left"
                changeToRightScreen()
            end
        end
    elseif event.target.name == "mapRightButton" then
        if event.phase == "began" then
            if thisScreenHorzValue < screenHorzTotal and manualScreenChangeCounter == 0 then
                manualScreenChangeCounter = 1
                thisScreenHorzValue = thisScreenHorzValue + 1
                screenChangeSpeed = mainScreenChangeSpeed * -1
                screenChangeType = "manual"
                thisChangeScreenDirection = "right"
                changeToRightScreen()
            end
        end
    elseif event.target.name == "mapUpButton" then
        if event.phase == "began" then
            if thisScreenVertValue > 1 and manualScreenChangeCounter == 0 then
                manualScreenChangeCounter = 1
                thisScreenVertValue = thisScreenVertValue - 1
                screenChangeSpeed = mainScreenChangeSpeed
                screenChangeType = "manual"
                thisChangeScreenDirection = "up"
                changeToRightScreen()
            end
        end
    elseif event.target.name == "mapDownButton" then
        if event.phase == "began" then
            if thisScreenVertValue < screenVertTotal and manualScreenChangeCounter == 0 then
                manualScreenChangeCounter = 1
                thisScreenVertValue = thisScreenVertValue + 1
                screenChangeSpeed = mainScreenChangeSpeed * -1
                screenChangeType = "manual"
                thisChangeScreenDirection = "down"
                changeToRightScreen()
            end
        end
    end
end

local function buttonListener(event)
    if event.target.name == "play" then
  	if event.phase == "began" then
	    if thisScreenHorzValue == ballScreenHorzValue and thisScreenVertValue == ballScreenVertValue then
		if pressCount == 0 then
		    pressCount = 1
		    if moveSomethingCounter == 0 then
			Runtime:addEventListener( "enterFrame", moveSomething )
                        Runtime:addEventListener( "enterFrame", edgesTransitions )
                        backBtn:setSequence("default")
                    end
                    
                    Runtime:addEventListener( "enterFrame", doorTransition )
                    Runtime:addEventListener( "enterFrame", tunnelTransition )
                    Runtime:addEventListener( "enterFrame", autoFanTransition )
		else
                    if ballActivateButtonSet == false then
                        backBtn:setSequence("over")
                        ballActivateButtonSet = true
                    end
                end
		isBallMovingState = "true"
		shouldBallMoveState = "true"
	    end
        elseif event.phase == "moved" then
            
            --event.target.isFocus = true
            display.getCurrentStage():setFocus( event.target , event.target.name )
            
            if event.x > event.target.x + (event.target.contentWidth/2 - 10)
            or event.y < event.target.y - (event.target.contentHeight/2 - 10) then
                if ballActivateButtonSet == true then
                    backBtn:setSequence("default")
                    ballActivateButtonSet = false
                    for a = 1, #shapeArray do
                        if shapeArray[a].objectType == "manualFan"
                        and shapeArray[a].sequence ==  "on" then
                            shapeArray[a]:setSequence("off")
                        end
                    end
                end
            elseif event.x < event.target.x + event.target.contentWidth/2
            and event.y > event.target.y - event.target.contentHeight/2 then
                if ballActivateButtonSet == false then
                    backBtn:setSequence("over")
                    ballActivateButtonSet = true
                end
            end
	elseif event.phase == "ended" then
            if ballActivateButtonSet == true then
                for a = 1, #shapeArray do
                    if shapeArray[a].objectType == "manualFan"
                    and shapeArray[a].sequence ==  "on" then
                        shapeArray[a]:setSequence("off")
                    end
                end
                backBtn:setSequence("default")
                ballActivateButtonSet = false
                --event.target.isFocus = false
                display.getCurrentStage():setFocus( nil )
            end
        end
    end
    
    if event.target.name == "map" then
        if event.phase == "began" then
            if mapScreen.state == "mapHidden"
            and mapShowCounter == 0
            and pauseButtonsEnabled == true then
                ballActivateButtonSet = false
                backBtn:setSequence("default")
                display.getCurrentStage():setFocus( nil )
                mapShowCounter = 1
                shouldBallMoveState = "false" 
                mapScreen.state = "mapShowing"
                transition.to (mapScreen, {alpha=0.11, time=150})
                backBtn.alpha = 0.3
                if isBallMovingState == "true" then
                    Runtime:removeEventListener("enterFrame", moveSomething)
                    Runtime:removeEventListener( "enterFrame", edgesTransitions )
                end
                if pauseButtonsEnabled == true then
                    Runtime:removeEventListener( "enterFrame", autoFanTransition)
                end
                if stillTransitioningCounter == 1 then
                    Runtime:removeEventListener( "enterFrame", transitionMoveSomething)
                end
                
                backBtn:removeEventListener( "touch", buttonListener )
                playBtn:setSequence("over")
                
                for c=1, #shapeArray do
                    if shapeArrayParameters[c][1] == "manualFan" or shapeArrayParameters[c][1] == "spitter" then
                        shapeArray[c]:removeEventListener( "touch", listener )
                    end  
                    for d=1, #transitionArrayIndex do
                        if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                            shapeArray[c]:removeEventListener("touch", listener)
                        end
                    end
                end
                
                mapButtonTransparencyCheck()
                
                rightBtn:addEventListener("touch", mapButtonListener )
                leftBtn:addEventListener("touch", mapButtonListener )
                upBtn:addEventListener("touch", mapButtonListener )
                downBtn:addEventListener("touch", mapButtonListener )
                mapShowCounter = 0
            elseif mapScreen.state == "mapShowing"
            and mapShowCounter == 0 then
            
                local function return2BallScreen (event)
    
                    if thisScreenHorzValue ~= ballScreenHorzValue then
                        if thisScreenHorzValue > ballScreenHorzValue then
                            alteredHorzMainScreenChangeSpeed = mainScreenChangeSpeed * (-1)
                            totalReturnToBallHorzTransition = (thisScreenHorzValue - ballScreenHorzValue) * display.contentWidth
                        else
                            alteredHorzMainScreenChangeSpeed = mainScreenChangeSpeed
                            totalReturnToBallHorzTransition = (ballScreenHorzValue - thisScreenHorzValue) * display.contentWidth
                        end
                        if returnToBallHorzTransition ~= totalReturnToBallHorzTransition then
                            backgroundObjectsGroup.x = backgroundObjectsGroup.x - alteredHorzMainScreenChangeSpeed
                            screenObjectsGroup.x = screenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
                            midScreenObjectsGroup.x = midScreenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
                            frontScreenObjectsGroup.x = frontScreenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
                            returnToBallHorzTransition = returnToBallHorzTransition + mainScreenChangeSpeed
                        else
                            returnToBallScreenHorzTransitionOver = true
                        end
                    else
                        returnToBallScreenHorzTransitionOver = true
                    end
                    
                    if thisScreenVertValue ~= ballScreenVertValue then
                        if thisScreenVertValue > ballScreenVertValue then
                            alteredVertMainScreenChangeSpeed = mainScreenChangeSpeed * (-1)
                            totalReturnToBallVertTransition = (thisScreenVertValue - ballScreenVertValue) * display.contentHeight
                        else
                            alteredVertMainScreenChangeSpeed = mainScreenChangeSpeed
                            totalReturnToBallVertTransition = (ballScreenVertValue - thisScreenVertValue) * display.contentHeight
                        end
                        if returnToBallVertTransition ~= totalReturnToBallVertTransition then
                            backgroundObjectsGroup.y = backgroundObjectsGroup.y - alteredVertMainScreenChangeSpeed
                            screenObjectsGroup.y = screenObjectsGroup.y - alteredVertMainScreenChangeSpeed
                            midScreenObjectsGroup.y = midScreenObjectsGroup.y - alteredVertMainScreenChangeSpeed
                            frontScreenObjectsGroup.y = frontScreenObjectsGroup.y - alteredVertMainScreenChangeSpeed
                            returnToBallVertTransition = returnToBallVertTransition + mainScreenChangeSpeed
                        else
                            returnToBallScreenVertTransitionOver = true
                        end
                    else
                        returnToBallScreenVertTransitionOver = true
                    end
                    
                    if returnToBallScreenHorzTransitionOver == true
                    and returnToBallScreenVertTransitionOver == true then
                        thisScreenHorzValue = ballScreenHorzValue
                        thisScreenVertValue = ballScreenVertValue
                        Runtime:removeEventListener("enterFrame", return2BallScreen)
                        
                        mapButtonStateCheck()
                        local function addButtonsBack ()
                            transition.to (mapScreen, {alpha=0, time=150})
                            backBtn.alpha = 1
                            
                            if isBallMovingState == "true" then
                                shouldBallMoveState = "true"
                                Runtime:addEventListener("enterFrame", moveSomething)
                                Runtime:addEventListener( "enterFrame", edgesTransitions )
                            end
                            
                            if pauseButtonsEnabled == true then
                                Runtime:addEventListener( "enterFrame", autoFanTransition)
                            end
                            
                            if stillTransitioningCounter == 1 then
                                Runtime:addEventListener( "enterFrame", transitionMoveSomething) 
                            end
                            
                            playBtn:addEventListener( "touch", buttonListener )
                            backBtn:addEventListener("touch", buttonListener)
                        
                            for c=1, #shapeArray do
                                if shapeArrayParameters[c][1] == "manualFan" or shapeArrayParameters[c][1] == "spitter" then
                                    shapeArray[c]:addEventListener( "touch", listener )
                                end    
                                
                                for d=1, #transitionArrayIndex do
                                    if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                                        shapeArray[c]:addEventListener("touch", listener)
                                    end
                                end
                            end
                        
                        end
                        playBtn:setSequence("default")
                        timer.performWithDelay(300, addButtonsBack, 1)
                        
                    end
                end
            
                mapShowCounter = 1
                playBtn:removeEventListener("touch", buttonListener)
                
                rightBtn:removeEventListener("touch", mapButtonListener )
                leftBtn:removeEventListener("touch", mapButtonListener )
                upBtn:removeEventListener("touch", mapButtonListener )
                downBtn:removeEventListener("touch", mapButtonListener )
                
                transition.to (rightBtn, {alpha=0, time=200})
                transition.to (leftBtn, {alpha=0, time=200})
                transition.to (upBtn, {alpha=0, time=200})
                transition.to (downBtn, {alpha=0, time=200})
                returnToBallHorzTransition = 0
                returnToBallVertTransition = 0
                returnToBallScreenHorzTransitionOver = false
                returnToBallScreenVertTransitionOver = false
                Runtime:addEventListener("enterFrame", return2BallScreen)
                
                mapScreen.state = "mapHidden"
                mapShowCounter = 0
                
            end
	end
    end
    
    if event.target.name == "random" then
	if event.phase == "began"
        and pauseButtonsEnabled == true then
	    shouldBallMoveState = "false"
	    Runtime:removeEventListener("enterFrame", moveSomething)
	    Runtime:removeEventListener( "enterFrame", edgesTransitions )
            
            if pauseButtonsEnabled == true then
                Runtime:removeEventListener( "enterFrame", autoFanTransition)
            end
            if stillTransitioningCounter == 1 then
                Runtime:removeEventListener( "enterFrame", transitionMoveSomething) 
            end
            
	    Runtime:addEventListener("enterFrame", showPauseScreen)
            
            playBtn:removeEventListener( "touch", buttonListener )
            backBtn:removeEventListener( "touch", buttonListener )
            
            randomBtn:removeEventListener( "touch", buttonListener )
            
            for c=1, #shapeArray do
                for d=1, #transitionArrayIndex do
                    if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                        shapeArray[c]:removeEventListener("touch", listener)
                    end
                end
            end
	end
    end
    
    if event.target.name == "backToPlay" then
	if event.phase == "began" then
	    if pauseScreen.state == "paused" then
	        Runtime:addEventListener("enterFrame", showPauseScreen)
                playBtn:addEventListener( "touch", buttonListener )
                backBtn:addEventListener( "touch", buttonListener )
                
                if pauseButtonsEnabled == true then
                    Runtime:addEventListener( "enterFrame", autoFanTransition)
                end
                if stillTransitioningCounter == 1 then
                    Runtime:addEventListener( "enterFrame", transitionMoveSomething) 
                end
                
                randomBtn:addEventListener( "touch", buttonListener )
                
                for c=1, #shapeArray do
                    for d=1, #transitionArrayIndex do
                        if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                            shapeArray[c]:addEventListener("touch", listener)
                        end
                    end
                end
	    end
	end
    end
    
    if event.target.name == "reset" then
	if event.phase == "began" then
            direction = "up"
	    resetLevel()
	end
    end
    
    if event.target.name == "backToMain" then
	if event.phase == "began" then
            --purge level
	    storyboard.gotoScene("backToHome", "fade", 10)
            return true
	end
    end
    
end


local function initialReturnToBallScreen (event)
    if thisScreenHorzValue ~= ballScreenHorzValue then
        if thisScreenHorzValue > ballScreenHorzValue then
            alteredHorzMainScreenChangeSpeed = mainScreenChangeSpeed * (-1)
            totalReturnToBallHorzTransition = (thisScreenHorzValue - ballScreenHorzValue) * display.contentWidth
        else
            alteredHorzMainScreenChangeSpeed = mainScreenChangeSpeed
            totalReturnToBallHorzTransition = (ballScreenHorzValue - thisScreenHorzValue) * display.contentWidth
        end
        if returnToBallHorzTransition ~= totalReturnToBallHorzTransition then
            backgroundObjectsGroup.x = backgroundObjectsGroup.x - alteredHorzMainScreenChangeSpeed
            screenObjectsGroup.x = screenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
            midScreenObjectsGroup.x = midScreenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
            frontScreenObjectsGroup.x = frontScreenObjectsGroup.x - alteredHorzMainScreenChangeSpeed
            returnToBallHorzTransition = returnToBallHorzTransition + mainScreenChangeSpeed
        else
            returnToBallScreenHorzTransitionOver = true
        end
    else
        returnToBallScreenHorzTransitionOver = true
            returnToBallHorzTransition = 0
    end
    
    if thisScreenVertValue ~= ballScreenVertValue then
        if thisScreenVertValue > ballScreenVertValue then
            alteredVertMainScreenChangeSpeed = mainScreenChangeSpeed * (-1)
            totalReturnToBallVertTransition = (thisScreenVertValue - ballScreenVertValue) * display.contentHeight
        else
            alteredVertMainScreenChangeSpeed = mainScreenChangeSpeed
            totalReturnToBallVertTransition = (ballScreenVertValue - thisScreenVertValue) * display.contentHeight
        end
        if returnToBallVertTransition ~= totalReturnToBallVertTransition then
            backgroundObjectsGroup.y = backgroundObjectsGroup.y - alteredVertMainScreenChangeSpeed
            screenObjectsGroup.y = screenObjectsGroup.y - alteredVertMainScreenChangeSpeed
            midScreenObjectsGroup.y = midScreenObjectsGroup.y - alteredVertMainScreenChangeSpeed
            frontScreenObjectsGroup.y = frontScreenObjectsGroup.y - alteredVertMainScreenChangeSpeed
            returnToBallVertTransition = returnToBallVertTransition + mainScreenChangeSpeed
        else
            returnToBallScreenVertTransitionOver = true
        end
    else
        returnToBallScreenVertTransitionOver = true
            returnToBallVertTransition = 0
    end
    
    if returnToBallScreenHorzTransitionOver == true
    and returnToBallScreenVertTransitionOver == true then
        
        returnToBallHorzTransition = 0
        returnToBallVertTransition = 0
        thisScreenHorzValue = ballScreenHorzValue
        thisScreenVertValue = ballScreenVertValue
        
        playBtn:addEventListener( "touch", buttonListener )
        backBtn:addEventListener( "touch", buttonListener )
        randomBtn:addEventListener( "touch", buttonListener )
        transition.to(playBtn, {alpha=1, time=400})
        transition.to(backBtn, {alpha=1, time=400})
        transition.to(randomBtn, {alpha=1, time=400})
        
        Runtime:removeEventListener("enterFrame", initialReturnToBallScreen)
        
        mapButtonStateCheck()
        
    end
end

local function screenInitialiserInTransition ()

    if nextScreenInitialiserTransition == "horizontal"
    and screenInitialiserHorzTransition == "incomplete" then
            
        if horzScreenInitialiserTimer < (display.contentWidth * numberOfHorzScreens) then
            backgroundObjectsGroup.x = backgroundObjectsGroup.x + initialScreenChangeSpeed
            screenObjectsGroup.x = screenObjectsGroup.x + initialScreenChangeSpeed
            midScreenObjectsGroup.x = midScreenObjectsGroup.x + initialScreenChangeSpeed
            frontScreenObjectsGroup.x = frontScreenObjectsGroup.x + initialScreenChangeSpeed
            
            if relevantHorzScreen == screenHorzTotal then 
                horzScreenInitialiserTimer = horzScreenInitialiserTimer - initialScreenChangeSpeed
            else
                horzScreenInitialiserTimer = horzScreenInitialiserTimer + initialScreenChangeSpeed
            end
        else
            screenInitialiserHorzValue = relevantHorzScreen
            screenInitialiserHorzTransition = "complete"
            if screenInitialiserVertValue < screenVertTotal then
                screenInitialiserVertValue = screenInitialiserVertValue + 1
                thisScreenVertValue = thisScreenVertValue + 1
                screenInitialiserVertTransition = "incomplete"
                vertScreenInitialiserTimer = 0
                nextScreenInitialiserTransition = "vertical"
            end
        end
    end
    
    if nextScreenInitialiserTransition == "vertical"
    and screenInitialiserVertTransition == "incomplete" then
        if vertScreenInitialiserTimer < (display.contentHeight) then
            
            backgroundObjectsGroup.y = backgroundObjectsGroup.y + initialVertScreenChangeSpeed
            screenObjectsGroup.y = screenObjectsGroup.y + initialVertScreenChangeSpeed
            midScreenObjectsGroup.y = midScreenObjectsGroup.y + initialVertScreenChangeSpeed
            frontScreenObjectsGroup.y = frontScreenObjectsGroup.y + initialVertScreenChangeSpeed
            
            if initialScreenChangeSpeed == display.contentWidth / 12 then
                vertScreenInitialiserTimer = vertScreenInitialiserTimer + initialVertScreenChangeSpeed
            else
                vertScreenInitialiserTimer = vertScreenInitialiserTimer - initialVertScreenChangeSpeed
            end
            
        else
            horzScreenInitialiserTimer = 0
            screenInitialiserHorzTransition = "incomplete"
            if screenInitialiserVertValue % 2 == 0 then
                relevantHorzScreen = 1
                initialScreenChangeSpeed = ((mainScreenChangeSpeed) / 2)
                if screenInitialiserVertValue ~= screenVertTotal then
                    thisScreenHorzValue = thisScreenHorzValue + numberOfHorzScreens
                end
            else
                relevantHorzScreen = screenHorzTotal
                initialScreenChangeSpeed = ((mainScreenChangeSpeed * -1) / 2)
                if screenInitialiserVertValue ~= screenVertTotal then
                    thisScreenHorzValue = thisScreenHorzValue - numberOfHorzScreens
                end
            end
            
            nextScreenInitialiserTransition = "horizontal"
            screenInitialiserVertTransition = "complete"
        end
    end
    
    if screenInitialiserHorzTransition == "complete"
    and screenInitialiserVertTransition == "complete" then
        --mapButtonStateCheck()
        if initialReturnToBallScreenCounter == 0 then
            myGameSettings[currentLevel]["intro_complete"] = true
            saveTable(myGameSettings, "myGameSettings.json")
            returnToBallHorzTransitionOver = false
            returnToBallVertTransitionOver = false
            initialReturnToBallScreenCounter = 1
            Runtime:addEventListener("enterFrame", initialReturnToBallScreen)
        end
        Runtime:removeEventListener("enterFrame", screenInitialiserInTransition)
    end
end


local function screenInitialiser ()           
    initialVertScreenChangeSpeed = ((mainScreenChangeSpeed * -1) / 2)
    numberOfHorzScreens = screenHorzTotal - 1
    initialScreenChangeSpeed = ((mainScreenChangeSpeed * -1) / 2)
    
    screenInitialiserHorzTransition = "incomplete"
    screenInitialiserVertTransition = "complete"
    horzScreenInitialiserTimer = 0
    Runtime:addEventListener("enterFrame", screenInitialiserInTransition)
    screenInitialiserInTransition = true
end

local function shortScreenInitialiser ()           
    backgroundObjectsGroup.x = backgroundObjectsGroup.x - (display.contentWidth * (ballScreenHorzValue - 1))
    screenObjectsGroup.x = screenObjectsGroup.x - (display.contentWidth * (ballScreenHorzValue - 1))
    midScreenObjectsGroup.x = midScreenObjectsGroup.x - (display.contentWidth * (ballScreenHorzValue - 1))
    frontScreenObjectsGroup.x = frontScreenObjectsGroup.x - (display.contentWidth * (ballScreenHorzValue - 1))
    
    backgroundObjectsGroup.y = backgroundObjectsGroup.y - (display.contentHeight * (ballScreenVertValue - 1))
    screenObjectsGroup.y = screenObjectsGroup.y - (display.contentHeight * (ballScreenVertValue - 1))
    midScreenObjectsGroup.y = midScreenObjectsGroup.y - (display.contentHeight * (ballScreenVertValue - 1))
    frontScreenObjectsGroup.y = frontScreenObjectsGroup.y - (display.contentHeight * (ballScreenVertValue - 1))
    
    thisScreenHorzValue = ballScreenHorzValue
    thisScreenVertValue = ballScreenVertValue
    
    playBtn:addEventListener( "touch", buttonListener )
    backBtn:addEventListener( "touch", buttonListener )
    randomBtn:addEventListener( "touch", buttonListener )
    
    mapButtonStateCheck()
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
    
    local group = self.view
    
    -------------------------
    --Object Image Sheets----
    
    local switchImageSheet = graphics.newImageSheet( "switch.png", {width = 63, height = 55, numFrames = 2})
    local switchSequenceData = {
        { name = "off", start=1, count=1,   loopCount=1 },
        { name = "on", start=2, count=2, loopCount=1 }
    }
    
    local manualFanImageSheet = graphics.newImageSheet( "manualFan.png", {width = 63, height = 55, numFrames = 2})
    local manualFanSequenceData = {
        { name = "off", start=1, count=1,   loopCount=1 },
        { name = "on", start=2, count=2, loopCount=1 }
    }
    
    -------------------------
    --Shape Objects In Game--
    -------------------------
    
    --------- SCREEN 1
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleTopRightShape", 1})
    
    autoFan = display.newImage("autoFan.png")
    table.insert(shapeArray, autoFan)
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 1, "down"} )
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 1, "triangleTopRightShape", 1})
    
    spitter = display.newImage("spitter.png")
    table.insert(shapeArray, spitter)
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 1, 2, "up", "right", "none", "left"} )
    
    autoFan = display.newImage("autoFan.png")
    table.insert(shapeArray, autoFan)
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 2, 2, "down"} )
    table.insert(transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"silver"},{1},{1},{1,1,2,2},{2},{1,1,4,3},{3},{1,1,4,4},{4},{1,1,6,5}})
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 7, 2, "triangleTopRightShape", 1})
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 3, "triangleTopRightShape", 1})
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 6, 3, "triangleTopRightShape", 1})
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right", "enabled"} )
    
    manualFan = display.newSprite(manualFanImageSheet, manualFanSequenceData)
    manualFan:play()
    table.insert(shapeArray, manualFan)
    table.insert(shapeArrayParameters,{"manualFan","manFan1_1_1", 1, 1, 1, 4, "down"} )
    
    autoFan = display.newImage("autoFan.png")
    table.insert(shapeArray, autoFan)
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 3, 4, "left"} )
    
    triangle = display.newImage("triangleTopLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1})
    
    manualFan = display.newSprite(manualFanImageSheet, manualFanSequenceData)
    manualFan:play()
    table.insert(shapeArray, manualFan)
    table.insert(shapeArrayParameters,{"manualFan","manFan2_1_1", 1, 1, 1, 5, "right"} )
    
    manualFan = display.newSprite(manualFanImageSheet, manualFanSequenceData)
    manualFan:play()
    table.insert(shapeArray, manualFan)
    table.insert(shapeArrayParameters,{"manualFan","manFan3_1_1", 1, 1, 3, 5, "up"} )
    
    triangle = display.newImage("triangleBottomLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 5, 5, "triangleBottomLeftShape", 1})
    
    ---------
    
    door1 = display.newImage("door.png")
    table.insert(shapeArray, door1)
    table.insert(shapeArrayParameters,{"door","door1", 2, 2, 1, 1, "left", "enabled"} )
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door2", 2, 2, 5, 1, "up", "enabled"} )
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door2_2_4", 2, 2, 2, 1, "up", "enabled"} )
    
    manualFan = display.newSprite(manualFanImageSheet, manualFanSequenceData)
    manualFan:play()
    table.insert(shapeArray, manualFan)
    table.insert(shapeArrayParameters,{"manualFan","fanUp1", 2, 2, 4, 1, "left"} )

    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle", 2, 2, 3, 2, "triangleTopRightShape", 1, 1})
    
    autoFan = display.newImage("autoFan.png")
    table.insert(shapeArray, autoFan)
    table.insert(shapeArrayParameters,{"autoFan","autoFanUp1", 2, 2, 7, 2, "left"} )
    
    spitter = display.newImage("spitter.png")
    table.insert(shapeArray, spitter)
    table.insert(shapeArrayParameters,{"spitter","spitter1", 2, 2, 4, 2, "up", "right", "down", "none"} )
    table.insert(transitionArrayIndex,{{"spitter1"},{"slide"},{"blue"},{1},{1},{2,2,4,2},{2},{2,2,4,5}})
    
    triangle = display.newImage("triangleBottomLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle3", 2, 2, 2, 5, "triangleBottomLeftShape", 1, 2} )
    
    switch = display.newSprite(switchImageSheet, switchSequenceData)
    table.insert(shapeArray, switch)
    table.insert(shapeArrayParameters,{"switch","switch1", 2, 2, 7, 3, "flip-horizontal", "triangle", "two-way", "triangle3"})
    
    triangle2 = display.newImage("triangleTopLeft.png")
    table.insert(shapeArray, triangle2)
    table.insert(shapeArrayParameters,{"shape","triangle2", 2, 2, 7, 5, "triangleTopLeftShape", 1} )
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door2_2_3", 2, 2, 2, 5, "down", "enabled"} )
    
    --local tunnel = display.newImage("triangle.png")
    --table.insert(shapeArray, tunnel)
    --table.insert(shapeArrayParameters,{"tunnel","tunnel1", 1, 1, 6, 1, 3, 1, "right", "left"} )
    
    -------- SCREEN 2

    triangle2_s2 = display.newImage("triangle2.png")
    table.insert(shapeArray, triangle2_s2)
    table.insert(shapeArrayParameters,{"shape","triangle2_s2", 3, 1, 3, 5, "triangleLeftAndRightShape", 1, 1} )
    
    --------------
    
    spitter = display.newImage("spitter.png")
    table.insert(shapeArray, spitter)
    table.insert(shapeArrayParameters,{"spitter","spitter2", 1, 2, 3, 1, "up", "none", "down", "left"} )
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle4", 1, 2, 1, 1, "triangleTopRightShape", 1, 3} )
    table.insert(transitionArrayIndex,{{"triangle4"},{"flip-vertical"}})
    
    triangle = display.newImage("triangleTopLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle6", 1, 2, 6, 2, "triangleTopLeftShape", 1, 4} )
    table.insert(transitionArrayIndex,{{"triangle6"},{"slide"},{"green"},{1},{1},{1,2,6,2},{2},{1,2,6,5}})
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door3", 1, 2, 7, 2, "right", "enabled"} )
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle5", 1, 2, 2, 4, "triangleTopRightShape", 1, 5} )
    table.insert(transitionArrayIndex,{{"triangle5"},{"flip-horizontal"}})
    
    manualFan = display.newSprite(manualFanImageSheet, manualFanSequenceData)
    manualFan:play()
    table.insert(shapeArray, manualFan)
    table.insert(shapeArrayParameters,{"manualFan","fanUp2", 1, 2, 3, 4, "right"} )
    table.insert(transitionArrayIndex,{{"fanUp2"},{"slide"},{"silver"},{1},{1},{1,2,3,4},{2},{1,2,5,2}})
    
    triangle = display.newImage("triangleTopRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle7", 1, 2, 1, 5, "triangleTopRightShape", 1} )
    table.insert(transitionArrayIndex,{{"triangle7"},{"slide"},{"green"},{1},{1},{1,2,1,5},{2},{1,2,3,5}})
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door4", 1, 2, 7, 5, "right", "enabled"} )
    
    ----------------
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door1_2_3", 2, 3, 4, 1, "up", "enabled"} )
    
    triangle = display.newImage("triangleBottomRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle1_2_3", 2, 3, 2, 2, "triangleBottomRightShape", 1} )
    table.insert(transitionArrayIndex,{{"triangle1_2_3"},{"slide"},{"green"},{2},{1},{2,3,1,1},{2},{2,3,2,2}})
    
    triangle = display.newImage("triangleBottomRight.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle2_2_3", 2, 3, 6, 1, "triangleBottomRightShape", 1, 6} )
    
    spitter = display.newImage("spitter.png")
    table.insert(shapeArray, spitter)
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_3", 2, 3, 6, 2, "up", "right", "down", "none"} )
    table.insert(transitionArrayIndex,{{"spitter1_2_3"},{"slide"},{"blue"},{1},{1},{2,3,6,2},{2},{2,3,7,3}})
    
    door = display.newImage("door.png")
    table.insert(shapeArray, door)
    table.insert(shapeArrayParameters,{"door","door2_2_3", 2, 3, 1, 3, "left", "enabled"} )
    
    triangle = display.newImage("triangleTopLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle3_2_3", 2, 3, 2, 4, "triangleTopLeftShape", 1} )
    table.insert(transitionArrayIndex,{{"triangle3_2_3"},{"slide"},{"green"},{1},{1},{2,3,2,4},{2},{2,3,4,4}})
    
    triangle = display.newImage("triangleTopLeft.png")
    table.insert(shapeArray, triangle)
    table.insert(shapeArrayParameters,{"shape","triangle4_2_3", 2, 3, 6, 4, "triangleTopLeftShape", 1} )
    table.insert(transitionArrayIndex,{{"triangle4_2_3"},{"slide"},{"green"},{2},{1},{2,3,2,5},{2},{2,3,6,4},{3},{2,3,6,3}})
    
    triangle2 = display.newImage("triangle2.png")
    table.insert(shapeArray, triangle2)
    table.insert(shapeArrayParameters,{"shape","triangle2", 1, 3, 3, 5, "triangleLeftAndRightShape", 1, 1} )
    
    local function addFlipIndicatorTriangles ()
        
        shapeArray[thisFlippingShapeIndex].flipTriangle = display.newImage("flipPosition-arrow.png")
        frontScreenObjectsGroup:insert( shapeArray[thisFlippingShapeIndex].flipTriangle )
        shapeArray[thisFlippingShapeIndex].flipTriangle.x = shapeArray[thisFlippingShapeIndex].x
        shapeArray[thisFlippingShapeIndex].flipTriangle.y = shapeArray[thisFlippingShapeIndex].y
        
        local flipIndicatorTrianglePositioningArray = {
            {"triangleTopLeftShape", 14, 10, 12, 14, 90, 180},
            {"triangleTopRightShape", -14, 10, -11, 14, -90, 180},
            {"triangleBottomRightShape", -14, -11, -11, -15, -90, 0},
            {"triangleBottomLeftShape", 14, -11, 12, -15,  90, 0},
            {"triangleLeftAndRightShape", -13, -2, 0, 0, -90, 0}
        }
        
        for a =1, #flipIndicatorTrianglePositioningArray do
            if shapeArrayParameters[thisFlippingShapeIndex][7] == flipIndicatorTrianglePositioningArray[a][1] then
                if thisFlipTransitionDirection == "flip-horizontal" then
                    shapeArray[thisFlippingShapeIndex].flipTriangle.x  = shapeArray[thisFlippingShapeIndex].flipTriangle.x + flipIndicatorTrianglePositioningArray[a][2]
                    shapeArray[thisFlippingShapeIndex].flipTriangle.y  = shapeArray[thisFlippingShapeIndex].flipTriangle.y + flipIndicatorTrianglePositioningArray[a][3]
                    shapeArray[thisFlippingShapeIndex].flipTriangle.rotation = flipIndicatorTrianglePositioningArray[a][6]
                elseif thisFlipTransitionDirection == "flip-vertical" then
                    shapeArray[thisFlippingShapeIndex].flipTriangle.x  = shapeArray[thisFlippingShapeIndex].flipTriangle.x + flipIndicatorTrianglePositioningArray[a][4]
                    shapeArray[thisFlippingShapeIndex].flipTriangle.y  = shapeArray[thisFlippingShapeIndex].flipTriangle.y + flipIndicatorTrianglePositioningArray[a][5]
                    shapeArray[thisFlippingShapeIndex].flipTriangle.rotation = flipIndicatorTrianglePositioningArray[a][7]
                end
            end
        end
    
    end
    
    
    for z = 1, #shapeArray do
	if shapeArrayParameters[z][1] == "shape" then
	    for a = 1, #shapeFormingArray do
		if shapeFormingArray[a][1] == shapeArrayParameters[z][7] then
		    relevantShape = shapeFormingArray[a][2]
		    if shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
		    and shapeArrayParameters[z][8] == 2 then
			relevantShape = shapeFormingArray[a][4]
		    elseif shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
		    and shapeArrayParameters[z][8] == 2 then
			relevantShape = shapeFormingArray[a][3]
		    end
		    if (shapeArrayParameters[z][9]) then
			shapeArrayParam = (shapeArrayParameters[z][9]) + 6
			shapeArray[z].directionsArray = directionArrayIndex[shapeArrayParam]
			shapeArray[z].directionsArrayAtIndex = shapeArrayParam
		    else
			shapeArray[z].directionsArray = directionArrayIndex[shapeFormingArray[a][5]]
			shapeArray[z].directionsArrayAtIndex = shapeFormingArray[a][5]
		    end
		end
	    end
	    physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape=relevantShape } )
	    shapeArray[z].shape = shapeArrayParameters[z][7]
	    shapeArray[z].state = shapeArrayParameters[z][8]
	    shapeArray[z].transitionArrayState = shapeArrayParameters[z][8]
            group:insert( shapeArray[z] )
	    frontScreenObjectsGroup:insert( shapeArray[z] )
	elseif shapeArrayParameters[z][1] == "autoFan"
	or shapeArrayParameters[z][1] == "manualFan"
	or shapeArrayParameters[z][1] == "spitter"
	or shapeArrayParameters[z][1] == "door"
	or shapeArrayParameters[z][1] == "tunnel" 
	or shapeArrayParameters[z][1] == "switch" then
	    shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z] )
	end
	
	if shapeArrayParameters[z][1] == "switch" then
	    shapeArray[z].switchCounter = 0
	    shapeArray[z].switchOnOffCounter = 0
	    if shapeArrayParameters[z][7] == "rotate-object" then
		shapeArray[z].rotateSwitch = "first"
	    end
	end
	
	if shapeArrayParameters[z][1] == "autoFan"
	or shapeArrayParameters[z][1] == "manualFan" then
	    shapeArray[z].direction = shapeArrayParameters[z][7]
	end
        
        if shapeArrayParameters[z][1] == "autoFan"
	or shapeArrayParameters[z][1] == "spitter" then
	    shapeArray[z].isBallPresent = false
	end
        
        if shapeArrayParameters[z][1] == "autoFan"
	or shapeArrayParameters[z][1] == "manualFan"
	or shapeArrayParameters[z][1] == "spitter" then
	    shapeArray[z].enabled = true
	end
	
	shapeArray[z].x = ((shapeArrayParameters[z][3] - 1) * display.contentWidth) + (((shapeArrayParameters[z][5] - 1) * 60) + 30)
	shapeArray[z].y = ((shapeArrayParameters[z][4] - 1) * display.contentHeight) + (((shapeArrayParameters[z][6] - 1) * 52) + 30)
	shapeArray[z].name = shapeArrayParameters[z][2]
	shapeArray[z].objectType = shapeArrayParameters[z][1]
	
	if (shapeArrayParameters[z][1] == "shape") then
	    shapeArray[z].x = shapeArray[z].x + 24
	    if (shapeArrayParameters[z][7] ~= "triangleLeftAndRightShape")
	    and (shapeArrayParameters[z][7] ~= "triangleTopAndBottomShape") then
		shapeArray[z].y = shapeArray[z].y + 27
		shapeArray[z].x = shapeArray[z].x + 6
	    else
		if (shapeArrayParameters[z][7] == "triangleLeftAndRightShape") then
		    shapeArray[z].y = shapeArray[z].y + 52
		    if (shapeArrayParameters[z][8] == 2) then
			shapeArray[z].x = shapeArray[z].x + 11
		    end
		else
		    shapeArray[z].x = shapeArray[z].x + 36
		    shapeArray[z].y = shapeArray[z].y + 28
		    if (shapeArrayParameters[z][8] == 2) then
			shapeArray[z].y = shapeArray[z].y - 3
		    end
		end
	    end
	    if (shapeArrayParameters[z][7] == "triangleBottomLeftShape")
	    or (shapeArrayParameters[z][7] == "triangleTopLeftShape") then
		shapeArray[z].x = shapeArray[z].x + 3
	    elseif (shapeArrayParameters[z][7] == "triangleBottomRightShape")
	    or (shapeArrayParameters[z][7] == "triangleTopRightShape") then
		shapeArray[z].x = shapeArray[z].x - 1
	    end
	    
	    local relevantDirectionArray = shapeArray[z].state * 2
	    
	    for a = 1, #shapeArray[z].directionsArray[relevantDirectionArray] do
		if a < 5 then
		    if shapeArray[z].directionsArray[relevantDirectionArray][a] == "kill" then
			if (a == 4
			and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
			and shapeArray[z].state == 1)
			or (a == 2
			and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
			and shapeArray[z].state == 2)
			or (a == 3
			and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
			and shapeArray[z].state == 1)
			or (a == 1
			and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
			and shapeArray[z].state == 2)
			or (a == 4
			and shapeArrayParameters[z][7] == "triangleTopRightShape")
			or (a == 4
			and shapeArrayParameters[z][7] == "triangleBottomRightShape")
			or (a == 2
			and shapeArrayParameters[z][7] == "triangleTopLeftShape")
			or (a == 2
			and shapeArrayParameters[z][7] == "triangleBottomLeftShape")then
			
			else
			    killBar = display.newImage("killBar.png")
			    frontScreenObjectsGroup:insert( killBar )
			    killBar.relatedShape = shapeArray[z].name
			    killBar.relatedDirectionArrayIndex = a
			    
			    if (a == 4
			    and shapeArrayParameters[z][7] == "triangleLeftAndRightShape"
			    and shapeArray[z].state == 2) then
				killBar.relatedDirectionArrayIndex = 2
			    elseif (a == 3
			    and shapeArrayParameters[z][7] == "triangleTopAndBottomShape"
			    and shapeArray[z].state == 2) then
				killBar.relatedDirectionArrayIndex = 1
			    end
			    
			    killBar.x = shapeArray[z].x
			    killBar.y = shapeArray[z].y
			end
			--local textObj = display.newText(shapeArray[z].name, 0,0, nil, 14); textObj.x = 20;
			local killBarPositionArray = {
			    {"triangleTopLeftShape","triangleTopRightShape", 0, 25, 90, "triangleLeftAndRightShape", 0, 25, 45, 0, -25, -135, "triangleTopAndBottomShape", -27, 25, 90, 27, 25, 90, "triangleBottomLeftShape", -3, -1, 135, "triangleBottomRightShape", 0, 0, 45},
			    {"triangleTopRightShape","triangleBottomRightShape", -25, 0, 180, "triangleLeftAndRightShape", -27, -24, 180, -27, 22, 180, "triangleTopAndBottomShape", -24, -4, 135, -24, 4, 135},
			    {"triangleBottomLeftShape","triangleBottomRightShape", 3, -25, -90, "triangleLeftAndRightShape", 3, -24, -45, -3, 24, 135, "triangleTopAndBottomShape", -27, -25, -90, 27, -25, -90, "triangleTopLeftShape", -3, -2, 225, "triangleTopRightShape", 2, -1, -45},
			    {"triangleTopLeftShape","triangleBottomLeftShape", 25, 0, 0, "triangleLeftAndRightShape", 27, 24, 0, 27, -22, 0, "triangleTopAndBottomShape", 24, -4, -45, 24, 4, 45}
			}
			
			for b=1, #killBarPositionArray do
			    if a == b then
				if shapeArrayParameters[z][7] == killBarPositionArray[b][1]
				or shapeArrayParameters[z][7] == killBarPositionArray[b][2] then
				    killBar.x = killBar.x + killBarPositionArray[b][3]
				    killBar.y = killBar.y + killBarPositionArray[b][4]
				    killBar.rotation = killBarPositionArray[b][5]
				elseif shapeArrayParameters[z][7] == killBarPositionArray[b][6] then
				    if a == 4 then
					thisRelevantState = 2
				    else
					thisRelevantState = 1
				    end
				    if b % 2 == 0 then
					if shapeArray[z].state == thisRelevantState then
					    killBar.x = killBar.x + killBarPositionArray[b][7]
					    killBar.y = killBar.y + killBarPositionArray[b][8]
					    killBar.rotation = killBarPositionArray[b][9]
					    
					    killBar = display.newImage("killBar.png")
					    frontScreenObjectsGroup:insert( killBar )
					    killBar.relatedShape = shapeArray[z].name
					    killBar.relatedDirectionArrayIndex = 2
					    killBar.x = shapeArray[z].x + killBarPositionArray[b][10]
					    killBar.y = shapeArray[z].y + killBarPositionArray[b][11]
					    killBar.rotation = killBarPositionArray[b][12]
					end
				    else
					if shapeArray[z].state == 1 then
					    killBar.x = killBar.x + killBarPositionArray[b][7]
					    killBar.y = killBar.y + killBarPositionArray[b][8]
					    killBar.rotation = killBarPositionArray[b][9]
					else
					    killBar.x = killBar.x + killBarPositionArray[b][10]
					    killBar.y = killBar.y + killBarPositionArray[b][11]
					    killBar.rotation = killBarPositionArray[b][12]
					end
				    end
				elseif shapeArrayParameters[z][7] == killBarPositionArray[b][13] then
				    if b % 2 == 0 then
					if shapeArray[z].state == 1 then
					    killBar.x = killBar.x + killBarPositionArray[b][14]
					    killBar.y = killBar.y + killBarPositionArray[b][15]
					    killBar.rotation = killBarPositionArray[b][16]
					else
					    killBar.x = killBar.x + killBarPositionArray[b][17]
					    killBar.y = killBar.y + killBarPositionArray[b][18]
					    killBar.rotation = killBarPositionArray[b][19]
					end
				    else
					if b == 3 then
					    thisRelevantState = 2
					else
					    thisRelevantState = 1
					end
					if shapeArray[z].state == thisRelevantState then
					    killBar.x = killBar.x + killBarPositionArray[b][14]
					    killBar.y = killBar.y + killBarPositionArray[b][15]
					    killBar.rotation = killBarPositionArray[b][16]
					    
					    killBar = display.newImage("killBar.png")
					    frontScreenObjectsGroup:insert( killBar )
					    killBar.relatedShape = shapeArray[z].name
					    killBar.relatedDirectionArrayIndex = 1
					    killBar.x = shapeArray[z].x + killBarPositionArray[b][17]
					    killBar.y = shapeArray[z].y + killBarPositionArray[b][18]
					    killBar.rotation = killBarPositionArray[b][19]
					end
				    end
				end
				
				if (killBarPositionArray[b][20]) then
				    if shapeArrayParameters[z][7] == killBarPositionArray[b][20] then
					killBar.x = killBar.x + killBarPositionArray[b][21]
					killBar.y = killBar.y + killBarPositionArray[b][22]
					killBar.rotation = killBarPositionArray[b][23]
				    elseif shapeArrayParameters[z][7] == killBarPositionArray[b][24] then
					killBar.x = killBar.x + killBarPositionArray[b][25]
					killBar.y = killBar.y + killBarPositionArray[b][26]
					killBar.rotation = killBarPositionArray[b][27]
				    end
				end
			    end
			end
			
		    elseif shapeArray[z].directionsArray[relevantDirectionArray][a] == "specialRule" then
			
			if shapeArrayParameters[z][7] == "triangleLeftAndRightShape" then
			    if shapeArray[z].state == 1 then
				if a == 2 then
				    if shapeArray[z].directionsArray[2][5] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 2
					killBar.rotation = 180
					killBar.x = shapeArray[z].x - 27
					killBar.y = shapeArray[z].y - 22
				    end
				    if shapeArray[z].directionsArray[2][6] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 2
					killBar.rotation = 180
					killBar.x = shapeArray[z].x - 27
					killBar.y = shapeArray[z].y + 22
				    end
				end
			    else
				if a == 4 then
				    if shapeArray[z].directionsArray[2][7] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 2
					killBar.rotation = 180
					killBar.x = shapeArray[z].x - 27
					killBar.y = shapeArray[z].y - 22
				    end
				    if shapeArray[z].directionsArray[2][8] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 2
					killBar.rotation = 0
					killBar.x = shapeArray[z].x + 27
					killBar.y = shapeArray[z].y + 22
				    end
				end
			    end
			elseif shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
			    if shapeArray[z].state == 1 then
				if a == 1 then
				    if shapeArray[z].directionsArray[2][5] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 1
					killBar.rotation = 90
					killBar.x = shapeArray[z].x - 27
					killBar.y = shapeArray[z].y + 25
				    end
				    if shapeArray[z].directionsArray[2][6] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 1
					killBar.rotation = 90
					killBar.x = shapeArray[z].x + 27
					killBar.y = shapeArray[z].y + 25
				    end
				end
			    else
				if a == 3 then
				    if shapeArray[z].directionsArray[relevantDirectionArray][7] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 1
					killBar.rotation = -90
					killBar.x = shapeArray[z].x - 27
					killBar.y = shapeArray[z].y - 26
				    end
				    if shapeArray[z].directionsArray[2][8] == "kill" then
					killBar = display.newImage("killBar.png")
					frontScreenObjectsGroup:insert( killBar )
					killBar.relatedShape = shapeArray[z].name
					killBar.relatedDirectionArrayIndex = 1
					killBar.rotation = -90
					killBar.x = shapeArray[z].x + 27
					killBar.y = shapeArray[z].y - 26
				    end
				end
			    end
			end
		    end
		end
	    end
	    
	end
	
	if (shapeArrayParameters[z][1] == "door") then
	    if shapeArrayParameters[z][7] == "up" then
		shapeArray[z].y = shapeArray[z].y - 30 + 10
		shapeArray[z].x = shapeArray[z].x + 3
		shapeArray[z].rotation = 270
	    elseif shapeArrayParameters[z][7] == "right" then
		shapeArray[z].x = shapeArray[z].x + 30 + 60 - 10
		shapeArray[z].y = shapeArray[z].y - 1
	    elseif shapeArrayParameters[z][7] == "down" then
		shapeArray[z].y = shapeArray[z].y + 30 + 52 - 10
		shapeArray[z].x = shapeArray[z].x + 60 - 2
		shapeArray[z].rotation = 90
	    elseif shapeArrayParameters[z][7] == "left" then
		shapeArray[z].rotation = 180
		shapeArray[z].x = shapeArray[z].x - 30 + 10
		shapeArray[z].y = shapeArray[z].y + 52
	    end
	    frontScreenObjectsGroup:insert( shapeArray[z] )
	    shapeArray[z].enabled = shapeArrayParameters[z][8]
	    if shapeArray[z].enabled == "disabled" then
		shapeArray[z].alpha = 0 
	    end
	end
	
	if shapeArrayParameters[z][1] == "spitter" then
	    shapeArray[z].upEnabled = false
	    shapeArray[z].rightEnabled = false
	    shapeArray[z].downEnabled = false
	    shapeArray[z].leftEnabled = false
		
	    if shapeArrayParameters[z][7] == "up" then
		shapeArray[z].upEnabled = true
		shapeArray[z].upArrow = display.newImage("spitter-arrow.png")
		shapeArray[z].upArrow:setReferencePoint(display.TopLeftReferencePoint);
		screenObjectsGroup:insert( shapeArray[z].upArrow )
		shapeArray[z].upArrow.x = (shapeArray[z].x + 23)
		shapeArray[z].upArrow.y = (shapeArray[z].y + 5)
	    end
	    if shapeArrayParameters[z][8] == "right" then
		shapeArray[z].rightEnabled = true
		shapeArray[z].rightArrow = display.newImage("spitter-arrow.png")
		shapeArray[z].rightArrow:setReferencePoint(display.TopLeftReferencePoint);
		screenObjectsGroup:insert( shapeArray[z].rightArrow )
		shapeArray[z].rightArrow.rotation = 90
		shapeArray[z].rightArrow.x = (shapeArray[z].x + 54)
		shapeArray[z].rightArrow.y = (shapeArray[z].y + 20)
	    end
	    if shapeArrayParameters[z][9] == "down" then
		shapeArray[z].downEnabled = true
		shapeArray[z].downArrow = display.newImage("spitter-arrow.png")
		shapeArray[z].downArrow:setReferencePoint(display.TopLeftReferencePoint);
		screenObjectsGroup:insert( shapeArray[z].downArrow )
		shapeArray[z].downArrow.rotation = 180
		shapeArray[z].downArrow.x = (shapeArray[z].x + 38)
		shapeArray[z].downArrow.y = (shapeArray[z].y + 49)
	    end
	    if shapeArrayParameters[z][10] == "left" then
		shapeArray[z].leftEnabled = true
		shapeArray[z].leftArrow = display.newImage("spitter-arrow.png")
		shapeArray[z].leftArrow:setReferencePoint(display.TopLeftReferencePoint);
		screenObjectsGroup:insert( shapeArray[z].leftArrow )
		shapeArray[z].leftArrow.rotation = 270
		shapeArray[z].leftArrow.x = (shapeArray[z].x + 7)
		shapeArray[z].leftArrow.y = (shapeArray[z].y + 35)
	    end
	    
	end
	
	if shapeArrayParameters[z][1] == "tunnel" then
	    shapeArray[z].firstDirection = shapeArrayParameters[z][9]
	    shapeArray[z].secondDirection = shapeArrayParameters[z][10]
	    shapeArray[z].relevantLowerX = shapeArray[z].x + 15
	    shapeArray[z].relevantHigherX = shapeArray[z].x + 60
	    shapeArray[z].relevantLowerY = shapeArray[z].y + 13
	    shapeArray[z].relevantHigherY = shapeArray[z].y + 52
	    if shapeArray[z].firstDirection == "right"
	    or shapeArray[z].firstDirection == "left" then
		shapeArray[z].relevantLowerY = shapeArray[z].y - 10
		shapeArray[z].relevantHigherY = shapeArray[z].y + 62
	    elseif shapeArray[z].firstDirection == "up"
	    or shapeArray[z].firstDirection == "down" then
		shapeArray[z].relevantLowerX = shapeArray[z].x - 10
		shapeArray[z].relevantHigherX = shapeArray[z].x + 70
	    end
            
            shapeArray[z].endTunnelCircle = display.newImage("tunnel.png")
            shapeArray[z].endTunnelCircle.x = ((shapeArrayParameters[z][3] - 1) * display.contentWidth) + (((shapeArrayParameters[z][7] - 1) * 60) + 60)
            shapeArray[z].endTunnelCircle.y = ((shapeArrayParameters[z][4] - 1) * display.contentHeight) + (((shapeArrayParameters[z][8] - 1) * 52) + 60)
            screenObjectsGroup:insert( shapeArray[z].endTunnelCircle )
            
            local tunnelDirectionIndicatorArrowArray = {
                {-1, 13},
                {-16, 0},
                {-1, -16},
                {28, 0}
            }
            
            shapeArray[z].entryDirectionArrow = display.newImage("spitter-arrow.png")
            shapeArray[z].entryDirectionArrow.x = shapeArray[z].x + (shapeArray[z].contentWidth/2)
            shapeArray[z].entryDirectionArrow.y = shapeArray[z].y + (shapeArray[z].contentHeight/2)
            
            for a = 1, #directionArray do
                if directionArray[a] == shapeArray[z].firstDirection then
                    shapeArray[z].entryDirectionArrow.x = shapeArray[z].entryDirectionArrow.x + tunnelDirectionIndicatorArrowArray[a][1]
                    shapeArray[z].entryDirectionArrow.y = shapeArray[z].entryDirectionArrow.y + tunnelDirectionIndicatorArrowArray[a][2]
                    shapeArray[z].entryDirectionArrow.rotation = (90 * (a - 1))
                end
            end
            
            local exitTunnelDirectionIndicatorArrowArray = {
                {-21, -41},
                {-2, -25},
                {-21, -10},
                {-50, -26}
            }
            
            shapeArray[z].exitDirectionArrow = display.newImage("spitter-arrow.png")
            shapeArray[z].exitDirectionArrow.x = shapeArray[z].endTunnelCircle.x + (shapeArray[z].contentWidth/2)
            shapeArray[z].exitDirectionArrow.y = shapeArray[z].endTunnelCircle.y + (shapeArray[z].contentHeight/2)
            
            for a = 1, #directionArray do
                if directionArray[a] == shapeArray[z].secondDirection then
                    shapeArray[z].exitDirectionArrow.x = shapeArray[z].exitDirectionArrow.x + exitTunnelDirectionIndicatorArrowArray[a][1]
                    shapeArray[z].exitDirectionArrow.y = shapeArray[z].exitDirectionArrow.y + exitTunnelDirectionIndicatorArrowArray[a][2]
                    shapeArray[z].exitDirectionArrow.rotation = (90 * (a - 1))
                end
            end
            
            screenObjectsGroup:insert( shapeArray[z].entryDirectionArrow )
            screenObjectsGroup:insert( shapeArray[z].exitDirectionArrow )
	end
        
        if shapeArrayParameters[z][1] == "switch" then
            local switchNumberImageSheet = graphics.newImageSheet( "switchNumber"..numberOfSwitchesCounter..".png", {width = 39, height = 37, numFrames = 2})
            local switchNumberSequenceData = {
                { name = "off", start=1, count=1,   loopCount=1 },
                { name = "on", start=2, count=2, loopCount=1 }
            }
            
            shapeArray[z].switchValueText = display.newSprite(switchNumberImageSheet, switchNumberSequenceData)
            --shapeArray[z].switchValueText:toBack()
            midScreenObjectsGroup:insert( shapeArray[z].switchValueText )
            shapeArray[z].switchValueText:play()
            shapeArray[z].switchValueText.x = shapeArray[z].x + 32
            shapeArray[z].switchValueText.y = shapeArray[z].y + 27
            
            if shapeArrayParameters[z][7] == "flip-horizontal"
            or shapeArrayParameters[z][7] == "flip-vertical" then
                for a = 1, #shapeArrayParameters do
                    local function addSwitchValueText()
                        
                        shapeArray[thisFlippingShapeIndex].switchValueText = display.newImage("flipPositionSwitchNumber"..numberOfSwitchesCounter..".png")
                        frontScreenObjectsGroup:insert( shapeArray[thisFlippingShapeIndex].switchValueText )
                        shapeArray[thisFlippingShapeIndex].switchValueText:toFront()
                        shapeArray[thisFlippingShapeIndex].switchValueText.x = shapeArray[thisFlippingShapeIndex].x
                        shapeArray[thisFlippingShapeIndex].switchValueText.y = shapeArray[thisFlippingShapeIndex].y
                        
                        local switchValueTextPositioningArray = {
                            {"triangleTopLeftShape", 0, 11, 11, 1},
                            {"triangleTopRightShape", 0, 11, -13, 1},
                            {"triangleBottomRightShape", -1, -11, -12, -1},
                            {"triangleBottomLeftShape", 0, -11, 12, 0}
                        }
                        
                        for b =1, #switchValueTextPositioningArray do
                            if shapeArrayParameters[thisFlippingShapeIndex][7] == switchValueTextPositioningArray[b][1] then
                                if thisFlipTransitionDirection == "flip-horizontal" then
                                    shapeArray[thisFlippingShapeIndex].switchValueText.x  = shapeArray[thisFlippingShapeIndex].switchValueText.x + switchValueTextPositioningArray[b][2]
                                    shapeArray[thisFlippingShapeIndex].switchValueText.y  = shapeArray[thisFlippingShapeIndex].switchValueText.y + switchValueTextPositioningArray[b][3]
                                elseif thisFlipTransitionDirection == "flip-vertical" then
                                    shapeArray[thisFlippingShapeIndex].switchValueText.x  = shapeArray[thisFlippingShapeIndex].switchValueText.x + switchValueTextPositioningArray[b][4]
                                    shapeArray[thisFlippingShapeIndex].switchValueText.y  = shapeArray[thisFlippingShapeIndex].switchValueText.y + switchValueTextPositioningArray[b][5]
                                end
                            end
                        end
                        
                    end
                    if shapeArrayParameters[a][2] == shapeArrayParameters[z][8] then
                        thisFlippingShapeIndex = a
                        thisFlipTransitionDirection = shapeArrayParameters[z][7]
                        addFlipIndicatorTriangles()
                        addSwitchValueText()
                    end
                    if shapeArrayParameters[z][10]
                    and shapeArrayParameters[a][2] == shapeArrayParameters[z][10] then
                        thisFlippingShapeIndex = a
                        thisFlipTransitionDirection = shapeArrayParameters[z][7]
                        addFlipIndicatorTriangles()
                        addSwitchValueText()
                    end
                end
            end
            
            numberOfSwitchesCounter = numberOfSwitchesCounter + 1
        end
        
        if shapeArrayParameters[z][1] == "manualFan"
        or shapeArrayParameters[z][1] == "autoFan" then
            if shapeArrayParameters[z][1] == "manualFan" then
                shapeArray[z].directionIndicatorArrow = display.newImage("manualFan-arrow.png")
            else
                shapeArray[z].directionIndicatorArrow = display.newImage("autoFan-arrow.png")
            end
            shapeArray[z].directionIndicatorArrow.x = shapeArray[z].x + (shapeArray[z].contentWidth/2)
            shapeArray[z].directionIndicatorArrow.y = shapeArray[z].y + (shapeArray[z].contentHeight/2)
            
            local directionIndicatorArrowArray = {
                {0, -16},
                {19, 0},
                {0, 16},
                {-19, 0}
            }
            
            for a = 1, #directionArray do
                if directionArray[a] == shapeArray[z].direction then
                    shapeArray[z].directionIndicatorArrow.x = shapeArray[z].directionIndicatorArrow.x + directionIndicatorArrowArray[a][1]
                    shapeArray[z].directionIndicatorArrow.y = shapeArray[z].directionIndicatorArrow.y + directionIndicatorArrowArray[a][2]
                    shapeArray[z].directionIndicatorArrow.rotation = (90 * (a - 1))
                end
            end
            
            midScreenObjectsGroup:insert( shapeArray[z].directionIndicatorArrow )
        end
        

    end
    
    -- NOW CREATE TRANSITION SETTINGS
    
    for y = 1, #transitionArrayIndex do
        
	if transitionArrayIndex[y][2][1] == "flip-horizontal" then
	    for z = 1, #shapeArray do
		if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		    if shapeArrayParameters[z][8] == 2 then
			shapeArray[z].transitionArrayState = 2
			shapeArray[z].originalState = 2
		    else
			shapeArray[z].transitionArrayState = 1
			shapeArray[z].originalState = 1
		    end
		    shapeArray[z].flipped = false
		    shapeArray[z].flipDisabled = false
                    thisFlippingShapeIndex = z
                    thisFlipTransitionDirection = "flip-horizontal"
                    addFlipIndicatorTriangles()
		end
	    end
	elseif transitionArrayIndex[y][2][1] == "flip-vertical" then
	    for z = 1, #shapeArray do
		if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		    if shapeArrayParameters[z][8] == 2 then
			shapeArray[z].transitionArrayState = 2
			shapeArray[z].originalState = 2
		    else
			shapeArray[z].transitionArrayState = 1
			shapeArray[z].originalState = 1
		    end
		    shapeArray[z].flipped = false
                    thisFlippingShapeIndex = z
                    thisFlipTransitionDirection = "flip-vertical"
                    addFlipIndicatorTriangles()
		end
	    end
	elseif transitionArrayIndex[y][2][1] == "slide" then
	    local connector
	    local thisSpotColour = transitionArrayIndex[y][3][1]
	    for x = 6, #transitionArrayIndex[y] do
		if x % 2 == 0 then
		    connector = display.newImage(thisSpotColour .. "-connectorSpot.png")
		    connector:setReferencePoint(display.CenterCenterReferencePoint);
		    table.insert(connectorArray, connector)
		    connector.relatedShape = transitionArrayIndex[y][1][1]
		    connector.x = ((transitionArrayIndex[y][x][1] - 1) * display.contentWidth) + (((transitionArrayIndex[y][x][3] - 1) * 60) + 60)
		    connector.y = ((transitionArrayIndex[y][x][2] - 1) * display.contentHeight) + (((transitionArrayIndex[y][x][4] - 1) * 52) + 56)
		    if x > 6 then
			thisConnectorXDistance = connector.x - lastConnectorX
			thisConnectorXDistance = thisConnectorXDistance / 60
			while thisConnectorXDistance > 0 do
			    connectorTubeHorizontal = display.newImage(thisSpotColour .. "-connectorTube-Horizontal.png")
			    if thisConnectorXDistance  == 1 then
				connectorTubeHorizontal.width = 52
				connectorTubeHorizontal.height = 8
			    end

			    backgroundObjectsGroup:insert( connectorTubeHorizontal )
                            connectorTubeHorizontal.shapeType = "connectorTube"
			    connectorTubeHorizontal:setReferencePoint(display.CenterLeftReferencePoint);
			    connectorTubeHorizontal.x = lastConnectorX
			    connectorTubeHorizontal.y = lastConnectorY
			    lastConnectorX = lastConnectorX + 60
			    thisConnectorXDistance = thisConnectorXDistance - 1
			end
			
			thisConnectorYDistance = connector.y - lastConnectorY
			thisConnectorYDistance = thisConnectorYDistance / 52
			wholeConnectorYDistance = thisConnectorYDistance
			if thisConnectorYDistance < 0 then
			    while thisConnectorYDistance < 0 do
				if thisConnectorYDistance == wholeConnectorYDistance then
				    connectorTubeVertical = display.newImage(thisSpotColour .. "-connectorTube-Vertical-Bottom.png")
				else
				    connectorTubeVertical = display.newImage(thisSpotColour .. "-connectorTube-Horizontal.png")
				    connectorTubeVertical.width = 52
				    connectorTubeVertical.height = 8
				end
                                
				backgroundObjectsGroup:insert( connectorTubeVertical )
                                connectorTubeVertical.shapeType = "connectorTube"
				connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
				connectorTubeVertical.x = lastConnectorX
				if thisConnectorYDistance == wholeConnectorYDistance then
				    connectorTubeVertical.x = connectorTubeVertical.x - 11
				    connectorTubeVertical.y = lastConnectorY - 22
				else
				    connectorTubeVertical.rotation = 90
				    connectorTubeVertical.y = lastConnectorY - 48
				    connectorTubeVertical.x = connectorTubeVertical.x
				end
				lastConnectorY = lastConnectorY - 52
				thisConnectorYDistance = thisConnectorYDistance + 1
			    end
			elseif thisConnectorYDistance > 0 then
			    while thisConnectorYDistance > 0 do
				if thisConnectorYDistance == wholeConnectorYDistance then
				    connectorTubeVertical = display.newImage(thisSpotColour .. "-connectorTube-Vertical-Top.png")
				else
				    connectorTubeVertical = display.newImage(thisSpotColour .. "-connectorTube-Horizontal.png")
				    connectorTubeVertical.width = 52
				    connectorTubeVertical.height = 8
				end

				backgroundObjectsGroup:insert( connectorTubeVertical )
                                connectorTubeVertical.shapeType = "connectorTube"
				connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
				connectorTubeVertical.x = lastConnectorX
				if thisConnectorYDistance == wholeConnectorYDistance then
				    connectorTubeVertical.x = connectorTubeVertical.x - 11
				    connectorTubeVertical.y = lastConnectorY + 20
				else
				    connectorTubeVertical.rotation = 90
				    connectorTubeVertical.y = lastConnectorY - 5
				    connectorTubeVertical.x = connectorTubeVertical.x
				end
				lastConnectorY = lastConnectorY + 54
				thisConnectorYDistance = thisConnectorYDistance - 1
			    end
			end
			yConnectorCounter = 0
		    end
		    lastConnectorX = connector.x
		    lastConnectorY = connector.y
		end
		for a = 1, #connectorArray do
		    for b=1, #shapeArray do
			if connectorArray[a].x > (shapeArray[b].x - 20)
			and connectorArray[a].x < (shapeArray[b].x + 30)
			and connectorArray[a].y > (shapeArray[b].y - 20)
			and connectorArray[a].y < (shapeArray[b].y + 30) then
			    connectorArray[a].alpha = 0
			end
		    end
                    
		    backgroundObjectsGroup:insert( connectorArray[a] )
		end
	    end
	    
	    for z = 1, #shapeArray do
		if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		    shapeArray[z].transitionArrayState = transitionArrayIndex[y][4][1]
		    thisTransitioningObject = shapeArray[z]
		    
		    thisArrayCount = 0
		    for a=1, #transitionArrayIndex[y] do
			thisArrayCount = thisArrayCount + 1	    
		    end
		    
		    for e=5, #transitionArrayIndex[y] do
			if e % 2 ~= 0 then
			    if transitionArrayIndex[y][e][1] == thisTransitioningObject.transitionArrayState then
				thisTransitioningObject.thisTransitionHorzSquare = transitionArrayIndex[y][e+1][3]
				thisTransitioningObject.thisTransitionVertSquare = transitionArrayIndex[y][e+1][4]
				if e < (thisArrayCount - 2) then
				    thisTransitioningObject.nextTransitionHorzSquare = transitionArrayIndex[y][e+3][3]
				    thisTransitioningObject.nextTransitionVertSquare = transitionArrayIndex[y][e+3][4]
				else
				    thisTransitioningObject.nextTransitionHorzSquare = "null"
				    thisTransitioningObject.nextTransitionVertSquare = "null"
				end
				if e > 6 then
				    thisTransitioningObject.prevTransitionHorzSquare = transitionArrayIndex[y][e-1][3]
				    thisTransitioningObject.prevTransitionVertSquare = transitionArrayIndex[y][e-1][4]
				else
				    thisTransitioningObject.prevTransitionHorzSquare = "null"
				    thisTransitioningObject.prevTransitionVertSquare = "null"
				end
			    end
			end
		    end
		end
	    end
	end
        
        
        
    end
    
    backgroundGrid = display.newImage("background.png", 0, 0)
    group:insert(backgroundGrid)
    
    local ballImageSheet = graphics.newImageSheet( "ballSprite.png", {width = 33, height = 33, numFrames = 4})
    local ballSequenceData = {
        { name = "up", start=1, count=1,   loopCount=1 },
        { name = "right", start=2, count=2, loopCount=1 },
        { name = "down", start=3, count=3, loopCount=1 },
        { name = "left", start=4, count=4, loopCount=1 }
    }
    -- MAIN BALL -- 
    instance2 = display.newSprite(ballImageSheet, ballSequenceData)
    physics.addBody( instance2, { density = 1, friction = 1, bounce = 0, radius = 13 } )
    midScreenObjectsGroup:insert( instance2 )
    instance2.gravityScale = 0
    instance2.x = (((ballScreenHorzValue - 1) * display.contentWidth) + ((ballFirstHorzSquare - 1) * 60) + 60)
    instance2.y = (((ballScreenVertValue - 1) * display.contentHeight) + ((ballFirstVertSquare - 1) * 52) + 60)
    instance2.isFixedRotation = true
    instance2:play()
    instance2:toFront()
    
    instance2:setSequence(direction)
    
    ---------  MAP SCREEN
    mapScreen = display.newRect(0, 0, display.contentWidth, display.contentHeight)
    mapScreen:setFillColor(0, 0, 0)
    mapScreen:setReferencePoint(display.TopLeftReferencePoint);
    mapScreen.y = 0
    mapScreen.x = 0
    mapScreen.alpha = 0
    mapScreen.state = "mapHidden"
    group:insert(mapScreen) 
    
    ---------  MENU SCREEN
    pauseScreen = display.newImage("pauseScreen.jpg")
    pauseScreen:setReferencePoint(display.TopLeftReferencePoint);
    pauseScreen.y = display.contentHeight
    pauseScreen.x = 0
    pauseScreen.state = "unpaused"
    group:insert(pauseScreen)
    
    
    backBtnImageSheet = graphics.newImageSheet( "ballActivateButton.png", {width = 61, height = 53, numFrames = 3})
    backBtnSequenceData = {
        { name = "go", start=1, count=1,   loopCount=1 },
        { name = "default", start=2, count=2,   loopCount=1 },
        { name = "over", start=3, count=3, loopCount=1 }
    }
    backBtn = display.newSprite(backBtnImageSheet, backBtnSequenceData)
        backBtn:setReferencePoint( display.CenterReferencePoint )
        backBtn.x = 30
        backBtn.y = display.contentHeight - 25
        backBtn.name = "play"
        backBtn:play()
        backBtn:setSequence("go")
        backBtn.alpha = 0
        group:insert(backBtn)
    
    
    playBtnImageSheet = graphics.newImageSheet( "mapButton.png", {width = 61, height = 53, numFrames = 2})
    playBtnSequenceData = {
        { name = "default", start=1, count=1,   loopCount=1 },
        { name = "over", start=2, count=2, loopCount=1 }
    }
            
    playBtn =
        display.newSprite(playBtnImageSheet, playBtnSequenceData)
        playBtn:setReferencePoint( display.CenterReferencePoint )
        playBtn.x = display.contentWidth - 29
        playBtn.y = display.contentHeight - 25
        playBtn.name = "map"
        playBtn:play()
        playBtn:setSequence("default")
        playBtn.alpha = 0
        group:insert(playBtn)
        
    rightBtn =
        widget.newButton{
	    labelColor = { default={255}},
	    default="mapArrow2.png",
	    width=25, height=30	-- event listener function
	}
	rightBtn:setReferencePoint( display.CenterReferencePoint )
	rightBtn.x = display.contentWidth - (rightBtn.contentWidth - 5)
	rightBtn.y = display.contentHeight/2
        rightBtn.alpha = 0
        rightBtn.name = "mapRightButton"
        group:insert(rightBtn)
        
    leftBtn =
        widget.newButton{
	    labelColor = { default={255}},
	    default="mapArrow2.png",
	    width=25, height=30	-- event listener function
	}
	leftBtn:setReferencePoint( display.CenterReferencePoint )
        leftBtn.x = leftBtn.contentWidth - 5
	leftBtn.y = display.contentHeight/2
        leftBtn.alpha = 0
        leftBtn.name = "mapLeftButton"
        leftBtn.rotation = 180
        group:insert(leftBtn)
        
    upBtn =
        widget.newButton{
	    labelColor = { default={255}},
	    default="mapArrow2.png",
	    width=25, height=30	-- event listener function
	}
	upBtn:setReferencePoint( display.CenterReferencePoint )
        upBtn.x = display.contentWidth  / 2
	upBtn.y = 20
        upBtn.alpha = 0
        upBtn.name = "mapUpButton"
        upBtn.rotation = -90
        group:insert(upBtn)
        
    downBtn =
        widget.newButton{
	    labelColor = { default={255}},
	    default="mapArrow2.png",
	    width=25, height=30	-- event listener function
	}
	downBtn:setReferencePoint( display.CenterReferencePoint )
        downBtn.x = display.contentWidth  / 2
	downBtn.y = display.contentHeight - 20
        downBtn.alpha = 0
        downBtn.name = "mapDownButton"
        downBtn.rotation = 90
        group:insert(downBtn)
        
    randomBtn =
        widget.newButton{
            labelColor = { default={255}, over={128} },
	    default="pauseButton.png",
	    over="pauseButton-over.png",
	    width=61, height=53,
	    onRelease = listener	-- event listener function
	}
	randomBtn:setReferencePoint( display.CenterReferencePoint )
	randomBtn.x = display.contentWidth - 30
	randomBtn.y = 25
        randomBtn.alpha = 0
        randomBtn.name = "random"
        group:insert(randomBtn)
        
    backToPlayBtn =
        widget.newButton{
            labelColor = { default={255}, over={128} },
	    default="backToPlay.png",
	    over="backToPlay-over.png"	-- event listener function
	}
	backToPlayBtn:setReferencePoint( display.CenterReferencePoint )
	backToPlayBtn.x = pauseScreen.x + 348
	backToPlayBtn.y = pauseScreen.y + 86
        backToPlayBtn.name = "backToPlay"
	pauseScreenObjectsGroup:insert(backToPlayBtn)
            
    resetBtn =
        widget.newButton{
            labelColor = { default={255}, over={128} },
            default="reset.png",
            over="reset-over.png"	-- event listener function
        }
        resetBtn:setReferencePoint( display.CenterReferencePoint )
        resetBtn.x = pauseScreen.x + 414
        resetBtn.y = pauseScreen.y + 86
        resetBtn.name = "reset"
        pauseScreenObjectsGroup:insert(resetBtn)
        
    backToMainBtn =
        widget.newButton{
            labelColor = { default={255}, over={128} },
            default="backToHome.png",
            over="backToHome-over.png"	-- event listener function
        }
        backToMainBtn:setReferencePoint( display.CenterReferencePoint )
        backToMainBtn.x = pauseScreen.x + 381
        backToMainBtn.y = pauseScreen.y + 143
        backToMainBtn.name = "backToMain"
        pauseScreenObjectsGroup:insert(backToMainBtn)
        
    
    pauseScreen.y = display.contentHeight
    
    group:insert(backgroundObjectsGroup)
    group:insert(screenObjectsGroup)
    group:insert(midScreenObjectsGroup)
    group:insert(frontScreenObjectsGroup)
    group:insert(pauseScreenObjectsGroup)
    
    
end


function scene:willEnterScene (event)
    local group = self.view
    instance2.x = 240
    instance2.y = 275
end




function scene:enterScene( event )
    local group = self.view
    
    --purge level
    storyboard.purgeScene( "LevelSelectScene" )
    storyboard.removeScene( "LevelSelectScene" )
    
    backToPlayBtn:addEventListener( "touch", buttonListener )
    resetBtn:addEventListener( "touch", buttonListener )
    backToMainBtn:addEventListener( "touch", buttonListener )
    
    instance2:toFront()
    for c=1, #shapeArray do
        if shapeArrayParameters[c][1] == "shape" then
            shapeArray[c]:addEventListener("collision", on_Triangle_Collision)
            shapeArray[c]:toFront()
            if shapeArray[c].flipTriangle then
                shapeArray[c].flipTriangle:toFront()
            end
            if shapeArray[c].switchValueText then
                shapeArray[c].switchValueText:toFront()
            end
        elseif shapeArrayParameters[c][1] == "manualFan" or shapeArrayParameters[c][1] == "spitter" then
            shapeArray[c]:addEventListener( "touch", listener )
        end
        
        for d=1, #transitionArrayIndex do
            if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                shapeArray[c]:addEventListener("touch", listener)
            end
        end
    end
    mapScreen:toFront()
    randomBtn:toFront()
    backBtn:toFront()
    playBtn:toFront()
    rightBtn:toFront()
    leftBtn:toFront()
    upBtn:toFront()
    downBtn:toFront()
    pauseScreen:toFront()
    pauseScreenObjectsGroup:toFront()
    
    
    
    if myGameSettings[currentLevel]["intro_complete"] == false then
        playBtn.alpha = 0
        backBtn.alpha = 0
        randomBtn.alpha = 0
        screenInitialiser()
    elseif myGameSettings[currentLevel]["intro_complete"] == true then
        playBtn.alpha = 1
        backBtn.alpha = 1
        randomBtn.alpha = 1
        shortScreenInitialiser()
        --mapButtonStateCheck()
    end
end



function scene:exitScene(event)
    local group = self.view
    
end



function scene:didExitScene (event)
    local group = self.view
    
    pauseScreen:removeSelf()
    pauseScreen = nil
    
    randomBtn:removeSelf()
    backToPlayBtn:removeSelf()
    resetBtn:removeSelf()
    
    Runtime:removeEventListener("enterFrame", edgesTransitions)
    Runtime:removeEventListener("enterFrame", moveSomething)
    
    for c=1, #shapeArray do
        if shapeArrayParameters[c][1] == "shape" then
            shapeArray[c]:removeEventListener("collision", on_Triangle_Collision)
        elseif shapeArrayParameters[c][1] == "manualFan" or shapeArrayParameters[c][1] == "spitter" then
            shapeArray[c]:removeEventListener( "touch", listener )
        end
        
        for d=1, #transitionArrayIndex do
            if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
                shapeArray[c]:removeEventListener("touch", listener)
            end
        end
    end
    
    for z=1, #shapeArray do
	shapeArray[z]:removeSelf()  
	shapeArray[z] = nil
    end
    
    for a=1, backgroundObjectsGroup.numChildren do
            backgroundObjectsGroup[a] = nil
    end

    for b=1, frontScreenObjectsGroup.numChildren do
            frontScreenObjectsGroup[b] = nil
    end

    for c=1, screenObjectsGroup.numChildren do
            screenObjectsGroup[c] = nil
    end
    
    --[[

    for b=1, frontScreenObjectsGroup.numChildren do
        if b < 3 or b > 4 then
            frontScreenObjectsGroup[b]:removeSelf()
            frontScreenObjectsGroup[b] = nil
            
            --connectorArray[a] = nil
            
        else
        end
    --10 is the problem
    end

    for c=1, screenObjectsGroup.numChildren do
        if c < 5 or c > 7 then
            screenObjectsGroup[c]:removeSelf()
            screenObjectsGroup[c] = nil
            --connectorArray[a] = nil
            
        else
        end
    --10 is the problem
    end
    ]]--
    
    instance2:removeSelf()
    instance2 = nil
end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )

return scene