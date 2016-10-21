local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

display.setStatusBar( display.HiddenStatusBar )
system.activate("multitouch")
local widget = require "widget"
local physics = require "physics"

physics.start()
--physics.setDrawMode("hybrid")

local autoFanArray = {}
local manualFanArray = {}
local triangleArray = {}

local j = 0

directionArray = {
    "up",
    "right",
    "down",
    "left"
}

local shapeFormingArray = {
    {"triangleTopRightShape", {-24,-24, 24,24, -24,24}, {24,-24, 24,24, -24,24}, {24,-24, -24,24, -24,-24}},
    {"triangleLeftAndRightShape", { -24,-48, 24,0, -24,48 }, { 24,48, -24,0, 24,-48 }, { 24,48, -24,0, 24,-48 }}
}

local directionArrayIndex = {
    {	{1}, {
	"down",
	"left",
	"right",
	"up"
	},
	{2}, {
	"right",
	"left",
	"up",
	"down"
	}
    },
    {	{1},{
	    "right",
	    "kill",
	    "right",
	    "specialRule"
	},
	{2},{
	    "left",
	    "specialRule",
	    "left",
	    "kill"
	}
    }
}

local shapeArrayParameters = {}
local shapeArray = {}
local connectorArray = {}

local backgroundObjectsGroup = display.newGroup()
local screenObjectsGroup = display.newGroup()
local midScreenObjectsGroup = display.newGroup()
local frontScreenObjectsGroup = display.newGroup()

local screenHorzTotal = 2
local screenVertTotal = 1
local thisScreenHorzValue = 1
local thisScreenVertValue = 1
local ballScreenHorzValue = 1
local ballScreenVertValue = 1

local ballspeed = 13

local lifeCounter = 1
local object1Counter = 0
local screenTimer = 0
local directionCounter = 0 
local mainScreenChangeSpeed = display.contentWidth / 12

local edgesTransitionscounter = 0
local manualScreenChangeCounter = 0
local tunnelCounter = 0
local moveslow_Counter = 1
local moveSomethingCounter = 0
local direction = "up"

local flipVerticalCounter = 0

local fanCenteringCounter = 0
local autoFanCounter = 0

local stillTransitioningCounter = 0
local transitionMoveCounter = 0
local secondTransitionMoveCounter = 0

local rightScreenEdge = (ballScreenHorzValue * display.contentWidth) + 26
local leftScreenEdge = ((ballScreenHorzValue - 1) * display.contentWidth)
local topScreenEdge = ((ballScreenVertValue - 1) * display.contentHeight)
local bottomScreenEdge = (ballScreenVertValue * display.contentHeight) + 30

local playBtn
local pressCount = 0
local playCounter = 0
local isBallMovingState = "false"

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view
    local bg = display.newImage(self.view, "Grid.jpg")
end

function scene:enterScene( event )
    local group = self.view
    local prior_scene = storyboard.getPrevious()
    storyboard.purgeScene( prior_scene )
end


--------- BACKGROUND

local backgroundGrid = display.newImage("background.png")
backgroundGrid.x = 240
backgroundGrid.y = 160
backgroundGrid.alpha = 1
backgroundObjectsGroup:insert( backgroundGrid )

--------- MAIN BALL 
local instance2 = display.newImage( "ball.png" )
physics.addBody( instance2, { density = 1, friction = 1, bounce = 0, radius = 13 } )
midScreenObjectsGroup:insert( instance2 )
instance2.gravityScale = 0
instance2.x = 62
instance2.y = 275
instance2.isFixedRotation = true

-------------------------
--Shape Objects In Game--
-------------------------

--------- SCREEN 1

local triangle = display.newImage("triangle.png")
table.insert(shapeArray, triangle)
table.insert(shapeArrayParameters,
    {"shape","triangle", 1, 1, 1, 1, "triangleTopRightShape", 1, 1})

local triangle3 = display.newImage("triangle.png")
table.insert(shapeArray, triangle3)
table.insert(shapeArrayParameters,
    {"shape","triangle3", 1, 1, 1, 4, "triangleTopRightShape", 1, 1})

local triangle2 = display.newImage("triangle2.png")
table.insert(shapeArray, triangle2)
table.insert(shapeArrayParameters,
    {"shape","triangle2", 1, 1, 4, 5, "triangleLeftAndRightShape", 1, 2} )

local tunnel = display.newImage("triangle.png")
table.insert(shapeArray, tunnel)
table.insert(shapeArrayParameters,
    {"tunnel","tunnel1", 1, 1, 6, 1, 3, 1, "right", "left"} )

local manualFan = display.newImage("manualFan.png")
table.insert(shapeArray, manualFan)
table.insert(shapeArrayParameters,
    {"manualFan","fanUp1", 1, 1, 6, 4, "up"} )

local door1 = display.newImage("door.png")
table.insert(shapeArray, door1)
table.insert(shapeArrayParameters,
    {"door","door1", 1, 1, 7, 4, "right"} )


