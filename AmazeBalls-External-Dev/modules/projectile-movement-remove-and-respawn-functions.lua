local widget = require("widget")
local t = {}

allLevelSettings = require("modules.levels.all-level-settings")

local bulletImageSheet = graphics.newImageSheet( "images/objects/bullets.png", {width = 60, height = 52, numFrames = 16, sheetContentWidth = 240, sheetContentHeight = 208})
local bulletSequenceData = {
    { name = "up", start=1, count=1,   loopCount=1 },
    { name = "right", start=2, count=1, loopCount=1 },
    { name = "down", start=3, count=1, loopCount=1 },
    { name = "left", start=4, count=1, loopCount=1 },
    { name = "upFalling", frames = {1,5,9,13}, time = 100, loopCount=1 },
    { name = "rightFalling", frames = {2,6,10,14}, time = 100, loopCount=1 },
    { name = "downFalling", frames = {3,7,11,15}, time = 100, loopCount=1 },
    { name = "leftFalling", frames = {4,8,12,16}, time = 100, loopCount=1}
}

moveHookshotArray = {
	up = function (obj, mainFunc, numSquares) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][1] = mainFunc.tm[obj.projectileType][1]:add(obj, {time= numSquares * 100, y = obj.y - (mainFunc.allLevelSettings.squareHeight * numSquares) + (mainFunc.allLevelSettings.squareHeight / 2), x = obj.x, onComplete = function () removeHookshot(obj, mainFunc) end}) end,
    right = function (obj, mainFunc, numSquares) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][1] = mainFunc.tm[obj.projectileType][1]:add(obj, {time= numSquares * 100, y = obj.y, x = obj.x + (mainFunc.allLevelSettings.squareWidth * numSquares) + (mainFunc.allLevelSettings.squareWidth / 2), onComplete = function () removeHookshot(obj, mainFunc) end}) end,
    left = function (obj, mainFunc, numSquares) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][1] = mainFunc.tm[obj.projectileType][1]:add(obj, {time= numSquares * 100, y = obj.y, x = obj.x - ((mainFunc.allLevelSettings.squareWidth * numSquares) + (mainFunc.allLevelSettings.squareHeight / 2)), onComplete = function () removeHookshot(obj, mainFunc) end}) end,
    down = function (obj, mainFunc, numSquares) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][1] = mainFunc.tm[obj.projectileType][1]:add(obj, {time= numSquares * 100, y = obj.y + (mainFunc.allLevelSettings.squareHeight * numSquares) + (mainFunc.allLevelSettings.squareHeight / 2), x = obj.x, onComplete = function () removeHookshot(obj, mainFunc) end}) end
}
	t.moveHookshotArray = moveHookshotArray

removeHookshot = function (obj, mainFunc)
	mainFunc.ballBtnScreenCreate.ball.direction = mainFunc.ballBtnScreenCreate.ball.prevDirection
    mainFunc.tm[mainFunc.ballBtnScreenCreate.ball.projectileType][mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex]:resumeAll()
    transition.to(obj, {alpha = 0.5, time = 200, onComplete = function () 
        physics.removeBody(obj)
        obj:removeSelf()
    end})
end
	t.removeHookshot = removeHookshot

