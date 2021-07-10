local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 1}, "down")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 2, 1}, "bar", {"horz"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 2, 2}, "down")
    addToTransitionArray(ta,{{"manualFan2_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,2,1},{3},{1,1,3,1}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 1, 3}, "up")
    addToTransitionArray(ta,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,1,3},{2},{1,1,1,5}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 5, 4})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,3,4},{2},{1,1,5,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 3, 5}, "bar", {"horz"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 5})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5},{3},{1,1,6,3},{4},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 8, 5}, "bar", {"horz"})

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 1}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,5,1},{3},{1,2,5,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 2}, "down")
    addToTransitionArray(ta,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,6,2},{2},{1,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 2, 2}, "right")
    addToTransitionArray(ta,{{"autoFan3_1_2"},{"slide"},{},{2},{1},{1,2,1,3},{2},{1,2,1,2},{3},{1,2,2,2}})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 3, 3})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"slide"},{},{3},{1},{1,2,1,5},{2},{1,2,3,5},{3},{1,2,3,3}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 6, 5})
    addToTransitionArray(ta,{{"backFire2_1_2"},{"slide"},{},{2},{1},{1,2,5,5},{2},{1,2,6,5},{3},{1,2,6,4}})

    --SCREEN 2-2
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 1, 3})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 5, 3})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 3, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 2}, 225)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 3}, 80)
    addToShapeArray(sp, "item","big-present", {2, 2, 4, 3}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 4, 5}, {})
    addToShapeArray(sp, "item","characterSpecial", {2, 2, 6, 3}, {})
    addToShapeArray(sp, "item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
