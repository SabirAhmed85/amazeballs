local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 2, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 3, "triangleTopRightShape", 1, 10, "breakable"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 2, 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 7, 3, "triangleBottomRightShape", 1, _})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 1, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 3, 4, "triangleTopRightShape", 1, 1, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 5, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 7, 4, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 7, 4, "right"})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 4, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 7, 1, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_1", 3, 1, 4, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 6, 2, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_3_1", 3, 1, 4, 3, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 3, 1, 5, 3, "triangleBottomLeftShape", 1, _})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_1", 3, 1, 1, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_3_1", 3, 1, 4, 4})
    table.insert(shapeArrayParameters,{"shape","triangle5_3_1", 3, 1, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"simple","simple1_3_1", 3, 1, 3, 5})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 3, 1, 5, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_2"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{1},{1},{3,1,5,5},{2},{3,1,6,5},{3},{3,1,7,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 4, 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 3, 3, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 5, 3, "triangleTopRightShape", 1, 13, "breakable"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
