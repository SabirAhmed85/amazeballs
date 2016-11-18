local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 7, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 3, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"slide"},{},{3},{1},{1,1,4,4},{2},{1,1,4,3},{3},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 7, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 3, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 5, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 6, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 7, 4, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 1, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 5, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 7, 5, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 4, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_2", 1, 2, 6, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_2", 1, 2, 4, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_1_2"},{"slide"},{},{1},{1},{1,2,4,2},{2},{1,2,4,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_2", 1, 2, 6, 3, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan6_1_2", 1, 2, 1, 4, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan7_1_2", 1, 2, 4, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 6, 4, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 6, 4, "left"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 4})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 8, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 5, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 5, "triangleBottomRightShape", 1, 8})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 6, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 7, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 3, 85})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 5, 125})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 3, 4, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
