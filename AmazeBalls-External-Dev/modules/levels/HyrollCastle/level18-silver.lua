local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 2}, "left")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 6, 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 4}, "left")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, 1)
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 4}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,1},{2},{1,2,3,1}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 1}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{1},{1},{1,2,2,2},{2},{1,2,4,2},{3},{1,2,6,2}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 6, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 7, 2}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 4, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 8, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 2, 4}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 4})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_1_2"},{"slide"},{},{1},{1},{1,2,2,5},{2},{1,2,3,5}})
    addToShapeArray(sp, "shape","triangle10_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar6_1_2", {1, 2, 4, 6}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar7_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar7_1_2"},{"slide"},{},{2},{1},{1,2,5,6},{2},{1,2,6,6}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 2}, 80)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 150)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 5}, 50)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 3}, 20)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 7, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
