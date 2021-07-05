local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 7, 1}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleTopAndBottomShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 7, 2}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 3}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 5, 4}, "down")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 4, 5}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 5})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 1, 1}, {"none","right","none","none"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 1}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,3,1},{2},{2,1,4,1},{3},{2,1,6,1}})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 1, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 4, 1}, {"none","right","none","left"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "spitter","spitter2_2_2", {2, 2, 7, 2}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_2"},{"autoSlide"},{timePerSquare = 360, pauseTime = 0},{2},{1},{2,2,7,1},{2},{2,2,7,2}})
    addToShapeArray(sp, "spitter","spitter3_2_2", {2, 2, 1, 4}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_2_2"},{"autoSlide"},{timePerSquare = 360, pauseTime = 0},{2},{1},{2,2,1,1},{2},{2,2,1,4}})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 4, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 4, 3})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{1},{1},{2,2,6,3},{2},{2,2,7,3}})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 5, 4})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 5, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 7, 5}, "triangleTopLeftShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 2, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 3}, 14)
    addToShapeArray(sp, "item","coins", {2, 1, 7, 5}, 250)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 4}, 100)
    addToShapeArray(sp, "item","small-present", {2, 1, 6, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 6, 3}, {})
    addToShapeArray(sp, "item","big-present", {2, 2, 3, 3}, {})
    addToShapeArray(sp, "item","characterSpecial", {2, 2, 2, 1}, {})
    addToShapeArray(sp, "item","hook", {1, 1, 4, 1}, {})
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
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
