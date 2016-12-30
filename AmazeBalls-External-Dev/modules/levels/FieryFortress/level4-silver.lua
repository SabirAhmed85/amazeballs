local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 1, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 2, "right"} )
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 3, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,3},{2},{1,1,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 4, "triangleTopAndBottomShape", 2})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 2, 1, "right"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{2},{1},{1,2,1,1},{2},{1,2,2,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 1, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,1},{2},{1,2,7,1}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 3, 3, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,3,3},{2},{1,2,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 6, 3, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,5},{2},{1,2,2,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 7, 5, "left"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{"orange"},{2},{1},{1,2,6,5},{2},{1,2,7,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 4, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 3, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 5, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 4, 75})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 1, 125})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 3, 75})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 1, 3, "present1_1_2", {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t