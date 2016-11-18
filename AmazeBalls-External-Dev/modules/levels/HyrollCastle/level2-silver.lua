local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 1, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleBottomRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 5, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 6, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 7, 3, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 1, 4, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 2, 5, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 3, 5, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 5, 4, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 5, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 1})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"autoSlide"},{timePerSquare = 300, pauseTime = 40},{2},{1},{1,2,2,2},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 6, 4, "triangleTopLeftShape", 1, 5, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 7, 4, "up"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 6, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 4, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 1, 70})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 2, 150})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 6, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
