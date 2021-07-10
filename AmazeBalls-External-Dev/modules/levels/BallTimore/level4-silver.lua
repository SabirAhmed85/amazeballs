local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 1}, "down")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 4})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 2}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 3}, "bar", {"horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"switchSlide"},{},{1},{1},{2,1,8,3},{2},{2,1,8,4}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 5, 4}, "bar", {"horz"})

    --SCREEN 3-1
    addToShapeArray(sp, "gun","gun1_3_1", {3, 1, 2, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 4, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_3_1", {3, 1, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_3_1"},{"slide"},{},{1},{1},{3,1,6,3},{2},{3,1,7,3},{3},{3,1,7,2}})
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 2, 4}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_3_1"},{"slide"},{},{1},{1},{3,1,2,4},{2},{3,1,4,4}})
    addToShapeArray(sp, "shape","bar2_3_1", {3, 1, 7, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_3_1"},{"slide"},{},{2},{1},{3,1,6,4},{2},{3,1,7,4}})
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 7, 5}, "up")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 6, 4}, { {"slide","bar1_2_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 4, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 1, 1, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 2}, 55)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 4}, 65)
    addToShapeArray(sp, "item","coins", {3, 1, 4, 3}, 14)
    addToShapeArray(sp, "item","small-present", {2, 1, 7, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
