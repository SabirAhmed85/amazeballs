local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1})
    addToTransitionArray(ta,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 4}, "triangleTopLeftShape", {1})
    addToTransitionArray(ta,{{"triangle5_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 2, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 3, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle6_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 1})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 5, 2})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"autoSlide"},{timePerSquare = 300, pauseTime = 40},{2},{1},{1,2,2,2},{2},{1,2,5,2}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 4}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 4}, "up")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 6, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 70)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 2}, 150)
    addToShapeArray(sp, "item","small-present", {1, 2, 6, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
