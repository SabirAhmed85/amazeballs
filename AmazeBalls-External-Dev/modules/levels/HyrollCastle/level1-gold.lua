local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 2}, "bar", {"vert", 4})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 6, 3}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 3, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 3, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 4, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 6, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,6,4}})
    addToShapeArray(sp, "manualFan","manualFan5_2_1", {2, 1, 7, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_2_1"},{"slide"},{},{3},{1},{2,1,5,1},{2},{2,1,5,2},{3},{2,1,6,2},{4},{2,1,7,3}})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 6})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,3,5},{2},{2,1,4,4}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 5}, "up")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 3, 4}, { {"slide", "autoFan2_1_1"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 4}, 80)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 2}, 80)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 2}, 12)
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
