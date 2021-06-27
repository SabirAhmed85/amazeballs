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
	"kill",
	"kill",
	"kill",
	"kill"
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
	    "right",
	    "kill", --specialRule
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
	    "kill",
	    "up",
	    "down",
	    "",
	    ""
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
    
    ,
    
    { {1},{
	"kill",
	"kill",
	"kill",
	"kill"
	},
      {2},{
	"kill",
	"left",
	"up",
	"kill"
	}
    }
    
    -- every time you enter a new Array, put the comma into the code before it, same as above
}


local shapeArrayParameters = {}
local shapeArray = {}
local connectorArray = {}
local transitionArrayIndex = {}

local backgroundObjectsGroup = display.newGroup()
local screenObjectsGroup = display.newGroup()
local midScreenObjectsGroup = display.newGroup()
local frontScreenObjectsGroup = display.newGroup()

local pauseScreenObjectsGroup = display.newGroup()

local screenHorzTotal = 2
local screenVertTotal = 1
local thisScreenHorzValue = 1
local thisScreenVertValue = 1
local ballScreenHorzValue = 1
local ballScreenVertValue = 1

local thisSwitch = null

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

local backgroundGrid = display.newImage("images/level-images/WoodyWalk/Layout/world-background.jpg")
backgroundGrid.x = 240
backgroundGrid.y = 160
backgroundGrid.alpha = 1
backgroundObjectsGroup:insert( backgroundGrid )

local backgroundGrid = display.newImage("images/level-images/WoodyWalk/Layout/world-background.jpg")
backgroundGrid.x = 720
backgroundGrid.y = 160
backgroundGrid.alpha = 1
backgroundObjectsGroup:insert( backgroundGrid )

--------- MAIN BALL 
local instance2 = display.newImage( "images/objects/ballSprite.png" )
physics.addBody( instance2, { density = 1, friction = 1, bounce = 0, radius = 13 } )
midScreenObjectsGroup:insert( instance2 )
instance2.gravityScale = 0
instance2.x = 62
instance2.y = 275
instance2.isFixedRotation = true

---------  MENU SCREEN

local pauseScreen = display.newRect(150, 100, display.contentWidth, display.contentHeight)
--pauseScreen:setReferencePoint(display.TopLeftReferencePoint);
pauseScreen.y = display.contentHeight
pauseScreen.x = 0
pauseScreen.state = "unpaused"

-------------------------
--Shape Objects In Game--
-------------------------

--------- SCREEN 1

local switch = display.newImage("images/objects/manualFan.png")
table.insert(shapeArray, switch)
table.insert(shapeArrayParameters,{"switch","switch1", 1, 1, 1, 3, "flip-horizontal", "triangle", "two-way", "triangle3", "flip-horizontal"})

local switch = display.newImage("images/objects/manualFan.png")
table.insert(shapeArray, switch)
table.insert(shapeArrayParameters,{"switch","switch1", 1, 1, 4, 1, "door-open", "door1", "two-way"})

local triangle3 = display.newImage("images/objects/triangleTopRight.png")
table.insert(shapeArray, triangle3)
table.insert(shapeArrayParameters,{"shape","triangle3", 1, 1, 2, 4, "triangleTopRightShape", 1})
table.insert(transitionArrayIndex,{{"triangle3"},{"slide"},{"green"},{1},{1},{1,1,2,4},{2},{1,1,3,4}})

local triangle2 = display.newImage("images/objects/triangle.png")
table.insert(shapeArray, triangle2)
table.insert(shapeArrayParameters,{"shape","triangle2", 1, 1, 4, 4, "triangleLeftAndRightShape", 1, 1} )
table.insert(transitionArrayIndex,{{"triangle2"},{"flip-horizontal"}})

--local tunnel = display.newImage("triangle.png")
--table.insert(shapeArray, tunnel)
--table.insert(shapeArrayParameters,{"tunnel","tunnel1", 1, 1, 6, 1, 3, 1, "right", "left"} )

local manualFan = display.newImage("images/objects/manualFan.png")
table.insert(shapeArray, manualFan)
table.insert(shapeArrayParameters,{"manualFan","fanUp1", 1, 1, 6, 4, "up"} )
table.insert(transitionArrayIndex,{{"fanUp1"},{"slide"},{"silver"},{2},{1},{1,1,4,2},{2},{1,1,6,4},{3},{1,1,7,4}})

local door1 = display.newImage("images/objects/door.png")
table.insert(shapeArray, door1)
table.insert(shapeArrayParameters,{"door","door1", 1, 1, 7, 4, "right", "disabled"} )


