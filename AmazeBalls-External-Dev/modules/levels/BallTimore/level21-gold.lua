local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 7, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 4, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 1, 1, 6, 3, {} })
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 7, 5}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,2,1},{2},{1,2,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", 1, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 1, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 7, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", 1, 2, 4, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", 1, 2, 1, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", 1, 2, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", 1, 2, 7, 5}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_3", {1, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 2, 2}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 5, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 6, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{},{2},{1},{1,3,6,2},{2},{1,3,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 2, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_3"},{"slide"},{},{1},{1},{1,3,2,4},{2},{1,3,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 3, 6, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 7, 4}, "triangleBottomLeftShape", {1, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 3, 5}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 3, 5}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{},{1},{1},{1,3,3,5},{2},{1,3,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SCREEN 1-4
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_4", {1, 4, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", 1, 4, 4, 2, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "triangle", properties = {shape = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up","right","left"} } }
    }} )
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", 1, 4, 2, 4}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", 1, 4, 4, 4, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","right"} } }
    }} )

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_3", {2, 3, 4, 4, { {"door-open","door1_2_3"},{"door-open","door3_2_2"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 4
t.screenHorzTotal = 1
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