--------- SCREEN 2

local triangle2_s2 = display.newImage("triangle2.png")
table.insert(shapeArray, triangle2_s2)
table.insert(shapeArrayParameters,
    {"shape","triangle2_s2", 2, 1, 3, 5, "triangleleftAndRightShape", 1, 2} )

local autoFan = display.newImage("autoFan.png")
table.insert(shapeArray, autoFan)
table.insert(shapeArrayParameters,
    {"autoFan","autoFanUp1", 2, 1, 6, 3, "up"} )

local spitter = display.newImage("spitter.png")
table.insert(shapeArray, spitter)
table.insert(shapeArrayParameters,
    {"spitter","spitter1", 2, 1, 3, 3, "none", "right", "down", "left"} )
    
    


for z = 1, #shapeArray do
	
    if shapeArrayParameters[z][1] == "shape" then
	for a = 1, #shapeFormingArray do
	    if shapeFormingArray[a][1]	== shapeArrayParameters[z][7] then
		relevantShape = shapeFormingArray[a][2]
	    end
	end
	physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape=relevantShape } )
	shapeArray[z].shape = shapeArrayParameters[z][7]
	shapeArray[z].state = shapeArrayParameters[z][8]
	shapeArray[z].directionsArray = directionArrayIndex[shapeArrayParameters[z][9]]
	frontScreenObjectsGroup:insert( shapeArray[z] )
    elseif shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan"
    or shapeArrayParameters[z][1] == "spitter"
    or shapeArrayParameters[z][1] == "door"
    or shapeArrayParameters[z][1] == "tunnel" then
	shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint);
	screenObjectsGroup:insert( shapeArray[z] )
    end
    
    if shapeArrayParameters[z][1] == "autoFan"
    or shapeArrayParameters[z][1] == "manualFan" then
	shapeArray[z].direction = shapeArrayParameters[z][7]
    end
    
    shapeArray[z].x = ((shapeArrayParameters[z][3] - 1) * display.contentWidth) + (((shapeArrayParameters[z][5] - 1) * 60) + 30)
    shapeArray[z].y = ((shapeArrayParameters[z][4] - 1) * display.contentHeight) + (((shapeArrayParameters[z][6] - 1) * 52) + 30)
    shapeArray[z].name = shapeArrayParameters[z][2]
    shapeArray[z].objectType = shapeArrayParameters[z][1]
    
    if (shapeArrayParameters[z][1] == "shape") then
	shapeArray[z].x = shapeArray[z].x + 24
	if (shapeArrayParameters[z][7] == "triangleTopRightShape") then
	    shapeArray[z].y = shapeArray[z].y + 27
	    shapeArray[z].x = shapeArray[z].x + 6
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
	    shapeArray[z].y = shapeArray[z].y + 30 + 52 - 9
	    shapeArray[z].x = shapeArray[z].x + 60 - 2
	    shapeArray[z].rotation = 90
	elseif shapeArrayParameters[z][7] == "left" then
	    shapeArray[z].rotation = 180
	    shapeArray[z].x = shapeArray[z].x - 30 + 10
	    shapeArray[z].y = shapeArray[z].y + 52
	end
	frontScreenObjectsGroup:insert( shapeArray[z] )
    end
    
    if shapeArrayParameters[z][1] == "spitter" then
	shapeArray[z].upEnabled = false
	shapeArray[z].rightEnabled = false
	shapeArray[z].downEnabled = false
	shapeArray[z].leftEnabled = false
	if shapeArrayParameters[z][7] == "up" then
	    shapeArray[z].upEnabled = true
	    
	    shapeArray[z].upArrow = display.newImage("triangle.png")
	    shapeArray[z].upArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].upArrow )
	    shapeArray[z].upArrow.x = (shapeArray[z].x + 30)
	    shapeArray[z].upArrow.y = (shapeArray[z].y + 5)
	end
	if shapeArrayParameters[z][8] == "right" then
	    shapeArray[z].rightEnabled = true
	    
	    shapeArray[z].rightArrow = display.newImage("triangle.png")
	    shapeArray[z].rightArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].rightArrow )
	    shapeArray[z].rightArrow.x = (shapeArray[z].x + 60 - 5)
	    shapeArray[z].rightArrow.y = (shapeArray[z].y + 26)
	end
	if shapeArrayParameters[z][9] == "down" then
	    shapeArray[z].downEnabled = true
	    
	    shapeArray[z].downArrow = display.newImage("triangle.png")
	    shapeArray[z].downArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].downArrow )
	    shapeArray[z].downArrow.x = (shapeArray[z].x + 30)
	    shapeArray[z].downArrow.y = (shapeArray[z].y + 52 - 5)
	end
	if shapeArrayParameters[z][10] == "left" then
	    shapeArray[z].leftEnabled = true
	    
	    shapeArray[z].leftArrow = display.newImage("triangle.png")
	    shapeArray[z].leftArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].leftArrow )
	    shapeArray[z].leftArrow.x = (shapeArray[z].x + 5)
	    shapeArray[z].leftArrow.y = (shapeArray[z].y + 26)
	end
    end
    
    if shapeArrayParameters[z][1] == "tunnel" then
	shapeArray[z].firstDirection = shapeArrayParameters[z][9]
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
    end
    
