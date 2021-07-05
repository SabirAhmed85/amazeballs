local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,6,3},{2},{1,1,6,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 1, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,1,2},{2},{2,1,2,2}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 3, 2}, "right")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{2},{1},{2,1,2,5},{2},{2,1,3,5}})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 6, 5}, "up")

    --SCREEN 3-1
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 5, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 3, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 2, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 3, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_3_1", {3, 1, 3, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 5, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_3_1"},{"slide"},{},{2},{1},{3,1,5,3},{2},{3,1,5,4}})
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 1, 2, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 2}, 80)
    addToShapeArray(sp, "item","coins", {2, 1, 7, 2}, 12)
    addToShapeArray(sp, "item","coins", {3, 1, 7, 2}, 75)
    addToShapeArray(sp, "item","small-present", {1, 1, 3, 5}, {})

    addToShapeArray(sp, "item","small-present", {3, 1, 4, 5}, {})

    addToShapeArray(sp, "item","big-present", {3, 1, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
