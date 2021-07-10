local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomRightShape", {1, 9})
    addToTransitionArray(ta,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 2})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 2}, "down")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,7,1},{2},{1,1,7,2}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"switchSlide"},{},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar2_1_1"},{"switchSlide"},{},{1},{1},{1,1,3,4},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 1})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"slide"},{},{1},{1},{1,1,2,5},{2},{1,1,3,5},{3},{1,1,3,4},{4},{1,1,4,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "item","map", {1, 2, 3, 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 4}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","compass", {1, 2, 7, 5})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 1}, { {"slide","bar2_1_1"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 3, 4}, { {"slide","bar1_1_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 1, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 1, 45})
    addToShapeArray(sp, "item","coins", {1, 2, 6, 5}, 250)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 2}, 70)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 4}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 2, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
