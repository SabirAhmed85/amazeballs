local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 1, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,1},{2},{1,1,3,2},{3},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 7, 3, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{"green"},{2},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 2, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 4})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 6, 5, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"slide"},{"green"},{3},{1},{1,1,4,5},{2},{1,1,5,5},{3},{1,1,6,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 3, 3, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 6, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 2, 1, "purpleCoin"})

    --ITEMS   
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 3, 75}) 
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 3, 90}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 4, 175}) 
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 1, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
