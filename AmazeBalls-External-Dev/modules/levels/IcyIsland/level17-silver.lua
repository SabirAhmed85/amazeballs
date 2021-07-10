local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 1})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,5,1},{2},{1,1,6,1}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 4, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,4,5}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,5,2},{2},{1,2,6,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,2,4},{2},{1,2,4,5}})

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "item","map", {2, 2, 4, 3})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 4}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"slide"},{},{3},{1},{2,2,3,1},{2},{2,2,3,2},{3},{2,2,3,4}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 7, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 170)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 2}, 70)
    addToShapeArray(sp, "item","big-present", {1, 1, 7, 5}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 7, 1}, {})
    addToShapeArray(sp, "item","characterSpecial", {1, 2, 3, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
