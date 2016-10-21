local storyboard = require ("storyboard")
local widget = require("widget")
local physics = require "physics"
physics.start()
local scene = storyboard.newScene()
storyboard.isDebug = true -- can be removed from Final version

--physics.setDrawMode("hybrid")
--
system.activate("multitouch")

--------------------
--------------------
local mainFunc = {}

mainFunc.tManager = require("classes.transitionManager")

mainFunc.tm = {
    ball = {},
    bullet = {},
    hookshot = {}
}



mainFunc.thisLevelSettings = require("modules.levels.level" .. currentLevel)

mainFunc.allLevelSettings = require("modules.levels.all-level-settings")
	mainFunc.allLevelSettings.createLevelSettings(mainFunc)
	shapeArray = mainFunc.allLevelSettings.shapeArray
	shapeArrayParameters = mainFunc.allLevelSettings.shapeArrayParameters

--------------------
local backgroundGrid

local autoFanArray = {}
local manualFanArray = {}
local triangleArray = {}

mainFunc.thisLevelSettings.createLevelObjects(mainFunc, shapeArrayParameters)

local j = 0

mainFunc.shapeRelatedArrays = require ( "modules.shape-related-arrays" )


myGameSettings = loadTable("myGameSettings.json")

mainFunc.screenChangingScript = require("modules.screen-changing-functions")


-- local function returnViewToBallScreen (event)

--     local function respawnBall()
--         mainFunc.screenChangingScript.thisScreenHorzValue = thisLevelSettings.ballFirstScreenHorzValue
--         mainFunc.screenChangingScript.thisScreenVertValue = ballFirstScreenVertValue
--         ballScreenHorzValue = thisLevelSettings.ballFirstScreenHorzValue
--         ballScreenVertValue = ballFirstScreenVertValue
--         mapButtonStateCheck(screenChangingScript, thisLevelSettings, mapButtonStateCheck)
--         pressCount = 0
--         mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 1
--         lifeCounter = lifeCounter + 1
--         mainFunc.ballAndButtonAndScreenCreateScript.backBtn:setSequence("go")
--     end
--     local targetXTransition, targetYTransition
--     if mainFunc.screenChangingScript.thisScreenHorzValue ~= thisLevelSettings.ballFirstScreenHorzValue then
        
--         if mainFunc.screenChangingScript.thisScreenHorzValue > thisLevelSettings.ballFirstScreenHorzValue then
--             totalReturnToBallHorzTransition = (screenChangingScript.thisScreenHorzValue - thisLevelSettings.ballFirstScreenHorzValue) * display.contentWidth
--         else
--             totalReturnToBallHorzTransition = (thisLevelSettings.ballFirstScreenHorzValue - mainFunc.screenChangingScript.thisScreenHorzValue) * display.contentWidth
--         end
--         targetXTransition = mainFunc.allLevelSettings.backgroundObjectsGroup.x - totalReturnToBallHorzTransition
--         leftScreenEdge = leftScreenEdge + totalReturnToBallHorzTransition
--         rightScreenEdge = rightScreenEdge + totalReturnToBallHorzTransition
    
--     else
--         targetXTransition = mainFunc.allLevelSettings.backgroundObjectsGroup.x
--     end
    
--     if mainFunc.screenChangingScript.thisScreenVertValue ~= thisLevelSettings.ballFirstScreenVertValue then
--         if mainFunc.screenChangingScript.thisScreenVertValue > thisLevelSettings.ballFirstScreenVertValue then
--             totalReturnToBallVertTransition = (screenChangingScript.thisScreenVertValue - thisLevelSettings.ballFirstScreenVertValue) * display.contentHeight
--         else
--             totalReturnToBallVertTransition = (thisLevelSettings.ballFirstScreenVertValue - mainFunc.screenChangingScript.thisScreenVertValue) * display.contentHeight
--         end
--         targetYTransition = mainFunc.allLevelSettings.backgroundObjectsGroup.y + totalReturnToBallVertTransition
--         topScreenEdge = topScreenEdge - totalReturnToBallVertTransition
--         bottomScreenEdge = bottomScreenEdge - totalReturnToBallVertTransition
--     else
--         targetYTransition = mainFunc.allLevelSettings.backgroundObjectsGroup.y
--     end
    
