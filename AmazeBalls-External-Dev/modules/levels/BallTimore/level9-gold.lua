local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_3_1", 3, 1, 4, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 1, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 2, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{1},{1},{2,1,2,2},{2},{2,1,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 6, 2, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 4, 3, "up", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,2,3},{2},{2,1,3,3},{3},{2,1,4,3},{4},{2,1,5,3},{5},{2,1,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 4, 4, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 8, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 1, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 7, 5, "triangleTopLeftShape", 1, 5, "breakable"})

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

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 1, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,3,1},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 5, 2, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 1, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"slide"},{},{1},{1},{1,2,1,3},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_2", 1, 2, 3, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_2"},{"slide"},{},{1},{1},{1,2,3,4},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 5, 4, "triangleTopLeftShape", 1, 11})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 3, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 5, 3, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 8, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 1, 4, "bar", "vert", 3})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 2, 1, 4, 250})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 1, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 7, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SWITCHES

    table.insert(shapeArrayParameters,{"switch","switch1_3_1", 3, 1, 5, 4, { {"door-open","door1_3_1"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
