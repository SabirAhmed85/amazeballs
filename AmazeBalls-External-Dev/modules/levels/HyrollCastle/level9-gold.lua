local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 2, "down"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 5, 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 4, 4, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 6, "bar", "vert", 2})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 1, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 6, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 2, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 3, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gem","purple1", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 4, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 1, 5, "triangleTopLeftShape", 1, 5})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 2, 5, "triangleTopRightShape", 1, 1, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 6, 5, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 3, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 7, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 3, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 3, 70})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 4, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
