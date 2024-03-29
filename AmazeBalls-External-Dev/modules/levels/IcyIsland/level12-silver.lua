local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape", 1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,1,1},{2},{1,1,1,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 6, 2, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 7, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,7,1},{2},{1,1,7,2}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 6, 3, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 7, 3, "none", "none", "down", "none"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 1, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 3, 4, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 3, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 4})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 6, 5, "bar", "horz", 3})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 1, "triangleTopLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 4, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 3, 2, "triangleTopRightShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 6, 2, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 7, 2})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 5, 3, "triangleTopLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_2", 1, 2, 2, 4})
    table.insert(shapeArrayParameters,{"item","compass", 1, 2, 3, 4})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 4, 4, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{2},{1},{1,2,4,3},{2},{1,2,4,4}})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 4, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 7, 3, { {"door-open", "door1_1_2"},{"door-open", "door2_1_2"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 2, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 2, 115})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 4, 1, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 2, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
