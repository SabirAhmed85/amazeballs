local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 3}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","map", {1, 1, 1, 4})
    addToShapeArray(sp, "backFire","backFire1_2_1", {1, 1, 2, 4})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 4}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,4,4},{2},{1,1,5,4},{3},{1,1,5,2}})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 7, 5}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,7,2},{2},{1,1,7,4},{3},{1,1,7,5}})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 4})
    addToShapeArray(sp, "item","mystery-block", {2, 1, 5, 4}, {
        {name = "triangle", properties = {directions = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right", "left"} } },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 3, 5}, "up")

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
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
