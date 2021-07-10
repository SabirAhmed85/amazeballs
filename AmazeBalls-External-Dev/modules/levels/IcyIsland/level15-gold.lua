local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 5, 1, 1, 1, 6, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 3}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,3},{2},{1,1,7,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 5}, "up")
    addToShapeArray(sp, "tunnel","tunnel2_1_1", {1, 1, 6, 5, 1, 2, 2, 1}, {"none"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,1},{2},{1,2,1,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 4}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,2,4}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,2,4,5},{"*"},{1,2,4,4},{2},{1,2,5,4},{3},{1,2,6,2}})
    addToShapeArray(sp, "tunnel","tunnel1_1_2", {1, 2, 2, 5, 1, 1, 1, 1}, "right")
    addToShapeArray(sp, "item","map", {1, 2, 5, 5})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 6, 5}, "left")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 5}, "bar", {"horz", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 3, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 4, 1}, 75)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 110)
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
