local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_1", {1, 1, 4, 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 4, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 1, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 3}, "triangleTopLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 4, 3}, "triangleTopRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_2", {1, 2, 3, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 5, 5}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 5}, "right"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_2", {2, 2, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 6, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 1, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 3, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_2", {2, 2, 1, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_2", {2, 2, 2, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_2_2", {2, 2, 1, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 4, 5}, "bar", {"vert", 2}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 2, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 7, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 2, 3}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 5}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 6, 5}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 7, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 5, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","iceCape", {2, 2, 2, 1}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
