local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 3, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 5, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 6, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("item","compass", {1, 1, 6, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 7, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopLeftShape", {1, 6}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_1_1", {1, 1, 4, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, 11, "breakable"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 1, "triangleTopAndBottomShape"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 4, 2}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopLeftShape", {1, 11, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 4, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 2, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 5, 5}, "triangleTopLeftShape"))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 4, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 3, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 6, 5}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 3, 20))
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
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
