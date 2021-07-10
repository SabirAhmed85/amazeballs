local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 3, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,4,2},{3},{1,1,5,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 4}, "down")
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 5, 4}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 3, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{2},{1},{1,2,3,2},{2},{1,2,3,1},{3},{1,2,4,1}})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 5, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{},{3},{1},{1,2,5,3},{2},{1,2,5,2},{3},{1,2,5,1},{4},{1,2,6,1}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{3},{1},{1,2,6,4},{2},{1,2,7,4},{3},{1,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,3,4}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 3, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,4,3},{2},{1,2,4,5},{3},{1,2,6,5}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 7, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 4, 3}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 7, 4})
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"slide"},{},{2},{1},{1,3,1,3},{2},{1,3,1,5}})
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 3, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 7, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle6_1_3", {1, 3, 7, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 3, 4, 4}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3}, 12)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 1}, 14)
    addToShapeArray(sp, "item","coins", {1, 3, 6, 3}, 27)
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 3, 3, 2}, {})
    addToShapeArray(sp, "item","big-present", {1, 3, 6, 1}, {})
    addToShapeArray(sp, "item","superDummy", 1, 2, 1, 2}, {})
    addToShapeArray(sp, "item","iceCape", {1, 3, 2, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
