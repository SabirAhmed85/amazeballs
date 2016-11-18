local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 1, "triangleTopAndBottomShape", 2})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 2, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 4, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 7, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 1, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 2, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 4, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 7, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 4, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_1", 1, 1, 6, 5, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_1_1"},{"slide"},{},{3},{1},{1,1,5,4},{2},{1,1,5,5},{3},{1,1,6,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 1, 3, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 2, 3, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 4, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 7, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 1, 4, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_1", 2, 1, 5, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 5, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 3, 5, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_1", 2, 1, 7, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 2, 6, "bar", "vert", 4})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 3, 1, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,1},{2},{2,2,4,1}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 7, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_2", 2, 2, 3, 2, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,2},{2},{2,2,4,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 3, 2, "triangleTopLeftShape", 1, 5, "breakable"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"switchSlide"},{},{2},{1},{2,2,3,1},{2},{2,2,3,2}})
    table.insert(shapeArrayParameters,{"shape","bar4_2_2", 2, 2, 6, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","bar5_2_2", 2, 2, 7, 2, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_2"},{"switchSlide"},{},{2},{1},{2,2,5,2},{2},{2,2,7,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 6, 2, "triangleBottomLeftShape", 1, 2})
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_2", 2, 2, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{2,2,4,3},{2},{2,2,5,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 2, 2, 2, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{3},{1},{2,2,1,2},{2},{2,2,1,4},{2},{2,2,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 5, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar6_2_2", 2, 2, 7, 4, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar6_2_2"},{"slide"},{},{1},{1},{2,2,7,4},{2},{2,2,7,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 7, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 2, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_2"},{"slide"},{},{1},{1},{2,2,2,5},{2},{2,2,3,5},{3},{2,2,4,5}})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 7, 5, "right"})

    --SCREEN 3-2
    table.insert(shapeArrayParameters,{"shape","triangle1_3_2", 3, 2, 4, 1, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_2", 3, 2, 7, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_2", 3, 2, 7, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_2", 3, 2, 2, 3, "triangleBottomRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle5_3_2", 3, 2, 5, 3, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle6_3_2", 3, 2, 4, 4, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_2", 3, 2, 7, 4, "down"})
    table.insert(shapeArrayParameters,{"simple","simple1_3_2", 3, 2, 1, 5})
    table.insert(shapeArrayParameters,{"shape","triangle7_3_2", 3, 2, 2, 5, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_3_2", 3, 2, 5, 5})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_2", 3, 2, 7, 5, "left"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_2_2", 2, 2, 7, 1, { {"slide", "triangle1_2_2"} }, "one-way" })
    table.insert(shapeArrayParameters,{"switch","switch2_2_2", 2, 2, 4, 2, { {"slide", "bar1_2_2"},{"slide", "bar2_2_2"},{"slide", "bar3_2_2"} }, "one-way", "not-labelled" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 2, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 3, 2, 2, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 2, 4, 1, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 5, 60})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 1, 75})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 3, 90})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 3, 4, 510})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 2, 2, 165})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 1, 5, 145})
    table.insert(shapeArrayParameters,{"item","coins", 3, 2, 1, 4, 285})
    table.insert(shapeArrayParameters,{"item","big-present", 2, 2, 7, 2, {}})
    table.insert(shapeArrayParameters,{"item","big-present", 3, 2, 5, 1, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 6, 1, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 3, 2, 6, 2, {}})
    table.insert(shapeArrayParameters,{"item","clock", 1, 1, 3, 3, {}})
    table.insert(shapeArrayParameters,{"item","hook", 3, 2, 4, 5, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
