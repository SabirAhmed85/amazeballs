local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_1", {1, 1, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 7, 1}, {
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down", "right"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 3}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 2, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, 6, "breakable"}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_1", {2, 1, 4, 1, "none","right","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, 22, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{1},{1},{2,1,5,3},{2},{2,1,5,4},{3},{2,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 4, 5}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_1", {2, 1, 4, 5, 3, 1, 4, 4, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 4, 6}, "bar", {"vert"}))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_3_1", {3, 1, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 2, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_1", {3, 1, 3, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_3_1", {3, 1, 2, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_3_1"},{"slide"},{},{2},{1},{3,1,2,2},{2},{3,1,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_1", {3, 1, 4, 3}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_1", {3, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, 1))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_1", {3, 1, 3, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"slide"},{},{2},{1},{3,1,3,1},{2},{3,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_3_1", {3, 1, 4, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_3_1", {3, 1, 5, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_3_1", {3, 1, 6, 4}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_3_1"},{"slide"},{},{2},{1},{3,1,6,1},{2},{3,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_3_1", {3, 1, 7, 4}, "triangleTopLeftShape"))

    --SWITCHES

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {3, 1, 5, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 1, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {3, 1, 2, 1}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 2, 58))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 6, 4}, 65))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 4, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 1, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {3, 1, 1, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","characterSpecial", 1, 1, 2, 4}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
