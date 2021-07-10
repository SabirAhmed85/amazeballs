local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,1},{2},{1,1,3,2},{3},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{"green"},{2},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 4})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 6, 5}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"slide"},{"green"},{3},{1},{1,1,4,5},{2},{1,1,5,5},{3},{1,1,6,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 1}, "purpleCoin")

    --ITEMS   
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 3}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 4, 175})
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
