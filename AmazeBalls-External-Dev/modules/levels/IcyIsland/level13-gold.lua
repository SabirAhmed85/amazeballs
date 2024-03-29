local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 3, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,4,1}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 6, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 7, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,6,2},{3},{1,1,7,2}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,2,4},{2},{1,1,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,4,4},{2},{1,1,5,4}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 3, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 7, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 3, 5, "down", "disabled"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 6, 5})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 5, 5, "up", "none", "none", "none"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 3, 1})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"switchSlide"},{},{2},{1},{1,2,5,2},{2},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 5, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"switchSlide"},{},{1},{1},{1,2,5,3},{2},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 7, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 4, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 6, 4, "triangleBottomRightShape", 1, 3, "breakable"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 7, 4, "right"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 1, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 4, 2, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"slide"},{},{1},{1},{2,2,4,2},{2},{2,2,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 5, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 6, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 7, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,7,2},{2},{2,2,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 2, 3, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_2", 2, 2, 1, 4, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"switchSlide"},{},{2},{1},{2,2,1,2},{2},{2,2,1,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 1, 4, "up"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 2, 4})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 5, 5, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 7, 5, "up"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 5, 1, { {"slide","simple1_1_2"},{"slide","manualFan1_1_2"},{"door-open","door1_1_1"},{"slide","bar3_2_2"} }, "one-way" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 4, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 3, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 5, 220})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 2, 2, 130})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 3, 2, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 7, 1, {}})
    table.insert(shapeArrayParameters,{"item","dummyBall", 1, 2, 1, 4, {}})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 1, 4, 5, {}})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
