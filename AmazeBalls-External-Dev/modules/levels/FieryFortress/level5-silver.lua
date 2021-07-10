local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 1})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")

    -- 1-2
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 2, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 2}, "bar", {"horz"})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 1, 4}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {1, 1, 4, 4}, 500)
    --addToShapeArray(sp, "item","coins", {1, 2, 6, 3, 30)
    --addToShapeArray(sp, "item","coins", {1, 2, 5, 4}, 90)
    addToShapeArray(sp, "item","big-present", {1, 1, 5, 3}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 6, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t