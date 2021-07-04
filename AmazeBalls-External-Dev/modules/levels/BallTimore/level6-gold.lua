local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 5, 2}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{2},{1},{1,1,3,3},{2},{1,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 4, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 2, 5}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_1", {2, 1, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 2, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"autoSlide"},{timePerSquare=600},{1},{1},{2,1,2,2},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 2, 4}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 4, 4}))

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
