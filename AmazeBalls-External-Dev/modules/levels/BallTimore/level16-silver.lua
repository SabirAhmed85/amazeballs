local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 1, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 5, 2}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 6, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 6, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 6, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 3, "right", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 7, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_1", {1, 1, 7, 5}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 4, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 5, 1}, "triangleTopRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_2", {1, 2, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,7,1},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_2", {1, 2, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 8, 2}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"switchSlide"},{},{1},{1},{1,2,8,1},{2},{1,2,8,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 6, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_1_2", {1, 2, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 5, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 1, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 4, 6}, "bar", {"vert", 2}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 5, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 7, 3}))


    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 1, 3}, { {"door-open","door1_1_1"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_1_2", {1, 2, 5, 3}, { {"slide","bar2_1_2"} }))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
