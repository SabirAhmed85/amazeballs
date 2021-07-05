local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 2}, "left")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 6, 1}, "down")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 3, 2})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 7, 2}, "down")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{2},{1},{2,1,3,3},{2},{2,1,4,3}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,6,5}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 5, 4})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,3,5},{3},{2,1,4,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 2, 3}, 110)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 5}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 5, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
