local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 1, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 1, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,6,1,},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 7, 2, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 3, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 3, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 7, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 4, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 4, "right", "disabled"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 1, 5, "down", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 2, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 6, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,1,5,5},{2},{1,1,6,5}})

    -- 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 1, 1, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 3, 1, "triangleTopLeftShape", 1, 11, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 1, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 1, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 1, 3, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 2, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 3, 2})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 4, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 5, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left", "disabled"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 6, 3, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,3},{2},{2,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_1", 2, 1, 1, 4, "triangleTopRightShape", 1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,1,1,4},{2},{2,1,1,5}})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_1", 2, 1, 3, 4, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_1", 2, 1, 4, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle10_2_1", 2, 1, 5, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 6, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters,{"shape","triangle11_2_1", 2, 1, 2, 5, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle12_2_1", 2, 1, 3, 5, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle12_2_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,1,3,5},{2},{2,1,4,5}})
    table.insert(shapeArrayParameters,{"shape","triangle13_2_1", 2, 1, 5, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 6, 5})
    table.insert(shapeArrayParameters,{"item","map", 2, 1, 7, 5})

    -- 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 5, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 2, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 4, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"door","door3_1_2", 1, 2, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 1, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{2},{1},{1,2,1,3},{2},{1,2,1,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_2", 1, 2, 3, 4, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{1},{1},{1,2,3,4},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 5, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{1},{1},{1,2,5,4},{2},{1,2,5,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_2", 1, 2, 7, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{2},{1},{1,2,7,3},{2},{1,2,7,4}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 8, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 2, 5, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 4, 5, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 7, 5, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{"brown"},{3},{1},{1,2,7,1},{2},{1,2,7,3},{3},{1,2,7,5}})
    table.insert(shapeArrayParameters,{"door","door4_1_2", 1, 2, 7, 5, "right"})

    -- 2-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 2, 1, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,2,2,1},{2},{2,2,2,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 4, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 6, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 8, 1, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 1, 1, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,1,1},{2},{2,2,1,2}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 6, 2, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{"brown"},{1},{1},{2,2,6,2},{2},{2,2,6,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 7, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_2", 2, 2, 2, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"slide"},{"brown"},{1},{1},{2,2,2,3},{2},{2,2,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 4, 3, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 5, 3, "triangleBottomRightShape", 1, _, "breakable"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_2_2", 2, 2, 7, 3, 4})
    table.insert(shapeArrayParameters,{"shape","bar4_2_2", 2, 2, 8, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_2"},{"slide"},{"brown"},{2},{1},{2,2,8,2},{2},{2,2,8,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 2, 2, 1, 4, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_2", 2, 2, 5, 4, "right"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut2_2_2", 2, 2, 1, 5, 2})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 2, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_2", 2, 2, 3, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_2", 2, 2, 6, 5, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar5_2_2", 2, 2, 7, 5, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{2,2,7,2},{2},{2,2,7,5}})


    -- ALL SWITCHES

    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 4, 2, { {"slide", "triangle4_1_2"},{"slide", "autoFan4_1_2"},{"slide", "triangle5_1_2"},{"slide", "autoFan5_1_2"} }, "one-way", "not-labelled" })
    table.insert(shapeArrayParameters,{"switch","switch2_1_1", 1, 1, 6, 4, { {"slide", "triangle7_2_1"},{"slide", "triangle12_2_1"} } })

    table.insert(shapeArrayParameters,{"switch","switch1_2_1", 2, 1, 2, 1, { {"door-open", "door1_2_1"}, {"door-open", "door1_1_1"} } })

    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 4, 1, { {"slide", "autoFan4_1_1"}, {"door-open", "door3_1_1"}, {"slide", "bar3_1_1"} }, "one-way", "not-labelled" })
    table.insert(shapeArrayParameters,{"switch","switch2_1_2", 1, 2, 4, 3, { {"flip-vertical", "triangle1_1_2"}, {"slide", "autoFan1_2_2"}, {"slide", "bar5_2_2"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 1, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 3, 4, "purpleCoin"})

    --ITEMS
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 3, 250})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 1, 2, 3, 400})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 1, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 4, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