--------- SCREEN 2

local triangle2_s2 = display.newImage("images/objects/triangle.png")
table.insert(shapeArray, triangle2_s2)
table.insert(shapeArrayParameters,{"shape","triangle2_s2", 2, 1, 3, 5, "triangleLeftAndRightShape", 1, 1} )

local autoFan = display.newImage("images/objects/autoFan.png")
table.insert(shapeArray, autoFan)
table.insert(shapeArrayParameters,{"autoFan","autoFanUp1", 2, 1, 6, 3, "up"} )

local spitter = display.newImage("images/objects/spitter.png")
table.insert(shapeArray, spitter)
table.insert(shapeArrayParameters,{"spitter","spitter2", 2, 1, 1, 4, "none", "right", "down", "left"} )
table.insert(transitionArrayIndex,{{"spitter2"},{"slide"},{"blue"},{1},{1},{2,1,1,4},{2},{2,1,2,4}})

local spitter = display.newImage("images/objects/spitter.png")
table.insert(shapeArray, spitter)
table.insert(shapeArrayParameters,{"spitter","spitter1", 2, 1, 4, 4, "up", "right", "down", "left"} )
table.insert(transitionArrayIndex,{{"spitter1"},{"slide"},{"blue"},{2},{1},{2,1,3,4},{2},{2,1,4,4}})
    
  


