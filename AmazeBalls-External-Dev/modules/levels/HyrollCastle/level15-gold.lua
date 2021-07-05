local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 3})
    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 1}, "left")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 5, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 7, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 4, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,2,4,2},{2},{1,2,4,3},{3},{1,2,4,4}})
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 5, 2}, "right")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 3, 3}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,2,3,2},{2},{1,2,3,3}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 4, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"switchSlide"},{},{1},{1},{1,2,4,5},{2},{1,2,6,5},{3},{1,2,7,5}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,2,5,6},{2},{1,2,6,6}})

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 1}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 5, 1}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 2, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_1"},{"slide"},{},{1},{1},{2,2,2,3},{2},{2,2,3,3}})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_1"},{"slide"},{},{2},{1},{2,2,5,3},{2},{2,2,6,3}})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 5, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 2, 5})
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 3, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_2_1"},{"switchSlide"},{},{2},{1},{2,2,3,4},{2},{2,2,3,5}})
    addToShapeArray(sp, "shape","triangle9_2_2", {2, 2, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle10_2_2", {2, 2, 6, 5}, "triangleTopLeftShape")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 1, 4}, { {"slide","triangle1_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_2", {1, 2, 5, 4}, { {"slide","triangle5_1_1"} })
    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 4, 4}, { {"slide","triangle8_2_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 6, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 3, 4}, 225)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 1}, 90)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 1}, {})
    addToShapeArray(sp, "item","hook", {2, 2, 4, 2}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
