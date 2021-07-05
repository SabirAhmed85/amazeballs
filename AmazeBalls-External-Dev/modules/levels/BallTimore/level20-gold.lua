local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 1, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,3},{2},{2,1,1,4}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 7, 4}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"switchSlide"},{},{1},{1},{2,1,7,4},{2},{2,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 3, 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 5}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "item","compass", {2, 2, 4, 1})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{},{1},{1},{2,2,7,1},{2},{2,2,7,2}})
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 1, 2, 3})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 5, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{1},{1},{2,2,5,2},{2},{2,2,5,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 6, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_2"},{"slide"},{},{2},{1},{2,2,6,2},{2},{2,2,6,3}})
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 2, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_2"},{"switchSlide"},{},{1},{1},{2,2,2,4},{2},{2,2,2,5}})
    addToShapeArray(sp, "autoFan","autoFan5_2_2", {2, 2, 3, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,4},{2},{2,2,3,5}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 3, 5}, "down")
    addToShapeArray(sp, "door","door3_2_2", {2, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 3-2
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 1, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_3_2", {3, 2, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_3_2", {3, 2, 5, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan4_3_2", {3, 2, 7, 1}, "left")
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 1, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan5_3_2", {3, 2, 2, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan6_3_2", {3, 2, 4, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan7_3_2", {3, 2, 7, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan8_3_2", {3, 2, 1, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 2, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 2, 4}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan2_3_2", {3, 2, 3, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan9_3_2", {3, 2, 4, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_3_2", {3, 2, 5, 3}, "left")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 4}, "purple")
    addToShapeArray(sp, "shape","bar1_3_2", {3, 2, 5, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "gem","redCoin", {3, 2, 5, 4}, "redCoin")
    addToShapeArray(sp, "autoFan","autoFan4_3_2", {3, 2, 7, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan10_3_2", {3, 2, 2, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan5_3_2", {3, 2, 7, 5}, "down")

    --SCREEN 2-3
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 1, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 2, 1, "up", "disabled"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 3, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_3"},{"switchSlide"},{},{1},{1},{2,3,3,1},{2},{2,3,3,2}})
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 2, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_3"},{"switchSlide"},{},{2},{1},{2,3,2,1},{2},{2,3,2,2}})
    addToShapeArray(sp, "simple","simple1_2_3", {2, 3, 4, 2})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 6, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_3"},{"slide"},{},{1},{2},{2,3,5,1},{2},{2,3,6,2}})
    addToShapeArray(sp, "backFire","backFire1_2_3", {2, 3, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_3"},{"slide"},{},{1},{1},{2,3,5,3},{2},{2,3,6,3}})
    addToShapeArray(sp, "shape","triangle5_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_3", {2, 3, 3, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle7_2_3", {2, 3, 5, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_3"},{"slide"},{},{1},{1},{2,3,5,4},{2},{2,3,6,5}})
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 1, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 3, 5}, "right")
    addToShapeArray(sp, "autoFan","autoFan4_2_3", {2, 3, 4, 5}, "right")
    addToShapeArray(sp, "shape","triangle8_2_3", {2, 3, 7, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 4, 4}, { {"door-open","door1_2_3"},{"door-open","door3_2_2"} })

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