for z = 1, #shapeArray do
	
    if shapeArrayParameters[z]["type"] == "shape" then
	for a = 1, #shapeFormingArray do
	    if shapeFormingArray[a][1]	== shapeArrayParameters[z]["subType"] then
		relevantShape = shapeFormingArray[a][2]
		if shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape"
		and shapeArrayParameters[z]["props"][1] == 2 then
		    relevantShape = shapeFormingArray[a][4]
		elseif shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape"
		and shapeArrayParameters[z]["props"][1] == 2 then
		    relevantShape = shapeFormingArray[a][3]
		end
		if (shapeArrayParameters[z]["props"][2]) then
		    shapeArrayParam = (shapeArrayParameters[z]["props"][2]) + 6
		    shapeArray[z].directionsArray = directionArrayIndex[shapeArrayParam]
		    shapeArray[z].directionsArrayAtIndex = shapeArrayParam
		else
		    shapeArray[z].directionsArray = directionArrayIndex[shapeFormingArray[a][5]]
		    shapeArray[z].directionsArrayAtIndex = shapeFormingArray[a][5]
		end
	    end
	end
	physics.addBody( shapeArray[z], "static", { density=10, friction=1, bounce=0, shape=relevantShape } )
	shapeArray[z].shape = shapeArrayParameters[z]["subType"]
	shapeArray[z].state = shapeArrayParameters[z]["props"][1]
	shapeArray[z].transitionArrayState = shapeArrayParameters[z]["props"][1]
	frontScreenObjectsGroup:insert( shapeArray[z] )
    elseif shapeArrayParameters[z]["type"] == "autoFan"
    or shapeArrayParameters[z]["type"] == "manualFan"
    or shapeArrayParameters[z]["type"] == "spitter"
    or shapeArrayParameters[z]["type"] == "door"
    or shapeArrayParameters[z]["type"] == "tunnel" 
    or shapeArrayParameters[z]["type"] == "switch" then
	--shapeArray[z]:setReferencePoint(display.TopLeftReferencePoint);
	screenObjectsGroup:insert( shapeArray[z] )
    end
    
    if shapeArrayParameters[z]["type"] == "switch" then
	shapeArray[z].switchCounter = 0
	shapeArray[z].switchOnOffCounter = 0
	if shapeArrayParameters[z]["subType"] == "rotate-object" then
	    shapeArray[z].rotateSwitch = "first"
	end
    end
    
    if shapeArrayParameters[z]["type"] == "autoFan"
    or shapeArrayParameters[z]["type"] == "manualFan" then
	shapeArray[z].direction = shapeArrayParameters[z]["subType"]
    end
    
    shapeArray[z].x = ((shapeArrayParameters[z]["location"]["xScreen"] - 1) * display.contentWidth) + (((shapeArrayParameters[z]["location"]["xSquare"] - 1) * 60) + 30)
    shapeArray[z].y = ((shapeArrayParameters[z]["location"]["yScreen"] - 1) * display.contentHeight) + (((shapeArrayParameters[z]["location"]["ySquare"] - 1) * 52) + 30)
    shapeArray[z].name = shapeArrayParameters[z]["name"]
    shapeArray[z].objectType = shapeArrayParameters[z]["type"]
    
    if (shapeArrayParameters[z]["type"] == "shape") then
	shapeArray[z].x = shapeArray[z].x + 24
	if (shapeArrayParameters[z]["subType"] ~= "triangleLeftAndRightShape")
	and (shapeArrayParameters[z]["subType"] ~= "triangleTopAndBottomShape") then
	    shapeArray[z].y = shapeArray[z].y + 27
	    shapeArray[z].x = shapeArray[z].x + 6
	else
	    if (shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape") then
		shapeArray[z].y = shapeArray[z].y + 52
		if (shapeArrayParameters[z]["props"][1] == 2) then
		    shapeArray[z].x = shapeArray[z].x + 11
		end
	    else
		shapeArray[z].x = shapeArray[z].x + 36
		shapeArray[z].y = shapeArray[z].y + 28
		if (shapeArrayParameters[z]["props"][1] == 2) then
		    shapeArray[z].y = shapeArray[z].y - 3
		end
	    end
	end
	if (shapeArrayParameters[z]["subType"] == "triangleBottomLeftShape")
	or (shapeArrayParameters[z]["subType"] == "triangleTopLeftShape") then
	    shapeArray[z].x = shapeArray[z].x + 3
	elseif (shapeArrayParameters[z]["subType"] == "triangleBottomRightShape")
	or (shapeArrayParameters[z]["subType"] == "triangleTopRightShape") then
	    shapeArray[z].x = shapeArray[z].x - 1
	end
	
	local relevantDirectionArray = shapeArray[z].state * 2
	
	for a = 1, #shapeArray[z].directionsArray[relevantDirectionArray] do
	    if a < 5 then
		if shapeArray[z].directionsArray[relevantDirectionArray][a] == "kill" then
		    if (a == 4
		    and shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape"
		    and shapeArray[z].state == 1)
		    or (a == 2
		    and shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape"
		    and shapeArray[z].state == 2)
		    or (a == 3
		    and shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape"
		    and shapeArray[z].state == 1)
		    or (a == 1
		    and shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape"
		    and shapeArray[z].state == 2)
		    or (a == 4
		    and shapeArrayParameters[z]["subType"] == "triangleTopRightShape")
		    or (a == 4
		    and shapeArrayParameters[z]["subType"] == "triangleBottomRightShape")
		    or (a == 2
		    and shapeArrayParameters[z]["subType"] == "triangleTopLeftShape")
		    or (a == 2
		    and shapeArrayParameters[z]["subType"] == "triangleBottomLeftShape")then
		    
		    else
			killBar = display.newImage("images/objects/killBar.png")
			frontScreenObjectsGroup:insert( killBar )
			killBar.relatedShape = shapeArray[z].name
			killBar.relatedDirectionArrayIndex = a
			
			if (a == 4
			and shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape"
			and shapeArray[z].state == 2) then
			    killBar.relatedDirectionArrayIndex = 2
			elseif (a == 3
			and shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape"
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
			    if shapeArrayParameters[z]["subType"] == killBarPositionArray[b][1]
			    or shapeArrayParameters[z]["subType"] == killBarPositionArray[b][2] then
				killBar.x = killBar.x + killBarPositionArray[b][3]
				killBar.y = killBar.y + killBarPositionArray[b][4]
				killBar.rotation = killBarPositionArray[b][5]
			    elseif shapeArrayParameters[z]["subType"] == killBarPositionArray[b][6] then
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
					
					killBar = display.newImage("images/objects/killBar.png")
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
			    elseif shapeArrayParameters[z]["subType"] == killBarPositionArray[b][13] then
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
					
					killBar = display.newImage("images/objects/killBar.png")
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
				if shapeArrayParameters[z]["subType"] == killBarPositionArray[b][20] then
				    killBar.x = killBar.x + killBarPositionArray[b][21]
				    killBar.y = killBar.y + killBarPositionArray[b][22]
				    killBar.rotation = killBarPositionArray[b][23]
				elseif shapeArrayParameters[z]["subType"] == killBarPositionArray[b][24] then
				    killBar.x = killBar.x + killBarPositionArray[b][25]
				    killBar.y = killBar.y + killBarPositionArray[b][26]
				    killBar.rotation = killBarPositionArray[b][27]
				end
			    end
			end
		    end
		    
		elseif shapeArray[z].directionsArray[relevantDirectionArray][a] == "specialRule" then
		    
		    if shapeArrayParameters[z]["subType"] == "triangleLeftAndRightShape" then
			if shapeArray[z].state == 1 then
			    if a == 2 then
				if shapeArray[z].directionsArray[2][5] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
				    frontScreenObjectsGroup:insert( killBar )
				    killBar.relatedShape = shapeArray[z].name
				    killBar.relatedDirectionArrayIndex = 2
				    killBar.rotation = 180
				    killBar.x = shapeArray[z].x - 27
				    killBar.y = shapeArray[z].y - 22
				end
				if shapeArray[z].directionsArray[2][6] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
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
				    killBar = display.newImage("images/objects/killBar.png")
				    frontScreenObjectsGroup:insert( killBar )
				    killBar.relatedShape = shapeArray[z].name
				    killBar.relatedDirectionArrayIndex = 2
				    killBar.rotation = 180
				    killBar.x = shapeArray[z].x - 27
				    killBar.y = shapeArray[z].y - 22
				end
				if shapeArray[z].directionsArray[2][8] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
				    frontScreenObjectsGroup:insert( killBar )
				    killBar.relatedShape = shapeArray[z].name
				    killBar.relatedDirectionArrayIndex = 2
				    killBar.rotation = 0
				    killBar.x = shapeArray[z].x + 27
				    killBar.y = shapeArray[z].y + 22
				end
			    end
			end
		    elseif shapeArrayParameters[z]["subType"] == "triangleTopAndBottomShape" then
			if shapeArray[z].state == 1 then
			    if a == 1 then
				if shapeArray[z].directionsArray[2][5] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
				    frontScreenObjectsGroup:insert( killBar )
				    killBar.relatedShape = shapeArray[z].name
				    killBar.relatedDirectionArrayIndex = 1
				    killBar.rotation = 90
				    killBar.x = shapeArray[z].x - 27
				    killBar.y = shapeArray[z].y + 25
				end
				if shapeArray[z].directionsArray[2][6] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
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
				    killBar = display.newImage("images/objects/killBar.png")
				    frontScreenObjectsGroup:insert( killBar )
				    killBar.relatedShape = shapeArray[z].name
				    killBar.relatedDirectionArrayIndex = 1
				    killBar.rotation = -90
				    killBar.x = shapeArray[z].x - 27
				    killBar.y = shapeArray[z].y - 26
				end
				if shapeArray[z].directionsArray[2][8] == "kill" then
				    killBar = display.newImage("images/objects/killBar.png")
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
    
    if (shapeArrayParameters[z]["type"] == "door") then
	if shapeArrayParameters[z]["subType"] == "up" then
	    shapeArray[z].y = shapeArray[z].y - 30 + 10
	    shapeArray[z].x = shapeArray[z].x + 3
	    shapeArray[z].rotation = 270
	elseif shapeArrayParameters[z]["subType"] == "right" then
	    shapeArray[z].x = shapeArray[z].x + 30 + 60 - 10
	    shapeArray[z].y = shapeArray[z].y - 1
	elseif shapeArrayParameters[z]["subType"] == "down" then
	    shapeArray[z].y = shapeArray[z].y + 30 + 52 - 9
	    shapeArray[z].x = shapeArray[z].x + 60 - 2
	    shapeArray[z].rotation = 90
	elseif shapeArrayParameters[z]["subType"] == "left" then
	    shapeArray[z].rotation = 180
	    shapeArray[z].x = shapeArray[z].x - 30 + 10
	    shapeArray[z].y = shapeArray[z].y + 52
	end
	frontScreenObjectsGroup:insert( shapeArray[z] )
	shapeArray[z].enabled = shapeArrayParameters[z]["props"][1]
	if shapeArray[z].enabled == "disabled" then
	    shapeArray[z].alpha = 0 
	end
    end
    
    if shapeArrayParameters[z]["type"] == "spitter" then
	shapeArray[z].upEnabled = false
	shapeArray[z].rightEnabled = false
	shapeArray[z].downEnabled = false
	shapeArray[z].leftEnabled = false
	    
	if shapeArrayParameters[z]["subType"] == "up" then
	    shapeArray[z].upEnabled = true
	    shapeArray[z].upArrow = display.newImage("images/objects/spitter-arrow.png")
	    --shapeArray[z].upArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].upArrow )
	    shapeArray[z].upArrow.x = (shapeArray[z].x + 23)
	    shapeArray[z].upArrow.y = (shapeArray[z].y + 5)
	end
	if shapeArrayParameters[z]["props"][1] == "right" then
	    shapeArray[z].rightEnabled = true
	    shapeArray[z].rightArrow = display.newImage("images/objects/spitter-arrow.png")
	    --shapeArray[z].rightArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].rightArrow )
	    shapeArray[z].rightArrow.rotation = 90
	    shapeArray[z].rightArrow.x = (shapeArray[z].x + 54)
	    shapeArray[z].rightArrow.y = (shapeArray[z].y + 20)
	end
	if shapeArrayParameters[z]["props"][2] == "down" then
	    shapeArray[z].downEnabled = true
	    shapeArray[z].downArrow = display.newImage("images/objects/spitter-arrow.png")
	    --shapeArray[z].downArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].downArrow )
	    shapeArray[z].downArrow.rotation = 180
	    shapeArray[z].downArrow.x = (shapeArray[z].x + 38)
	    shapeArray[z].downArrow.y = (shapeArray[z].y + 49)
	end
	if shapeArrayParameters[z]["props"][3] == "left" then
	    shapeArray[z].leftEnabled = true
	    shapeArray[z].leftArrow = display.newImage("images/objects/spitter-arrow.png")
	    --shapeArray[z].leftArrow:setReferencePoint(display.TopLeftReferencePoint);
	    screenObjectsGroup:insert( shapeArray[z].leftArrow )
	    shapeArray[z].leftArrow.rotation = 270
	    shapeArray[z].leftArrow.x = (shapeArray[z].x + 7)
	    shapeArray[z].leftArrow.y = (shapeArray[z].y + 35)
	end
	
    end
    
    if shapeArrayParameters[z]["type"] == "tunnel" then
	shapeArray[z].firstDirection = shapeArrayParameters[z]["props"][2]
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

