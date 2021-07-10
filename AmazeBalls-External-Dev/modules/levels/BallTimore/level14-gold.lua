local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 3}, "redCoin")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 3}, "triangleTopRightShape", {1, 10, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 1}, "up")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 2, 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 3}, "triangleBottomRightShape", {1, _})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 7, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 7, 4}, "right")

    --SCREEN 3-1
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan2_3_1", {3, 1, 4, 2}, "down")
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan3_3_1", {3, 1, 4, 3}, "down")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape", {1, _})
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 1, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 4, 4})
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "simple","simple1_3_1", {3, 1, 3, 5})
    addToShapeArray(sp, "autoFan","autoFan4_2_2", 3, 1, 5, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_2"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{1},{1},{3,1,5,5},{2},{3,1,6,5},{3},{3,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","map", {1, 2, 4, 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
