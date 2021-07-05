local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "item","map", {1, 1, 3, 1})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 5, 1})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 7, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 1, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 5, 5}, "left")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 1}, "down")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,5,3},{2},{1,2,5,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 1, 4}, "right")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 4}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 4, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"slide"},{},{2},{1},{2,2,4,2},{2},{2,2,6,2},{3},{2,2,6,3}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 3, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{3},{1},{2,2,3,1},{2},{2,2,3,2},{3},{2,2,3,3}})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 3, 5}, "left")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 7, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 2, 345})
    addToShapeArray(sp, "item","coins", {2, 2, 1, 1}, 85)
    addToShapeArray(sp, "item","big-present", {1, 1, 4, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 3}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 2, 1}, {})
    addToShapeArray(sp, "item","hook", {2, 2, 4, 3}, {})
    addToShapeArray(sp, "item","bomb", {1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
