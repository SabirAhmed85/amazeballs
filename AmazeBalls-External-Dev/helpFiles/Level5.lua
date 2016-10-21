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

    --------  CREATE OBJECTS HERE   -----------

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleTopRightShape", 1, 1})
        
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 1, "down"} )

    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 1, "triangleTopRightShape", 1, _, "breakable"})
    
    table.insert(shapeArrayParameters,{"tunnel","tunnel1", 1, 1, 7, 1, 7, 5, "right", "left"} )
   
    table.insert(shapeArrayParameters,{"gem","purple1", 1, 1, 2, 5, "purple"} )
     
    table.insert(shapeArrayParameters,{"gem","purple2", 1, 1, 3, 5, "purple"} )
    
    table.insert(shapeArrayParameters,{"gem","red", 1, 1, 5, 1, "red"} )
    
    --table.insert(shapeArrayParameters,{"gem","gold", 1, 1, 6, 1, "gold"} )
    
    --table.insert(shapeArrayParameters,{"laser", "long-beam", 1, 1, 6, 1, "down"} )
    
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 1, 2, "up", "right", "none", "left"} )
    table.insert(transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{"blue"},{1},{1},{1,1,1,2},{2},{1,1,1,3},{3},{1,1,2,3}})
    
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 3, "down"} )
    table.insert(transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"silver"},{3},{1},{1,1,2,2},{2},{1,1,2,2},{3},{1,1,4,3},{4},{1,1,4,4},{5},{1,1,6,5}})
    
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 3, "triangleTopLeftShape", 1, 2})
    table.insert(transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 3, "triangleTopRightShape", 1})
    
    --table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 5, 3, "triangleBottomLeftShape", 1})
    
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right", "enabled"} )
    
    table.insert(shapeArrayParameters,{"manualFan","manFan1_1_1", 1, 1, 1, 4, "down"} )
    
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 3, 4, "left"} )
    
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1, 4})
    
    
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1})
    
    table.insert(shapeArrayParameters,{"manualFan","manFan3_1_1", 1, 1, 3, 5, "up"} )
    
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 5, 5, "triangleTopLeftShape", 1})
    
    ---------
    -------- SCREEN 2

local j = 0

local pauseScreen

local gem_counter = {
    purple = 0,
    red = 0,
    gold = 0
}

local shapeRelatedArrays = require ( "modules.shape-related-arrays" )

directionArray = shapeRelatedArrays.directionArray

shapeFormingArray = shapeRelatedArrays.shapeFormingArray

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
	    "kill",
	    "left",
	    "right",
	    "up"
	},
        {2},{
	    "left",
	    "down",
	    "up",
	    "kill"
	}
    }
    
    ,
    
    {	{1},{
	    "down",
	    "up",
	    "left",
	    "kill"
	},
        {2},{
	    "down",
	    "kill",
	    "right",
	    "up"
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
	    "left",
	    "down",
	    "up",
	    "kill"
	}
    }
    
    ,
    
    {	{1},{
	    "down",
	    "up",
	    "left",
	    "kill"
	},
        {2},{
	    "left",
	    "down",
	    "up",
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
	    "left",
	    "down",
	    "up",
	    "kill"
	}
    }
    
    -- every time you enter a new Array, put the comma into the code before it, same as above
}

currentLevel = 5

local screenHorzTotal = 2
local screenVertTotal = 3
local ballFirstScreenHorzValue = 1
local ballFirstScreenVertValue = 1
local ballFirstHorzSquare = 2
local ballFirstVertSquare = 2
local ballFirstDirection = "down"
local initialDirection = "down"

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
local gemCounter = 0
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

local killBar, playBtn, mapScreen, connector, connectorTubeHorizontal, connectorTubeVertical, instance2, randomBtn, resetBtn, backBtn, rightBtn, spitter, autoFan, triangle, switch, manualFan, door1, gem
local pressCount = 0
local playCounter = 0
local isBallMovingState = "false"

local bullet = {}
local transitionForProjectile = {
    ball = {},
    bullet = {}
}

local createdBulletCounter = 0
local moveBulletOff = true

myGameSettings = loadTable("myGameSettings.json")

local screenChangingScript = require("modules.screen-changing-functions")
	mapButtonStateCheck = screenChangingScript.mapButtonStateCheck
	mapButtonTransparencyCheck = screenChangingScript.mapButtonTransparencyCheck
	changeToRightScreen = screenChangingScript.changeToRightScreen
	resettingScreenChangeCounter = screenChangingScript.resettingScreenChangeCounter

local changeToRightScreen

