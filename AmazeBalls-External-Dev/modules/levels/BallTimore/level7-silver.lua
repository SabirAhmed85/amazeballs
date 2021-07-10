local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,2,2},{"*"},{1,1,2,1},{3},{1,1,3,1}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,4,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"horz"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,4,3},{2},{1,1,4,5}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 1, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{"*"},{1,1,1,3},{2},{1,1,2,3}})
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 2, 4, 1, 1, 6, 2, "none"})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 3, 4}, "up")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 3, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 2, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 5, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 1}, 160)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 4}, 180)
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
