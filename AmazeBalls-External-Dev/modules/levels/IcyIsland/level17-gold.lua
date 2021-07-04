local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,1,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, 9}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,3,3},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 4, 3, "up","none","none","left"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 6, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,6,1},{2},{1,1,6,3},{3},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 4, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 5, 5}, "down"))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 4, 1}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,4,1},{2},{1,3,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 6, 1}, "triangleTopRightShape", {1, 16, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_3", {1, 3, 6, 2, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_3"},{"slide"},{},{2},{1},{1,3,5,2},{2},{1,3,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_3", {1, 3, 2, 3, "up","none","down","none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_3", {1, 3, 6, 4, "none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_3"},{"slide"},{},{2},{1},{1,3,5,4},{2},{1,3,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 2, 5}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 5, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_3", {1, 3, 6, 5}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_3"},{"slide"},{},{1},{1},{1,3,6,5},{2},{1,3,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_3", {1, 3, 7, 5}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 1, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 6, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 4, 2}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 4, 375}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 2, 5}, 130))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 4, 5}, 85))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 2, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 2, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 3, 1, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
