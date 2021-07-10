local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 3}, "down")
    addToTransitionArray(ta,{{"manualFan2_1_1"},{"slide"},{},{3},{1},{1,1,4,4},{2},{1,1,4,3},{3},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 1, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 5, 5}, "left")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 4, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 6, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 4, 2}, "down")
    addToTransitionArray(ta,{{"manualFan4_1_2"},{"slide"},{},{1},{1},{1,2,4,2},{2},{1,2,4,3}})
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 6, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan6_1_2", {1, 2, 1, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan7_1_2", {1, 2, 4, 4}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 4}, "left")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 4})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 5}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 5}, "triangleBottomRightShape", {1, 8})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 6, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 2, 3}, 85)
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5, 125})
    addToShapeArray(sp, "item","small-present", {1, 2, 3, 4}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
