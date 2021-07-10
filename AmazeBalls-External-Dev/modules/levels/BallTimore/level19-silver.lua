local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 1}, "redCoin")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 5}, "left")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 2}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 2}, "right", {"disabled"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 1, 2, "up", "none", "none", "none"})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 5, 2})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 6, 2}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 1, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle9_2_2", {2, 2, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle10_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 5, 4}, { {"door-open","door1_1_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
