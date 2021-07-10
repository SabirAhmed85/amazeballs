local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --------  CREATE OBJECTS HERE   -----------
    --addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"switchSlide"},{labelled = false},{1},{1},{1,1,6,1},{2},{1,1,6,2}})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 1}, "triangleTopRightShape", {1, _, "hyroll"})

    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 5, 5}, "right")
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,5}})
    -- if autoslide object is activeWhenSliding, then it must slide slowly
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"autoSlide"},{timePerSquare = 500, pauseTime = 0},{3},{1},{1,1,3,2},{2},{1,1,3,5},{3},{1,1,5,5}})
    -- SWITCHSLIDE alternative
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"switchSlide"},{timePerSquare = 500, pauseTime = 0, isEnabledByDefault = true, labelled = false},{3},{1},{1,1,3,2},{2},{1,1,3,3},{3},{1,1,3,5},{4},{1,1,5,5}})
    --
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"autoSlide"},{timePerSquare = 200, pauseTime = 400, labelled = false, isActiveWhenSliding = false},{3},{1},{1,1,3,2},{2},{1,1,3,4},{3},{1,1,3,5},{4},{1,1,5,5}})

addToShapeArray(sp, "simple","fan1_1_1", {1, 1, 5, 4})

    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 6, 3})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 5})


    --
    --addToShapeArray(sp, "switch","switch1", {1, 1, 1, 3, { {"toggle-slide", "simple2_1_1"} } })


    addToShapeArray(sp, "switch","switch2", {1, 1, 1, 3}, { {"slide", "simple1_1_1"} } })

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