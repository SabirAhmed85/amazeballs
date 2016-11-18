local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 2, "triangleLeftAndRightShape", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,6,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 3, "right"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 4, 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 6, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 3, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{3},{1},{1,1,1,4},{2},{1,1,2,4},{3},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 4, "triangleTopAndBottomShape", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 5, 5, "up"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 1, "triangleTopAndBottomShape", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 5, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{2},{1},{1,2,4,3},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 6, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 2, 4, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 5, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 3, 6, "bar", "vert", 2})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 3, 2, { {"flip-horizontal","triangle1_1_2"} }, "one-way" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 4, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 4, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
