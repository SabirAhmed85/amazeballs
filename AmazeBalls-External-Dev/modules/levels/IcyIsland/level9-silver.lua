local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{3},{1},{1,1,6,3},{2},{1,1,6,2},{3},{1,1,7,1}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 3}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 6, 4}, "right")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 1)
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 5, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,5,5}})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 7, 1}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 2}, "left")
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "door","door4_2_1", {2, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{3},{1},{2,1,3,4},{2},{2,1,4,4},{3},{2,1,5,4}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 6, 5}, "up")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")

    --SCREEN 3-1
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "spitter","spitter1_3_1", {3, 1, 1, 3, "up","none","none","none"})
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 6, 3})
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 5, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"autoSlide"},{timePerSquare = 480, pauseTime = 0},{2},{1},{3,1,5,3},{2},{3,1,5,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {3, 1, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 6, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 2}, 135)
    addToShapeArray(sp, "item","coins", {3, 1, 3, 4}, 33)
    addToShapeArray(sp, "item","big-present", {3, 1, 7, 3}, {})
    addToShapeArray(sp, "item","big-present", {3, 1, 3, 1}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 5, 2}, {})
    addToShapeArray(sp, "item","bomb", {1, 1, 5, 2}, {})
    addToShapeArray(sp, "item","fireCape", {2, 1, 1, 5}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
