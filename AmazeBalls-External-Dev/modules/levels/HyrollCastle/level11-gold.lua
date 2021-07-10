local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,6,1}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 6, 3}, "right")
    addToTransitionArray(ta,{{"manualFan2_1_1"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,6,4}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 4})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{3},{1},{1,1,1,4},{2},{1,1,2,4},{3},{1,1,3,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 4}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 1}, "left")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 3}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{},{2},{1},{1,2,4,3},{2},{1,2,5,3}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 3}, "up")
    addToTransitionArray(ta,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,6,3}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 5, 4}, "left")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 3, 6}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 3, 2}, { {"flip-horizontal","triangle1_1_2"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
