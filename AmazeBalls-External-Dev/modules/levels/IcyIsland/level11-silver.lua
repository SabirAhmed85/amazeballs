local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 2}, "down")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{},{2},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,5,4}})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 3, 5}, "right")
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 5, 5}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 5}, "up")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 7, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{1},{1},{2,1,7,1},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 1, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,1,2},{2},{2,1,2,3}})
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 4, 3, 1, 1, 2, 3, "none"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 5, 3, 125})
    addToShapeArray(sp, "item","coins", {2, 1, 5, 1, 75 })
    addToShapeArray(sp, "item","coins", {2, 1, 3, 2, 250 })
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
