local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "item","compass", {1, 1, 1, 2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{2},{1},{1,1,6,1},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 2}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{timePerSquare = 400},{1},{1},{1,1,7,2},{2},{1,1,7,4}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,3,2},{2},{1,1,3,3},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 4, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 6, 3}, "right")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 1, 4}, "bar", {"horz"})
    addToShapeArray(sp, "item","map", {1, 1, 1, 4})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomRightShape", {1, 8})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{3},{1},{1,1,5,5},{2},{1,1,5,4},{3},{1,1,6,4}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{3},{1},{1,1,7,2},{2},{1,1,7,3},{3},{1,1,7,4}})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, 13})

    -- 1-2
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 2}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,2},{2},{2,1,4,2}})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 6, 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopRightShape", {1, 16})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 3}, "right")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{"brown"},{1},{1},{2,1,2,4},{2},{2,1,3,4}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{"green"},{1},{1},{2,1,1,4},{2},{2,1,2,4},{3},{2,1,2,5}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 7, 5}, "left")

    --ALL SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 2}, { {"slide","bar2_1_1"} })

    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 4, 2}, { {"slide","bar2_1_2"},{"slide","bar7_1_2"} })
    addToShapeArray(sp, "switch","switch2_1_2", {1, 2, 3, 3}, { {"slide","bar5_1_2"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 2, 2}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 2}, {})

    --addToShapeArray(sp, "item","coins", {1, 1, 1, 3}, 90)
    --addToShapeArray(sp, "item","coins", {2, 1, 7, 3}, 90)

    --addToShapeArray(sp, "item","something", 1, 1, 5, 2})
    --addToShapeArray(sp, "item","something", 1, 2, 4, 3})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
