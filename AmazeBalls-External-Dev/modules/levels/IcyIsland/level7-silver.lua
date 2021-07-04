local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_1", {1, 1, 4, 1, 1, 1, 6, 1}, "up"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 3}, "left"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 7, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 7, 4}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