local function returnViewToBallScreen (event)

    local function respawnBall()
        thisScreenHorzValue = ballFirstScreenHorzValue
        thisScreenVertValue = ballFirstScreenVertValue
        ballScreenHorzValue = ballFirstScreenHorzValue
        ballScreenVertValue = ballFirstScreenVertValue
        mapButtonStateCheck(thisScreenHorzValue, thisScreenVertValue, screenHorzTotal, screenVertTotal, leftBtn, rightBtn, upBtn, downBtn, mapScreen, mapButtonStateCheck)
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

projectileMovementRemoveAndRespawnScript = require("modules.projectile-movement-remove-and-respawn-functions")
	moveProjectileArray = projectileMovementRemoveAndRespawnScript.moveProjectileArray
	moveProjectile = projectileMovementRemoveAndRespawnScript.moveProjectile
	removeProjectile = projectileMovementRemoveAndRespawnScript.removeProjectile
	bullet = projectileMovementRemoveAndRespawnScript.bullet

projectileReboundScript = require("modules.projectile-rebound-functions")
	calculateReboundFunction = projectileReboundScript.calculateReboundFunction
	detectRebound = projectileReboundScript.detectRebound

local function on_Triangle_Collision( event )
    if event.target.objectType == "shape"
    and ( event.phase == "began" ) then

    	detectRebound(event, directionArray, changeProjectileDirection, instance2, thisObjectBreakability, direction, shouldBallMoveState, isBallMovingState, startBallAgain, specialRuleFunction, directionCounter, transitionForProjectile)
    	transitionForProjectile = projectileReboundScript.transitionForProjectile	
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

local objectToBallTransitionScript = require("modules.all-object-to-ball-transition-functions")
	autoFanAndEtcTransition = objectToBallTransitionScript.autoFanAndEtcTransition

local resetFanCounter = function (obj)
    obj.autoFanCounter = 0
end

local objectFlipScript = require ("modules.object-flip-function")
positionNewFlippedObject = objectFlipScript.positionNewFlippedObject
fanCentering = objectToBallTransitionScript.fanCentering

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
	autoFanAndEtcTransition(shapeArray, shapeArrayParameters, fanCentering, instance2, prepareForFanCentering, playBtn, randomBtn, pauseButtonsEnabled, bullet, gemCounter, gem_counter, moveSomethingCounter, projectileMovementRemoveAndRespawnScript, resetFanCounter, isBallMovingState, shouldBallMoveState, myGameSettings, transitionForProjectile, rightScreenEdge, leftScreenEdge, removeProjectile)
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

bulletFire = projectileMovementRemoveAndRespawnScript.bulletFire

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
						    changeToRightScreen(screenValue, screenChangeType, thisChangeScreenDirection, thisScreenHorzValue, thisScreenVertValue, mapScreen, mapButtonStateCheck, backgroundObjectsGroup, screenObjectsGroup, midScreenObjectsGroup, frontScreenObjectsGroup)
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
						    changeToRightScreen(screenValue, screenChangeType, thisChangeScreenDirection, thisScreenHorzValue, thisScreenVertValue, mapScreen, mapButtonStateCheck, backgroundObjectsGroup, screenObjectsGroup, midScreenObjectsGroup, frontScreenObjectsGroup)
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
			                            changeToRightScreen(screenValue, screenChangeType, thisChangeScreenDirection, thisScreenHorzValue, thisScreenVertValue, mapScreen, mapButtonStateCheck, backgroundObjectsGroup, screenObjectsGroup, midScreenObjectsGroup, frontScreenObjectsGroup)
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
						    changeToRightScreen(screenValue, screenChangeType, thisChangeScreenDirection, thisScreenHorzValue, thisScreenVertValue, mapScreen, mapButtonStateCheck, backgroundObjectsGroup, screenObjectsGroup, midScreenObjectsGroup, frontScreenObjectsGroup)
						    instance2.x = (lowerX + 30)
						end
				    end
				end
		    end
		end
    end
end

--[[

local function createAndControlLaser (event)
    local function laserCollision (event)
        local text = display.newText("hi", 20, 20, nil, 14)
        if event.phase == "began" then
            
        local text = display.newText("hi", 20, 20, nil, 14) 
        end
    end
    for a = 1, #shapeArray do
        if shapeArrayParameters[a][1] == "laser" then
            if shapeArrayParameters[a][7] == "down" then
                if shapeArray[a].laserCounter == 0 then
                    thisLaserX = shapeArray[a].x
                    thisLaserY = shapeArray[a].y
                    shapeArray[a].laserCounter = 1
                end
                if thisLaserY < display.contentHeight then
                    shapeArray[a].laser = display.newImage("flipPositionSwitchNumber2.png")
                    physics.addBody( shapeArray[a].laser, "static", { density=10, friction=1, bounce=0, gravity = 0 } )
                    shapeArray[a].laser:addEventListener("collision", laserCollision)
                    frontScreenObjectsGroup:insert( shapeArray[a].laser )
                    shapeArray[a].laser.x = thisLaserX
                    shapeArray[a].laser.y = thisLaserY
                    thisLaserY = thisLaserY + 20
                end
            end
        end
    end
end

]]--

