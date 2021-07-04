local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 1, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,3,4},{3},{1,1,4,4},{4},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 4, 6}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 7, 6}, "bar", {"vert", 2}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 2, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, 4, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_2", {1, 2, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 6, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 3, 5}, "triangleTopRightShape", {1, _, "icy"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 4, 1}, { {"door-open","door1_1_2"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 4, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 5, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 1, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 1}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 2, 1}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 1, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","hook", {1, 2, 6, 3}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
