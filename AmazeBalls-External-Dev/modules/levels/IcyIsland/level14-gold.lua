local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 2, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 2, "triangleTopRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 1, 4, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 1, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 1, "triangleBottomRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 2, 3, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 5, 3, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{1},{1},{2,1,5,3},{2},{2,1,7,3},{3},{2,1,7,1}})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 3, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,3,4},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 2, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 6, 5, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 7, 6, "bar", "vert", 2})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 4, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 7, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 3, 85})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 1, 65})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 4, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 4, 5, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