local transitionFunctionScript = require ("modules.all-transitioning-functions")
	transitionArrayStateCheckNew = transitionFunctionScript.transitionArrayStateCheckNew

--transitionMoveSomething = transitionFunctionScript.transitionMoveSomething()

local function transitionMoveSomething (event)

	local prepareSpitterTransition = function (direction, distanceConstant)

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
					thisSpitterDirectionArray[a].x = thisSpitterDirectionArray[a].x + (distanceConstant * thisTransitionXDirection)
				else
					thisSpitterDirectionArray[a].y = thisSpitterDirectionArray[a].y + (distanceConstant * thisTransitionXDirection)
				end	
		    end
		end

		if thisTransitionObject.isBallPresent == true then
			if direction == "horz" then
				instance2.x = instance2.x + (distanceConstant * thisTransitionXDirection)
			else
				instance2.y = instance2.y + (distanceConstant * thisTransitionXDirection)
			end
		end
	end

	local firstSlideTransition = function (thisTransitionDirection)
		if thisTransitionDirection == "horz" then
			thisTransitionSpeed = 30
	    	thisTransitionObject.x = thisTransitionObject.x + (thisTransitionSpeed * thisTransitionXDirection)
	    else
			thisTransitionSpeed = 26
	    	thisTransitionObject.y = thisTransitionObject.y + (thisTransitionSpeed * thisTransitionXDirection)
	    end
    	if thisTransitionObject.objectType == "spitter" then
			prepareSpitterTransition(thisTransitionDirection, thisTransitionSpeed)
    	elseif thisTransitionObject.objectType == "shape" then
            for a = 1, frontScreenObjectsGroup.numChildren do
                if frontScreenObjectsGroup[a].relatedShape == thisTransitionObject.name then
                	if thisTransitionDirection == "horz" then
                    	frontScreenObjectsGroup[a].x = frontScreenObjectsGroup[a].x + (thisTransitionSpeed * thisTransitionXDirection)
                    else
                    	frontScreenObjectsGroup[a].y = frontScreenObjectsGroup[a].y + (thisTransitionSpeed * thisTransitionXDirection)
                    end
                end
            end
        elseif thisTransitionObject.objectType == "manualFan"
        or thisTransitionObject.objectType == "autoFan" then
        	if thisTransitionDirection == "horz" then
            	thisTransitionObject.directionIndicatorArrow.x = thisTransitionObject.directionIndicatorArrow.x + (thisTransitionSpeed * thisTransitionXDirection)
        	else
        		thisTransitionObject.directionIndicatorArrow.y = thisTransitionObject.directionIndicatorArrow.y + (thisTransitionSpeed * thisTransitionXDirection)
        	end
        end
	end

	local endTransition = function (sign)
		if (sign == "plus") then
			thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState + 1
		else
			thisTransitionObject.transitionArrayState = thisTransitionObject.transitionArrayState - 1
		end
	    transitionArrayStateCheckNew(thisTransitionObject, transitionArrayIndex, stillTransitioningCounter, transitionMoveCounter, secondTransitionMoveCounter, shapeArray, shapeArrayParameters, instance2, connectorArray)
	    	stillTransitioningCounter = transitionFunctionScript.stillTransitioningCounter
		    transitionMoveCounter = transitionFunctionScript.transitionMoveCounter
		    secondTransitionMoveCounter = transitionFunctionScript.secondTransitionMoveCounter
	    Runtime:removeEventListener( "enterFrame", transitionMoveSomething )
	end

    stillTransitioningCounter = 1
    
    thisTransitionObject.enabled = false
    if (thisTransitionObject.objectType == "shape") then
    	physics.removeBody( thisTransitionObject )
    end
    
    if thisTransitionDirection == "horz" then
		squareLength = 60
		transitionMoveCounterSpeed = 30
    else
		squareLength = 52
		transitionMoveCounterSpeed = 26
    end
    
    if transitionMoveCounter < (squareLength * storedTransitionDistance) then
        firstSlideTransition(thisTransitionDirection)
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
						prepareSpitterTransition("vert", 13)
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
				    endTransition("plus")
				end
		    else
				endTransition("plus")
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
						prepareSpitterTransition("horz", 20)
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
				    endTransition("minus")
				end
		    else
				endTransition("minus")
		    end
		else
		    if nextOrPrev == "next" then
				endTransition("plus")
		    else
				endTransition("minus")
		    end
		end
    end
    if thisTransitionObject.isFocus == true then
		thisTransitionObject.isFocus = false
		display.getCurrentStage():setFocus( nil )
    end 
