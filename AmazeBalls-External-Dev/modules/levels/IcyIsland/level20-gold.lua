local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{"*"},{1,1,2,1},{2},{1,1,5,1},{3},{1,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, 13}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 5, "down", "disabled"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 1, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"switchSlide"},{},{1},{1},{1,2,1,1},{2},{1,2,2,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 5, 1}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"switchSlide"},{},{3},{1},{1,2,2,2},{2},{1,2,4,1},{3},{1,2,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"switchSlide"},{},{1},{1},{1,2,7,1},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 6, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 2, 3}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"switchSlide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 4, 3}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 3}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 6, 3}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"switchSlide"},{},{1},{1},{1,2,6,3},{2},{1,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 4, 5}, "down"))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 1, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 3, 5}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_3", {1, 3, 4, 5}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 5, 2}, { {"slide","autoFan2_1_1"},{"door-open","door1_1_1"} }, {"one-way"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 1, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 5, 2}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 4, 3, 33))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 5, 4, 405}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 1, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 3, 2, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","characterSpecial", 1, 3, 3, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","hook", {1, 1, 4, 3}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
