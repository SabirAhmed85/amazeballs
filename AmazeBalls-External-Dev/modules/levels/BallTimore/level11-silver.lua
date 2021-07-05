local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 2, 1})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 7, 5, "up", "none","none","left"})

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,1,3},{2},{1,2,2,3}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 3}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-horizontal"}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 3}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 1}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 6, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{3},{1},{2,2,1,1},{2},{2,2,1,2},{3},{2,2,1,3},{4},{2,2,1,4}})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 3, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{},{1},{1},{2,2,3,3},{2},{2,2,3,4}})
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 5, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"slide"},{},{2},{1},{2,2,5,2},{2},{2,2,5,3}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 7, 3}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 3, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 5, 4}, "up")
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 7, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 1, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 2, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 6, 5}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 7, 5}, "left")

    --GEMS
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 1, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 6, 4}, 90)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 2}, 220)
    addToShapeArray(sp, "item","coins", {2, 2, 4, 5}, 160)
    addToShapeArray(sp, "item","small-present", {2, 2, 2, 1}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 4, 4}, {})
    addToShapeArray(sp, "item","big-present", {2, 1, 1, 2}, {})
    addToShapeArray(sp, "item","bomb", {2, 2, 7, 1}, {})
    addToShapeArray(sp, "item","clock", {2, 2, 2, 4}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
