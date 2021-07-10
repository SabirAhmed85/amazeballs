local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "right")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,1},{2},{1,1,4,3},{3},{1,1,4,4},{4},{1,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 13})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 7, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 1, 3}, "right")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,3,3},{2},{2,1,4,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 4}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 6, 5}, "triangleTopAndBottomShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,5},{2},{2,1,6,5}})

    --SCREEN 3-1
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 2, 1})
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 5, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_3_1", {3, 1, 5, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_3_1"},{"slide"},{"orange"},{2},{1},{3,1,4,2},{2},{3,1,5,2}})
    addToShapeArray(sp, "backFire","backFire1_3_1", {3, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_3_1"},{"slide"},{"lightDarkBlue"},{1},{1},{3,1,1,1},{2},{3,1,1,3}})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 3}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 4, 4}, "triangleTopAndBottomShape", {1})

    --GEMS
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 1, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 3, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 4}, 100)
    addToShapeArray(sp, "item","coins", {3, 1, 4, 5}, 100)
    addToShapeArray(sp, "item","big-present", {3, 1, 7, 1}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 5, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t