moveProjectileArray = {
    up = function (obj, mainFunc) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][obj.relevantArrayIndex] = mainFunc.tm[obj.projectileType][obj.relevantArrayIndex]:add(obj, {time=(  ((obj.y - mainFunc.allLevelSettings.topScreenEdge) / display.contentHeight) * ((1000 / obj.movementSpeed) * 100)), y = mainFunc.allLevelSettings.topScreenEdge - (obj.contentHeight/2), x = obj.x, onComplete = function () removeProjectile(obj, mainFunc) end}) end,
    right = function (obj, mainFunc) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][obj.relevantArrayIndex] = mainFunc.tm[obj.projectileType][obj.relevantArrayIndex]:add(obj, {time=(  ((mainFunc.allLevelSettings.leftScreenEdge + display.contentWidth - obj.x) / display.contentWidth) * ((480/320) * ((1000 / obj.movementSpeed) * 100))), y = obj.y, x = mainFunc.allLevelSettings.leftScreenEdge + display.contentWidth + (obj.contentWidth/2), onComplete = function () removeProjectile(obj, mainFunc) end}) end,
    left = function (obj, mainFunc) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][obj.relevantArrayIndex] = mainFunc.tm[obj.projectileType][obj.relevantArrayIndex]:add(obj, {time=(  ((obj.x - mainFunc.allLevelSettings.leftScreenEdge) / display.contentWidth) * ((480/320) * ((1000 / obj.movementSpeed) * 100))), y = obj.y, x = mainFunc.allLevelSettings.leftScreenEdge - (obj.contentWidth/2), onComplete = function () removeProjectile(obj, mainFunc) end}) end,
    down = function (obj, mainFunc) mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][obj.relevantArrayIndex] = mainFunc.tm[obj.projectileType][obj.relevantArrayIndex]:add(obj, {time=(  ((mainFunc.allLevelSettings.topScreenEdge + display.contentHeight - obj.y) / display.contentHeight) * ((1000 / obj.movementSpeed) * 100)), y = mainFunc.allLevelSettings.topScreenEdge + display.contentHeight + (obj.contentHeight/2), x = obj.x, onComplete = function () removeProjectile(obj, mainFunc) end}) end
}
	t.moveProjectileArray = moveProjectileArray

moveProjectile = function (obj, mainFunc)
    if obj.direction == "right" or obj.direction == "kill" then
        obj.direction = "right"
    end

    if mainFunc.ballBtnScreenCreate.itemBtn then
    	timer.performWithDelay(150, function () mainFunc.ballBtnScreenCreate.itemBtn.canHookshot = true end)
    end

    moveProjectileArray[obj.direction](obj, mainFunc)
end
	t.moveProjectile = moveProjectile

removeProjectile = function (obj, mainFunc)

    if obj.projectileType == "ball"
    or obj.projectileType == "specialBall" then
        --For slower bullet
        local edgeTransitionProjectileArray = {
            up = function () obj:translate( 0, (display.contentHeight + (obj.contentHeight/2) )) end,
            right = function () obj:translate( -(display.contentWidth + (obj.contentWidth/2) ), 0) end,
            down = function () obj:translate( 0, -(display.contentHeight + (obj.contentHeight/2) )) end,
            left = function () obj:translate( (display.contentWidth + (obj.contentWidth/2) ), 0) end
        }
        edgeTransitionProjectileArray[obj.direction](obj)
        moveProjectile(obj, mainFunc)
    else
        obj.removed = true
        obj.x = -9000
        obj.y = -9000
        mainFunc.allLevelSettings.transitionForProjectile[obj.projectileType][obj.relevantArrayIndex] = nil
    end
end
	t.removeProjectile = removeProjectile


local createdBulletCounter = 0
    t.createdBulletCounter = createdBulletCounter

