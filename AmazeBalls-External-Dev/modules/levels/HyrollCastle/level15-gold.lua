local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 4, 3})
    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 2, 3, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 2, 5, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 2, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 2, 4, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 2, 4, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,2,4,2},{2},{1,2,4,3},{3},{1,2,4,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 2, 5, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 2, 1, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 2, 3, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,2,3,2},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 2, 4, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 2, 2, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 2, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 2, 4, 5, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"switchSlide"},{},{1},{1},{1,2,4,5},{2},{1,2,6,5},{3},{1,2,7,5}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 2, 6, 6, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,2,5,6},{2},{1,2,6,6}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 2, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 2, 1, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 2, 5, 1, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 2, 1, 2, "triangleBottomRightShape", 1, 8, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 2, 3, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 2, 5, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 2, 1, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 2, 2, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_1"},{"slide"},{},{1},{1},{2,2,2,3},{2},{2,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 2, 6, 3, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_1"},{"slide"},{},{2},{1},{2,2,5,3},{2},{2,2,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_1", 2, 2, 5, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_1", 2, 2, 2, 5})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_1", 2, 2, 3, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_2_1"},{"switchSlide"},{},{2},{1},{2,2,3,4},{2},{2,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_1", 2, 2, 4, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle10_2_1", 2, 2, 6, 5, "triangleTopLeftShape"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 2, 1, 4, { {"slide","triangle1_1_1"} } })
    table.insert(shapeArrayParameters,{"switch","switch2_1_1", 1, 2, 5, 4, { {"slide","triangle5_1_1"} } })
    table.insert(shapeArrayParameters,{"switch","switch1_2_1", 2, 2, 4, 4, { {"slide","triangle8_2_1"} }, "one-way" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 2, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 2, 6, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 4, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 3, 4, 225})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 3, 1, 90})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 1, 1, {}})
    table.insert(shapeArrayParameters,{"item","hook", 2, 2, 4, 2, {}})
    table.insert(shapeArrayParameters,{"item","dummyBall", 1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
