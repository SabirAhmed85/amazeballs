local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,3},{2},{1,1,4,3}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")

    -- SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{2},{1},{2,1,2,2},{2},{2,1,3,1}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 1}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,3},{2},{2,1,6,1}})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 7, 1}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 3})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{2},{1},{2,1,2,4},{2},{2,1,3,5}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 6, 5}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,4},{2},{2,1,6,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 3, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 2}, 80)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 5}, 150)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
