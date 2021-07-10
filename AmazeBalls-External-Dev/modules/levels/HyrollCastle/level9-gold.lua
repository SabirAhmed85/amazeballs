local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 2}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 4}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 1}, "up")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2}})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 6, 1}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 5}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 6, 3}, 70)
    addToShapeArray(sp, "item","small-present", {2, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
