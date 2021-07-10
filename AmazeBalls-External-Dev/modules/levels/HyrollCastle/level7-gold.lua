local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,2,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "item","compass", {1, 1, 4, 2})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,5,2},{3},{1,1,6,2}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,2,4}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,3,5},{3},{1,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "up")
    addToShapeArray(sp, "item","map", {1, 1, 2, 5})

    --SCREEN 2-1
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire2_2_1", {2, 1, 7, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_1"},{"slide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{3},{1},{2,1,3,1},{2},{2,1,3,3},{3},{2,1,4,3}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,4,4},{2},{2,1,5,4},{3},{2,1,5,3}})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","bar5_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,3,5}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 2, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 1, 5}, 60)
    addToShapeArray(sp, "item","coins", {2, 1, 1, 4}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 14)
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 7, 5}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 3, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
