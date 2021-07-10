local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 2, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,1,6,1},{2},{1,1,6,2}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 4, 5})
    addToShapeArray(sp, "item","map", {1, 1, 5, 5})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 5}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 2, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 4}, "up")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,5,4}})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 5})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 3, 5}, "up")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,6,5}})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 6, 3}, { {"slide","triangle1_1_1"},{"slide","autoFan1_2_1"} }, {"one-way"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