for y = 1, #transitionArrayIndex do
    if transitionArrayIndex[y][2][1] == "flip-horizontal" then
	for z = 1, #shapeArray do
	    if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		if shapeArrayParameters[z]["props"][1] == 2 then
		    shapeArray[z].transitionArrayState = 2
		    shapeArray[z].originalState = 2
		else
		    shapeArray[z].transitionArrayState = 1
		    shapeArray[z].originalState = 1
		end
		shapeArray[z].flipped = false
		shapeArray[z].flipDisabled = false
	    end
	end
    elseif transitionArrayIndex[y][2][1] == "flip-vertical" then
	for z = 1, #shapeArray do
	    if shapeArray[z].name == transitionArrayIndex[y][1][1] then
		if shapeArrayParameters[z]["props"][1] == 2 then
		    shapeArray[z].transitionArrayState = 2
		    shapeArray[z].originalState = 2
		else
		    shapeArray[z].transitionArrayState = 1
		    shapeArray[z].originalState = 1
		end
		shapeArray[z].flipped = false
	    end
	end
    elseif transitionArrayIndex[y][2][1] == "slide" then
	local connector
	local thisSpotColour = transitionArrayIndex[y][3][1]
	for x = 6, #transitionArrayIndex[y] do
	    if x % 2 == 0 then
		connector = display.newImage("images/objects/" .. thisSpotColour .. "-connectorSpot.png")
		--connector:setReferencePoint(display.CenterCenterReferencePoint);
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
			if thisConnectorXDistance  == 1 then
			    connectorTubeHorizontal = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Horizontal.png")
			    connectorTubeHorizontal.width = 52
			    connectorTubeHorizontal.height = 8
			else
			    connectorTubeHorizontal = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Horizontal.png")
			end
			backgroundObjectsGroup:insert( connectorTubeHorizontal )
			--connectorTubeHorizontal:setReferencePoint(display.CenterLeftReferencePoint);
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
				connectorTubeVertical = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Vertical-Bottom.png")
			    else
				connectorTubeVertical = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Horizontal.png")
				connectorTubeVertical.width = 52
				connectorTubeVertical.height = 8
			    end
			    backgroundObjectsGroup:insert( connectorTubeVertical )
			    --connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
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
				connectorTubeVertical = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Vertical-Top.png")
			    else
				connectorTubeVertical = display.newImage("images/objects/" .. thisSpotColour .. "-connectorTube-Horizontal.png")
				connectorTubeVertical.width = 52
				connectorTubeVertical.height = 8
			    end
			    backgroundObjectsGroup:insert( connectorTubeVertical )
			    --connectorTubeVertical:setReferencePoint(display.CenterLeftReferencePoint);
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
    
    if direction == "kill" then
	shouldBallMoveState = "false"
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