end



-- NOW CREATE TRANSITION SETTINGS

local transitionArrayIndex = {
    {{"fanUp1"},{"slide"},{"green"},{2},{1},{1,1,4,2},{2},{1,1,6,4},{3},{1,1,7,4}},
    {{"triangle3"},{"slide"},{"green"},{1},{1},{1,1,1,4},{2},{1,1,2,1}},
    {{"spitter1"},{"slide"},{"green"},{2},{1},{2,1,2,1},{2},{2,1,3,3}},
    {{"triangle2"},{"flip-horizontal"}},
    {{"triangle"},{"flip-vertical"}}
}

for y = 1, #transitionArrayIndex do
    if transitionArrayIndex[y][2][1] == "flip-horizontal" then
	for z = 1, #shapeArray do
	    if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		shapeArray[z].transitionArrayState = 1
	    end
	end
    elseif transitionArrayIndex[y][2][1] == "flip-vertical" then
	for z = 1, #shapeArray do
	    if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		shapeArray[z].transitionArrayState = 1
	    end
	end
    elseif transitionArrayIndex[y][2][1] == "slide" then
	local connector
	local thisSpotColour = transitionArrayIndex[y][3][1]
	for x = 6, #transitionArrayIndex[y] do
	    if x % 2 == 0 then
		if thisSpotColour == "green" then
		    connector = display.newImage("connectorSpot.png")
		end
		connector:setReferencePoint(display.CenterCenterReferencePoint);
		table.insert(connectorArray, connector)
		connector.alpha = 1
		connector.relatedShape = transitionArrayIndex[y][1][1]
		connector.x = ((transitionArrayIndex[y][x][1] - 1) * display.contentWidth) + (((transitionArrayIndex[y][x][3] - 1) * 60) + 60)
		connector.y = ((transitionArrayIndex[y][x][2] - 1) * display.contentHeight) + (((transitionArrayIndex[y][x][4] - 1) * 52) + 56)
		local connectorTubeHorizontal
		if x > 6 then
		    thisConnectorXDistance = connector.x - lastConnectorX
		    thisConnectorXDistance = thisConnectorXDistance / 60
		    
		    while thisConnectorXDistance > 0 do
			connectorTubeHorizontal = display.newImage("connectorTube-Horizontal.png")
			backgroundObjectsGroup:insert( connectorTubeHorizontal )
			connectorTubeHorizontal:setReferencePoint(display.CenterLeftReferencePoint);
			connectorTubeHorizontal.x = lastConnectorX
			connectorTubeHorizontal.y = lastConnectorY
			lastConnectorX = lastConnectorX + 60
			thisConnectorXDistance = thisConnectorXDistance - 1
		    end
		    
		    thisConnectorYDistance = connector.y - lastConnectorY
		    thisConnectorYDistance = thisConnectorYDistance / 52
		    if thisConnectorYDistance < 0 then
			yConnectorCounter = 0 
			while thisConnectorYDistance < 0 do
			    if yConnectorCounter  == 0 then
				connectorTubeVertical = display.newImage("connectorTube-Horizontal.png")
			    else
				connectorTubeVertical = display.newImage("connectorTube-Horizontal.png")
			    end
			    backgroundObjectsGroup:insert( connectorTubeVertical )
			    connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
			    connectorTubeVertical.x = lastConnectorX
			    connectorTubeVertical.y = lastConnectorY - 52
			    connectorTubeVertical.rotation = 90
			    lastConnectorY = lastConnectorY - 52
			    thisConnectorYDistance = thisConnectorYDistance + 1
			    yConnectorCounter = yConnectorCounter + 1
			end
		    elseif thisConnectorYDistance > 0 then
			yConnectorCounter = 0
			wholeConnectorYDistance = thisConnectorYDistance
			while thisConnectorYDistance > 0 do
			    if yConnectorCounter == 0 then
				connectorTubeVertical = display.newImage("connectorTube-Horizontal.png")
			    else
				connectorTubeVertical = display.newImage("connectorTube-Horizontal.png")
			    end
			    backgroundObjectsGroup:insert( connectorTubeVertical )
			    connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
			    connectorTubeVertical.x = lastConnectorX
			    connectorTubeVertical.y = lastConnectorY
			    connectorTubeVertical.rotation = 90
			    lastConnectorY = lastConnectorY + 52
			    thisConnectorYDistance = thisConnectorYDistance - 1
			    yConnectorCounter = yConnectorCounter + 1
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


