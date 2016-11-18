local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 4, 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 3, "triangleBottomLeftShape", 1, 7, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 7, 3, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 5, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 5, 5, "up"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 3, 2, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 6, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 3, "triangleTopLeftShape", 1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 2, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,3,2},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{2},{1},{1,2,4,1},{2},{1,2,4,3},{3},{1,2,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 2, 4, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 2, 4, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{},{1},{1},{1,2,2,4},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 6, 4, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 5, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_2", 1, 2, 4, 5, "up","none","none","none"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 5, 5, "triangleBottomLeftShape", 1, _, "icy"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 5, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 2, 2, 5, 250})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 3, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 4, 5, "triangleTopRightShape", 1, 10, "breakable"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 3, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 1, 1, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 300})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 6, 3, 280})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 1, 5, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 2, 4, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 5, 2, {}})
    table.insert(shapeArrayParameters,{"item","clock", 2, 2, 6, 4, {}})
    table.insert(shapeArrayParameters,{"item","superDummy", 1, 2, 2, 1, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
