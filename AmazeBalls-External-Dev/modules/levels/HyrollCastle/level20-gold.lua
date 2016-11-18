local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 1, 2, "triangleBottomRightShape", 1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 7, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 1, 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 6, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 7, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 4, "triangleTopRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 5, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 6, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 1, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 6, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 1, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 3, 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 7, 2, "down"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 4, 3, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{2},{1},{2,1,3,3},{2},{2,1,4,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,6,5}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_1", 2, 1, 5, 4})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 7, 4, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"simple","simple2_2_1", 2, 1, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,3,5},{3},{2,1,4,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 7, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 6, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 2, 3, 110})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 7, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 5, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
