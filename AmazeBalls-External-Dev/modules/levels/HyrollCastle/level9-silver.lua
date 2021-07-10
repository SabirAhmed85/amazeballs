local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 2, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle10_1_1", {1, 1, 4, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle11_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle12_1_1", {1, 1, 7, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle13_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle14_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "shape","triangle15_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 2, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 4, 2}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "item","big-present", {1, 2, 7, 2}, {})

    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 3}, "right")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 3}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 3})
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 1, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 2, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 3, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan6_1_2", {1, 2, 4, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan7_1_2", {1, 2, 7, 4}, "down")
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 8, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 2, 5})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 4, 5}, "bar", {"horz", 4})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 5, 5}, "right")
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 6, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 1, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2}, 50)
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5, 125})
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
