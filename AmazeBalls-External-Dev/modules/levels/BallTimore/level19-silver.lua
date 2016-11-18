local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 4, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 3, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 5, 3, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 2, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 5, "left"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 1, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 2, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 2, "right", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 3, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 6, 1, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 1, 2, "up", "none", "none", "none"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 2, 2, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 5, 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 6, 2, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 7, 2, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 1, 3, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 3, 3, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_2", 2, 2, 3, 4, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_2", 2, 2, 5, 4, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_2", 2, 2, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle10_2_2", 2, 2, 7, 5, "triangleTopLeftShape", 1, _, "fire"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 5, 4, { {"door-open","door1_1_2"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