local function startBallAgain (event)
    Runtime:removeEventListener( "enterFrame", moveSomething )
    Runtime:removeEventListener("enterFrame", edgesTransitions)
    instance2.x = 56
    instance2.y = 275
    pressCount = 0
    playBtn.alpha = 1
    lifeCounter = lifeCounter + 1
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

local function moveSlow (event)

    if tunnelCounter == 0 then
	tunnelCounter = 1
	instance2.x = ((nextHorzScreen - 1) * display.contentWidth) + (((nextHorzSquare - 1) * 60) + 30 + 30)
	instance2.y = ((nextVertScreen - 1) * display.contentHeight) + (((nextVertSquare - 1) * 52) + 30 + 26)
	direction = nextDirection
	instance2.alpha = 1
	Runtime:addEventListener( "enterFrame", moveSomething )
    end

end

local function specialRuleFunction(event)

    if thisObjectShape == "triangleLeftAndRightShape" then
	
	if newDirectionArray[a] == 1 then
	    
	    if instance2.y > (thisObject.y) then
		
		direction = "down"
			
	    elseif instance2.y < (thisObject.y) then
			
	    	direction = "up"
			
	    end
	    
	else
	    
	    if instance2.y > (thisObject.y) then
		
		direction = "down"
			
	    elseif instance2.y < (thisObject.y) then
			
		direction = "up"
			
    	    end
	    
	end
	    
    end
    
end

local function reboundsFunction(event)
	Runtime:removeEventListener( "enterFrame", moveSomething )
	
	for a = 1, #newDirectionArray do
	    if newDirectionArray[a][1] == thisObjectState then
		
		for i = 1, #directionArray do
			    
		    if directionArray[i] == oldDirection then
			direction = newDirectionArray[a+1][i]
			if direction == "kill" then
			    shouldBallMoveState = "false"
			    timer.performWithDelay( 0, startBallAgain, 1 )
			    direction = "up"
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

local function changeToRightScreen (event)
    
    slowScreenChangeSpeed = mainScreenChangeSpeed * 0.75
    if thisChangeScreenDirection == "right"
    or thisChangeScreenDirection == "left" then
	if screenTimer < display.contentWidth then
	    
	    if thisChangeScreenDirection == "left" then
		alteredSlowScreenChangeSpeed = slowScreenChangeSpeed * (-1)
	    else
		alteredSlowScreenChangeSpeed = slowScreenChangeSpeed
	    end
	    
	    backgroundObjectsGroup.x = backgroundObjectsGroup.x - alteredSlowScreenChangeSpeed
	    screenObjectsGroup.x = screenObjectsGroup.x - alteredSlowScreenChangeSpeed
	    midScreenObjectsGroup.x = midScreenObjectsGroup.x - alteredSlowScreenChangeSpeed
	    frontScreenObjectsGroup.x = frontScreenObjectsGroup.x - alteredSlowScreenChangeSpeed
	    
	    screenTimer = screenTimer + slowScreenChangeSpeed
	
	else
	    
	    direction = thisChangeScreenDirection
	    Runtime:addEventListener("enterFrame", moveSomething)
	    Runtime:removeEventListener("enterFrame", changeToRightScreen)
	    screenTimer = 0
	end
    elseif thisChangeScreenDirection == "up"
    or thisChangeScreenDirection == "down" then
	if screenTimer < display.contentHeight then
	    
	    if thisChangeScreenDirection == "up" then
		alteredSlowScreenChangeSpeed = slowScreenChangeSpeed * (-1)
	    else
		alteredSlowScreenChangeSpeed = slowScreenChangeSpeed
	    end
	    
	    backgroundObjectsGroup.y = backgroundObjectsGroup.y - alteredSlowScreenChangeSpeed
	    screenObjectsGroup.y = screenObjectsGroup.y - alteredSlowScreenChangeSpeed
	    midScreenObjectsGroup.y = midScreenObjectsGroup.y - alteredSlowScreenChangeSpeed
	    frontScreenObjectsGroup.y = frontScreenObjectsGroup.y - alteredSlowScreenChangeSpeed
	    
	    screenTimer = screenTimer + slowScreenChangeSpeed
	
	else
	    
	    direction = thisChangeScreenDirection
	    Runtime:addEventListener("enterFrame", moveSomething)
	    Runtime:removeEventListener("enterFrame", changeToRightScreen)
	    screenTimer = 0
	end
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

