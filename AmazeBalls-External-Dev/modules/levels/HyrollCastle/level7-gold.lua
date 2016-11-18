local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,2,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"item","compass", 1, 1, 4, 2})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,5,2},{3},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 1, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 3, 3, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 4, 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 8, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,3,5},{3},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 7, 4, "up"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 2, 5})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_1", 2, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire2_2_1", 2, 1, 7, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_1"},{"slide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 2, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{3},{1},{2,1,3,1},{2},{2,1,3,3},{3},{2,1,4,3}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 4, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 5, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,4,4},{2},{2,1,5,4},{3},{2,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","bar4_2_1", 2, 1, 6, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar5_2_1", 2, 1, 3, 5, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 5, "triangleTopLeftShape"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 2, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 6, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 6, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 1, 5, 60})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 1, 4, 90})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 5, 140})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 1, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 7, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 3, 4, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
