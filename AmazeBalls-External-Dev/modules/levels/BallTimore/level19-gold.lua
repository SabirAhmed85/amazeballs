local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,1},{2},{1,1,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,5,1},{2},{1,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 3, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 7, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_1", {1, 1, 3, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_1_1", {1, 1, 7, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,8,1},{2},{1,1,8,3}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 2, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_1_1", {1, 1, 6, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan6_1_1"},{"slide"},{},{2},{1},{1,1,6,2},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan7_1_1", {1, 1, 1, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_1_1", {1, 1, 6, 5}, "left"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("item","compass", {2, 1, 7, 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 5, 5}, "left"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"slide"},{},{1},{1},{2,2,3,1},{2},{2,2,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 4, 1}, "triangleTopRightShape", {1, 13}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{2},{1},{2,2,5,1},{2},{2,2,6,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 7, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 7, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{2},{1},{2,2,6,2},{2},{2,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 1, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_2", {2, 2, 3, 3, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{2},{1},{2,2,3,1},{2},{2,2,3,3},{3},{2,2,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 7, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 4, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_2", {2, 2, 1, 5, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 6, 5}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{},{2},{1},{2,2,6,4},{2},{2,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 7, 5}, "triangleTopLeftShape"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut2_2_2", {2, 2, 5, 5, 3}))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 4, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_3", {2, 3, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_3", {2, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_3", {2, 3, 1, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_2_3", {2, 3, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan7_2_3", {2, 3, 5, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan8_2_3", {2, 3, 7, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 4, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan9_2_3", {2, 3, 2, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan10_2_3", {2, 3, 3, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan11_2_3", {2, 3, 5, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan12_2_3", {2, 3, 7, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan13_2_3", {2, 3, 2, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan14_2_3", {2, 3, 3, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan14_2_3"},{"slide"},{},{1},{1},{2,3,3,5},{2},{2,3,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan15_2_3", {2, 3, 5, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan16_2_3", {2, 3, 7, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 3, 6, 2}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