local function autoFanTransition(event)
    
    for b = 1, #shapeArray do
	if shapeArrayParameters[b][1] == "autoFan" or shapeArrayParameters[b][1] == "spitter" then
	    if  (instance2.x) > shapeArray[b].x and
		(instance2.x) < (shapeArray[b].x + 60) and
		instance2.y > shapeArray[b].y and
		instance2.y < (shapeArray[b].y + 39) and
		autoFanCounter == 0 then
		    Runtime:removeEventListener( "enterFrame", moveSomething )
		    fanXCenteringComplete = false
		    fanYCenteringComplete = false
		    fanCenteringCounter = 0
		    thisFan = shapeArray[b]
		    thisFan.type = shapeArrayParameters[b][1]
		    Runtime:addEventListener( "enterFrame", fanCentering )
		    direction = shapeArray[b].direction
		    
		    if shapeArrayParameters[b][1] == "spitter" then
			spitterCounter = 0
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
	    and direction == shapeArray[z].firstDirection then
		tunnelCounter = 0
		instance2.alpha = 0
		nextDirection = shapeArrayParameters[z][10]
		nextHorzScreen = shapeArrayParameters[z][3]
		nextVertScreen = shapeArrayParameters[z][4]
		nextHorzSquare = shapeArrayParameters[z][7]
		nextVertSquare = shapeArrayParameters[z][8]
		Runtime:removeEventListener( "enterFrame", moveSomething )
		timer.performWithDelay( 750, moveSlow, 1 )
	    end
	end
    end
    
end


local function edgesTransitions(event)
    
    if  (instance2.x + instance2.contentWidth) > rightScreenEdge and direction == "right" or
	(instance2.x + instance2.contentWidth) < leftScreenEdge and direction == "left" or
	(instance2.y + instance2.contentHeight) < topScreenEdge and direction == "up" or
	(instance2.y + instance2.contentHeight) > bottomScreenEdge  and direction == "down" then
	    Runtime:removeEventListener( "enterFrame", moveSomething )
	    if (instance2.x + instance2.contentWidth) > rightScreenEdge and direction == "right" then
		instance2:translate( -520, 0)
	    elseif (instance2.x + instance2.contentWidth) < leftScreenEdge and direction == "left" then
		instance2:translate( 520, 0)
	    elseif (instance2.y + instance2.contentHeight) < topScreenEdge and direction == "up" then
		instance2:translate( 0, 380)
	    elseif (instance2.y + instance2.contentHeight) > bottomScreenEdge  and direction == "down" then
	        instance2:translate( 0, -380)
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
	    if shapeArrayParameters[b][7] == "right" then
		if (instance2.x + instance2.contentWidth) > (((shapeArrayParameters[b][3] - 1) * display.contentWidth) + 490)
		and (instance2.x + instance2.contentWidth) < (((shapeArrayParameters[b][3] - 1) * display.contentWidth) + 510)
		and direction == "right" then
		    higherY = ((shapeArrayParameters[b][6] - 1) * 52) + 30
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
			Runtime:addEventListener("enterFrame", changeToRightScreen)
			instance2.y = (higherY + 26)
		    end
		end
	    elseif shapeArrayParameters[b][7] == "left" then
		if (instance2.x + instance2.contentWidth) < (((shapeArrayParameters[b][3] - 1) * display.contentWidth) + 10)
		and (instance2.x + instance2.contentWidth) > (((shapeArrayParameters[b][3] - 1) * display.contentWidth))
		and direction == "left" then
		    higherY = ((shapeArrayParameters[b][6] - 1) * 52) + 30
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
			Runtime:addEventListener("enterFrame", changeToRightScreen)
			instance2.y = (higherY + 26)
		    end
		end
	    elseif shapeArrayParameters[b][7] == "up" then
		if (instance2.y + instance2.contentHeight) < (((shapeArrayParameters[b][4] - 1) * display.contentHeight) + 10)
		and (instance2.y + instance2.contentHeight) > (((shapeArrayParameters[b][4] - 1) * display.contentHeight) - 20)
		and direction == "up" then
		    lowerX = ((shapeArrayParameters[b][5] - 1) * 60) + 30
		    if instance2.x > lowerX
		    and instance2.x < (lowerX + 60)
		    and ballScreenVertValue == shapeArrayParameters[b][4]
		    and ballScreenHorzValue == shapeArrayParameters[b][3]
		    and screenTimer == 0 then
			ballScreenHorzValue = ballScreenVertValue - 1
			thisScreenHorzValue = thisScreenVertValue - 1
			topScreenEdge = topScreenEdge - (1 * display.contentHeight)
			bottomScreenEdge = bottomScreenEdge - (1 * display.contentHeight)
			Runtime:removeEventListener("enterFrame", moveSomething)
			Runtime:removeEventListener("enterFrame", edgesTransitions)
			timer.performWithDelay(100, addEdgesTransitions, 1)
			Runtime:addEventListener("enterFrame", changeToRightScreen)
			instance2.x = (lowerX + 30)
		    end
		end
	    elseif shapeArrayParameters[b][7] == "down" then
		if (instance2.y + instance2.contentHeight) > (((shapeArrayParameters[b][4] - 1) * display.contentHeight) + 327)
		and (instance2.y + instance2.contentHeight) < (((shapeArrayParameters[b][4] - 1) * display.contentHeight) + 335)
		and direction == "down" then
		    lowerX = ((shapeArrayParameters[b][5] - 1) * 60) + 30
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
			Runtime:addEventListener("enterFrame", changeToRightScreen)
			instance2.x = (lowerX + 30)
		    end
		end
	    end
	end
    end
