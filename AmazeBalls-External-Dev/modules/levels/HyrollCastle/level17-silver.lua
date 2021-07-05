local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 1}, "down")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 3, 2})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, 13})

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2},{3},{2,1,2,2},{4},{2,1,3,2}})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 1})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 3, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,3},{2},{2,1,4,1}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,1,5},{2},{2,1,3,5}})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 4, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 5, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 5, 1}, 50)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 2}, 80)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 2}, 90)
    addToShapeArray(sp, "item","small-present", {2, 1, 6, 1}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 7, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
