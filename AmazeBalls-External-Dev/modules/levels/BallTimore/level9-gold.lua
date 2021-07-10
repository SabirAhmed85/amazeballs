local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan2_3_1", {3, 1, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{1},{1},{2,1,2,2},{2},{2,1,2,4}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 4, 3, "up", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,2,3},{2},{2,1,3,3},{3},{2,1,4,3},{4},{2,1,5,3},{5},{2,1,6,3}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, 5, "breakable"})

    --SCREEN 3-1
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 1}, "left", {"disabled"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 3, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_3_1", {3, 1, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 3, 3}, "triangleTopLeftShape", {1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_3_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 4, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 6, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle7_3_1", {3, 1, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle8_3_1", {3, 1, 4, 4}, "triangleBottomRightShape", {1, 14})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_3_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle9_3_1", {3, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle10_3_1", {3, 1, 3, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle11_3_1", {3, 1, 4, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,3,1},{2},{1,2,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 1, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"slide"},{},{1},{1},{1,2,1,3},{2},{1,2,2,3}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 3, 3})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 3, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_2"},{"slide"},{},{1},{1},{1,2,3,4},{2},{1,2,3,5}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, 11})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 4}, "bar", {"vert", 3})
    --addToShapeArray(sp, "item","coins", {2, 2, 1, 4}, 250)
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES

    addToShapeArray(sp, "switch","switch1_3_1", {3, 1, 5, 4}, { {"door-open","door1_3_1"} })

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