local startBallAgain = function (mainFunc, automaticallyRestartLevel, timeIsUp, shapeArray, shapeArrayParameters)
    --Runtime:removeEventListener( "enterFrame", moveSomething )
    --Runtime:removeEventListener("enterFrame", edgesTransitions)
    if timeIsUp == false then

    end
    function startAgain ()
        mainFunc.ballBtnScreenCreate.backBtn.alpha = 1
        mainFunc.ballBtnScreenCreate.backBtn:setSequence("go")
        mainFunc.ballBtnScreenCreate.backBtn:play()
        mainFunc.ballBtnScreenCreate.backBtn:addEventListener("tap", mainFunc.buttonListener)

        mainFunc.ballBtnScreenCreate.ball.alpha = 1
        mainFunc.ballBtnScreenCreate.ball.direction = mainFunc.thisLevelSettings.initialDirection
        mainFunc.ballBtnScreenCreate.ball:setSequence(mainFunc.ballBtnScreenCreate.ball.direction)
        mainFunc.ballBtnScreenCreate.ball.x = (((mainFunc.thisLevelSettings.ballFirstScreenHorzValue - 1) * display.contentWidth) + ((mainFunc.thisLevelSettings.ballFirstHorzSquare - 1) * 60) + 60)
        mainFunc.ballBtnScreenCreate.ball.y = (((mainFunc.thisLevelSettings.ballFirstScreenVertValue - 1) * display.contentHeight) + ((mainFunc.thisLevelSettings.ballFirstVertSquare - 1) * 52) + 60)
        mainFunc.ballBtnScreenCreate.ball.lastFanIndex = nil
        mainFunc.ballBtnScreenCreate.ball.autoFanCounter = 0
        mainFunc.allLevelSettings.pressCount = 0
        mainFunc.ballBtnScreenCreate.ball.transitioning = false
        
        Runtime:addEventListener( "enterFrame", mainFunc.doorTransition )
	    --Runtime:addEventListener( "enterFrame", mainFunc.tunnelTransition )
	    Runtime:addEventListener( "enterFrame", mainFunc.autoFanTransitionListener )

	    if (mainFunc.allLevelSettings.bulletHasFired == true) then
	        timer.resume(mainFunc.projectileMovementRemoveAndRespawnScript.createBulletTimer)
	        if #mainFunc.tm["bullet"] > 0 then
	            for a = 1, #mainFunc.tm["bullet"] do
	                if (mainFunc.tm["bullet"][a]
	                and mainFunc.tm["bullet"][a] ~= nil) then
	                    mainFunc.tm["bullet"][a]:resumeAll()
	                end
	            end
	        end
	    end
	    if #mainFunc.thisLevelSettings.bombArray > 0 then
	        for a =1, #mainFunc.thisLevelSettings.bombArray do
	            if (mainFunc.thisLevelSettings.bombArray[a] ~= nil) then
	                timer.resume(mainFunc.thisLevelSettings.bombArray[a].timer)
	            end
	        end
	    end
        if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
            timer.resume(mainFunc.levelTimerUpdateTimer)
        end

        mainFunc.ballBtnScreenCreate.pauseScreenOverlay.alpha = 0
        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
        mainFunc.ballBtnScreenCreate.pauseScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)
    end
    -- if ballActivateButtonSet == true then
        
    -- end
    for a = 1, #shapeArray do
    	if shapeArrayParameters[a]["type"] == "spitter"
        or shapeArrayParameters[a]["type"] == "simple"
        or shapeArrayParameters[a]["type"] == "backFire" then
    		shapeArray[a].isBallPresent = false
    		--shapeArray[a]:setSequence("normal")
    		shapeArray[a].canShapeSlide = true
    		shapeArray[a].enabled = true
    	end
    end

    if timeIsUp == false then
        mainFunc.ballBtnScreenCreate.ball.alpha = 0
    end
    mainFunc.tm["ball"][mainFunc.ballBtnScreenCreate.ball.relevantArrayIndex]:cancelAll()

    -- prepare animation to show one life lost and restarting of ball

    local thisMyGameSettings = loadTable("myGameSettings.json")

    thisMyGameSettings["total_lives"] = thisMyGameSettings["total_lives"] - 1
    if thisMyGameSettings["total_lives"] < 0 then
        thisMyGameSettings["total_lives"] = 0
    end
    saveTable(thisMyGameSettings, "myGameSettings.json")

    Runtime:removeEventListener( "enterFrame", mainFunc.doorTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.tunnelTransition )
    Runtime:removeEventListener( "enterFrame", mainFunc.autoFanTransitionListener )

    if #mainFunc.thisLevelSettings.bombArray > 0 then
        for a =1, #mainFunc.thisLevelSettings.bombArray do
            if (mainFunc.thisLevelSettings.bombArray[a] ~= nil) then
                timer.pause(mainFunc.thisLevelSettings.bombArray[a].timer)
            end
        end
    end

    local totalLivesLeft = thisMyGameSettings["total_lives"]
    local showLivesLeftScreen = function (totalLivesLeft)
        if mainFunc.levelTimerUpdateTimer and mainFunc.levelTimerUpdateTimer ~= nil then
            timer.pause(mainFunc.levelTimerUpdateTimer)
        end
    	transition.to(mainFunc.ballBtnScreenCreate.livesLeftScreen, {alpha = 1, time = 300, onComplete = function ()
        	for a = 1, #mainFunc.ballBtnScreenCreate.lifeIcon do
                if a <= totalLivesLeft + 1 then
    			     mainFunc.ballBtnScreenCreate.lifeIcon[a].alpha = 1
                else
                     mainFunc.ballBtnScreenCreate.lifeIcon[a].alpha = 0.3
                end
    		end

            local numTimesTotal = 3
            local numTimesOccured = 0
            local blinkLifeIcon
            
            blinkLifeIcon = function ()
                local toggleAlpha = function ()
                    timer.performWithDelay(250, function ()
                        mainFunc.ballBtnScreenCreate.lifeIcon[totalLivesLeft + 1].alpha = 1
                        timer.performWithDelay(250, function ()
                        mainFunc.ballBtnScreenCreate.lifeIcon[totalLivesLeft + 1].alpha = 0.3
                            numTimesOccured = numTimesOccured + 1
                            blinkLifeIcon()
                        end)
                    end)
                end

                if numTimesOccured < numTimesTotal then
                    toggleAlpha()
                else
                    timer.performWithDelay(450, function ()
                        for a = 1, #mainFunc.ballBtnScreenCreate.lifeIcon do
                            transition.to(mainFunc.ballBtnScreenCreate.lifeIcon[a], {alpha = 0, time = 200})
                        end

                        timer.performWithDelay(250, function ()
                            mainFunc.ballBtnScreenCreate.livesLeftScreen.alpha = 0

                            if totalLivesLeft < 1 or automaticallyRestartLevel then
                                timer.performWithDelay(400, function ()
                                    for a = 1, #mainFunc.thisLevelSettings.originalToolArray do
                                        
                                        for b =1, #mainFunc.thisLevelSettings.toolArray do
                                            if (mainFunc.thisLevelSettings.toolArray[b]["name"] == mainFunc.thisLevelSettings.originalToolArray[a]["name"]) then
                                                local sameTool = true
                                                for key, val in pairs(mainFunc.thisLevelSettings.originalToolArray[a]["properties"]) do
                                                    if key == "directions" and mainFunc.thisLevelSettings.toolArray[a]["properties"]["directions"] then
                                                        if #mainFunc.thisLevelSettings.toolArray[a]["properties"]["directions"] == #mainFunc.thisLevelSettings.originalToolArray[a]["properties"]["directions"] then
                                                            for c = 1, #mainFunc.thisLevelSettings.originalToolArray[a]["properties"][key] do
                                                                if mainFunc.thisLevelSettings.originalToolArray[a]["properties"][key][c] ~= mainFunc.thisLevelSettings.toolArray[a]["properties"][key][c] then
                                                                    sameTool = false
                                                                end
                                                            end
                                                        else
                                                            sameTool = false
                                                        end
                                                    elseif key == "directions" and mainFunc.thisLevelSettings.toolArray[a]["properties"]["directions"] == nil then
                                                        sameTool = false
                                                    else 
                                                        if mainFunc.thisLevelSettings.toolArray[a]["properties"][key] then
                                                            if mainFunc.thisLevelSettings.originalToolArray[a]["properties"][key] ~= mainFunc.thisLevelSettings.toolArray[a]["properties"][key] then
                                                                sameTool = false
                                                            end
                                                        else
                                                            sameTool = false
                                                        end
                                                    end
                                                end
                                                
                                                if (sameTool == true) then
                                                    if mainFunc.thisLevelSettings.toolArray[b]["quantity"] < mainFunc.thisLevelSettings.originalToolArray[a]["quantity"] then
                                                        mainFunc.thisLevelSettings.originalToolArray[a]["quantity"] = mainFunc.thisLevelSettings.toolArray[b]["quantity"]
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    for a = 1, #mainFunc.thisLevelSettings.originalToolArray do
                                        if (mainFunc.thisLevelSettings.originalToolArray[a]["quantity"] == 0
                                        and (mainFunc.thisLevelSettings.originalToolArray[a]["name"] ~= "dummyBall" and mainFunc.thisLevelSettings.originalToolArray[a]["name"] ~= "superBall") ) then
                                            table.remove(mainFunc.thisLevelSettings.originalToolArray, mainFunc.thisLevelSettings.originalToolArray[a])
                                        end
                                    end

                                    myTotalToolArray = mainFunc.thisLevelSettings.originalToolArray 
                                    myTotalObjectArray = mainFunc.thisLevelSettings.originalObjectArray
                                    saveTable(myTotalToolArray, "myTotalToolArray.json")
                                    saveTable(myTotalObjectArray, "myTotalObjectArray.json")

                                    mainFunc.backToLevelMenu()
                                    mainFunc.ballBtnScreenCreate.ball.transitioning = false
                                    if automaticallyRestartLevel ~= true and totalLivesLeft < 1 then
                                        thisMyGameSettings["total_lives"] = 3
                                    end
                                    saveTable(thisMyGameSettings, "myGameSettings.json")
                                end)
                            elseif (totalLivesLeft >= 1) then
                                timer.performWithDelay(300, startAgain, 1)
                            end
                        end)
                    end)
                end
            end

            timer.performWithDelay(350, function ()
                blinkLifeIcon()
            end)

        end})
    end

    mainFunc.buttonListenerScript.removeEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)

    mainFunc.ballBtnScreenCreate.pauseScreenOverlay.alpha = 0.3
    mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("tap", mainFunc.dummyListener)
    mainFunc.ballBtnScreenCreate.pauseScreenOverlay:addEventListener("touch", mainFunc.dummyListener)

    if timeIsUp then
        timer.performWithDelay(600, function ()
            transition.to(mainFunc.ballBtnScreenCreate.timesUpNotice, {alpha = 1, time = 210, onComplete = function ()
                timer.performWithDelay(1200, function ()
                    transition.to(mainFunc.ballBtnScreenCreate.timesUpNotice, {alpha = 0, time = 240, onComplete = function ()
                        timer.performWithDelay(400, function ()
                            showLivesLeftScreen(totalLivesLeft)
                        end)
                    end})
                end)
            end})
        end)
    else
        showLivesLeftScreen(totalLivesLeft)
    end
