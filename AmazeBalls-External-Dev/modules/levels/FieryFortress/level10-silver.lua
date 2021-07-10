local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,1},{"*"},{1,1,4,2},{2},{1,1,5,2},{3},{1,1,5,4},{4},{1,1,5,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 4, 4}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right", {"disabled"})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,1},{2},{2,1,1,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 2}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 3, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 1, 4}, "up")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 4, 4}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{"lightDarkBlue"},{1},{1},{2,1,4,4},{2},{2,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 3, 5}, "down")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 3, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_2_1", {2, 1, 6, 5}, "left")


    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 7, 3}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{2,2,5,1},{"*"},{2,2,5,3},{2},{2,2,7,3}})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 5}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 5, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{2,2,3,5},{2},{2,2,5,5}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 7, 5}, "left")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 4, 1}, { {"door-open", "door2_1_1"} }, "one-way", "not-labelled" })
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 7, 4}, { {"slide", "autoFan1_2_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 6, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4}, 70)
    addToShapeArray(sp, "item","coins", {2, 1, 1, 3}, 85)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 3}, 130)
    addToShapeArray(sp, "item","coins", {1, 1, 3, 1}, 65)
    addToShapeArray(sp, "item","coins", {2, 1, 7, 2}, 180)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 1}, 90)
    addToShapeArray(sp, "item","big-present", {2, 1, 3, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 3}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t