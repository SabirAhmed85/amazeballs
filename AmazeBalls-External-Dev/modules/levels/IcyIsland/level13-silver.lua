local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 3, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 5, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 7, 1, "none", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,2,1},{2},{1,1,7,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 2, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,5,2}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 1, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"switchSlide"},{},{1},{1},{1,1,1,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 3, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 3, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 3, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 2, 4})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, 1, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","bar5_1_1", 1, 1, 6, 5, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters,{"shape","bar6_1_1", 1, 1, 6, 5, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 5})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door3_1_2", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_2", 1, 2, 2, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,3,3},{3},{1,2,5,3},{4},{1,2,7,3}})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 5, 50})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 6, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 6, "bar", "vert"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 5, 4, { {"slide","bar4_1_1"},{"slide","bar5_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 3, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 7, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 2, 55})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 5, 160})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 6, 2, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
