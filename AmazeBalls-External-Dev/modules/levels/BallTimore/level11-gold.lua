local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 2}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 3, 3}, {"none","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,3,3}})
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 5, 3}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter3_1_1", {1, 1, 4, 5}, {"none","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,4,5}})
    addToShapeArray(sp, "spitter","spitter4_1_1", {1, 1, 5, 5}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 7, 1}, "right")
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,1,2},{2},{2,1,2,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 3, 4}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{2},{1},{2,1,2,4},{2},{2,1,3,4}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 6, 5}, "blueCoin")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 7, 5}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,5}})

    --SCREEN 3-1
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 2, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_3_1", {3, 1, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 6, 2}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 7, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_3_1", {3, 1, 2, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_3_1", {3, 1, 4, 3}, "left")
    addToShapeArray(sp, "item","coins", {3, 1, 7, 3, 999})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 5, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan5_3_1", {3, 1, 7, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_3_1"},{"slide"},{},{1},{1},{3,1,7,4},{2},{3,1,7,5}})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --SCREEN 4-1
    addToShapeArray(sp, "endPoint","endPoint1_4_1", {4, 1, 5, 1})
    addToShapeArray(sp, "tunnel","tunnnel1_4_1", {4, 1, 7, 1, 4, 1, 4, 1}, "down")
    --addToShapeArray(sp, "timeOut","timeOut1_4_1", {4, 1, 2, 2})
    addToShapeArray(sp, "autoFan","autoFan1_4_1", {4, 1, 7, 2}, "up")
    addToShapeArray(sp, "shape","triangle1_4_1", {4, 1, 2, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_4_1"},{"slide"},{},{1},{1},{4,1,2,4},{2},{4,1,4,4}})
    addToShapeArray(sp, "shape","bar1_4_1", {4, 1, 5, 4}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_4_1"},{"slide"},{},{1},{1},{4,1,5,4},{2},{4,1,5,5}})
    addToShapeArray(sp, "tunnel","tunnel2_4_1", {4, 1, 7, 4, 4, 1, 1, 5, "none"})
    addToShapeArray(sp, "shape","bar2_4_1", {4, 1, 4, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan2_4_1", {4, 1, 5, 5}, "up")

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
