local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,1,1},{2},{1,1,3,1}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,3},{2},{1,1,3,4}})
    addToShapeArray(sp, "item","map", {1, 1, 4, 3})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,1,4},{2},{1,1,2,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 7, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,5},{2},{1,1,4,5},{3},{1,1,6,5}})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "door","door4_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,1},{2},{1,2,2,1}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 4, 1})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{2},{1},{1,2,6,1},{2},{1,2,6,3}})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 2}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 2}, "triangleBottomRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,3,2},{2},{1,2,5,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 1, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 4})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 5, 5}, "triangleBottomRightShape", {1})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 5, 3}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 50)
    addToShapeArray(sp, "item","small-present", {1, 2, 3, 3}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 7, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t