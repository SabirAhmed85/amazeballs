local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 1, 1, "right"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 1, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,1},{2},{1,1,4,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 7, 1, "left"} )
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 2, "triangleBottomLeftShape", 1, 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 3} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 4, 4, "right"} )
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 5, "triangleTopAndBottomShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 5, "triangleTopAndBottomShape", 1})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 1, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 1, "right"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 2, "triangleTopRightShape", 1, 10})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 6, 2, "right"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,2},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 3, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 1, 5, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{"green"},{1},{1},{2,1,1,5},{2},{2,1,2,4},{3},{2,1,3,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 4, 5, "right"} )
    table.insert(shapeArrayParameters,{"item","map", 2, 1, 6, 5} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 7, 5, "up"} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 6, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 2, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 1, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 4, 90})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 1, 50})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 1, 2, 150})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 2, 150})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 7, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t