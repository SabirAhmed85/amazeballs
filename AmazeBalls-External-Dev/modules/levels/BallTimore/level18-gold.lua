local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,4,2},{3},{1,1,5,2},{"*"},{1,1,5,3},{4},{1,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 1, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"switchSlide"},{},{2},{1},{1,1,1,3},{2},{1,1,1,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 3, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,1,8,3},{2},{1,1,8,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 4, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 5, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"switchSlide"},{},{1},{1},{1,1,5,5},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 5, "down", "disabled"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 4, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 5, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 7, 5}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 6, 6}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_2", {1, 2, 7, 6}, "bar", {"vert"}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 6, 1}, "triangleTopLeftShape", {1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{},{1},{1},{1,3,7,1},{2},{1,3,7,2}})
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_1_3", {1, 3, 5, 2, 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 6, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 1, 4}, "triangleTopLeftShape", {1, 13}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_3"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 5, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 6, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 1))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_3", {1, 3, 7, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_3"},{"slide"},{},{2},{1},{1,3,7,4},{2},{1,3,7,5}})

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 3, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 4, 2}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 3, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 5, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_3", {2, 3, 4, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 7, 4}, "triangleBottomLeftShape", {1, 22, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 1, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 2, 5}, "triangleTopLeftShape", {1, 11, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_3", {2, 3, 3, 5}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_3"},{"slide"},{},{2},{1},{2,3,3,3},{2},{2,3,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 6, 5}, "triangleTopRightShape", {1, 13, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 2, 1}, { {"slide","bar3_1_1"},{"slide","autoFan1_1_1"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_1_1", {1, 1, 5, 4}, { {"slide","triangle7_1_1"},{"door-open","door1_1_1"} }))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
