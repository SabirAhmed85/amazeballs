local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 6, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 5, 2, "none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{3},{1},{1,1,1,2},{2},{1,1,2,2},{2},{1,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 1))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 6, 3, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 7, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_1", {1, 1, 2, 4, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_1", {1, 1, 3, 4, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_2"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter5_1_1", {1, 1, 7, 4, "none","none","down","none"}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleTopLeftShape", {1, 5, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 4, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_1", {2, 1, 7, 1, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,7,1},{2},{2,1,7,3},{3},{2,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, 3, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_1", {2, 1, 1, 3, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,1,3},{3},{2,1,1,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 4, 3}, "triangleBottomRightShape", {1, 9, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 5, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 5, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 4, 6}, "bar", {"vert", 3}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 3, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 1, 465}))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 1, 3, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 4, 1}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","dummyBall", {2, 1, 4, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","hook", {1, 1, 3, 1}, {}))

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
