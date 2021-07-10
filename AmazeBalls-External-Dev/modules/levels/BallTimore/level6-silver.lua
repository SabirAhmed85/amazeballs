local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 2})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 3, 5, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,3,5},{3},{1,1,4,5},{4},{1,1,6,5}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 7, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 3}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopRightShape", {1, 24, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 1}, 85)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 1}, 130)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
