local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,6,1},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 3, 2}, "left")
    addToShapeArray(sp, "gun","gun2_1_1", {1, 1, 5, 2}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 4, 4}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,4,4},{2},{1,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 5}, "right")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 1})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 1, 3}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,4},{2},{2,1,3,5}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 7, 5}, "left")

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
