local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 5}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 1-2
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 5, 1}, {"none","right","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,1,1},{2},{1,2,5,1},{3},{1,2,6,1}})
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 2, 2}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 4, 3})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 5}, "redCoin")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,4,4},{2},{1,2,4,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 110)
    addToShapeArray(sp, "item","small-present", {1, 2, 6, 4}, {})


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
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
