local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 2, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_1", {1, 1, 5, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{},{3},{1},{1,1,4,3},{2},{1,1,5,3},{3},{1,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 6, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 4, 4}))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopLeftShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 6, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"slide"},{},{2},{1},{1,1,4,5},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 7, 5}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 7, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 7, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 7, 6}, "bar", {"vert", 2}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 7, 1}, "triangleTopRightShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{4},{1},{1,2,5,2},{2},{1,2,5,1},{3},{1,2,6,1},{3},{1,2,7,1}})
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_1_2", {1, 2, 1, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 5, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 6, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"flip-horizontal"}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_2", {2, 2, 6, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 7, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, 8, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 4, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_2", {2, 2, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 3, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 7, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 5, 4}, "triangleBottomRightShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 5, 5}, "triangleBottomLeftShape", {1, _, "breakable"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 4, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
