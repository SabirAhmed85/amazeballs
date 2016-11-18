local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 1, "triangleBottomRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 1, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 2, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 2, "left"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 6, 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 4, "triangleTopRightShape", 1, 10})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 4, "up"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,1},{2},{1,2,3,1}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 1, "triangleTopAndBottomShape", 1})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 8, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 2, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{1},{1},{1,2,2,2},{2},{1,2,4,2},{3},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 6, 2, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 7, 2, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 7, 2, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 4, 3, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar5_1_2", 1, 2, 8, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 1, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 2, 4, "triangleTopRightShape", 1, 1})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_2", 1, 2, 5, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 4})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_2", 1, 2, 2, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_1_2"},{"slide"},{},{1},{1},{1,2,2,5},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle10_1_2", 1, 2, 6, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar6_1_2", 1, 2, 4, 6, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar7_1_2", 1, 2, 6, 6, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar7_1_2"},{"slide"},{},{2},{1},{1,2,5,6},{2},{1,2,6,6}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 3, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 5, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 2, 80})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 5, 150})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 5, 50})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 3, 3, 200})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 7, 1, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
