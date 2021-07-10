local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,1},{"*"},{1,1,4,2},{2},{1,1,5,2}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 2}, "bar", {"vert"})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,1,2},{2},{1,1,2,2},{3},{1,1,3,2}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 1, 4}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar3_1_1"},{"slide"},{"brown"},{1},{1},{1,1,1,4},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,5},{2},{1,1,5,4}})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "item","map", {1, 2, 3, 1})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 3, 2})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,3,2},{2},{1,2,4,2},{3},{1,2,5,2}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 4}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle5_1_2"},{"slide"},{},{2},{1},{1,2,5,5},{2},{1,2,6,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 5, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 5, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 5}, 50)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 1}, 90)
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
