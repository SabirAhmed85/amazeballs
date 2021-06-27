local ball = function (ballCharacter, mainFunc, sheetSequenceData)
    local ball = display.newSprite(mainFunc.allLevelSettings.characterInLevelImageSheet[ballCharacter], sheetSequenceData);
    physics.addBody( ball, { density = 1, friction = 1, bounce = 0, radius = (mainFunc.allLevelSettings.squareHeight/4) } )
    mainFunc.allLevelSettings.midScreenObjectsGroup:insert( ball )
    ball.projectileType = "ball"
    ball.direction = mainFunc.allLevelSettings.direction
    ball.relevantArrayIndex = 0
    ball.transitionId = ball.relevantArrayIndex
    ball.gravityScale = 0
    -- ball.xScale = 0.6
    -- ball.yScale = 0.6
    ball.x = (((mainFunc.allLevelSettings.ballScreenHorzValue - 1) * display.contentWidth) + ((mainFunc.thisLevelSettings.ballFirstHorzSquare - 1) * mainFunc.allLevelSettings.squareWidth) + (mainFunc.allLevelSettings.gutterWidth) + (mainFunc.allLevelSettings.squareWidth/2) )
    ball.y = (((mainFunc.allLevelSettings.ballScreenVertValue - 1) * display.contentHeight) + ((mainFunc.thisLevelSettings.ballFirstVertSquare - 1) * mainFunc.allLevelSettings.squareHeight) + (mainFunc.allLevelSettings.gutterHeight) + (mainFunc.allLevelSettings.squareHeight/2))
    ball.isFixedRotation = true
    ball.character = ballCharacter
    ball.autoFanCounter = 0
    ball.fanCenteringCounter = 0
    ball.movementSpeed = 75
    ball.transitioning = false
    ball:play()
    ball:toFront()
    ball:setSequence(ball.direction)
    ball.lastFanIndex = nil
    ball.isCollisioningWith = nil
    ball.specialConditionsArray = {}

    return ball;
end;

return ball;