local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,1,3}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 2}, "left")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","map", {1, 2, 2, 4})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 2}, 150)
    addToShapeArray(sp, "item","small-present", {1, 1, 3, 5}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 6, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