end

local screenShowingScript = require ("modules.screen-showing-script")
showPauseScreen = screenShowingScript.showPauseScreen

function resetLevel()

    -- simply go to level1.lua scene
    storyboard.gotoScene( "reset", "slideDown", 150 )
     
    return true -- indicates successful touch

end

local eventStartY, eventStartX

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
                    thisFlipDirection = transitionArrayIndex[d][2][1]
                    positionNewFlippedObject(event.target, thisFlipDirection, flipVerticalCounter, frontScreenObjectsGroup)
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
                    
                    local function startTransitionMoveSomething ()
                        stillTransitioningCounter = 1
                        Runtime:addEventListener( "enterFrame", transitionMoveSomething)
                    end
                    
                    local function planTransitionMoveSomething(relevantSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext )
                        if relevantSwipe > moreThanThreshold and relevantSwipe < lessThanThreshold and object1Counter == 0 then
                            thisTransitionXDirection = transXDirection
                            thisTransitionDirection = transDirection
                            nextOrPrev = prevOrNext
                            if thisTransitionDistance < 0 then
                                storedTransitionDistance = (thisTransitionDistance) * -1
                            else
                                storedTransitionDistance = thisTransitionDistance
                            end
                            if stillTransitioningCounter == 0 then
                                startTransitionMoveSomething()
                            end
                        end
                    end
                    
                    local function planTransitionMoveSomethingSetUp (topSwipe, bottomSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext)
                        if (topSwipe) < 10 and (topSwipe) > -10 and (eventTotalTime) < 350 then
                            planTransitionMoveSomething(bottomSwipe, lessThanThreshold, moreThanThreshold, transXDirection, transDirection, prevOrNext)
                        end
                    end
                    
                    local function alternativePlanTransitionMoveSomethingSetUp(irrelevantSwipe, relevantSwipe, otherRelevantSquare, thisRelevantSquare, prevOrNext, transDirection)
                        if (irrelevantSwipe) < 10 and (irrelevantSwipe) > -10 and (eventTotalTime) < 350 then
                            if otherRelevantSquare ~= "null" and otherRelevantSquare < thisRelevantSquare then
                                planTransitionMoveSomething(relevantSwipe, -10, -10000, -1, transDirection, prevOrNext)
                            elseif otherRelevantSquare ~= "null" and otherRelevantSquare > thisRelevantSquare then
                                planTransitionMoveSomething(relevantSwipe, 10000, 10, 1, transDirection, prevOrNext)
                            end
                        end
                    end
                    
                    if event.target.nextTransitionHorzSquare ~= "null"
                    and event.target.nextTransitionHorzSquare > event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.nextTransitionHorzSquare - event.target.thisTransitionHorzSquare
                        
                        planTransitionMoveSomethingSetUp(ySwipe, xSwipe, 10000, 10, 1, "horz", "next")
                    elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare < event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.thisTransitionHorzSquare - event.target.nextTransitionHorzSquare
                        
                        planTransitionMoveSomethingSetUp(ySwipe, xSwipe, -10, -10000, -1, "horz", "next")
                    elseif event.target.nextTransitionHorzSquare ~= "null" and event.target.nextTransitionHorzSquare == event.target.thisTransitionHorzSquare then
                        thisTransitionDistance = event.target.nextTransitionVertSquare - event.target.thisTransitionVertSquare
                        
                        alternativePlanTransitionMoveSomethingSetUp(xSwipe, ySwipe, event.target.nextTransitionVertSquare, event.target.thisTransitionVertSquare, "next", "vert")
                    end
                    
                    if  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare > event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.prevTransitionVertSquare - event.target.thisTransitionVertSquare
                        
                        planTransitionMoveSomethingSetUp(xSwipe, ySwipe, 10000, 10, 1, "vert", "prev")
                    elseif  event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare < event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.thisTransitionVertSquare - event.target.prevTransitionVertSquare
                                
                        planTransitionMoveSomethingSetUp(xSwipe, ySwipe, -10, -10000, -1, "vert", "prev")
                    elseif event.target.prevTransitionVertSquare ~= "null" and event.target.prevTransitionVertSquare == event.target.thisTransitionVertSquare then
                        thisTransitionDistance = event.target.prevTransitionHorzSquare - event.target.thisTransitionHorzSquare
                                    
                        alternativePlanTransitionMoveSomethingSetUp(ySwipe, xSwipe, event.target.prevTransitionHorzSquare, event.target.thisTransitionHorzSquare, "prev", "horz")
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
            and ballActivateButtonSet == true then
                if event.phase == "began" then
                    shapeArray[c]:setSequence("on")
                    event.target.isEnabledNow = true
                    if manualFanCounter == 0 then
                        manualFanCounter = 1
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
                        shouldBallMoveState = "true"
                        isBallMovingState = "true"
                        Runtime:addEventListener( "enterFrame", moveSomething)
                        instance2:setSequence(direction)
                        local function reactivateBallSpitter ()
                            thisBallSpitter.isBallPresent = false
                        end
                        timer.performWithDelay(75, reactivateBallSpitter)
                    end
                    
                    if (ySwipe) < 10 and (ySwipe) > -10 and (eventTotalTime) > 10 and (eventTotalTime) < 600 then
                        if (xSwipe) > 7 and spitterCounter == 0 and event.target.rightEnabled == true and event.target.isBallPresent == true then
                            direction = "right"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        elseif (xSwipe) < -7 and spitterCounter == 0 and event.target.leftEnabled == true and event.target.isBallPresent == true then
                            direction = "left"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        end
                    end
                    
                    if (xSwipe) < 10 and (xSwipe) > -10 and (eventTotalTime) > 10 and (eventTotalTime) < 600 then
                        if (ySwipe) > 7 and spitterCounter == 0 and event.target.downEnabled == true and event.target.isBallPresent == true then
                            direction = "down"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        elseif (ySwipe) < -7 and spitterCounter == 0 and event.target.upEnabled == true and event.target.isBallPresent == true then
                            direction = "up"
                            thisBallSpitter = event.target
                            moveBallFromSpitter()
                        end
                    end
                    
                    local function addBackAutoFan ()
                        Runtime:addEventListener("enterFrame", autoFanTransition)
                    end
                    
                    timer.performWithDelay(90, addBackAutoFan, 1)
                end
            end
        end
    end
    
