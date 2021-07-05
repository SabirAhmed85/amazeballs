local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,4,3},{2},{1,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 5}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5, "down", "disabled"})

    --SCREEN 1-2
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 2, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 5, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"switchSlide"},{labelled = false},{2},{1},{1,2,5,4},{2},{1,2,5,5}})
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 7, 5}, "right")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 3, 3})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 3, 5})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 4}, { {"door-open", "door1_1_1"} })

    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 2, 1}, { {"door-open", "door1_1_2"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch2_1_2", {1, 2, 3, 4}, { {"slide", "autoFan3_1_2"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 5, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 4}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 1, 1}, 115)
    addToShapeArray(sp, "item","coins", {2, 2, 7, 5}, 295)
    addToShapeArray(sp, "item", "small-present", {1, 2, 1, 1}, {})

    addToShapeArray(sp, "item", "big-present", {2, 2, 3, 1}, {})

    addToShapeArray(sp, "item", "hook", {1, 1, 4, 1}, {})

    addToShapeArray(sp, "item", "bomb", {1, 2, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
