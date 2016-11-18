local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 3, "triangleBottomLeftShape", 1, 7})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 3, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 4, "right"} )
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 5, 4} )
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 4} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{4},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3},{4},{1,1,7,4},{5},{1,1,7,5} })
    table.insert(shapeArrayParameters,{"door","door4_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 4, 2, "right"} )
    table.insert(shapeArrayParameters,{"endPoint","endPoint1", 2, 1, 6, 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 5, "triangleTopLeftShape"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 4, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 3, 400})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 5, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t