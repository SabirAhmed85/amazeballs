local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 4}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,3,3},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{"brown"},{1},{1},{1,1,5,3},{2},{1,1,5,4}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 6, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,6,2},{2},{1,1,6,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 3}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,7,3},{2},{1,1,7,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")

    -- 2-1
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 1})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,1,1},{2},{2,1,1,2},{3},{2,1,1,3}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "item","map", {2, 1, 3, 3})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 2, "triangleTopAndBottomShape", 1, 18})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 4}, "down")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,3,1},{"*"},{2,1,2,1},{2},{2,1,2,4}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 5, 3}, "down")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"slide"},{"orange"},{2},{1},{2,1,4,3},{2},{2,1,5,3},{"*"},{2,1,5,5},{3},{2,1,7,5}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 3, 5}, "down")
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 5, 5}, "down")

    -- 2-2
    addToShapeArray(sp, "item","compass", {2, 2, 5, 1})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", 2, 2, 1, 2})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar1_2_2"},{"slide"},{"brown"},{1},{1},{2,2,2,2},{2},{2,2,2,3}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 3, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 7, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 4}, "right")
    addToTransitionArray(ta,{{"autoFan1_2_2"},{"slide"},{"orange"},{1},{1},{2,2,2,4},{2},{2,2,4,4},{3},{2,2,5,2}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 5, 5}, "down")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {2, 1, 4, 4}, 250)
    --addToShapeArray(sp, "item","coins", {2, 1, 6, 3}, 250)
    addToShapeArray(sp, "item","big-present", {2, 2, 3, 5}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 6, 3}, {})


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
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
