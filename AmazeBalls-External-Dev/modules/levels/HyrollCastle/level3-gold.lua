local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 5}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 2}, "right")
    addToTransitionArray(ta,{{"manualFan1_1_2"},{"autoSlide"},{},{1},{1},{1,2,2,2},{2},{1,2,2,4}})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 3, 2}, "down")
    addToTransitionArray(ta,{{"manualFan2_1_2"},{"autoSlide"},{},{1},{1},{1,2,3,2},{2},{1,2,3,4}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 2})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{},{2},{1},{1,2,5,1},{2},{1,2,5,2},{3},{1,2,5,3},{4},{1,2,5,4}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "endPoint","endPoint", 1, 2, 3, 5})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 6, 4}, 70)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 5}, 50)
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 1, 3}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
