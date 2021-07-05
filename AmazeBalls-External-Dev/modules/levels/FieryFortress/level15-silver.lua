local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,1},{2},{1,1,2,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 3}, "right")
    addToShapeArray(sp, "item","map", {1, 1, 6, 3})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{3},{1},{1,1,2,4},{2},{1,1,3,4},{3},{1,1,4,4}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 5}, "up")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 5}, "triangleTopLeftShape")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, 7})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,4,2},{2},{2,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 4, 4}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 4})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 9})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 4, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 6, 3}, 150)
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 250)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 4}, 90)
    addToShapeArray(sp, "item","small-present", {2, 1, 7, 2}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 2, 2}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t