end

local function toDiffScreen (event)

    if screenTimer < display.contentWidth then
	
	Runtime:removeEventListener("enterFrame", moveSomething)
	Runtime:removeEventListener( "enterFrame", edgesTransitions )
	isBallMovingState = "false"
	
	backgroundObjectsGroup.x = backgroundObjectsGroup.x + screenChangeSpeed
	screenObjectsGroup.x = screenObjectsGroup.x + screenChangeSpeed
	midScreenObjectsGroup.x = midScreenObjectsGroup.x + screenChangeSpeed
	frontScreenObjectsGroup.x = frontScreenObjectsGroup.x + screenChangeSpeed
	
	if screenChangeSpeed == 40 then
	    screenTimer = screenTimer + screenChangeSpeed
	else
	    screenTimer = screenTimer - screenChangeSpeed
	end
	
    else
	Runtime:removeEventListener("enterFrame", toDiffScreen)
	screenTimer = 0
	
	if thisScreenHorzValue ~= ballScreenHorzValue or thisScreenVertValue ~= ballScreenVertValue then
	    playBtn.alpha = 0.5
	else
	    playBtn.alpha = 1
	    pressCount = 0
	end
	
	if thisScreenHorzValue ~= 1 then
	    backBtn.alpha = 1
	else
	    backBtn.alpha = 0.5
	end
	
	if thisScreenHorzValue ~= screenHorzTotal then
	    rightBtn.alpha = 1
	else
	    rightBtn.alpha = 0.5
	end
	
	manualScreenChangeCounter = 0
	
    end
    
end

function resetLevel()
    
    -- simply go to level1.lua scene
    storyboard.gotoScene( "reset" )
     
    return true -- indicates successful touch

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
	    end
	end
    end
			
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
    
    thisTransitionObject.alpha = 0.8
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
		if thisTransitionObject.enabled == true then
		    instance2.x = instance2.x + (30 * thisTransitionXDirection)
		end
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
		if thisTransitionObject.enabled == true then
		    instance2.y = instance2.y + (26 * thisTransitionXDirection)
		end
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
			if thisTransitionObject.enabled == true then
			    instance2.y = instance2.y + (13 * thisTransitionXDirection)
			end
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
			if thisTransitionObject.enabled == true then
			    instance2.x = instance2.x + (20 * thisTransitionXDirection)
			end
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

end

local function listener(event)
    if event.target.name == "play" then 
  	if event.phase == "began" then
	    if thisScreenHorzValue == ballScreenHorzValue and thisScreenVertValue == ballScreenVertValue then
		if pressCount == 0 then
		    pressCount = 1
		    if moveSomethingCounter == 0 then
			Runtime:addEventListener( "enterFrame", moveSomething )
		    end
		    Runtime:addEventListener( "enterFrame", edgesTransitions )
		    Runtime:addEventListener( "enterFrame", doorTransition )
		    Runtime:addEventListener( "enterFrame", tunnelTransition )
		    Runtime:addEventListener( "enterFrame", autoFanTransition )
		end
		isBallMovingState = "true"
		shouldBallMoveState = "true"
		playBtn.alpha = 0.5
		
	    end
	end
    end
    
    if event.target.name == "back" then
        if event.phase == "began" then
	    if thisScreenHorzValue > 1 and manualScreenChangeCounter == 0 then
		shouldBallMoveState = "false"
		manualScreenChangeCounter = 1
		thisScreenHorzValue = thisScreenHorzValue - 1
		screenChangeSpeed = mainScreenChangeSpeed
		Runtime:addEventListener( "enterFrame", toDiffScreen )
		shouldBallMoveState = "false"
	    end
	end
    end
    
    if event.target.name == "right" then
        if event.phase == "began" then
	    if thisScreenHorzValue < screenHorzTotal and manualScreenChangeCounter == 0 then
		shouldBallMoveState = "false"
		manualScreenChangeCounter = 1
		thisScreenHorzValue = thisScreenHorzValue + 1
		screenChangeSpeed = mainScreenChangeSpeed * -1
		Runtime:addEventListener( "enterFrame", toDiffScreen )
	    end
	end
    end
    
    if event.target.name == "triangle23" then
	if event.phase == "began" then
		local textObj = display.newText(instance2.y, 0,0, nil, 14);
