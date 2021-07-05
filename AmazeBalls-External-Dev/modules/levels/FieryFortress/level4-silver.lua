local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,3},{2},{1,1,4,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopAndBottomShape", {2})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{2},{1},{1,2,1,1},{2},{1,2,2,1}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,1},{2},{1,2,7,1}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,3,3},{2},{1,2,4,3}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,5},{2},{1,2,2,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{"orange"},{2},{1},{1,2,6,5},{2},{1,2,7,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 5, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 4}, 75)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 1, 125})
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 75)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t