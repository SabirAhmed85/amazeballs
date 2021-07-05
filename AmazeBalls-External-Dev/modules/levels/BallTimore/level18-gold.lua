local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,4,2},{3},{1,1,5,2},{"*"},{1,1,5,3},{4},{1,1,7,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"switchSlide"},{},{2},{1},{1,1,1,3},{2},{1,1,1,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,1,8,3},{2},{1,1,8,4}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 5, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"switchSlide"},{},{1},{1},{1,1,5,5},{2},{1,1,6,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5, "down", "disabled"})

    --SCREEN 1-2
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 4}, "redCoin")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, 5, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 5, 5}, "down")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 7, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 7, 6}, "bar", {"vert"})

    --SCREEN 1-3
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 3, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 6, 1}, "triangleTopLeftShape", {1, 1})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{},{1},{1},{1,3,7,1},{2},{1,3,7,2}})
    --addToShapeArray(sp, "timeOut","timeOut1_1_3", {1, 3, 5, 2, 4})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 6, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 7, 3}, "right")
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 1, 4}, "triangleTopLeftShape", {1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_3"},{"flip-horizontal"}})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 5, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 6, 4}, "right")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 1)
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_3"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 7, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_3"},{"slide"},{},{2},{1},{1,3,7,4},{2},{1,3,7,5}})

    --SCREEN 2-3
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 4, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 5, 3}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_2_3", {2, 3, 4, 4})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 7, 4}, "triangleBottomLeftShape", {1, 22, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 2, 5}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 3, 5}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_3"},{"slide"},{},{2},{1},{2,3,3,3},{2},{2,3,3,5}})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 6, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 1}, { {"slide","bar3_1_1"},{"slide","autoFan1_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 5, 4}, { {"slide","triangle7_1_1"},{"door-open","door1_1_1"} })

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
