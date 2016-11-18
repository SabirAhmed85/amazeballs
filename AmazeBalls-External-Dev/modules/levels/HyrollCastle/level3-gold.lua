local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 1, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 7, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 3, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 5, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"autoSlide"},{},{1},{1},{1,2,2,2},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 3, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_2"},{"autoSlide"},{},{1},{1},{1,2,3,2},{2},{1,2,3,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{2},{1},{1,2,5,1},{2},{1,2,5,2},{3},{1,2,5,3},{4},{1,2,5,4}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 2, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 6, 3, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 4, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 4, 4, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"endPoint","endPoint", 1, 2, 3, 5})
    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 4, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 7, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 4, 70})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 5, 50})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 2, 1, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 1, 3, {} })


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
