local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 1}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 2}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 3, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 4, 5}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 2, 1}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,2,1},{2},{2,1,2,2}})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 2, 5})

    --SCREEN 2-2
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 1, 1}, "down")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"switchSlide"},{labelled=false},{1},{1},{2,2,6,1},{2},{2,2,7,1}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 2}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 5, 3}, "down")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 1, 4}, "triangleTopRightShape", {1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_2"},{"slide"},{},{2},{1},{2,2,1,3},{2},{2,2,1,4}})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 4, 5, "up", "right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{3},{1},{2,2,2,5},{2},{2,2,3,5},{3},{2,2,4,5}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-3
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 3, 1, "up", "disabled"})
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 3, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar3_2_3", {2, 3, 3, 3}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 5, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 7, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_3"},{"slide"},{},{3},{1},{2,3,6,1},{2},{2,3,7,2},{3},{2,3,7,3}})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 6, 4}, "triangleTopLeftShape", {1, 5, "icy"})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 7, 4}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 5}, "purple")
    addToShapeArray(sp, "shape","triangle5_2_3", {2, 3, 3, 5}, "triangleBottomRightShape", {1, 9, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 5, 2}, { {"slide","triangle1_2_2"} }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 4, 1}, { {"door-open","door1_2_3"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