end

local buttonListenerScript = require("modules.button-listener-functions")
	mapButtonFunctionArray = buttonListenerScript.mapButtonFunctionArray
	beganPlayPressedFunction = buttonListenerScript.beganPlayPressedFunction
	movedPlayPressedFunction = buttonListenerScript.movedPlayPressedFunction
	endedPlayPressedFunction = buttonListenerScript.endedPlayPressedFunction
	mapButtonPressedFunction = buttonListenerScript.mapButtonPressedFunction
	pauseButtonPressedFunction = buttonListenerScript.pauseButtonPressedFunction
	backToPlayButtonPressedFunction = buttonListenerScript.backToPlayButtonPressedFunction
	resetButtonPressedFunction = buttonListenerScript.resetButtonPressedFunction
	backToMainButtonPressedFunction = buttonListenerScript.backToMainButtonPressedFunction

    changeToRightScreen = screenChangingScript.changeToRightScreen

local function mapButtonListener (event)
    if event.phase == "began"
    and manualScreenChangeCounter == 0 then
    	local resetScreenChangeCounter = function ()
			resettingScreenChangeCounter()
			manualScreenChangeCounter = screenChangingScript.manualScreenChangeCounter
			thisScreenVertValue = screenChangingScript.thisScreenVertValue
		    thisScreenHorzValue = screenChangingScript.thisScreenHorzValue
		end
        manualScreenChangeCounter = 1
		mapButtonFunctionArray[event.target.name](manualScreenChangeCounter, thisScreenVertValue, thisScreenHorzValue, screenVertTotal, screenHorzTotal, mainScreenChangeSpeed, changeToRightScreen, upBtn, rightBtn, downBtn, leftBtn, backgroundObjectsGroup, screenObjectsGroup, midScreenObjectsGroup, frontScreenObjectsGroup, mapScreen, resetScreenChangeCounter)

    end
end

