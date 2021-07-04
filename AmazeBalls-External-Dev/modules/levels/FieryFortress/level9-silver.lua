local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,1},{2},{1,1,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 5, 1}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "bar", properties = { shape = "horz"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 5, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 5, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 6, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 7, 3}, {
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 7, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{4},{1},{1,2,2,2},{2},{1,2,4,2},{3},{1,2,6,2},{4},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 3}, "triangleLeftAndRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple1_1_2", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_1_2", {1, 2, 3, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,3,4},{2},{1,2,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 3}, "triangleLeftAndRightShape", {2}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 1, 5}, "down"))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 1, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{"orange"},{1},{1},{1,3,1,1},{2},{1,3,1,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple2_1_3", {1, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 4, 3}, "triangleTopLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{"green"},{2},{1},{1,3,4,2},{2},{1,3,4,3},{3},{1,3,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 5, 5}, "up"))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 6, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 3, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 5, 2}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 7, 2}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 7, 2, 40))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 7, 1}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 6, 1}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t