local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "item","map", {1, 1, 1, 1})
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 3, 1, 1, 1, 7, 5, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,3,1}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "tunnel","tunnel2_1_1", {1, 1, 2, 3, 1, 1, 5, 2, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel2_1_1"},{"slide"},{},{2},{1},{1,1,1,3},{2},{1,1,2,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "tunnel","tunnel3_1_1", {1, 1, 3, 4, 2, 1, 6, 3, "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel3_1_1"},{"slide"},{},{2},{1},{1,1,1,4},{2},{1,1,3,4}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 4}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 4}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 2, 5}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,2,5},{2},{1,1,4,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,5,2},{2},{2,1,7,1}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 1, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 4, 3}, "down")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 5, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 5, 4})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 3, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 7, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 4, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 3}, 12)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 1}, 90)
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
