local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {_, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {_, 1)
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 2})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,4,2},{2},{1,1,5,2},{3},{1,1,5,1},{4},{1,1,6,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 3}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 4}, "left")
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 7, 4})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,5},{2},{1,1,7,4},{3},{1,1,7,2}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2

    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"brown"},{1},{1},{1,2,6,1},{2},{1,2,7,2}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 2, "doubleBar", "horz"})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{"brown"},{2},{1},{1,2,2,1},{2},{1,2,2,2},{3},{1,2,2,3}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 3, 2})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,3,2},{2},{1,2,3,3}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 2, "doubleBar", "horz"})
    addToTransitionArray(ta,{{"bar2_1_2"},{"slide"},{"brown"},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 3})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