local function buttonListener(event)
    if event.target.name == "play" then
    	if event.phase == "began" then
		  	beganPlayPressedFunction(thisScreenHorzValue, ballScreenHorzValue, thisScreenVertValue, ballScreenVertValue, pressCount, moveSomethingCounter, transitionForProjectile, moveProjectile, instance2, backBtn, doorTransition, tunnelTransition, autoFanTransition, bulletFire, ballActivateButtonSet, isBallMovingState, shouldBallMoveState, pressCount, shapeArray, shapeArrayParameters, createdBulletUsed, relevantBulletIndex, moveProjectileArray, rightScreenEdge, leftScreenEdge, removeProjectile, startBallAgain, direction, initialDirection, returnViewToBallScreen, ballFirstScreenHorzValue, ballFirstScreenVertValue, ballFirstHorzSquare, ballFirstVertSquare)
	    		pressCount = buttonListenerScript.pressCount
	    		ballActivateButtonSet = buttonListenerScript.ballActivateButtonSet
	    		isBallMovingState = buttonListenerScript.isBallMovingState
	        	shouldBallMoveState = buttonListenerScript.shouldBallMoveState
	    elseif event.phase == "moved" then
	    	movedPlayPressedFunction(event, backBtn, ballActivateButtonSet, shapeArray)
	    		ballActivateButtonSet = buttonListenerScript.ballActivateButtonSet
	    elseif event.phase == "ended" then
	    	endedPlayPressedFunction(backBtn, ballActivateButtonSet, shapeArray)
	    		ballActivateButtonSet = buttonListenerScript.ballActivateButtonSet
		end
    end
    
    if event.target.name == "map" then
        if event.phase == "began" then
            mapButtonPressedFunction(mapScreen, mapShowCounter, pauseButtonsEnabled, ballActivateButtonSet, backBtn, shouldBallMoveState, isBallMovingState, autoFanTransition, stillTransitioningCounter, transitionMoveSomething, playBtn, shapeArray, shapeArrayParameters, transitionArrayIndex, listener, buttonListener, mapButtonTransparencyCheck, mapButtonStateCheck, mapButtonListener, rightBtn, leftBtn, upBtn, downBtn, thisScreenHorzValue, ballScreenHorzValue, thisScreenVertValue, ballScreenVertValue, backgroundObjectsGroup, screenObjectsGroup, frontScreenObjectsGroup, midScreenObjectsGroup, returnToBallVertTransition, mainScreenChangeSpeed, returnToBallHorzTransition, returnToBallScreenVertTransitionOver, returnToBallScreenHorzTransitionOver, playBtn)
				ballActivateButtonSet = buttonListenerScript.ballActivateButtonSet
			    mapShowCounter = buttonListenerScript.mapShowCounter
			    shouldBallMoveState = buttonListenerScript.shouldBallMoveState
			    mapScreen = buttonListenerScript.mapScreen
			    thisScreenHorzValue = buttonListenerScript.thisScreenHorzValue
			    thisScreenVertValue = buttonListenerScript.thisScreenVertValue
			    returnToBallVertTransition = buttonListenerScript.returnToBallVertTransition
			    returnToBallHorzTransition = buttonListenerScript.returnToBallHorzTransition
			    returnToBallScreenHorzTransitionOver = buttonListenerScript.returnToBallScreenHorzTransitionOver
			    returnToBallScreenVertTransitionOver = buttonListenerScript.returnToBallScreenVertTransitionOver
		end
    end
    
    if event.target.name == "random" then
		if event.phase == "began"
	    and pauseButtonsEnabled == true then
		    pauseButtonPressedFunction(shouldBallMoveState, pauseButtonsEnabled, autoFanTransition, transitionMoveSomething, showPauseScreen, pauseScreen, pauseScreenObjectsGroup, isBallMovingState, randomBtn, playBtn, backBtn, mapScreen, buttonListener, listener, shapeArrayParameters, shapeArray, transitionArrayIndex)
				shouldBallMoveState = buttonListenerScript.shouldBallMoveState
		end
    end
    
    if event.target.name == "backToPlay" then
		if event.phase == "began" then
		    backToPlayButtonPressedFunction(pauseScreen, showPauseScreen, pauseScreenObjectsGroup, isBallMovingState, mapScreen, shouldBallMoveState, playBtn, backBtn, randomBtn, buttonListener, pauseButtonsEnabled, autoFanTransition, transitionMoveSomething, buttonListener, shapeArrayParameters, shapeArray, transitionArrayIndex, listener)
				shouldBallMoveState = buttonListenerScript.shouldBallMoveState
		end
    end
    
    if event.target.name == "reset" then
		if event.phase == "began" then
	        resetButtonPressedFunction(direction, resetLevel)
	        	direction = buttonListenerScript.direction
		end
    end
    
    if event.target.name == "backToMain" then
		if event.phase == "began" then
	        backToMainButtonPressedFunction(storyboard)
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
        
        mapButtonStateCheck(thisScreenHorzValue, thisScreenVertValue, screenHorzTotal, screenVertTotal, leftBtn, rightBtn, upBtn, downBtn, mapScreen, mapButtonStateCheck)
        
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

