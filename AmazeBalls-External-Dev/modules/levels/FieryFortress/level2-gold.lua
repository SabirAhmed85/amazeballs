local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 5, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{1},{1},{1,1,5,1},{2},{1,1,5,4},{3},{1,1,7,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 2}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "item","map", {1, 1, 4, 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 5})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomRightShape", {1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,3},{"*"},{1,2,1,2},{2},{1,2,3,2},{3},{1,2,5,1}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{4},{1},{1,2,1,4},{2},{1,2,2,4},{3},{1,2,3,4},{4},{1,2,4,4}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 3, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 6}, "bar", {"vert", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 5}, "purpleCoin")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
