local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,1},{2},{1,1,4,1}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1, 1})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 3})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 4}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 5}, "triangleTopAndBottomShape", {1})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 2}, "triangleTopRightShape", {1, 1)
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,2},{2},{2,1,7,2}})
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 5}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{"green"},{1},{1},{2,1,1,5},{2},{2,1,2,4},{3},{2,1,3,4}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 4, 5}, "right")
    addToShapeArray(sp, "item","map", {2, 1, 6, 5})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 7, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 2, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 1, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 5, 4}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 1}, 50)
    addToShapeArray(sp, "item","coins", {2, 1, 1, 2}, 150)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 2}, 150)
    addToShapeArray(sp, "item","small-present", {2, 1, 7, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t