local function removeIntroScreen()
    transition.to(introScreen, {alpha = 0, time = 750})
    transition.to(introScreen.valueText, {alpha = 0, time = 750})
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
    
    mapButtonStateCheck(thisScreenHorzValue, thisScreenVertValue, screenHorzTotal, screenVertTotal, leftBtn, rightBtn, upBtn, downBtn, mapScreen, mapButtonStateCheck)
    
    timer.performWithDelay(250, removeIntroScreen, 1)
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
    
    
    local function insertGroupsIntoMainGroup()

        -------------------------
        --Shape Objects In Game--
        -------------------------
        
        --------- SCREEN 1
        
        
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
        
        
        
        local function spawn (z)
            if shapeArrayParameters[z][1] == "autoFan"
            or shapeArrayParameters[z][1] == "spitter"
            or shapeArrayParameters[z][1] == "door"
            or shapeArrayParameters[z][1] == "tunnel" then
                object = display.newImage(shapeArrayParameters[z][1]..".png")
            elseif shapeArrayParameters[z][1] == "manualFan" then
                object = display.newSprite(manualFanImageSheet, manualFanSequenceData)
                object:play()
            elseif shapeArrayParameters[z][1] == "shape" then
                if shapeArrayParameters[z][7] == "triangleTopRightShape" then
                    object = display.newImage("triangleTopRight.png")
                elseif shapeArrayParameters[z][7] == "triangleBottomRightShape" then
                    object = display.newImage("triangleBottomRight.png")
                elseif shapeArrayParameters[z][7] == "triangleBottomLeftShape" then
                    object = display.newImage("triangleBottomLeft.png")
                elseif shapeArrayParameters[z][7] == "triangleTopLeftShape" then
                    object = display.newImage("triangleTopLeft.png")
                elseif shapeArrayParameters[z][7] == "triangleLeftAndRightShape" then
                    object = display.newImage("triangle.png")
                elseif shapeArrayParameters[z][7] == "triangleTopAndBottomShape" then
                    object = display.newImage("triangle.png")
                end
            elseif shapeArrayParameters[z][1] == "gem" then
                if shapeArrayParameters[z][7] == "purple" then
                    object = display.newImage("spitter-arrow.png")
                elseif shapeArrayParameters[z][7] == "red" then
                    object = display.newImage("flipPosition-arrow.png")
                elseif shapeArrayParameters[z][7] == "gold" then
                    object = display.newImage("flipPositionSwitchNumber2.png")
                end
            elseif shapeArrayParameters[z][1] == "endPoint" then
                object = display.newImage("tunnel.png")
            elseif shapeArrayParameters[z][1] == "characterChangePoint" then
                object = display.newImage("tunnel.png")
            elseif shapeArrayParameters[z][1] == "gun" then
                object = display.newImage("tunnel.png")
            end
            return object
        end
        for z = 1, #shapeArrayParameters do
            shapeArray[z] = spawn(z)
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
                        if (shapeArrayParameters[z][9] and shapeArrayParameters[z][9] ~= "_") then
                            shapeArrayParam = (shapeArrayParameters[z][9]) + 6
                            shapeArray[z].directionsArray = directionArrayIndex[shapeArrayParam]
                            shapeArray[z].directionsArrayAtIndex = shapeArrayParam
                        else
                            shapeArray[z].directionsArray = directionArrayIndex[shapeFormingArray[a][5]]
                            shapeArray[z].directionsArrayAtIndex = shapeFormingArray[a][5]
                        end
                        if (shapeArrayParameters[z][10] and shapeArrayParameters[z][10] == "breakable") then
                            shapeArray[z].breakable = true
                        else
                            shapeArray[z].breakable = false
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
            or shapeArrayParameters[z][1] == "switch"
            or shapeArrayParameters[z][1] == "gem"
            or shapeArrayParameters[z][1] == "endPoint"
            or shapeArrayParameters[z][1] == "characterChangePoint"
            or shapeArrayParameters[z][1] == "gun" then
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
            or shapeArrayParameters[z][1] == "spitter"
            or shapeArrayParameters[z][1] == "characterChangePoint" then
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
            
            if shapeArrayParameters[z][1] == "gem" then
                shapeArray[z].gemType = shapeArrayParameters[z][7]
                shapeArray[z].x = shapeArray[z].x + 23
                shapeArray[z].y = shapeArray[z].y + 21
                midScreenObjectsGroup:insert( shapeArray[z] )
            end
            
            if shapeArrayParameters[z][1] == "laser" then
                shapeArray[z].laserDirection = shapeArrayParameters[z][7]
                shapeArray[z].laserCounter = 0
                shapeArray[z].x = shapeArray[z].x + 23
                shapeArray[z].y = shapeArray[z].y + 21
                frontScreenObjectsGroup:insert( shapeArray[z] )
            end
            
            if shapeArrayParameters[z][1] == "endPoint" then
                shapeArray[z].enabled = true
            end
            
        end

        --- Create Transition Settings
        prepareTransitioningObjects = transitionFunctionScript.prepareTransitioningObjects
        prepareTransitioningObjects(transitionArrayIndex, shapeArray, shapeArrayParameters, connectorArray, backgroundObjectsGroup, addFlipIndicatorTriangles)
        
        backgroundGrid = display.newImage("background.png", 0, 0)
       
        ballAndButtonAndScreenCreateScript.createBall(ballScreenHorzValue, ballScreenVertValue, ballFirstHorzSquare, ballFirstVertSquare, midScreenObjectsGroup, direction)
        instance2 = ballAndButtonAndScreenCreateScript.instance2

        otherScreensAndButtonCreate()

        mapScreen = ballAndButtonAndScreenCreateScript.mapScreen
        group:insert(mapScreen) 
        
        pauseScreen = ballAndButtonAndScreenCreateScript.pauseScreen
        group:insert(pauseScreen)
    
    	backBtn = ballAndButtonAndScreenCreateScript.backBtn
        group:insert(backBtn)
            
    	playBtn = ballAndButtonAndScreenCreateScript.playBtn
    	group:insert(playBtn)
        
    	rightBtn = ballAndButtonAndScreenCreateScript.rightBtn
        group:insert(rightBtn)
        
    	leftBtn = ballAndButtonAndScreenCreateScript.leftBtn
        group:insert(leftBtn)
        
    	upBtn = ballAndButtonAndScreenCreateScript.upBtn
        group:insert(upBtn)
        
    	downBtn = ballAndButtonAndScreenCreateScript.downBtn
        group:insert(downBtn)
        
        randomBtn = ballAndButtonAndScreenCreateScript.randomBtn
        group:insert(randomBtn)
            
        backToPlayBtn = ballAndButtonAndScreenCreateScript.backToPlayBtn
        pauseScreenObjectsGroup:insert(backToPlayBtn)
                
        resetBtn = ballAndButtonAndScreenCreateScript.resetBtn
        pauseScreenObjectsGroup:insert(resetBtn)
            
        backToMainBtn = ballAndButtonAndScreenCreateScript.backToMainBtn
        pauseScreenObjectsGroup:insert(backToMainBtn)
            
        
        pauseScreen.y = display.contentHeight
    
    
        group:insert(pauseScreenObjectsGroup)
        introScreen:toFront()
        
        group:insert(backgroundGrid)
        introScreen:toFront()
        introScreen.valueText:toFront()
        
        group:insert(backgroundObjectsGroup)
        introScreen:toFront()
        
        group:insert(screenObjectsGroup)
        introScreen:toFront()
        introScreen.valueText:toFront()
        
        group:insert(midScreenObjectsGroup)
        introScreen:toFront()
        
        group:insert(frontScreenObjectsGroup)
        introScreen:toFront()
        introScreen.valueText:toFront()
        
    end
    
    timer.performWithDelay(300, insertGroupsIntoMainGroup, 1)
    
    ballAndButtonAndScreenCreateScript = require ("modules.ball-and-button-and-screen-create-script")
    createIntroScreen = ballAndButtonAndScreenCreateScript.createIntroScreen
    otherScreensAndButtonCreate = ballAndButtonAndScreenCreateScript.otherScreensAndButtonCreate
    ---------  INTRO SCREEN
    createIntroScreen(currentLevel)
    introScreen = ballAndButtonAndScreenCreateScript.introScreen
    
    group:insert(introScreen)
    group:insert(introScreen.valueText)

