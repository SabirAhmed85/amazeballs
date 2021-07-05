local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 5, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 4}, "triangleTopLeftShape", {1, 11}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 5, 4}, {"none","right","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 5, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,2,1},{2},{1,2,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,4,1},{2},{1,2,5,1},{3},{1,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 6, 1}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,1},{2},{1,2,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{1},{1},{1,2,6,2},{2},{1,2,6,3},{3},{1,2,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_2", {1, 2, 3, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_2", {1, 2, 5, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{},{2},{1},{1,2,1,5},{2},{1,2,1,4},{3},{1,2,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 5, 5}, "down"))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 1, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_3", {1, 3, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_3", {1, 3, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 4, 2}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{},{2},{1},{1,3,4,3},{2},{1,3,4,2},{3},{1,3,5,2},{4},{1,3,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_3", {1, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_3", {1, 3, 1, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 1, 2}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 2, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{},{1},{1},{1,3,2,2},{2},{1,3,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_3", {1, 3, 3, 3}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 3, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_3", {1, 3, 5, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_3", {1, 3, 6, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_3", {1, 3, 3, 4}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_1_3", {1, 3, 5, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_3", {1, 3, 2, 5}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_3"},{"slide"},{},{2},{1},{1,3,1,5},{2},{1,3,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 7, 5}, "triangleTopLeftShape", {1, _, "icy"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 1, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 3, 4, 5}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 4}, 110))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 2, 3}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 2, 5}, 60))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 7, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 4, 4}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