--     transition.to(mainFunc.allLevelSettings.backgroundObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
--     transition.to(mainFunc.allLevelSettings.screenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
--     transition.to(mainFunc.allLevelSettings.midScreenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400})
--     transition.to(mainFunc.allLevelSettings.frontScreenObjectsGroup, {x= targetXTransition, y= targetYTransition, time=400, onComplete=respawnBall})
-- end

mainFunc.projectileMovementRemoveAndRespawnScript = require("modules.projectile-movement-remove-and-respawn-functions")

mainFunc.projectileReboundScript = require("modules.projectile-rebound-functions")

local function gemCollisionListener (event)
    mainFunc.objectToBallTransitionScript.gemCollision(event, mainFunc)
end
	mainFunc.gemCollisionListener = gemCollisionListener

local function on_Triangle_Collision( event )
    if event.target.objectType == "shape"
    and ( event.phase == "began" ) then

    	if (event.other.projectileType ~= "hookshot")
    	and event.other.isCollisioningWith ~= event.target.relevantShapeArrayIndex then
    		print('last ', event.other.direction, event.other.x)
    		if (event.target.effectiveShape == "triangleTopLeftShape"
	    	or event.target.effectiveShape == "triangleBottomLeftShape")
	    	and (event.other.direction == "right") then
	    		event.other.x = event.target.x - 4
	    	elseif (event.target.effectiveShape == "triangleTopRightShape"
	    	or event.target.effectiveShape == "triangleBottomRightShape")
	    	and (event.other.direction == "left") then
	    		if event.target.effectiveShape == "triangleTopRightShape" then
	    			event.other.x = event.target.x + 3
	    		elseif event.target.effectiveShape == "triangleBottomRightShape" then
	    			event.other.x = event.target.x + 3
	    		end
	    	end

	    	if (event.target.effectiveShape == "triangleTopLeftShape"
	    	or event.target.effectiveShape == "triangleTopRightShape")
	    	and (event.other.direction == "down") then
	    		event.other.y = event.target.y - 1
	    		if event.target.effectiveShape == "triangleTopRightShape" then
	    			print('dfdf', event.other.x)

	    		end
	    	elseif (event.target.effectiveShape == "triangleBottomRightShape"
	    	or event.target.effectiveShape == "triangleBottomLeftShape")
	    	and (event.other.direction == "up") then
	    		event.other.y = event.target.y + 1
	    	end

			mainFunc.tm[event.other.projectileType][event.other.relevantArrayIndex]:cancelAll()

			mainFunc.projectileReboundScript.detectRebound(event, mainFunc)
    		event.target.isCollisioningWith = event.target.relevantShapeArrayIndex

		elseif (event.other.projectileType == "hookshot")
		and (event.other.isCollisioningWith ~= event.target.relevantShapeArrayIndex) then
    		event.other.isCollisioningWith = event.target.relevantShapeArrayIndex
    		mainFunc.tm["hookshot"][1]:cancelAll()
			mainFunc.projectileReboundScript.detectRebound(event, mainFunc)
		end
    end
end
	mainFunc.on_Triangle_Collision = on_Triangle_Collision

local closeItemGainedScreen = function (event)
	mainFunc.objectToBallTransitionScript.closeItemGainedScreenFunction(mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.closeItemGainedScreen = closeItemGainedScreen

local function mysteryBlockTouch (event)
	mainFunc.objectListenerScript.mysteryBlockTouchFunction(event, mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.mysteryBlockTouch = mysteryBlockTouch

mainFunc.objectToBallTransitionScript = require("modules.all-object-to-ball-transition-functions")

mainFunc.objectFlipScript = require ("modules.object-flip-function")

local function autoFanTransitionListener (event)
	mainFunc.objectToBallTransitionScript.autoFanAndEtcTransition(mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.autoFanTransitionListener = autoFanTransitionListener

local function tunnelTransitionListener(event)
	mainFunc.objectToBallTransitionScript.tunnelTransition(mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.tunnelTransitionListener = tunnelTransitionListener

local function doorTransition (event)
    mainFunc.objectToBallTransitionScript.mainDoorTransition(mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.doorTransition = doorTransition

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

mainFunc.transitionFunctionScript = require ("modules.all-transitioning-functions")

local function transitionMoveSomething (event)

	mainFunc.transitionFunctionScript.mainTransitionMoveSomething(mainFunc, shapeArray, shapeArrayParameters)
	
end
	mainFunc.transitionMoveSomething = transitionMoveSomething

mainFunc.screenShowingScript = require ("modules.screen-showing-script")

function resetLevel()

    -- simply go to level1.lua scene
    storyboard.gotoScene( "reset", "slideDown", 150 )
     
    return true -- indicates successful touch

end
	mainFunc.resetLevel = resetLevel

local eventStartY, eventStartX

mainFunc.objectListenerScript = require("modules.object-listener-functions")

mainFunc.objectFunctionsScript = require("modules.object-functions")

local function listener(event)
	mainFunc.objectListenerScript.objectListener(event, mainFunc, shapeArray, shapeArrayParameters)
end
	mainFunc.listener = listener


mainFunc.buttonListenerScript = require("modules.button-listener-functions")

mainFunc.ballAndButtonAndScreenCreateScript = require("modules.ball-and-button-and-screen-create-script")

local function mapButtonListener (event)
    if event.phase == "began"
    and mainFunc.allLevelSettings.manualScreenChangeCounter == 0 then
    	local resetScreenChangeCounter = function ()
			resettingScreenChangeCounter()
		end
        mainFunc.allLevelSettings.manualScreenChangeCounter = 1
		mainFunc.buttonListenerScript.mapButtonFunctionArray[event.target.name](mainFunc)

    end
end
	mainFunc.mapButtonListener = mapButtonListener

local function buttonListener(event)

	if event.phase == "began" then
		
		mainFunc.buttonListenerScript.buttonListenerBeganFunctionArray[event.target.name](mainFunc, shapeArray, shapeArrayParameters, storyboard, group)

	elseif event.phase == "moved"
	and event.target.name == "play" then

		mainFunc.buttonListenerScript.movedPlayPressedFunction(event, mainFunc, shapeArray)

	elseif event.phase == "ended"
	and event.target.name == "play" then

		mainFunc.buttonListenerScript.endedPlayPressedFunction( mainFunc, shapeArray)

	end
    
end
	mainFunc.buttonListener = buttonListener


mainFunc.objectCreateScript = require("modules.object-create-script")

mainFunc.storyboardScript = require("modules.storyboard-functions")

-- Called when the scene's view does not exist:
function scene:createScene( event)
    
    local group = self.view
    mainFunc.storyboardScript.createScene(mainFunc, shapeArray, shapeArrayParameters, group)

end

function scene:willEnterScene (event)
    local group = self.view

    mainFunc.ballAndButtonAndScreenCreateScript.instance2.x = 240
    mainFunc.ballAndButtonAndScreenCreateScript.instance2.y = 275
end


function scene:enterScene( event )

	--Runtime:addEventListener( "enterFrame", storyboard.printMemUsage )

	--Call it at the beginning of your new scene or the first line under your .new() function

    local function delayedEnterScene ()
        local group = self.view
        mainFunc.storyboardScript.delayedEnterScene(mainFunc, shapeArray, shapeArrayParameters, storyboard, myGameSettings)
    end
    
    timer.performWithDelay(300, delayedEnterScene, 1)
    
end



function scene:exitScene(event)
    local group = self.view
    
end

function scene:didExitScene (event)
    local group = self.view
    mainFunc.storyboardScript.didExitScene(mainFunc, shapeArray, shapeArrayParameters)
end



scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "didExitScene", scene )

return scene