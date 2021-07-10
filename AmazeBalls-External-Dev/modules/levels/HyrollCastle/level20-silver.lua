local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"horz"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "left")
    addToShapeArray(sp, "item","map", {1, 1, 3, 2})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,5,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "item","compass", {1, 1, 6, 4})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 4, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,4,5}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, 11, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1, "triangleTopAndBottomShape"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,3,2}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 4, 2}, "bar", {"horz"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 4, 3})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 4}, 150)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 3}, 20)
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
