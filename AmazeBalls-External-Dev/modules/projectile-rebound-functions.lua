local widget = require("widget")
local physics = require("physics")
local t = {}

local bulletRotate = function (obj)
	local bulletRotateArray = {
		up = 0,
		right = 90,
		down = 180,
		left = 270
	}
	timer.performWithDelay(0, function () obj.rotation = bulletRotateArray[obj.direction] end)
end

local changeProjectileDirection = function (obj, mainFunc, shape)
    
    local function changeBulletTransitioning ()
        obj.transitioning = false
    end
    timer.performWithDelay(40, changeBulletTransitioning, 1)

    if (mainFunc.allLevelSettings.isScreenPausedState) == false then
    	mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(obj, mainFunc)
    else
    	obj.isWaitingForMovement = true
    end

	local function removeObjCollisioningIndex ()
		obj.isCollisioningWith = nil
	end

	timer.performWithDelay(80, removeObjCollisioningIndex)
end
	t.changeProjectileDirection = changeProjectileDirection

local specialRuleFunction = function (shape, obj)
	
    if obj.oldDirection == "left" then
    
		if obj.y > (shape.y) then
		    
		    obj.direction = shape.directionsArray[shape.state * 2][8]
			    
		elseif obj.y < (shape.y) then
			    
		    obj.direction = shape.directionsArray[shape.state * 2][7]
			    
		end
    
    elseif obj.oldDirection == "right" then
	
		if obj.y > (shape.y) then
		    
		    obj.direction = shape.directionsArray[shape.state * 2][6]
			    
		elseif obj.y < (shape.y) then
			    
		    obj.direction = shape.directionsArray[shape.state * 2][5]
			    
		end
	
    elseif obj.oldDirection == "down" then
	
		if obj.x > (shape.x) then
		    
		    obj.direction = shape.directionsArray[shape.state * 2][8]
			    
		elseif obj.x < (shape.x) then
			    
		    obj.direction = shape.directionsArray[shape.state * 2][7]
			    
		end
	
    elseif obj.oldDirection == "up" then
	
		if obj.x > (shape.x) then
		    
		    obj.direction = shape.directionsArray[shape.state * 2][6]
			    
		elseif obj.x < (shape.x) then
			    
		    obj.direction = shape.directionsArray[shape.state * 2][5]
			    
		end
	
    end
    
    
    if obj.direction == "kill"
    and obj.projectileType == "ball" then
		mainFunc.allLevelSettings.shouldBallMoveState = "false"
        mainFunc.allLevelSettings.isBallMovingState = "false"
		startBallAgain()
		obj.direction = mainFunc.thisLevelSettings.ballFirstDirection;
	elseif obj.direction ~= kill then
		if obj.projectileType == "ball"
		and obj.specialConditionsArray["bulletVest"]
		and obj.specialConditionsArray["bulletVest"].active == true then
			obj:setSequence(obj.direction .. "-bullet")
		elseif obj.projectileType == "ball"
		and obj.specialConditionsArray["characterSpecial"]
		and obj.specialConditionsArray["characterSpecial"].active == true then
			obj:setSequence(obj.direction .. "-special")
		else
    		obj:setSequence(obj.direction)
    	end
    end
    
end
	t.specialRuleFunction = specialRuleFunction

