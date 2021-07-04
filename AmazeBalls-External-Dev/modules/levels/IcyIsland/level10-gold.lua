local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 3, 1, "none","right","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, 23, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 2, 2, "none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_1", {1, 1, 5, 2, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_1", {1, 1, 6, 5, "none","right","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_1"},{"slide"},{},{2},{1},{1,1,6,3},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 2, 3, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_2", {1, 2, 5, 3, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,5,1},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_2", {1, 2, 6, 3, "up","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{1},{1},{1,2,6,3},{2},{1,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 7, 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_2", {1, 2, 4, 5, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_2"},{"slide"},{},{2},{1},{1,2,4,2},{2},{1,2,4,4},{3},{1,2,4,5}})

    --SWITCHES

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 2, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 5, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 7, 1}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 5}, 130))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 1, 2}, 140))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 2, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 4, 2}, {}))
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
