local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --------  CREATE OBJECTS HERE   -----------
    --table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 2, "triangleLeftAndRightShape", 1})

    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 6, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"switchSlide"},{labelled = false},{1},{1},{1,1,6,1},{2},{1,1,6,2}})

    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 1, 1, "triangleTopRightShape", 1, _, "hyroll"})

    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 5, 5, "right"})
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,5}})
    -- if autoslide object is activeWhenSliding, then it must slide slowly
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"autoSlide"},{timePerSquare = 500, pauseTime = 0},{3},{1},{1,1,3,2},{2},{1,1,3,5},{3},{1,1,5,5}})
    -- SWITCHSLIDE alternative
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"switchSlide"},{timePerSquare = 500, pauseTime = 0, isEnabledByDefault = true, labelled = false},{3},{1},{1,1,3,2},{2},{1,1,3,3},{3},{1,1,3,5},{4},{1,1,5,5}})
    --
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"autoSlide"},{timePerSquare = 200, pauseTime = 400, labelled = false, isActiveWhenSliding = false},{3},{1},{1,1,3,2},{2},{1,1,3,4},{3},{1,1,3,5},{4},{1,1,5,5}})

table.insert(shapeArrayParameters,{"simple","fan1_1_1", 1, 1, 5, 4})

    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 6, 3} )

    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 5} )


    --
    --table.insert(shapeArrayParameters,{"switch","switch1", 1, 1, 1, 3, { {"toggle-slide", "simple2_1_1"} } } )


    table.insert(shapeArrayParameters,{"switch","switch2", 1, 1, 1, 3, { {"slide", "simple1_1_1"} } } )

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t