end


function scene:willEnterScene (event)
    local group = self.view

    instance2.x = 240
    instance2.y = 275
end


function scene:enterScene( event )

    local function delayedEnterScene ()
        local group = self.view
    
        introScreen:toFront()
        introScreen.valueText:toFront()
        --purge level
        storyboard.purgeScene( "LevelSelectScene" )
        storyboard.removeScene( "LevelSelectScene" )
        
        backToPlayBtn:addEventListener( "touch", buttonListener )
        resetBtn:addEventListener( "touch", buttonListener )
        backToMainBtn:addEventListener( "touch", buttonListener )
        
        -- Runtime:addEventListener("enterFrame", createAndControlLaser)
        
        for c=1, #shapeArray do
            if shapeArrayParameters[c][1] == "shape" then
                shapeArray[c].collision = on_Triangle_Collision
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
        introScreen:toFront()
        introScreen.valueText:toFront()
        
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
        end
    end
    
    timer.performWithDelay(300, delayedEnterScene, 1)
    
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
    Runtime:removeEventListener( "enterFrame", doorTransition )
    Runtime:removeEventListener( "enterFrame", tunnelTransition )
    Runtime:removeEventListener( "enterFrame", autoFanTransition )
    
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
        if shapeArrayParameters[z][1] == "gem" then
            shapeArray[z]:removeSelf()
        end
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