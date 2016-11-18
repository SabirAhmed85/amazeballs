local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 8, 1, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 2, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 3, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,3,2},{2},{1,1,4,2},{3},{1,1,5,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 3, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,3},{2},{1,1,3,3},{3},{1,1,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 5, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,3,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 1, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 5, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 1, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 1, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 1, 5, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 6, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 4, 90})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 110})
    table.insert(shapeArrayParameters,{"item","clock", 1, 1, 5, 1, "clock1_1_1", 10, 1})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 2, 5, 5, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 7, 5, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 2, 5, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
