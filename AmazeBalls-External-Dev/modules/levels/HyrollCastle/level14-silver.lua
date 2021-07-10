local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 3})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle5_1_1"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,7,4}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 4}, "triangleTopLeftShape", {1, 6})
    addToTransitionArray(ta,{{"triangle6_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,4,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 4}, "up")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,5,4},{2},{1,1,5,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 3, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar3_1_1"},{"slide"},{},{2},{1},{1,1,6,4},{2},{1,1,6,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 4, 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 4, 5})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 3, 5}, 600)
    addToShapeArray(sp, "item","coins", {1, 2, 4, 4}, 150)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 75)
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 3}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 3, 4}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 6, 2}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 6, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
