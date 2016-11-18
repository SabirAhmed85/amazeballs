local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 1, 1})
    table.insert(shapeArrayParameters,{"tunnel","tunnel1_1_1", 1, 1, 3, 1, 1, 1, 7, 5, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,3,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 4, 2, "right"})
    table.insert(shapeArrayParameters,{"tunnel","tunnel2_1_1", 1, 1, 2, 3, 1, 1, 5, 2, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel2_1_1"},{"slide"},{},{2},{1},{1,1,1,3},{2},{1,1,2,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"tunnel","tunnel3_1_1", 1, 1, 3, 4, 2, 1, 6, 3, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel3_1_1"},{"slide"},{},{2},{1},{1,1,1,4},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 4, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 2, 5, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,2,5},{2},{1,1,4,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 1, 1, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 7, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,5,2},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 1, 3, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_1", 2, 1, 4, 3, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 7, 3, "triangleTopLeftShape", 1, 5})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 1, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 5, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 5, 4})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 6, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 3, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_2_1", 2, 1, 7, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 4, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 5, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 3, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 3, 120})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 1, 90})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 2, 1, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 5, 5, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
