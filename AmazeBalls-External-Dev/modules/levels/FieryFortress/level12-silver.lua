local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,1},{2},{1,1,6,1}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,2},{2},{1,1,2,2},{3},{1,1,3,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,6,3},{2},{1,1,7,3},{3},{1,1,7,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{2},{1},{1,1,4,4},{2},{1,1,4,5},{3},{1,1,5,3}})

    -- SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 2}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 2}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, 1, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 3, 1})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 3}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{"orange"},{1},{1},{2,2,6,3},{2},{2,2,7,4}})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 3, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{"lightBlue"},{2},{1},{2,2,3,5},{2},{2,2,3,4},{3},{2,2,4,2},{4},{2,2,5,1}})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 2, 5}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 5}, "right")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 5, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 3, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 3, 1}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 2}, 80)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 3, 30)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 3}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 5, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t