--- WHEN TRANSITIONING SOMETHING
local calculateReboundFunction = function (shape, obj, mainFunc, breakable)
	for a = 1, #shape.directionsArray do
		if shape.directionsArray[a][1] == shape.state then
		    for i = 1, #mainFunc.shapeRelatedArrays.directionArray do
				if mainFunc.shapeRelatedArrays.directionArray[i] == obj.direction
	            and obj.transitioning == false then
	            	obj.oldDirection = obj.direction
	                obj.transitioning = true
	                if obj.projectileType == "bullet" and shape.objectType ~= "gun" then
	                	if shape.directionsArray[a+1][i][1] then
	                		obj.direction = shape.directionsArray[a+1][i][1]
	                	else
	                    	obj.direction = shape.directionsArray[a+1][i]
	                    end
	                    changeProjectileDirection(obj, mainFunc)
                        if obj.direction ~= "specialRule" then
                            bulletRotate(obj)
                        end
                    elseif obj.projectileType == "bullet" and obj.readyToCollide and shape.objectType == "gun" then
                    	local event = {}
                    	event.target = obj

	                	mainFunc.projectileMovementRemoveAndRespawnScript.killBullet(event, mainFunc, mainFunc.projectileMovementRemoveAndRespawnScript.bulletCollide)
	                elseif obj.projectileType == "bullet" and shape.objectType == "gun" and obj.readyToCollide == false then
	                	obj.transitioning = false
	                end
	                if obj.projectileType == "ball" then
	                    if breakable ~= true then
	                    	if shape.triangleSpecialType then
	                    		if shape.triangleSpecialType == "fire" then
	                    			if obj.specialConditionsArray["iceCape"]
			                		and obj.specialConditionsArray["iceCape"].active == true then
			                			obj.direction = shape.directionsArray[a+1][i]
			                		else
			                			obj.direction = "kill"
			                		end
	                    		elseif shape.triangleSpecialType == "icy" then
	                    			if obj.specialConditionsArray["fireCape"]
			                		and obj.specialConditionsArray["fireCape"].active == true then
			                			obj.direction = shape.directionsArray[a+1][i]
			                		else
			                			obj.direction = "kill"
			                		end
	                    		end
	                    	else
		                    	if shape.directionsArray[a+1][i][1] then
			                		obj.direction = shape.directionsArray[a+1][i][1]
			                		if obj.character == "PuckNorris"
		                			and obj.specialConditionsArray["characterSpecial"]
			                		and obj.specialConditionsArray["characterSpecial"].active == true then
			                			obj.direction = shape.directionsArray[a+1][i][1]
			                		else
			                			obj.direction = "kill"
			                		end
			                	else
			                    	obj.direction = shape.directionsArray[a+1][i]
			                    end
			                end

	                        if obj.direction ~= "specialRule" then
	                        	if mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["bulletVest"]
								and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["bulletVest"].active == true then
									obj:setSequence(obj.direction .. "-bullet")
								elseif mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["characterSpecial"]
								and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["characterSpecial"].active == true then
									obj:setSequence(obj.direction .. "-special")
								else
						    		obj:setSequence(obj.direction)
						    	end

	                            if obj.suit then
	                            	obj.suit:setSequence(obj.direction)
	                            end
	                            if obj.jetSuit then
	                            	local direction = {
	                            		up = 0, right = 90, down = 180, left = 270
	                            	}
	                            	obj.jetSuit.rotation = direction[obj.direction]
	                            end
	                        end
	                    end
	                    if obj.direction == "kill" then
	                        mainFunc.allLevelSettings.shouldBallMoveState = "false"
	                        mainFunc.allLevelSettings.isBallMovingState = "false"
	                        mainFunc.ballAndButtonAndScreenCreateScript.backBtn:setSequence("go")
	                        mainFunc.projectileMovementRemoveAndRespawnScript.startBallAgain(mainFunc, false, false, shapeArray, shapeArrayParameters)
	                    elseif obj.direction == "specialRule"
	                    and breakable == false then
	                        specialRuleFunction(shape, obj)
	                    elseif breakable == false then
	                        mainFunc.allLevelSettings.directionCounter = 1
	                    end
	                    if breakable == true then
        					mainFunc.allLevelSettings.thisObjectBreakability = false
	                        shape:setSequence("breaking")
            				shape.timeScale = 0.015
            				shape:play()
            				transition.to(shape, {alpha = 0, time = 2000, onComplete = function ()
            					physics.removeBody(shape)
            				end})
	                    else
	                    	shape.collision = mainFunc.on_Triangle_Collision
	                    end
	                end
		                    
				end
				
		    end
		
		end
    
    end
    
    if obj.projectileType == "ball"
    and obj.direction ~= "kill" then
        changeProjectileDirection(obj, mainFunc, shape)
    end
