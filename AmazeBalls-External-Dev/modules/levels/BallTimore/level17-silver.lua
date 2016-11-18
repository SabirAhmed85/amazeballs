local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 5, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 3, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 6, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_1", 1, 1, 7, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 4, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"autoSlide"},{timePerSquare = 600},{2},{1},{1,2,4,2},{2},{1,2,4,5}})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_2", 1, 2, 5, 1, "none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"gun","gun1_1_2", 1, 2, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 5})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
