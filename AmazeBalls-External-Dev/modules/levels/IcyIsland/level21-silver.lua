local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 2, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 1, 3, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 1, 4, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 6, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 6, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 1, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 2, 1, "bar", "vert", 3})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_2", 1, 2, 4, 1, 2})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 1, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,3},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 3, "triangleLeftAndRightShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 7, 3, "right"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 4, 3})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 3, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 2, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 2, 2, 3, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 1, 170})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 3, 80})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 3, 4, {}})
    table.insert(shapeArrayParameters,{"item","characterSpecial", 1, 2, 3, 3, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
