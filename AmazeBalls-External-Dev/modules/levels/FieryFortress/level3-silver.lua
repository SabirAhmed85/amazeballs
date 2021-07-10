local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 1})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 3, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 2}, "down")
    addToTransitionArray(ta,{{"autoFan3_3_1"},{"slide"},{"orange"},{2},{1},{2,1,5,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 4}, "triangleBottomLeftShape", {1})
    addToTransitionArray(ta,{{"triangle2_3_1"},{"slide"},{"green"},{2},{1},{2,1,3,4},{2},{2,1,4,4}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 5}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 7, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 4, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 4, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 5}, 75)
    --addToShapeArray(sp, "item","small-present", {1, 1, 4, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t