end
	t.calculateReboundFunction = calculateReboundFunction

local detectSpecialRebound = function (shape, projectile, oldDirection)
	if (shape.effectiveShape == "triangleTopLeftShape"
	or shape.effectiveShape == "triangleBottomLeftShape")
	and (oldDirection == "right") then
		projectile.x = shape.x - 4
	elseif (shape.effectiveShape == "triangleTopRightShape"
	or shape.effectiveShape == "triangleBottomRightShape")
	and (oldDirection == "left") then
		if shape.effectiveShape == "triangleTopRightShape" then
			projectile.x = shape.x + 3
		elseif shape.effectiveShape == "triangleBottomRightShape" then
			projectile.x = shape.x + 3
		end
	end

	if (shape.effectiveShape == "triangleTopLeftShape"
	or shape.effectiveShape == "triangleTopRightShape")
	and (oldDirection == "down") then
		projectile.y = shape.y - 1
		if shape.effectiveShape == "triangleTopRightShape" then

		end
	elseif (shape.effectiveShape == "triangleBottomRightShape"
	or shape.effectiveShape == "triangleBottomLeftShape")
	and (projectile.direction == "up") then
		projectile.y = shape.y + 1
	end

	if (shape.effectiveShape == "triangleLeftAndRightShape") then
		if oldDirection == "left" and shape.state == 1 then
			projectile.x = shape.x + 7
		elseif oldDirection == "right" and shape.state == 2 then
			projectile.x = shape.x - 7
		elseif oldDirection == "down" then
			projectile.y = shape.y - 26
		elseif oldDirection == "up" then
			projectile.y = shape.y + 26
		end
	end

	if (shape.effectiveShape == "triangleTopAndBottomShape") then
		if oldDirection == "down" and shape.state == 1 then
			projectile.y = shape.y - 3
		elseif oldDirection == "up" and shape.state == 2 then
			projectile.y = shape.y + 3
		elseif oldDirection == "right" then
			projectile.x = shape.x - 36
		elseif oldDirection == "left" then
			projectile.x = shape.x + 36
		end
	end
	
end
	t.detectSpecialRebound = detectSpecialRebound

local detectRebound = function (event, mainFunc)
	local breakability
	if (event.other.projectileType ~= "hookshot") then
		breakability = false
	    if (event.target.breakable == true
	    and event.other == mainFunc.ballAndButtonAndScreenCreateScript.instance2
	    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.character == "PrincessBoulder" 
	    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["characterSpecial"] 
	    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["characterSpecial"].active == true) then
	        breakability = true
	    elseif (event.target.breakable == true
	    and event.target.hyrollBreakable == false
	    and event.other == mainFunc.ballAndButtonAndScreenCreateScript.instance2
	    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"] 
	    and mainFunc.ballAndButtonAndScreenCreateScript.instance2.specialConditionsArray["jetSuit"].active == true) then
    		breakability = true
	    end

	    calculateReboundFunction(event.target, event.other, mainFunc, breakability)
	elseif (event.other.projectileType == "hookshot") then
		mainFunc.projectileMovementRemoveAndRespawnScript.removeHookshot(event.other, mainFunc)
		if (event.target.breakable == true) then
			mainFunc.allLevelSettings.isBallMovingState = "false"
			mainFunc.tm[mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:cancelAll()
			mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction = event.other.direction
			mainFunc.projectileMovementRemoveAndRespawnScript.moveProjectile(mainFunc.ballAndButtonAndScreenCreateScript.instance2, mainFunc)
			mainFunc.allLevelSettings.isBallMovingState = "true"
		else
			mainFunc.tm[mainFunc.ballAndButtonAndScreenCreateScript.instance2.projectileType][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:resumeAll()
		end
	end
end
	t.detectRebound = detectRebound

return t
