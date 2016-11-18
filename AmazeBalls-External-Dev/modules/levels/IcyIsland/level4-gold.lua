local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 1, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,5,1},{"*"},{1,1,5,2},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 1, 3, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 4, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 7, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 5})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 5, "bar", "horz", 3})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 1, "triangleTopLeftShape", 1, 6})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,1},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 7, 1, "triangleBottomRightShape", 1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{3},{1},{2,1,3,3},{2},{2,1,4,2},{"*"},{2,1,4,1},{3},{2,1,7,1}})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 6, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 7, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 6, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 5, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 2, 5, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_1", 2, 1, 6, 5})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_1", 2, 1, 7, 5, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"slide"},{},{2},{1},{2,1,7,3},{2},{2,1,7,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 6, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 1, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 3, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 4, 125})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 5, 85})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 4, 5, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