textObj.x = 20;
	end
    end

    for d=1, #transitionArrayIndex do
	if transitionArrayIndex[d][2][1] == "flip-horizontal"
	and event.target.name == transitionArrayIndex[d][1][1] then
	    if event.phase == "began" then
		display.getCurrentStage():setFocus(event.target)
		event.target.isFocus = true
		if event.target.transitionArrayState == 1 and flipVerticalCounter == 0 then
		    flipVerticalCounter = 1
		    event.target.xScale = -1
		    physics.removeBody(event.target)
		    for a = 1, #shapeFormingArray do
			if shapeFormingArray[a][1] == event.target.shape then
			    physics.addBody( event.target, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][3] } )
			end
			if event.target.shape == "triangleTopRightShape" then
			    event.target.x = event.target.x - 6
			end
		    end
		    event.target.x = event.target.x - 48 
		    event.target.transitionArrayState = event.target.transitionArrayState + 1
		    event.target.state = 2
		elseif event.target.transitionArrayState == 2 and flipVerticalCounter == 0 then
		    flipVerticalCounter = 1
		    event.target.xScale = 1
		    physics.removeBody(event.target)
		    for a = 1, #shapeFormingArray do
			if shapeFormingArray[a][1] == event.target.shape then
			    physics.addBody( event.target, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][2] } )
			end
			if event.target.shape == "triangleTopRightShape" then
			    event.target.x = event.target.x + 6
			end
		    end
		    event.target.x = event.target.x + 48
		    event.target.state = 1
		    event.target.transitionArrayState = event.target.transitionArrayState - 1
		end
	    else
		if event.target.isFocus == true then
		    flipVerticalCounter = 0
		    event.target.isFocus = false
		    display.getCurrentStage():setFocus( nil )
		end
	    end
	elseif transitionArrayIndex[d][2][1] == "flip-vertical"
	and event.target.name == transitionArrayIndex[d][1][1] then
	    if event.phase == "began" then
		display.getCurrentStage():setFocus(event.target)
		event.target.isFocus = true
		if event.target.transitionArrayState == 1 and flipVerticalCounter == 0 then
		    flipVerticalCounter = 1
		    event.target.yScale = -1
		    physics.removeBody(event.target)
		    for a = 1, #shapeFormingArray do
			if shapeFormingArray[a][1] == event.target.shape then
			    physics.addBody( event.target, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][4] } )
			end
			if event.target.shape == "triangleTopRightShape" then
			    event.target.y = event.target.y + 1
			end
		    end
		    event.target.y = event.target.y + 48 
		    event.target.transitionArrayState = event.target.transitionArrayState + 1
		    event.target.state = 2
		elseif event.target.transitionArrayState == 2 and flipVerticalCounter == 0 then
		    flipVerticalCounter = 1
		    event.target.yScale = 1
		    physics.removeBody(event.target)
		    for a = 1, #shapeFormingArray do
			if shapeFormingArray[a][1] == event.target.shape then
			    physics.addBody( event.target, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[a][2] } )
			end
			if event.target.shape == "triangleTopRightShape" then
			    event.target.y = event.target.y -1
			end
		    end
		    event.target.y = event.target.y - 48
		    event.target.state = 1
		    event.target.transitionArrayState = event.target.transitionArrayState - 1
		end
	    else
		if event.target.isFocus == true then
		    flipVerticalCounter = 0
		    event.target.isFocus = false
		    display.getCurrentStage():setFocus( nil )
		end
	    end
	elseif transitionArrayIndex[d][2][1] == "slide" then
	    if event.target.name == transitionArrayIndex[d][1][1] and stillTransitioningCounter == 0 then
		if event.phase == "began" then
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
		    
		elseif event.phase == "moved" and stillTransitioningCounter == 0 then
		    eventMove = "true"
		    eventNewX = event.x
		    eventNewY = event.y
		    eventEndTime = event.time
		    ySwipe = eventNewY - eventStartY
		    xSwipe = eventNewX - eventStartX
		    eventTotalTime = eventEndTime - eventStartTime
		    
		    
		    if event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare > event.target.thisTransitionHorzSquare then
			thisTransitionDistance = event.target.nextTransitionHorzSquare - event.target.thisTransitionHorzSquare
			
			if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 250 then
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
			
			if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 250 then
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
			
			if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 250 then
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
			
			if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 250 then
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
				
			if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) < 250 then
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
				    
			if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) < 250 then
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
		end
	    end
	end
    end
    
    for c=1, #shapeArray do
	if event.target == shapeArray[c] then
	    if  event.target.objectType == "manualFan"
	    and (instance2.x) > (event.target.x - 10)
	    and (instance2.x) < (event.target.x + 10 + 60)
	    and (instance2.y) > (event.target.y - 6)
	    and (instance2.y) < (event.target.y + 6 + 52)
	    and event.phase == "began" then
	    	Runtime:removeEventListener( "enterFrame", moveSomething )
	    	fanXCenteringComplete = false
	    	fanYCenteringComplete = false
	    	fanCenteringCounter = 0
	    	thisFan = event.target
		thisFan.type = event.target.objectType
	    	Runtime:addEventListener( "enterFrame", fanCentering )
	    	direction = event.target.direction
	    elseif event.target.objectType == "spitter"
	    and event.target.enabled == true then
		if event.phase == "began" then
		    eventStartX = event.x
		    eventStartY = event.y
		    eventStartTime = event.time
		elseif event.phase == "moved" then
		    eventNewX = event.x
		    eventNewY = event.y
		    eventEndTime = event.time
		    ySwipe = eventNewY - eventStartY
		    xSwipe = eventNewX - eventStartX
		    eventTotalTime = eventEndTime - eventStartTime
		    
		    if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) > 290 and (eventTotalTime) < 900 then
			if (xSwipe) > 10 and spitterCounter == 0 and event.target.rightEnabled == true and shouldBallMoveState == "true" then
			    spitterCounter = 1
			    direction = "right"
			    Runtime:addEventListener( "enterFrame", moveSomething)
			    event.target.enabled = false
			elseif (xSwipe) < -10 and spitterCounter == 0 and event.target.leftEnabled == true and shouldBallMoveState == "true" then
			    spitterCounter = 1
			    direction = "left"
			    Runtime:addEventListener( "enterFrame", moveSomething)
			    event.target.enabled = false
			end
		    end
		    
		    if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) > 290 and (eventTotalTime) < 900 then
			if (ySwipe) > 10 and spitterCounter == 0 and event.target.downEnabled == true and shouldBallMoveState == "true" then
			    spitterCounter = 1
			    direction = "down"
			    Runtime:addEventListener( "enterFrame", moveSomething)
			    event.target.enabled = false
			elseif (ySwipe) < -10 and spitterCounter == 0 and event.target.upEnabled == true and shouldBallMoveState == "true" then
			    spitterCounter = 1
			    direction = "up"
			    Runtime:addEventListener( "enterFrame", moveSomething)
			    event.target.enabled = false
			end
		    end
		end
	    end
	end
    end
    
    if event.target.name == "reset" then
	if event.phase == "began" then
	    timer.performWithDelay(1, resetLevel)
	end
    end
    
