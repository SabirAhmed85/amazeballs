local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 3, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 8, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 3, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 2, 1}, "triangleBottomRightShape", {1, 21, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{},{3},{1},{1,2,4,1},{2},{1,2,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 2, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,1,2},{2},{1,2,2,2},{3},{1,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 2, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,2,4},{2},{1,2,3,4},{3},{1,2,4,4},{4},{1,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_2", {1, 2, 7, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"slide"},{},{2},{1},{1,2,7,2},{2},{1,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_2", {1, 2, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 7, 5}, "triangleTopRightShape", {1, 13, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 7, 5, "right", "disabled"}))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", 2, 2, 1, 1, "none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"autoSlide"},{timePerSlide=480},{1},{1},{2,2,1,1},{2},{2,2,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 7, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {2, 2, 3, 3}, {
        {name = "backFire"},
        {name = "simple"},
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {2, 2, 5, 3}, {
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down","left"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_2", {2, 2, 1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{},{1},{1},{2,2,1,4},{2},{2,2,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_2", {2, 2, 7, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{2},{1},{2,2,6,4},{2},{2,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 2, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 6, 5}, "triangleTopRightShape"))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 3, 1}, "triangleBottomRightShape", {1, 14, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_3", {2, 3, 5, 1}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_3"},{"switchSlide"},{},{1},{1},{2,3,5,1},{2},{2,3,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 6, 1}, "triangleTopLeftShape", {1, 26, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 7, 1}, "triangleTopRightShape", {1, 1, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 4, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 7, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_3", {2, 3, 4, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_3", {2, 3, 6, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_3", {2, 3, 1, 4}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_3", {2, 3, 2, 4, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_3"},{"switchSlide"},{},{1},{1},{2,3,2,4},{2},{2,3,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_3", {2, 3, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_3", {2, 3, 6, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 7, 5}, "triangleTopRightShape"))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 2, 5}, { {"door-open","door2_1_2"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_3", {2, 3, 5, 1}, { {"slide","bar1_2_3"},{"slide","spitter1_2_3"} }))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
