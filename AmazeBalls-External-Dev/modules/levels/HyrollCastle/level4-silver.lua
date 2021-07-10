local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{"silver"},{2},{1},{1,1,1,2},{2},{1,1,2,1}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 3, 1}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "bar", properties = { shape = "horz"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,1},{2},{1,1,7,2}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"slide"},{"silver"},{1},{1},{1,1,4,2},{2},{1,1,5,3},{3},{1,1,4,4}})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 3, 4}, {
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 4}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,6,4},{2},{1,1,7,4}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 3, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"green"},{2},{1},{1,2,2,1},{2},{1,2,3,1},{3},{1,2,3,2},{4},{1,2,3,3}})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 4, 1})
    addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 6, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"slide"},{"green"},{1},{1},{1,2,6,1},{2},{1,2,6,3},{3},{1,2,6,4}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"horz"})
    addToShapeArray(sp, "item","map", {1, 2, 2, 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 5, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 3}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 3}, "triangleBottomRightShape", {1, 21, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, 7})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,3},{"*"},{1,2,5,5},{2},{1,2,6,5}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 4}, "triangleTopRightShape", {1, 1)
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{3},{1},{1,2,1,5},{2},{1,2,2,5},{3},{1,2,3,4}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 6, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 5}, "down")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 6, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 6, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 8, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"slide"},{"lightBlue"},{1},{1},{1,3,4,3},{2},{1,3,5,3}})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 6, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 2, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{"silver"},{3},{1},{1,3,2,2},{2},{1,3,1,4},{3},{1,3,2,4}})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 5, 4}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 7, 4}, "up")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_3"},{"slide"},{"green"},{2},{1},{1,3,2,5},{2},{1,3,3,5},{3},{1,3,4,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 7, 5})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
