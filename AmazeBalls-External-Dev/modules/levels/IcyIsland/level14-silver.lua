local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 2}, "bar", {"horz"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 3, 3}, {"none", "right", "none"}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,3,3},{2},{2,1,3,4},{3},{2,1,3,5}})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 7, 3}, "bar", {"horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"autoSlide"},{},{1},{1},{2,1,7,3},{2},{2,1,7,5}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    --addToShapeArray(sp, "item","coins", {2, 1, 6, 4}, 100)
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 3, 4})
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 7, 4, "up", "right", "none", "none"})


    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 7, 4}, { {"door-open","door1_2_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 6, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 5, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3, 445})
    addToShapeArray(sp, "item","big-present", {1, 1, 7, 5}, {})
    addToShapeArray(sp, "item","big-present", {2, 1, 1, 4}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 5}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 4, 4}, {})
    addToShapeArray(sp, "item","characterSpecial", {2, 2, 7, 1}, {})
    addToShapeArray(sp, "item","hook", {2, 1, 5, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
