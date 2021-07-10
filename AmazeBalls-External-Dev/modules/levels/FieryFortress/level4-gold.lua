local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 1}, "down")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 3}, "down")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 1, 4}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{2},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 4, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 6, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,6,4},{"*"},{1,1,6,5},{2},{1,1,7,5}})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 7, 4}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 2, 5}, "up")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{1},{1},{2,1,5,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,1,3},{2},{2,1,2,3}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 3, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,3,3},{2},{2,1,3,4},{3},{2,1,3,5}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 3}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 6, 3}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,3},{2},{2,1,5,4}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 6, 5}, "left")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 3, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 80)
    --addToShapeArray(sp, "item","coins", {2, 1, 4, 2}, 250)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
