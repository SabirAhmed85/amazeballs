local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "item","map", {1, 1, 2, 4})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 1}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 2}, "left")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 3}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 4}, "right")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 2, 5})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 5}, "left")
    addToShapeArray(sp, "tunnel","tunnel1_1_2", {1, 2, 7, 5, 2, 2, 6, 1}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 4, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{2},{1},{2,2,2,1},{2},{2,2,2,2},{3},{2,2,4,2}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 6, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 7, 3}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "tunnel","tunnel1_2_2", {2, 2, 2, 5, 1, 2, 2, 1}, {"none"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 5, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 1, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 5, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 2}, 170)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 1}, 110)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 4}, 12)
    addToShapeArray(sp, "item","big-present", {2, 2, 1, 1}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 4}, {})
    addToShapeArray(sp, "item","hook", {1, 2, 3, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
