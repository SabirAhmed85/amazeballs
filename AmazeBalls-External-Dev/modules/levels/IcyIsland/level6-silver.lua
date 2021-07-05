local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 4, 1, 1, 1, 2, 5}, "right")
    --addToShapeArray(sp, "item","coins", {1, 1, 2, 2}, 50)
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 5}, "left")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "tunnel","tunnel2_1_1", {1, 1, 6, 5, 1, 2, 2, 1}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,2,2}})
    addToShapeArray(sp, "tunnel","tunnel1_1_2", {1, 2, 4, 2, 1, 2, 6, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 1, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,2,4}})
    addToShapeArray(sp, "tunnel","tunnel2_1_2", {1, 2, 4, 4, 1, 2, 7, 1}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 5})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 6}, "bar", {"vert", 2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 6, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 2, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 2, 40)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 3}, 250)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 65)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
