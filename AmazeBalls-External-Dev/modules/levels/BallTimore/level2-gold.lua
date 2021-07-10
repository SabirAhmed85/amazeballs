local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 3})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 2, 4}, "right")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 5})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 4, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle4_1_2"},{"slide"},{},{3},{1},{1,2,2,5},{2},{1,2,4,5},{3},{1,2,4,4}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
