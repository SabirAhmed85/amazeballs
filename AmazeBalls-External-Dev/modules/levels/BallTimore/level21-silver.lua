local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,1,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 2, "left"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 2})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 8, 2, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 3, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 4, "triangleTopRightShape", 1, 10, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 7, 4, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 5, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 2, "triangleTopLeftShape", 1, 11, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 2, 4})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 4, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1, _, "breakable"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 2, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 2, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 2, 150})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 3, 5, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 6, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
