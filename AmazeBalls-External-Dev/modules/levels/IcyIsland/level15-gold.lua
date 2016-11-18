local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"tunnel","tunnel1_1_1", 1, 1, 5, 1, 1, 1, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 3, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,3},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 4, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 5, "up"})
    table.insert(shapeArrayParameters,{"tunnel","tunnel2_1_1", 1, 1, 6, 5, 1, 2, 2, 1, "none"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 7, 5, "triangleTopRightShape", 1, _, "icy"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,1},{2},{1,2,1,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 1, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 4, 2, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 2, 1, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 2, 1, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 2, 5, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,2,4,5},{"*"},{1,2,4,4},{2},{1,2,5,4},{3},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"tunnel","tunnel1_1_1", 1, 2, 2, 5, 1, 1, 1, 1, "right"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 5, 5})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 2, 6, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 7, 5, "bar", "horz", 2})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 3, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 4, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 4, 1, 75})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 5, 110})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 1, 2, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
