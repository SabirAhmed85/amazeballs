local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {1, 1, 2, 3}, "up")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 2, 4}, "bar", {"horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{},{2},{1},{1,1,2,2},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 5})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 6, 5, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,4,5},{2},{1,1,5,5},{3},{1,1,6,5},{4},{1,1,7,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 1, 1, 2, 1, 7, 4, "none"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 1}, "right")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,5,1},{2},{2,1,5,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 2}, "triangleBottomLeftShape")
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 2, 3})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,5,5}})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 5, 6}, "bar", {"vert", 2})

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 3, 3}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,1,4},{2},{2,2,1,5}})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{1},{1},{2,2,2,5},{2},{2,2,4,5},{3},{2,2,5,5}})

    --SCREEN 2-3
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 1}, "purple")
    --addToShapeArray(sp, "item","coins", {2, 3, 2, 1}, 250)
    addToShapeArray(sp, "gem","redCoin", {2, 3, 3, 1}, "redCoin")
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 4, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 7, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_2_3", {2, 3, 7, 1, "up","none","none","none"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 7, 2}, "up")
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 8, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan2_2_3", {2, 3, 3, 3}, "up")
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 4, 3}, "triangleTopLeftShape", {1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_3"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 5, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan3_2_3", {2, 3, 6, 3}, "right")
    addToShapeArray(sp, "shape","triangle5_2_3", {2, 3, 7, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle6_2_3", {2, 3, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "manualFan","manualFan4_2_3", {2, 3, 2, 4}, "down")
    addToShapeArray(sp, "shape","bar3_2_3", {2, 3, 5, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle7_2_3", {2, 3, 5, 4}, "triangleBottomRightShape", {1, 14})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_3"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle8_2_3", {2, 3, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 3, 5}, "left")
    addToShapeArray(sp, "shape","triangle9_2_3", {2, 3, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle10_2_3", {2, 3, 5, 5}, "triangleTopLeftShape")

    --SCREEN 2-4
    addToShapeArray(sp, "door","door1_2_4", {2, 4, 6, 1}, "up")
    addToShapeArray(sp, "simple","simple1_2_4", {2, 4, 6, 1})
    addToShapeArray(sp, "shape","triangle1_2_4", {2, 4, 1, 3}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_4", {2, 4, 2, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_4", {2, 4, 6, 3})
    addToShapeArray(sp, "simple","simple2_2_4", {2, 4, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_4"},{"slide"},{},{2},{1},{2,4,1,5},{2},{2,4,3,5}})
    addToShapeArray(sp, "spitter","spitter1_2_4", {2, 4, 6, 5, "up","none","none","none"})

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
