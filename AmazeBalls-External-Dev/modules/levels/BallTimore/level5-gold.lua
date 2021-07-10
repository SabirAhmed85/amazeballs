local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,2,3}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"vert"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 2})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 3}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,7,2}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 3, 5}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 1}, "left")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 5, 3}, "left")
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 3, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 5, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_2"},{"slide"},{},{3},{1},{1,2,1,5},{2},{1,2,3,5},{3},{1,2,5,5}})
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 6, 5, 3})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "gem","redCoin", {2, 2, 1, 1}, "redCoin")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 4, 1}, "left")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 5, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 5, 1}, "right")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 7, 1}, "down")
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 4, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 5, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 2}, "left")
    --addToShapeArray(sp, "item","coins", {2, 2, 7, 2}, 250)
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 2, 3}, "right")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 5, 3}, "down")
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 7, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 4, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 4}, "down")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan6_2_2", {2, 2, 5, 5}, "left")

    --SCREEN 3-2
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 1, 4}, "left")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_3_2", {3, 2, 2, 4})
    addToShapeArray(sp, "item","map", {3, 2, 4, 4})
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 6, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_2"},{"switchSlide"},{labelled=false},{2},{1},{3,2,6,4},{2},{3,2,6,5}})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_3_2", {3, 2, 5, 4}, { {"slide","triangle2_3_2"} }, {"one-way", "not-labelled"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
