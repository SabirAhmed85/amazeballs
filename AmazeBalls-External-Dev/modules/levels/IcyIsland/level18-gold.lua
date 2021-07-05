local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 1})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 2}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 3}, "triangleTopLeftShape", {1, 15})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,3,2},{2},{1,2,3,3}})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{2},{1},{1,2,4,1},{2},{1,2,4,3},{3},{1,2,4,4}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{},{1},{1},{1,2,2,4},{2},{1,2,3,5}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 5}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 4, 5, "up","none","none","none"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 5, 5}, "triangleBottomLeftShape", {1, _, "icy"})

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    --addToShapeArray(sp, "item","coins", {2, 2, 2, 5}, 250)
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, 10, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 3, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 1, 1}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 1, 2, 30)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3}, 28)
    addToShapeArray(sp, "item","big-present", {1, 2, 1, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 4}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 5, 2}, {})
    addToShapeArray(sp, "item","clock", {2, 2, 6, 4}, {})
    addToShapeArray(sp, "item","superDummy", 1, 2, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
