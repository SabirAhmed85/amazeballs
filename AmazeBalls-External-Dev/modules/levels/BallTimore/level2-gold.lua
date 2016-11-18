local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"gun","gun1_1_1", 1, 1, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 3})
    table.insert(shapeArrayParameters,{"gun","gun1_1_1", 1, 1, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 6, 5})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 5, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,7,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"gun","gun1_1_2", 1, 2, 4, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 6, 3, "triangleTopLeftShape", 1, 5, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 4, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{},{3},{1},{1,2,2,5},{2},{1,2,4,5},{3},{1,2,4,4}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
