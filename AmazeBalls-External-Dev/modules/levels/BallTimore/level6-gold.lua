local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,3,3},{2},{1,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 4}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,7,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 5})

    --SCREEN 2-1
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 5, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 2}, "left")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"autoSlide"},{timePerSquare=600},{1},{1},{2,1,2,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 2, 4})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 4})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
