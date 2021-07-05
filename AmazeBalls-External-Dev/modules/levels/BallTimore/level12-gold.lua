local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 3}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,2},{"*"},{1,2,1,1},{2},{1,2,2,1}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 4, 1})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 2}, "down")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 4, 4})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 4}, "up")
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{},{1},{1},{1,2,1,5},{2},{1,2,1,4},{3},{1,2,2,3}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 5}, "triangleTopAndBottomShape", {1})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 3, 2}, 70)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3}, 105})
    addToShapeArray(sp, "item","coins", {1, 2, 5, 4}, 14)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 1}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 6, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
