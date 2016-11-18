local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomLeftShape", _, 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 2, "triangleTopRightShape", _, 10})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,4,2},{2},{1,1,5,2},{3},{1,1,5,1},{4},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 1, 4, 3, "triangleLeftAndRightShape", 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 1, 5, 3, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 4, "left"})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,5},{2},{1,1,7,4},{3},{1,1,7,2}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 1-2

    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 6, 1, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"brown"},{1},{1},{1,2,6,1},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 2, "doubleBar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{"brown"},{2},{1},{1,2,2,1},{2},{1,2,2,2},{3},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 3, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,3,2},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 2, "doubleBar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{"brown"},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 2, 6, 3} )

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