end

rightBtn =
        widget.newButton{
	    label=">",
	    labelColor = { default={255}},
	    default="button.png",
	    width=30, height=30,
	    onRelease = onPlayBtnRelease	-- event listener function
	}
	rightBtn:setReferencePoint( display.CenterReferencePoint )
	rightBtn.x = 55
	rightBtn.y = display.contentHeight - 15
        rightBtn.name = "right"
	if thisScreenHorzValue ~= screenHorzTotal then
	    rightBtn.alpha = 1
	else
	    rightBtn.alpha = 0.5
	end
        
backBtn =
        widget.newButton{
	    label="<",
	    labelColor = { default={255} },
	    default="button.png",
	    width=30, height=30,
	    onRelease = onBackBtnRelease	-- event listener function
	}
	backBtn:setReferencePoint( display.CenterReferencePoint )
	backBtn.x = 20
	backBtn.y = display.contentHeight - 15
        backBtn.name = "back"
	if thisScreenHorzValue ~= 1 then
	    backBtn.alpha = 1
	else
	    backBtn.alpha = 0.5
	end
	
	if thisScreenHorzValue ~= screenHorzTotal then
	    rightBtn.alpha = 1
	else
	    rightBtn.alpha = 0.5
	end
	
playBtn =
        widget.newButton{
	    label="*",
            labelColor = { default={255}, over={128} },
	    default="button.png",
	    over="button-over.png",
	    width=30, height=30,
	    onRelease = onJumpBtnRelease	-- event listener function
	}
	playBtn:setReferencePoint( display.CenterReferencePoint )
	playBtn.x = display.contentWidth - 10
	playBtn.y = display.contentHeight - 15
        playBtn.name = "play"
	
resetBtn =
        widget.newButton{
	    label="R",
            labelColor = { default={255}, over={128} },
	    default="button.png",
	    over="button-over.png",
	    width=30, height=30,
	    onRelease = onJumpBtnRelease	-- event listener function
	}
	resetBtn:setReferencePoint( display.CenterReferencePoint )
	resetBtn.x = display.contentWidth - 60
	resetBtn.y = display.contentHeight - 15
        resetBtn.name = "reset"
	        
playBtn:addEventListener( "touch", listener )
resetBtn:addEventListener( "touch", listener )
backBtn:addEventListener( "touch", listener )
rightBtn:addEventListener( "touch", listener )

for c=1, #shapeArray do
    if shapeArrayParameters[c][1] == "shape" then
	shapeArray[c]:addEventListener("collision", on_Triangle_Collision)
    elseif shapeArrayParameters[c][1] == "manualFan" or shapeArrayParameters[c][1] == "spitter" then
	shapeArray[c]:addEventListener( "touch", listener )
    end
    
    for d=1, #transitionArrayIndex do
	if transitionArrayIndex[d][1][1] == shapeArrayParameters[c][2] then
	    shapeArray[c]:addEventListener("touch", listener)
	end
    end
end


scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene" )

return scene