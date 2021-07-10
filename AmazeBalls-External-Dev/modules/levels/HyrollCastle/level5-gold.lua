local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-2
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 3}, "triangleTopLeftShape", {1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,6,3}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle10_1_1", {1, 1, 5, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle10_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    addToShapeArray(sp, "shape","triangle11_1_1", {1, 1, 6, 5}, "triangleBottomRightShape", {1, _, "breakable"})

    --SCREEN 2-2
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 1})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 2, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 4, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 5, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 5, 1}, "right")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 1}, "up")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,2},{2},{2,1,2,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"slide"},{},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 8, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 4, 3}, "right")
    addToShapeArray(sp, "shape","bar5_2_1", {2, 1, 7, 3}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{1},{1},{2,1,7,3},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","bar6_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan5_2_1", {2, 1, 1, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan6_2_1", {2, 1, 4, 4}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar7_2_1", {2, 1, 8, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan7_2_1", {2, 1, 1, 5}, "right")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 11})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 5}, "right")
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"slide"},{},{4},{1},{2,1,7,1},{2},{2,1,7,2},{3},{2,1,7,3},{4},{2,1,7,5}})
    addToShapeArray(sp, "shape","bar8_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 4}, { {"slide", "triangle10_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin")

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