end
    t.startBallAgain = startBallAgain

local bulletCollide

local killBullet = function (event, mainFunc, bulletCollide)
    local xTarget = event.target.x
    local yTarget = event.target.y
    event.target:removeEventListener("collision", bulletCollide)
    event.target.removed = true
    timer.performWithDelay(1, function ()
        event.target.x = -9000
        event.target.y = -9000
    end)
    mainFunc.tm[event.target.projectileType][event.target.relevantArrayIndex]:cancelAll()
    

    local dyingBullet = display.newSprite(bulletImageSheet, bulletSequenceData)
    mainFunc.allLevelSettings.midScreenObjectsGroup:insert(dyingBullet)
    dyingBullet.x = xTarget
    dyingBullet.y = yTarget
    dyingBullet:setSequence(event.target.direction .. "Falling")
    dyingBullet:play()
    transition.to(dyingBullet, {time = 500, alpha = 0, onComplete = function ()
        dyingBullet:removeSelf()
        dyingBullet = nil
    end})
    --transition.to(event.target, {time = 0, x = -1000 - (50 * event.target.relevantArrayIndex)})
    --event.target.alpha = 0
end
    t.killBullet = killBullet

local function bulletFire (mainFunc, shapeArray, shapeArrayParameters)
    for a = 1, #shapeArray do
        if shapeArrayParameters[a]["type"] == "gun" then
            
            function createBullet ()

    			mainFunc.allLevelSettings.bulletHasFired = true
                mainFunc.allLevelSettings.createdBulletUsed = false
                local function prepareBullet(bulletIndex, shapeArray, shapeArrayParameters )
                    mainFunc.allLevelSettings.bullet[bulletIndex].readyToCollide = false
                    mainFunc.allLevelSettings.bullet[bulletIndex].x = shapeArray[a].x
                    mainFunc.allLevelSettings.bullet[bulletIndex].y = shapeArray[a].y
                    mainFunc.allLevelSettings.bullet[bulletIndex].direction = shapeArrayParameters[a]["subType"]
                    local bulletRotateArray = {
                        up = 0,
                        right = 90,
                        down = 180,
                        left = 270
                    }
                    mainFunc.allLevelSettings.bullet[bulletIndex].rotation = bulletRotateArray[shapeArrayParameters[a]["subType"]]

                    mainFunc.allLevelSettings.bullet[bulletIndex].removed = false
                    mainFunc.allLevelSettings.bullet[bulletIndex].transitioning = false
                    mainFunc.allLevelSettings.bullet[bulletIndex].autoFanCounter = 0
                    mainFunc.allLevelSettings.bullet[bulletIndex].fanCenteringCounter = 0
                    mainFunc.allLevelSettings.bullet[bulletIndex].movementSpeed = 115
                    mainFunc.allLevelSettings.bullet[bulletIndex].isCollisioningWith = nil
                    bulletCollide = function (event)

                        local bulletKillsBall = function ()
                            if (mainFunc.ballBtnScreenCreate.ball.transitioning == false) then
                                mainFunc.ballBtnScreenCreate.ball.transitioning = true
                                mainFunc.ballBtnScreenCreate.ball.x = -9000
                                mainFunc.ballBtnScreenCreate.ball.y = -9000
                                mainFunc.allLevelSettings.shouldBallMoveState = "false"
                                mainFunc.allLevelSettings.isBallMovingState = "false"
                                startBallAgain(mainFunc, false, false, shapeArray, shapeArrayParameters)
                            end
                        end
                        if event.phase == "began" then
                            if event.other.projectileType == "bullet" then
                                --[[
                            	if event.target.killBulletCounter == 0 then
                                	killBullet(event, mainFunc, bulletCollide)
                                	event.target.killBulletCounter = 1
                                end
                                ]]
                            elseif event.other.projectileType == "ball" then
                                if event.other.suit
                                and event.other.specialConditionsArray["bulletVest"] then

                                    if event.other.specialConditionsArray["bulletVest"] then
                                        if event.other.specialConditionsArray["bulletVest"].active == true then
                                            killBullet(event, mainFunc, bulletCollide)
                                            event.target.killBulletCounter = 1
                                        else
                                            bulletKillsBall()
                                        end
                                    else
                                        bulletKillsBall()
                                    end
                                else
                                    bulletKillsBall()
                                end                            	
                            end
                        end 
                    end
                    mainFunc.projectileMovementRemoveAndRespawnScript.bulletCollide = bulletCollide

                    if mainFunc.allLevelSettings.createdBulletUsed == false then 
                    	mainFunc.tm["bullet"][mainFunc.allLevelSettings.bullet[bulletIndex].relevantArrayIndex] = mainFunc.tManager.new()
                    end
                    	mainFunc.allLevelSettings.bullet[bulletIndex]:addEventListener("collision", bulletCollide)

                    mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.allLevelSettings.bullet[bulletIndex], mainFunc)

                    mainFunc.allLevelSettings.bullet[bulletIndex].readyToCollideTimer = timer.performWithDelay(200, function ()
                        mainFunc.allLevelSettings.bullet[bulletIndex].readyToCollideTimer = nil
                        mainFunc.allLevelSettings.bullet[bulletIndex].readyToCollide = true
                    end)
                    mainFunc.allLevelSettings.bullet[bulletIndex].readyToCollideTimer.paused = false 
                end

                for b = 1, #mainFunc.allLevelSettings.bullet do
                    if mainFunc.allLevelSettings.bullet[b].removed == true
                    and mainFunc.allLevelSettings.createdBulletUsed == false then
                        t.relevantBulletIndex = b
                        --mainFunc.allLevelSettings.bullet[t.relevantBulletIndex].alpha = 0.3
                        mainFunc.allLevelSettings.bullet[t.relevantBulletIndex].killBulletCounter = 0
                        prepareBullet(t.relevantBulletIndex, shapeArray, shapeArrayParameters)
                        mainFunc.allLevelSettings.createdBulletUsed = true
                    end
                end
                if mainFunc.allLevelSettings.createdBulletUsed == false then
                    
                    mainFunc.allLevelSettings.createdBulletCounter = mainFunc.allLevelSettings.createdBulletCounter + 1

                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter] = display.newSprite(bulletImageSheet, bulletSequenceData)
                    mainFunc.allLevelSettings.midScreenObjectsGroup:insert(mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter])
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter]:toBack()
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter]:play()

                    --mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter] = display.newImage("ball.png")
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter].projectileType = "bullet"  
                    physics.addBody( mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter], { "static", density = 1, friction = 1, bounce = 0, shape = {-3, -10, 3, -10, 3, 10, -3, 10 } } )       
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter].gravityScale = 0
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter].isFixedRotation = true
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter].killBulletCounter = 0
                    mainFunc.allLevelSettings.bullet[mainFunc.allLevelSettings.createdBulletCounter].relevantArrayIndex = mainFunc.allLevelSettings.createdBulletCounter
                    t.relevantBulletIndex = mainFunc.allLevelSettings.createdBulletCounter
                    prepareBullet(t.relevantBulletIndex, shapeArray, shapeArrayParameters)
                end
                
            end
            shapeArray[a].createBulletTimer = timer.performWithDelay(150, createBullet, 0)
        end
    end
end
    t.bulletFire = bulletFire

return t
