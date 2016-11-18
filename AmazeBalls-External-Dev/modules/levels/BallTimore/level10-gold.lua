local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 1, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 1, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 3, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 2, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 2, 3, "left"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right", "disabled"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 2, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 3, 4, "up"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_1", 1, 1, 7, 4, 4})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar5_1_1", 1, 1, 7, 5, "bar", "horz", 2})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 2, 3, "down"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 2, 5, "down"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 4, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 2, 2, 5, 2, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 7, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"slide"},{},{2},{1},{2,2,7,1},{2},{2,2,7,2}})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 3, 3, "triangleBottomLeftShape", 1, 3, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 4, 3, "left"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 2, 2, 2, 4, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_2", 2, 2, 4, 4, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_2", 2, 2, 6, 4, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_2", 2, 2, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 7, 6, "bar", "vert", 2})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"door","door1_3_1", 3, 1, 1, 1, "left", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 2, 1, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 3, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 3, 1, 4, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_1", 3, 1, 3, 2, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_3_1", 3, 1, 4, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_1", 3, 1, 1, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_3_1", 3, 1, 3, 3, "triangleTopLeftShape", 1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_3_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","bar1_3_1", 3, 1, 4, 3, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle6_3_1", 3, 1, 6, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_3_1", 3, 1, 1, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle8_3_1", 3, 1, 4, 4, "triangleBottomRightShape", 1, 14})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_3_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","triangle9_3_1", 3, 1, 6, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle10_3_1", 3, 1, 3, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle11_3_1", 3, 1, 4, 5, "triangleTopLeftShape", 1, 11})

    --SCREEN 4-1
    table.insert(shapeArrayParameters,{"door","door1_4_1", 4, 1, 1, 2, "left"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 3, 3})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 1, 3, { {"door-open","door1_1_1"} } })
    table.insert(shapeArrayParameters,{"switch","switch2_1_1", 1, 1, 3, 5, { {"slide","triangle1_1_1"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
