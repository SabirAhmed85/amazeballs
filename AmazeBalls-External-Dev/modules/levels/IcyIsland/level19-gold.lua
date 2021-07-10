local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,4,1}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 1, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 5}, "up")

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,3,1},{3},{2,1,4,1}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 2}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape", {1, 3, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 4, 3})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 6, 3}, "down")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_1"},{"slide"},{},{3},{1},{2,1,6,1},{2},{2,1,7,2},{3},{2,1,7,3}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 1, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 4, 5}, "up")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 7, 1}, { {"door-open","door1_2_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 5, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 2}, 100)
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 70)
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
