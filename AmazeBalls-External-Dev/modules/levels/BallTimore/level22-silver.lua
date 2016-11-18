local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 1, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 2, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 1, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 1, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 2, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 1, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 1, 1, 2, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar5_1_1", 1, 1, 2, 4, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{},{2},{1},{1,1,2,2},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 5})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 6, 5, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,4,5},{2},{1,1,5,5},{3},{1,1,6,5},{4},{1,1,7,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"tunnel","tunnel1_2_1", 2, 1, 1, 1, 2, 1, 7, 4, "none"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 8, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 4, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 2, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,5,1},{2},{2,1,5,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 7, 2, "triangleBottomLeftShape"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_2_1", 2, 1, 2, 3})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 5, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,5,5}})
    table.insert(shapeArrayParameters,{"shape","bar4_2_1", 2, 1, 5, 6, "bar", "vert", 2})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 1, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 3, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 5, 2, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 3, 3, "triangleBottomRightShape", 1, 9})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 2, 2, 1, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,1,4},{2},{2,2,1,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 2, 5, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{1},{1},{2,2,2,5},{2},{2,2,4,5},{3},{2,2,5,5}})

    --SCREEN 2-3
    table.insert(shapeArrayParameters,{"gem","purple", 2, 3, 1, 1, "purple"})
    --table.insert(shapeArrayParameters,{"item","coins", 2, 3, 2, 1, 250})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 3, 3, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_3", 2, 3, 4, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_3", 2, 3, 5, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"door","door1_2_3", 2, 3, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_3", 2, 3, 7, 1, "up","none","none","none"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_3", 2, 3, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_3", 2, 3, 7, 2, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_3", 2, 3, 8, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_3", 2, 3, 1, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_3", 2, 3, 3, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_3", 2, 3, 4, 3, "triangleTopLeftShape", 1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_3", 2, 3, 5, 3, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_3", 2, 3, 6, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_3", 2, 3, 7, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_3", 2, 3, 1, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_2_3", 2, 3, 2, 4, "down"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_3", 2, 3, 5, 4, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_3", 2, 3, 5, 4, "triangleBottomRightShape", 1, 14})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_3", 2, 3, 7, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_3", 2, 3, 3, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_3", 2, 3, 4, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle10_2_3", 2, 3, 5, 5, "triangleTopLeftShape"})

    --SCREEN 2-4
    table.insert(shapeArrayParameters,{"door","door1_2_4", 2, 4, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_4", 2, 4, 6, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_4", 2, 4, 1, 3, "triangleBottomRightShape", 1, 3, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_4", 2, 4, 2, 3, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_4", 2, 4, 6, 3})
    table.insert(shapeArrayParameters,{"simple","simple2_2_4", 2, 4, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_4"},{"slide"},{},{2},{1},{2,4,1,5},{2},{2,4,3,5}})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_4", 2, 4, 6, 5, "up","none","none","none"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 2
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
