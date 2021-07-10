local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right", {"disabled"})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 5, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle10_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle11_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 5})
    addToShapeArray(sp, "shape","triangle12_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 3, 1})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{4},{1},{2,1,4,2},{2},{2,1,5,2},{3},{2,1,5,2},{4},{2,1,6,1}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 5}, "up")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 3, 5}, "down")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"flip-horizontal"}})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")

    --SCREEN 2-2
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 3, 4})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 3, 3}, { {"door-open", "door1_1_1"} }, {"one-way"})

    --GEM
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 5, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 65)
    addToShapeArray(sp, "item","coins", {2, 1, 2, 2}, 80)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 2}, 130)
    addToShapeArray(sp, "item","big-present", {1, 1, 4, 3}, {})
    addToShapeArray(sp, "item","big-present", {2, 1, 1, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 4, 3}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 6, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
