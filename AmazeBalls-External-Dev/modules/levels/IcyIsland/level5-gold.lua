local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 1})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{2},{1},{1,1,6,2},{2},{1,1,7,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{1},{1},{1,1,6,3},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, 9, "icy"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 4}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 7, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 2, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 2, 3}, "right")
    addToShapeArray(sp, "tunnel","tunnel1_1_2", {1, 2, 4, 3, 2, 2, 2, 3, "none"})
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 5, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan5_1_2", {1, 2, 7, 3}, "left")
    addToShapeArray(sp, "item","map", {1, 2, 2, 4})
    addToShapeArray(sp, "manualFan","manualFan6_1_2", {1, 2, 3, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan7_1_2", {1, 2, 5, 4}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 7, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan8_1_2", {1, 2, 1, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 2, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan9_1_2", {1, 2, 4, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan10_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 1, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 4, 1}, "down")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 6, 1}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 7, 1}, "left")
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 3, 2})
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 6, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, 4, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 7, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 1, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 6, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 1, 5}, "down")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 5}, "triangleTopLeftShape", {1, 5, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan6_2_2", {2, 2, 5, 5}, "up")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 5}, "triangleTopAndBottomShape", {2})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 4, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 5, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 3}, 165)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 3, 125})
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3, 125})
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 5, 5}, {})
    addToShapeArray(sp, "item","clock", {2, 2, 4, 2}, {})
    addToShapeArray(sp, "item","fireCape", {1, 1, 6, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
