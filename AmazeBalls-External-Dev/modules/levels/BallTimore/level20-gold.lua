local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 3, "triangleTopLeftShape", 1, 11, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 3, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 1, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,3},{2},{2,1,1,4}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 4, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 4, "triangleTopRightShape", 1, 10, "breakable"})
    table.insert(shapeArrayParameters,{"spitter","spitter2_2_1", 2, 1, 7, 4, "none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"switchSlide"},{},{1},{1},{2,1,7,4},{2},{2,1,7,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 5, 2, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 2, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 2, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 2, 3, 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 5, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 6, 5, "triangleTopRightShape", 1, _, "fire"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"item","compass", 2, 2, 4, 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 6, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 7, 1, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{},{1},{1},{2,2,7,1},{2},{2,2,7,2}})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_2_1", 2, 1, 1, 2, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 5, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{1},{1},{2,2,5,2},{2},{2,2,5,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 6, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_2"},{"slide"},{},{2},{1},{2,2,6,2},{2},{2,2,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 2, 2, 2, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_2"},{"switchSlide"},{},{1},{1},{2,2,2,4},{2},{2,2,2,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_2", 2, 2, 3, 4, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,4},{2},{2,2,3,5}})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door3_2_2", 2, 2, 7, 5, "right", "disabled"})

    --SCREEN 3-2
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_2", 3, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_3_2", 3, 2, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_3_2", 3, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_3_2", 3, 2, 7, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door1_3_2", 3, 2, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_3_2", 3, 2, 2, 2, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan6_3_2", 3, 2, 4, 2, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan7_3_2", 3, 2, 7, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan8_3_2", 3, 2, 1, 3, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_2", 3, 2, 2, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_2", 3, 2, 2, 4, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_2", 3, 2, 3, 3, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan9_3_2", 3, 2, 4, 3, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_3_2", 3, 2, 5, 3, "left"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"shape","bar1_3_2", 3, 2, 5, 4, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"gem","redCoin", 3, 2, 5, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_3_2", 3, 2, 7, 4, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan10_3_2", 3, 2, 2, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_3_2", 3, 2, 7, 5, "down"})

    --SCREEN 2-3
    table.insert(shapeArrayParameters,{"shape","triangle1_2_3", 2, 3, 1, 1, "triangleBottomRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"door","door1_2_3", 2, 3, 2, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_3", 2, 3, 3, 1, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_3"},{"switchSlide"},{},{1},{1},{2,3,3,1},{2},{2,3,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_3", 2, 3, 4, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_3", 2, 3, 7, 1, "triangleBottomLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_3", 2, 3, 2, 2, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_3"},{"switchSlide"},{},{2},{1},{2,3,2,1},{2},{2,3,2,2}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_3", 2, 3, 4, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_3", 2, 3, 6, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_3"},{"slide"},{},{1},{2},{2,3,5,1},{2},{2,3,6,2}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_3", 2, 3, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_3"},{"slide"},{},{1},{1},{2,3,5,3},{2},{2,3,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_3", 2, 3, 1, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_3", 2, 3, 3, 4, "triangleTopLeftShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_3", 2, 3, 5, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_3"},{"slide"},{},{1},{1},{2,3,5,4},{2},{2,3,6,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_3", 2, 3, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_3", 2, 3, 3, 5, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_3", 2, 3, 4, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_3", 2, 3, 7, 5, "triangleTopLeftShape", 1, 6, "breakable"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_2_3", 2, 3, 4, 4, { {"door-open","door1_2_3"},{"door-open","door3_2_2"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
