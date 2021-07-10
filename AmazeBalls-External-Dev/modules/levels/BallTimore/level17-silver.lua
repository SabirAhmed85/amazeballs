local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 2}, "down")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"autoSlide"},{timePerSquare = 600},{2},{1},{1,2,4,2},{2},{1,2,4,5}})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 5, 1}, {"none","right","none","none"})
    addToTransitionArray(ta,{{"spitter1_1_2"},{"slide"},{},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 2, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 5})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
