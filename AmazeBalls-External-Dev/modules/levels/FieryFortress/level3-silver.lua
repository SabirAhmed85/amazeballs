local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 1, 1, 2, 2, "down"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 1, 1, 4, 2, "right"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 1, 1, 2, 5, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{1},{1},{1,1,2,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 1, 1, 7, 2, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 2, 1, 3, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 2, 1, 5, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_3_1", 2, 1, 7, 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_1", 2, 1, 3, 2, "down"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_3_1", 2, 1, 6, 2, "down"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_3_1"},{"slide"},{"orange"},{2},{1},{2,1,5,2},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters,{"door","door2_3_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 2, 1, 4, 4, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_1"},{"slide"},{"green"},{2},{1},{2,1,3,4},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 2, 1, 7, 4, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_1", 2, 1, 3, 5, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_1", 2, 1, 4, 5, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle5_3_1", 2, 1, 5, 5, "triangleTopRightShape", 1, _, "breakable"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 4, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 4, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 5, 75})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 5, 75})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 7, 5, 75})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 4, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t