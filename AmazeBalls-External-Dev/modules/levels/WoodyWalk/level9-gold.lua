local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,2},{2},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,3},{2},{1,1,3,3}})
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 3, 5, 2})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 5}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 2}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,4,2},{2},{1,2,5,2},{3},{1,2,6,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 3}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,3},{2},{1,2,4,3}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,4},{2},{1,2,2,4},{3},{1,2,3,4}})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 6, 4})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 3, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 170)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 4}, 70)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 5}, 60)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 4}, 130)
    addToShapeArray(sp, "item","small-present", {1, 2, 6, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 2, 5}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 1, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
