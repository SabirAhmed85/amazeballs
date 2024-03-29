local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 1, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,1,5,1},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 5, 2} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 4, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,1},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,4},{2},{1,1,6,1}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 5, "triangleTopLeftShape"})

    -- SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 6, 1, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{4},{1},{1,2,3,4},{"*"},{1,2,3,3},{2},{1,2,4,3},{"*"},{1,2,4,2},{3},{1,2,6,2},{4},{1,2,6,1}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 3, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 2, 5, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{2},{1},{1,2,1,5},{2},{1,2,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 6, 5, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_2"},{"slide"},{"green"},{2},{1},{1,2,3,5},{2},{1,2,6,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 5, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 5, 1, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 4, 65}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 180}) 
    table.insert(shapeArrayParameters,{"item", "small-present", 1, 2, 1, 4, {} })
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 2, 110}) 

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
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
