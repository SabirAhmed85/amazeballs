local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 2, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 1, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 2, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 3, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 3, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 3, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 4, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 4, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 5, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 7, 5, "up", "none","none","left"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,3},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 3, "triangleLeftAndRightShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 3, "right"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 3, 1, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 2, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 5, 1, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 2, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 6, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_2", 2, 2, 1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{3},{1},{2,2,1,1},{2},{2,2,1,2},{3},{2,2,1,3},{4},{2,2,1,4}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 3, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{},{1},{1},{2,2,3,3},{2},{2,2,3,4}})
    table.insert(shapeArrayParameters,{"shape","bar3_2_2", 2, 2, 5, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"slide"},{},{2},{1},{2,2,5,2},{2},{2,2,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 7, 3, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 3, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_2", 2, 2, 5, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 6, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_2", 2, 2, 7, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar4_2_2", 2, 2, 1, 5, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_2", 2, 2, 2, 5, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_2_2", 2, 2, 6, 5, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 7, 5, "left"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 1, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 7, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 2, 1, 5, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 4, 90})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 220})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 4, 5, 160})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 2, 1, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 4, 4, {}})
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 1, 2, {}})
    table.insert(shapeArrayParameters,{"item","bomb", 2, 2, 7, 1, {}})
    table.insert(shapeArrayParameters,{"item","clock", 2, 2, 2, 4, {}})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
