local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 6, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 6, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 2, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 5, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 2}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 3, 2}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 6, 2}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 2, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 3, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 4, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 6, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_1", {2, 1, 7, 3}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_2_1"},{"slide"},{},{3},{1},{2,1,5,1},{2},{2,1,5,2},{3},{2,1,6,2},{4},{2,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 6}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,3,5},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 5, 5}, "up"))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 3, 4}, { {"slide", "autoFan2_1_1"} }, {"one-way", "not-labelled"}))
    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 3, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 2, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 4}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 2}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 3, 2, 12))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 2, 4}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
