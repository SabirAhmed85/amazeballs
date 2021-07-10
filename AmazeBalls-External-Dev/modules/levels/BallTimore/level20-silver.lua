local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 6, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,6,5},{2},{1,1,6,3},{3},{1,1,7,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 4}, "down")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 5}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,1,2},{2},{1,1,1,3},{3},{1,1,1,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 4, 5}, "triangleBottomRightShape", {1, 9, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 3}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,1,4},{2},{2,1,2,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 3}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{},{2},{1},{2,1,5,3},{2},{2,1,6,3}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 5, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 2}, "left")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 5, 2}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{1},{1},{1,2,5,2},{2},{1,2,5,4},{3},{1,2,5,5}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 3, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 4})
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 7, 4}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 5}, "bar", {"horz"})
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
