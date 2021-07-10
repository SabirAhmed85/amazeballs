local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 1, 3}, "up")
    addToTransitionArray(ta,{{"autoFan3_1_1"},{"slide"},{},{1},{1},{1,1,1,3},{2},{1,1,2,3}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 7, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 5, 4}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 4})
    addToShapeArray(sp, "autoFan","autoFan6_1_1", {1, 1, 7, 4}, "up")
    addToTransitionArray(ta,{{"autoFan6_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 5})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,3,5}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 6, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 2}, "right")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{2},{2,1,6,3}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 7, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 2, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 6, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2}, 80)
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
