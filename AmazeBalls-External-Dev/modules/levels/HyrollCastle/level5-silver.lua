local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{"silver"},{2},{1},{1,1,1,2},{2},{1,1,2,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", 1, 1, 3, 1, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    }} )
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,1},{2},{1,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 4, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"slide"},{"silver"},{1},{1},{1,1,4,2},{2},{1,1,5,3},{3},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", 1, 1, 3, 4, {
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    }} )
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 4, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 6, 4, "triangleLeftAndRightShape", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,6,4},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 1, 5}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 3, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"green"},{2},{1},{1,2,2,1},{2},{1,2,3,1},{3},{1,2,3,2},{4},{1,2,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_2", {1, 2, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_1_2", {1, 2, 6, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"slide"},{"green"},{1},{1},{1,2,6,1},{2},{1,2,6,3},{3},{1,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 2, 2, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 5, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 3}, "triangleBottomLeftShape", {1, 7, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 4, 3}, "triangleBottomRightShape", {1, 21, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, 7}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,3},{"*"},{1,2,5,5},{2},{1,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 4}, "triangleTopRightShape", {1, 10})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{3},{1},{1,2,1,5},{2},{1,2,2,5},{3},{1,2,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 6, 5}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 6, 5}, "down"))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 7, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 8, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_3", {1, 3, 4, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"slide"},{"lightBlue"},{1},{1},{1,3,4,3},{2},{1,3,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 6, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 2, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{"silver"},{3},{1},{1,3,2,2},{2},{1,3,1,4},{3},{1,3,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 5, 4}, "triangleTopLeftShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 3, 5}, "triangleBottomRightShape", {1, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_3"},{"slide"},{"green"},{2},{1},{1,3,2,5},{2},{1,3,3,5},{3},{1,3,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_3", {1, 3, 7, 5}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 4, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 1, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 3, 1, 5}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 4}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 7, 1, 340})
    table.insert(shapeArrayParameters, getShapeArray("item","bomb", 1, 3, 4, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", 1, 2, 1, 4, "clock1_1_1", 10, 1}))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 1, 1, 3, 2, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 1, 3, 3, 3, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 3, 6, 1, {}})

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
