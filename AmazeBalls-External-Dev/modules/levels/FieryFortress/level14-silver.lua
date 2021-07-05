local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, 7})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 3}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 4}, "right")
    addToShapeArray(sp, "item","map", {1, 1, 5, 4})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{4},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3},{4},{1,1,7,4},{5},{1,1,7,5} })
    addToShapeArray(sp, "door","door4_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 4, 2}, "right")
    addToShapeArray(sp, "endPoint","endPoint1", 2, 1, 6, 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 4, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 3, 40)
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t