local function switchAlphaTransparency (event)

	local vext = display.newImage("skfmknd", 0, 0, 14, nil)
    if thisSwitchingObject.enabled == "enabled" then
	if alphaCounter < 1
	and thisSwitchingObject.alpha < 1.1
	and thisSwitchingObject.alpha > - 0.1 then
	    thisSwitchingObject.alpha = thisSwitchingObject.alpha - 0.2
	    alphaCounter = alphaCounter + 0.2
	else
	    thisSwitchingObject.enabled = "disabled"
	    Runtime:removeEventListener("enterFrame", switchAlphaTransparency)
	end
    else
	local rext = display.newImage("sknd", 0, 0, 14, nil)
	if alphaCounter < 1
	and thisSwitchingObject.alpha < 1.1
	and thisSwitchingObject.alpha > -0.1 then
	    thisSwitchingObject.alpha = thisSwitchingObject.alpha + 0.2
	    alphaCounter = alphaCounter + 0.2
	else
	    thisSwitchingObject.enabled = "enabled"
	    Runtime:removeEventListener("enterFrame", switchAlphaTransparency)
	end
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
	    thisActualFlippedObject.xScale = actualFlippedObjectValue2
	    physics.removeBody(thisActualFlippedObject)
	    for z = 1, #shapeFormingArray do
		if shapeFormingArray[z][1] == thisActualFlippedObjectShape then
		    physics.addBody( thisActualFlippedObject, "static", { density=10, friction=1, bounce=0, shape=shapeFormingArray[z][positionFlippedObjectArray[a][8]] } )
		end
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
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][5]
		    or thisActualFlippedObjectShape == positionFlippedObjectArray[a][6] then
			thisActualFlippedObject.y = thisActualFlippedObject.y - flippedObjectMeasurementValue
		    elseif thisActualFlippedObjectShape == positionFlippedObjectArray[a][7] then
			thisActualFlippedObject.y = thisActualFlippedObject.y + flippedObjectMeasurementValue
		    end
		end
	    end
		
	    thisActualFlippedObject.state = actualFlippedObjectValue3
	    thisActualFlippedObject.transitionArrayState = thisActualFlippedObject.transitionArrayState + actualFlippedObjectValue4
	    
	    thisFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
	    thisFlippedObjectShape = thisActualFlippedObject.shape
	    thisFlippedObjectName = thisActualFlippedObject.name
	    
	    local thisNewFlippedObjectArray = {
		{"triangleTopLeftShape", 1, 3, 2, 225, 90, 55, -60, 52, 1, 0},
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
				frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + thisNewFlippedObjectArray[newT][11]
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
	    thisActualFlippedObject.flipped = true
	end
    end
    
    if thisActualFlippedObject.isFocus ~= true then
	flipVerticalCounter = 0
    end

end

local function addBackThisSwitchOnOffCounter ()
    if thisSwitch ~= null then
        thisSwitch.switchOnOffCounter = 0
    end
end

local function autoFanTransition(event)
    
    for b = 1, #shapeArray do
	
	if shapeArrayParameters[b]["type"] == "autoFan" or shapeArrayParameters[b]["type"] == "spitter" then
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
		    thisFan.type = shapeArrayParameters[b]["type"]
		    Runtime:addEventListener( "enterFrame", fanCentering )
		    direction = shapeArray[b].direction
		    
		    if shapeArrayParameters[b]["type"] == "spitter" then
			spitterCounter = 0
		    end
	    end
	elseif shapeArrayParameters[b]["type"] == "switch" then
	    if shapeArray[b].switchCounter == 0 then
		if  (instance2.x) > shapeArray[b].x
		and (instance2.x) < (shapeArray[b].x + 60)
		and instance2.y > shapeArray[b].y
		and instance2.y < (shapeArray[b].y + 39)
		and shapeArray[b].switchOnOffCounter == 0 then
		    thisSwitch = shapeArray[b]
		    thisSwitch.switchOnOffCounter = 1
			for a = 1, #shapeArray do
			    if shapeArrayParameters[a]["name"] == shapeArrayParameters[b]["props"][1] then
				thisSwitchingObject = shapeArray[a]
				if shapeArrayParameters[b]["subType"] == "flip-horizontal"
				or shapeArrayParameters[b]["subType"] == "flip-vertical" then
				    thisActualFlippedObject = shapeArray[a]
				    thisActualFlippedObjectName = thisActualFlippedObject.name
				    thisActualFlippedObjectShape = thisActualFlippedObject.shape
				    thisActualFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
				    thisActualFlippedObjectDirection = shapeArrayParameters[b]["subType"]
				    positionNewFlippedObject()
				    if shapeArrayParameters[b]["props"][3] then
					for c = 1, #shapeArray do
					    if shapeArrayParameters[c]["name"] == shapeArrayParameters[b]["props"][3] then
						thisSwitchingObject = shapeArray[c]
						thisActualFlippedObject = shapeArray[c]
						thisActualFlippedObjectName = thisActualFlippedObject.name
						thisActualFlippedObjectShape = thisActualFlippedObject.shape
						thisActualFlippedObjectTransitionArrayState = thisActualFlippedObject.transitionArrayState
						if shapeArrayParameters[b]["props"][4] then
						    thisActualFlippedObjectDirection = shapeArrayParameters[b]["props"][4]
						else
						    thisActualFlippedObjectDirection = shapeArrayParameters[b]["subType"]
						end
						positionNewFlippedObject()
					    end
					end
				    end
				end
			    end
		        end
			
			if shapeArrayParameters[b]["props"][2] == "one-way" then
			    shapeArray[b].switchCounter = 1
			end
			if shapeArrayParameters[b]["subType"] == "door-open" then
			    alphaCounter = 0
			    Runtime:addEventListener( "enterFrame", switchAlphaTransparency )
			end
			if shapeArrayParameters[b]["props"][2] ~= "one-way" then
			    timer.performWithDelay(300, addBackThisSwitchOnOffCounter)
			end
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
		nextDirection = shapeArrayParameters[z]["props"][3]
		nextHorzScreen = shapeArrayParameters[z]["location"]["xScreen"]
		nextVertScreen = shapeArrayParameters[z]["location"]["yScreen"]
		nextHorzSquare = shapeArrayParameters[z]["subType"]
		nextVertSquare = shapeArrayParameters[z]["props"][1]
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
	if shapeArrayParameters[b]["type"] == "door" then
	    thisChangeScreenDirection = shapeArrayParameters[b]["subType"]
	    if shapeArray[b].enabled == "enabled" then
		if shapeArrayParameters[b]["subType"] == "right" then
		    if (instance2.x + instance2.contentWidth) > (((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth) + 490)
		    and (instance2.x + instance2.contentWidth) < (((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth) + 510)
		    and direction == "right" then
			higherY = ((shapeArrayParameters[b]["location"]["ySquare"] - 1) * 52) + 30
			if instance2.y > higherY
			and instance2.y < (higherY + 52)
			and ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
			and ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
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
		elseif shapeArrayParameters[b]["subType"] == "left" then
		    if (instance2.x + instance2.contentWidth) < (((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth) + 10)
		    and (instance2.x + instance2.contentWidth) > (((shapeArrayParameters[b]["location"]["xScreen"] - 1) * display.contentWidth))
		    and direction == "left" then
			higherY = ((shapeArrayParameters[b]["location"]["ySquare"] - 1) * 52) + 30
			if instance2.y > higherY
			and instance2.y < (higherY + 52)
			and ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
			and ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
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
		elseif shapeArrayParameters[b]["subType"] == "up" then
		    if (instance2.y + instance2.contentHeight) < (((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) + 10)
		    and (instance2.y + instance2.contentHeight) > (((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) - 20)
		    and direction == "up" then
			lowerX = ((shapeArrayParameters[b]["location"]["xSquare"] - 1) * 60) + 30
			if instance2.x > lowerX
			and instance2.x < (lowerX + 60)
			and ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
			and ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
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
		elseif shapeArrayParameters[b]["subType"] == "down" then
		    if (instance2.y + instance2.contentHeight) > (((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) + 327)
		    and (instance2.y + instance2.contentHeight) < (((shapeArrayParameters[b]["location"]["yScreen"] - 1) * display.contentHeight) + 335)
		    and direction == "down" then
			lowerX = ((shapeArrayParameters[b]["location"]["xSquare"] - 1) * 60) + 30
			if instance2.x > lowerX
			and instance2.x < (lowerX + 60)
			and ballScreenVertValue == shapeArrayParameters[b]["location"]["yScreen"]
			and ballScreenHorzValue == shapeArrayParameters[b]["location"]["xScreen"]
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
			
    stillTransitioningCounter = 0
    transitionMoveCounter = 0
    secondTransitionMoveCounter = 0
    for z = 1, #shapeArray do
	if shapeArrayParameters[z]["name"] == thisTransitionObject.name
	and shapeArrayParameters[z]["type"] == "shape" then
	    local function addPhysicsBodyToShape ()
		for a = 1, #shapeFormingArray do
		    if shapeFormingArray[a][1] == shapeArrayParameters[z]["subType"] then
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
	elseif shapeArrayParameters[z]["name"] == thisTransitionObject.name
	and shapeArrayParameters[z]["type"] ~= "shape" then
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
	    if isBallMovingState == "true" then
		Runtime:addEventListener("enterFrame", moveSomething)
		Runtime:addEventListener( "enterFrame", edgesTransitions )
		shouldBallMoveState = "true"
	    end
	    pauseScreen.state = "unpaused"
	end
    end
end


function resetLevel()
    
    -- simply go to level1.lua scene
    storyboard.purgeScene( "main" )
    storyboard.gotoScene( "reset", "flip" )
     
    return true -- indicates successful touch

end

local function buttonListener(event)
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
	else
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
    
    if event.target.name == "random" then
	if event.phase == "began" then
	    shouldBallMoveState = "false"
	    Runtime:removeEventListener("enterFrame", moveSomething)
	    Runtime:removeEventListener( "enterFrame", edgesTransitions )
	    Runtime:addEventListener("enterFrame", showPauseScreen)
	end
    end
    
    if event.target.name == "backToPlay" then
	if event.phase == "began" then
	    if pauseScreen.state == "paused" then
	        Runtime:addEventListener("enterFrame", showPauseScreen)
	    end
	end
    end
    
    if event.target.name == "reset" then
	if event.phase == "began" then
	    resetLevel()
	end
    end
    
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
		text3e.text = "hi"
		text3e.x = event.target.x + 60
		text3e.y = event.target.y + 40
		thisFlippedCounterObject = event.target
		local function addThisCounterBack ()
		    thisFlippedCounterObject.flipDisabled = false
		    text3e.text = ""
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
		    local text1 = display.newText(thisActualFlippedObject.originalState, 0, 0, nil, 14)
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
    
end

rightBtn =
        widget.newButton{
	    label=">",
	    labelColor = { default={255}},
	    default="button.png",
	    width=30, height=30,
	    onRelease = onPlayBtnRelease	-- event listener function
	}
	--rightBtn:setReferencePoint( display.CenterReferencePoint )
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
	--backBtn:setReferencePoint( display.CenterReferencePoint )
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
	    width=30, height=30	-- event listener function
	}
	--playBtn:setReferencePoint( display.CenterReferencePoint )
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
	--resetBtn:setReferencePoint( display.CenterReferencePoint )
	resetBtn.x = display.contentWidth - 60
	resetBtn.y = display.contentHeight - 15
        resetBtn.name = "reset"
	
randomBtn =
        widget.newButton{
	    label="r",
            labelColor = { default={255}, over={128} },
	    default="button.png",
	    over="button-over.png",
	    width=30, height=30,
	    onRelease = listener	-- event listener function
	}
	--randomBtn:setReferencePoint( display.CenterReferencePoint )
	randomBtn.x = display.contentWidth - 100
	randomBtn.y = display.contentHeight - 15
        randomBtn.name = "random"

	
backToPlayBtn =
        widget.newButton{
	    label="l",
            labelColor = { default={255}, over={128} },
	    default="button.png",
	    over="button-over.png",
	    width=30, height=30	-- event listener function
	}
	--backToPlayBtn:setReferencePoint( display.CenterReferencePoint )
	backToPlayBtn.x = pauseScreen.x + 100
	backToPlayBtn.y = pauseScreen.y + 115
        backToPlayBtn.name = "backToPlay"
	pauseScreenObjectsGroup:insert(backToPlayBtn)
	        
playBtn:addEventListener( "touch", buttonListener )
resetBtn:addEventListener( "touch", buttonListener )
backBtn:addEventListener( "touch", buttonListener )
rightBtn:addEventListener( "touch", buttonListener )

randomBtn:addEventListener( "touch", buttonListener )

backToPlayBtn:addEventListener( "touch", buttonListener )

pauseScreen:toFront()
pauseScreenObjectsGroup:toFront()


for c=1, #shapeArray do
    if shapeArrayParameters[c]["type"] == "shape" then
	shapeArray[c]:addEventListener("collision", on_Triangle_Collision)
    elseif shapeArrayParameters[c]["type"] == "manualFan" or shapeArrayParameters[c]["type"] == "spitter" then
	shapeArray[c]:addEventListener( "touch", listener )
    end
    
    for d=1, #transitionArrayIndex do
	if transitionArrayIndex[d][1][1] == shapeArrayParameters[c]["name"] then
	    shapeArray[c]:addEventListener("touch", listener)
	end
    end
end

scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene" )

return scene