local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 1})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,2,1},{3},{1,1,3,1}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "backFire","backFire2_1_1", {1, 1, 7, 1})
    addToTransitionArray(ta,{{"backFire2_1_1"},{"slide"},{},{2},{1},{1,1,5,1},{2},{1,1,7,1}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 2})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{2},{1},{1,1,4,2},{2},{1,1,5,2},{"*"},{1,1,5,3},{3},{1,1,6,3}})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 6, 4})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,3,4},{2},{1,1,6,4}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 4}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 3, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "backFire","backFire3_1_1", {1, 1, 4, 5})
    addToTransitionArray(ta,{{"backFire3_1_1"},{"slide"},{},{2},{1},{1,1,3,5},{2},{1,1,4,5},{3},{1,1,6,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 2, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 1}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 5, 2})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 6, 2}, "right")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 3, 3})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{},{2},{1},{1,2,2,3},{2},{1,2,3,3}})
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 6, 3}, "right")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 4}, "bar", {"vert", 4})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 3, 4})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"slide"},{},{2},{1},{1,2,2,4},{2},{1,2,3,4}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{},{3},{1},{1,2,2,5},{2},{1,2,4,5},{3},{1,2,4,4}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 6, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1, 125})
    addToShapeArray(sp, "item","coins", {1, 2, 3, 2}, 75)
    addToShapeArray(sp, "item","clock", {1, 1, 2, 4, "clock1_1_1", 10, 1})
    addToShapeArray(sp, "item","big-present", {1, 2, 5, 3}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
