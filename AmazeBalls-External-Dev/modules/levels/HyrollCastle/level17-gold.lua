local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 3, 1})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 5, 1})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 7, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 2, "right"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 7, 2})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 4, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 7, 4, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 1, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 5, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 5, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 1, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 2, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 3, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,5,3},{2},{1,2,5,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 1, 4, "right"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 7, 4, "right"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 2, 1, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 4, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 2, 2, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 4, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 6, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{2},{1},{2,2,4,2},{2},{2,2,6,2},{3},{2,2,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 3, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{3},{1},{2,2,3,1},{2},{2,2,3,2},{3},{2,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 4, 4, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 3, 5, "left"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 6, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 6, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 2, 7, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 2, 345})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 1, 1, 85})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 4, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 2, 5, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 3, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 2, 1, {}})
    table.insert(shapeArrayParameters,{"item","hook", 2, 2, 4, 3, {}})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
