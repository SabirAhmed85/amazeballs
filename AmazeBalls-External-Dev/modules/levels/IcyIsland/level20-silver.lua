local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "item","map", {1, 1, 4, 2})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 4, 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 1}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 1, 3}, "up")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 4, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 3, 5}, "left")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 5}, "bar", {"horz"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 1, 1})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 6, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 1, 3}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 3, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    --addToShapeArray(sp, "timeOut","timeOut1_2_2", {2, 2, 1, 4, 5})
    addToShapeArray(sp, "autoFan","autoFan5_2_2", {2, 2, 2, 4}, "right")
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan6_2_2", {2, 2, 1, 5}, "up")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 4, 5}, "bar", {"vert", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 2, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 80)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 5}, 80)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 3}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 5, 3}, {})
    addToShapeArray(sp, "item","iceCape", {2, 2, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
