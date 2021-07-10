local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 1, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 4, 2}, "left")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 5, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 4}, "right")
    addToTransitionArray(ta,{{"autoFan2_1_1"},{"slide"},{"orange"},{2},{1},{1,1,1,4},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 4, 1}, "left")
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 7,1})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 5, 2})
    addToTransitionArray(ta,{{"simple1_2_1"},{"autoSlide"},{timePerSquare = 360, pauseTime = 2000, labelled = false},{1},{1},{2,1,5,2},{2},{2,1,5,4}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 1}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar1_2_1"},{"autoSlide"},{timePerSquare = 220, pauseTime = 20},{1},{1},{2,1,8,1},{2},{2,1,8,2}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 6, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 4})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,1,4},{2},{2,1,1,5}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 4}, "up")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,4},{2},{2,1,7,3}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 3, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 1, 3}, "right")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,4},{2},{1,2,1,5}})
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 3, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 5, 4})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 3, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 3, 5}, "right")
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 3, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar5_1_2"},{"slide"},{"brown"},{2},{1},{1,2,6,3},{2},{1,2,6,5}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
