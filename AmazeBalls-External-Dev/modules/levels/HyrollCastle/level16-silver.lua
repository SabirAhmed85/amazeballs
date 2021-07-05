local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 1}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,3,2},{2},{1,1,4,2},{3},{1,1,5,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,3},{2},{1,1,3,3},{3},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,3,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 1})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 3}, "left")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 1, 3}, "up")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 1, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 4}, 90)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 2}, 110)
    addToShapeArray(sp, "item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})
    addToShapeArray(sp, "item","bomb", {1, 2, 5, 5, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    addToShapeArray(sp, "item","big-present", {1, 2, 7, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
