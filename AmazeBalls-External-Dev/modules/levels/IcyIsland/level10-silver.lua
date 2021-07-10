local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 1, "up", "none", "down", "none"})
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 4, 1}, {"none", "none", "down"}, "left")
    addToShapeArray(sp, "spitter","spitter3_1_1", {1, 1, 6, 1}, {"none", "right", "none", "none"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 2})
    addToShapeArray(sp, "spitter","spitter4_1_1", {1, 1, 6, 2, "up", "none", "none", "none"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "spitter","spitter5_1_1", {1, 1, 4, 3, "up", "right", "none", "none"})
    addToShapeArray(sp, "spitter","spitter6_1_1", {1, 1, 7, 3}, {"none", "none", "down", "none"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 2, 4}, "left")
    addToShapeArray(sp, "spitter","spitter7_1_1", {1, 1, 6, 4, "up", "none", "down", "none"})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 7, 4}, "up")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "item","map", {1, 1, 2, 5})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, 13})
    --addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 50)

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 2, 1}, {"none", "right", "down", "none"})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 5, 1}, {"none", "right", "down", "none"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 7, 1}, "down")
    addToShapeArray(sp, "spitter","spitter3_2_1", {2, 1, 4, 2}, {"none", "right", "down", "none"})
    addToShapeArray(sp, "spitter","spitter4_2_1", {2, 1, 6, 2, "up", "none", "down", "none"})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 3}, "right")
    addToShapeArray(sp, "spitter","spitter5_2_1", {2, 1, 4, 3, "up", "none", "down", "none"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    --addToShapeArray(sp, "item","coins", {2, 1, 2, 4}, 100)
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 5, 4}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 4, 5}, "left")
    addToShapeArray(sp, "spitter","spitter6_2_1", {2, 1, 5, 5}, {"none", "right", "none"}, "left")
    --addToShapeArray(sp, "item","coins", {2, 1, 1, 1}, 50)
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 6, 4}, 140)
    addToShapeArray(sp, "item","small-present", {2, 1, 3, 3}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 7, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
