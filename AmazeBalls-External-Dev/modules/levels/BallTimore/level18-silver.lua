local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"gun","gun1_1_1", 1, 1, 2, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,1,6,1},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 4, 5})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 5, 5})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 7, 5, "left"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 6, 1, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 3, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gun","gun1_2_1", 2, 1, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 5, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,5,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 1, 5})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 3, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,6,5}})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_2_1", 2, 1, 6, 3, { {"slide","triangle1_1_1"},{"slide","autoFan1_2_1"} }, "one-way" })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
