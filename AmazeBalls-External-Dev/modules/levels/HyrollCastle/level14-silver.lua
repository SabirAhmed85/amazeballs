local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, 8}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 3, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{},{1},{1},{1,1,6,3},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 2, 4}, "triangleTopLeftShape", {1, 6}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 3, 4}, "bar", {"vert", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 4, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,5,4},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 3, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 6, 5}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{},{2},{1},{1,1,6,4},{2},{1,1,6,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_2", {1, 2, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 6, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "icy"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 4, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 5, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 2, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 5}, 600))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 4, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 5}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 1, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 3, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 6, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 6, 4}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
