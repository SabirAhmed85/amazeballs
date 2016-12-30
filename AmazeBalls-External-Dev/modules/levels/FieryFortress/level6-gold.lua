local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 3, 4, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,3,3},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{1},{1},{1,1,5,3},{2},{1,1,5,4}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 6, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,6,2},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,7,3},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"})

    -- 2-1
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,1,1},{2},{2,1,1,2},{3},{2,1,1,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 1, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"item","map", 2, 1, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 2, "triangleTopAndBottomShape", 1, 18})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 2, 4, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,3,1},{"*"},{2,1,2,1},{2},{2,1,2,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 5, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{2},{1},{2,1,4,3},{2},{2,1,5,3},{"*"},{2,1,5,5},{3},{2,1,7,5}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 7, 5, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 5, 5, "down"})

    -- 2-2
    table.insert(shapeArrayParameters,{"item","compass", 2, 2, 5, 1})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 2, 2, 1, 2})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 2, 2, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"slide"},{"brown"},{1},{1},{2,2,2,2},{2},{2,2,2,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 3, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 7, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 2, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{"orange"},{1},{1},{2,2,2,4},{2},{2,2,4,4},{3},{2,2,5,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 5, 5, "down"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 3, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 7, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 3, 3, "purpleCoin"})

    --ITEMS
    --table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 4, 250})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 3, 250})
    table.insert(shapeArrayParameters,{"item","big-present", 2, 2, 3, 5, "present1_2_2", {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 6, 3, "present2_1_1", {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
