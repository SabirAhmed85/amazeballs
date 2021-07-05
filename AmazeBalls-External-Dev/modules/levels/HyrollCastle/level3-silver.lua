local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 5, 5}, "right")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{3},{1},{1,2,2,1},{2},{1,2,3,1},{"*"},{1,2,3,2},{3},{1,2,4,2},{4},{1,2,4,3},{"*"},{1,2,3,3},{5},{1,2,3,4}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{"silver"},{1},{1},{1,2,5,3},{2},{1,2,6,2},{3},{1,2,6,1}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"orange"},{1},{1},{1,2,6,4},{2},{1,2,6,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 4})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SCREEN 2-2
    addToShapeArray(sp, "item","map", {2, 2, 1, 2})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_2", {2, 2, 2, 2})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 2}, "right")
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 4}, "triangleTopLeftShape", {1, _, "hyroll"})

    --SCREEN 3-2
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 3, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_3_2", {3, 2, 6, 4}, "triangleTopLeftShape", {1, _, "icy"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 2, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 4, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 5, 4}, 20)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3}, 250)
    addToShapeArray(sp, "item","coins", {3, 2, 1, 4}, 500)
    addToShapeArray(sp, "item","coins", {1, 2, 4, 1}, 90)
    addToShapeArray(sp, "item","bomb", {1, 1, 2, 4 })
    addToShapeArray(sp, "item","small-present", {1, 1, 2, 3}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 1, 3}, {})

    addToShapeArray(sp, "item","big-present", {3, 2, 5, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
