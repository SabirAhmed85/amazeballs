local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 3, 2, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 4, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{"brown"},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 7, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{"brown"},{3},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 5, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 2, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,2},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{"brown"},{2},{1},{2,1,2,1},{2},{2,1,2,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 5, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,5},{2},{2,1,4,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 7, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 3, 3, "purpleCoin"})

    --ITEMS
    --table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 5, 90})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 5, 250})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
