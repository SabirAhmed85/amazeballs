local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 1})
    addToShapeArray(sp, "item","map", {1, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 3}, "up")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,8,3},{2},{1,1,8,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 4}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 7, 1, 1, 1, 5, 1}, "down")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 2, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape", {1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,2},{2},{2,1,5,2},{3},{2,1,7,2}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 4, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,4,5},{2},{2,1,5,5}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{3},{1},{2,1,5,3},{2},{2,1,6,3},{3},{2,1,6,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 7, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 2}, "left")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{1},{1},{1,2,5,3},{2},{1,2,5,4},{3},{1,2,5,5}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 3, 4}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,2,4},{2},{1,2,3,4}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{3},{1},{1,2,6,1},{2},{1,2,6,2},{3},{1,2,6,4}})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SCREEN 2-2
    addToShapeArray(sp, "tunnel","tunnel1_2_2", {2, 2, 2, 1, 2, 1, 1, 2}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 4, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"slide"},{},{2},{1},{2,2,4,1},{2},{2,2,4,2}})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, 2, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 2, 4}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 4, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_2"},{"slide"},{},{1},{1},{2,2,4,4},{2},{2,2,4,5}})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 3, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 5, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2}, 70)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 3}, 65)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 3}, 150)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 1}, 110)
    addToShapeArray(sp, "item","small-present", {1, 2, 6, 5}, {})

    addToShapeArray(sp, "item","small-present", {2, 2, 6, 3}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
