local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 3, 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 2, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 3, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 4, "triangleTopRightShape", 1, 13})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 1, 1, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2},{3},{2,1,2,2},{4},{2,1,3,2}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 7, 1})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 3, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 3, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,3},{2},{2,1,4,1}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 7, 4, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,5},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 4, 5, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 4, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 7, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 5, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 1, 50})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 2, 80})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 2, 90})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 6, 1, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 7, 3, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
