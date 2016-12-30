local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 2, 1})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 2, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,2},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 2, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 3, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 3, 4, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 300, pauseTime = 100},{1},{1},{1,1,3,4},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 1, 5})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 4, 5})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 5})

    -- 1-2
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 1, 1, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 7, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 5, 2, "triangleBottomLeftShape", 1, 20, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 2, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{2},{1},{1,2,3,2},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 4, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 7, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 4, 4, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 2, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_2", 1, 2, 4, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 6, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_2", 1, 2, 7, 5, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,5},{2},{1,2,7,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 5, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 2, 5, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 2, 4, "present1_1_2", {} })
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 1, 250})
    --table.insert(shapeArrayParameters,{"item","something", 1, 1, 6, 4})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
