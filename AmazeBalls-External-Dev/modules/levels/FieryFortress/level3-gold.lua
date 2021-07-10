local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{"brown"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 2}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{"brown"},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar3_1_1"},{"slide"},{"brown"},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 7, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar4_1_1"},{"slide"},{"brown"},{3},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 4})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 5}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleTopAndBottomShape", {2})
    addToTransitionArray(ta,{{"triangle1_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,2},{2},{2,1,4,2}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar1_2_1"},{"slide"},{"brown"},{2},{1},{2,1,2,1},{2},{2,1,2,3}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 3}, "left")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 5})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 5}, "triangleTopAndBottomShape", {1})
    addToTransitionArray(ta,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,5},{2},{2,1,4,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {1, 1, 7, 5}, 90)
    --addToShapeArray(sp, "item","coins", {2, 1, 6, 5}, 250)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
