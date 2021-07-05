local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,5,1},{"*"},{1,1,5,2},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 3}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 5})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 1}, "triangleTopLeftShape", {1, 6})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,1},{2},{2,1,2,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 1}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{3},{1},{2,1,3,3},{2},{2,1,4,2},{"*"},{2,1,4,1},{3},{2,1,7,1}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 5, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 5}, "triangleBottomLeftShape")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 6, 5})
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 7, 5}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"slide"},{},{2},{1},{2,1,7,3},{2},{2,1,7,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 1, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 4, 125})
    addToShapeArray(sp, "item","coins", {1, 1, 2, 5}, 85)
    addToShapeArray(sp, "item","small-present", {2, 1, 4, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
