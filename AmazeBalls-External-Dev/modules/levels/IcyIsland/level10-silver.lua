local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 1, 1, "up", "none", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 4, 1}, {"none", "none", "down"}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_1", {1, 1, 6, 1}, {"none", "right", "none", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_1", {1, 1, 6, 2, "up", "none", "none", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter5_1_1", {1, 1, 4, 3, "up", "right", "none", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter6_1_1", {1, 1, 7, 3}, {"none", "none", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 2, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter7_1_1", {1, 1, 6, 4, "up", "none", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 5}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 2, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, 13}))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 1}, 50))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_1", {2, 1, 2, 1}, {"none", "right", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_1", {2, 1, 5, 1}, {"none", "right", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 7, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_2_1", {2, 1, 4, 2}, {"none", "right", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_2_1", {2, 1, 6, 2, "up", "none", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 2, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter5_2_1", {2, 1, 4, 3, "up", "none", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 4}, "left"))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 2, 4}, 100))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 5, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 4, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter6_2_1", {2, 1, 5, 5}, {"none", "right", "none"}, "left"))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 1, 1}, 50))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 6, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 4, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 4}, 140))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 3, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 1, 7, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
