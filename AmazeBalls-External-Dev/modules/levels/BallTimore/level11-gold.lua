local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 2}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 3, 3, "none","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 5, 3, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_1", {1, 1, 4, 5, "none","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_1", {1, 1, 5, 5, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 2, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 2, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,1,2},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 3, 4}, "bar", {"vert"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{2},{1},{2,1,2,4},{2},{2,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 6, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 7, 5}, "bar", {"vert"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,5}})

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_1", {3, 1, 2, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_3_1", {3, 1, 4, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, 7, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 6, 2}, "triangleBottomLeftShape", {1, 4, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_1", {3, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_3_1", {3, 1, 2, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_3_1", {3, 1, 4, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 7, 3, 999}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 5, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_3_1", {3, 1, 7, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_3_1"},{"slide"},{},{1},{1},{3,1,7,4},{2},{3,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"}))

    --SCREEN 4-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_4_1", {4, 1, 5, 1}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnnel1_4_1", {4, 1, 7, 1, 4, 1, 4, 1}, "down"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_4_1", {4, 1, 2, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_4_1", {4, 1, 7, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_4_1", {4, 1, 2, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_4_1"},{"slide"},{},{1},{1},{4,1,2,4},{2},{4,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_4_1", {4, 1, 5, 4}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_4_1"},{"slide"},{},{1},{1},{4,1,5,4},{2},{4,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_4_1", {4, 1, 7, 4, 4, 1, 1, 5, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_4_1", {4, 1, 4, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_4_1", {4, 1, 5, 5}, "up"))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
