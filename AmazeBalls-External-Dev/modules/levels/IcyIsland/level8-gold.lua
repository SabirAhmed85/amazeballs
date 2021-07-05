local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 4}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 5})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 1, 6}, "bar", {"vert", 4})

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 1}, "down")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 4, 1})
    addToShapeArray(sp, "item","map", {2, 1, 6, 1})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 2, 2}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 3}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 3}, "left")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 7, 3}, "left")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 6, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 2, 5}, "right")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 2, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan5_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan6_2_1", {2, 1, 6, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan7_2_1", {2, 1, 7, 5}, "down")
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 2, 1}, "up")
    --addToShapeArray(sp, "item","coins", {2, 2, 5, 1}, 20)
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 7, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 2, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 4, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 5, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 4, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 7, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 2, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 6, 5}, "left")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 7, 5}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,5},{2},{2,2,7,5}})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 6, 2}, { {"slide","bar1_2_2"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 4}, 80)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 1, 125})
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 5}, {})
    addToShapeArray(sp, "item","hook", {1, 1, 2, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
