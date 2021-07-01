local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 2, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, 7, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 6, 3}, "triangleTopLeftShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 3, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 13}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle10_1_1", {1, 1, 5, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle10_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle11_1_1", {1, 1, 6, 5}, "triangleBottomRightShape", {1, _, "breakable"}))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 2, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 4, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 5, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 5, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 8, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 1, 2}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,2},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 7, 2}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"slide"},{},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_1", {2, 1, 8, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 2, 3}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 3, 3, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 4, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_1", {2, 1, 7, 3}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{1},{1},{2,1,7,3},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_2_1", {2, 1, 8, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_1", {2, 1, 1, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_2_1", {2, 1, 4, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar7_2_1", {2, 1, 8, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan7_2_1", {2, 1, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 11}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_1", {2, 1, 7, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"slide"},{},{4},{1},{2,1,7,1},{2},{2,1,7,2},{3},{2,1,7,3},{4},{2,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar8_2_1", {2, 1, 8, 5}, "bar", {"horz", 2}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 4, 4, { {"slide", "triangle10_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin"))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
