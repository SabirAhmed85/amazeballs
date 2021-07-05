local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 4}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 3, 1}, "left")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 5, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 2, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 1, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 2, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 5, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 1, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 3, 4}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan6_1_2", {1, 2, 6, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 5})
    addToShapeArray(sp, "manualFan","manualFan7_1_2", {1, 2, 2, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan8_1_2", {1, 2, 6, 5}, "left")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2,6}, "bar", {"vert", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 6, 1, 125})
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 85)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
