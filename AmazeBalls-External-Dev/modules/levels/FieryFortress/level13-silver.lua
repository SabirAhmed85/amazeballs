local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 7, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,4,1},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 2, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_1", {1, 1, 6, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{"green"},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_1_1", {1, 1, 5, 5}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,5},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 5, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomRightShape", {1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_2", {1, 2, 6, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 5, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{4},{1},{1,2,1,2},{2},{1,2,3,3},{3},{1,2,4,3},{4},{1,2,5,3},{"*"},{1,2,5,4},{5},{1,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_2", {1, 2, 2, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_1_2", {1, 2, 4, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_1_2", {1, 2, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 2, 7, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right", "none", "left"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 7, 5}, "right"))

    -- 2-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 1, 1}, "triangleBottomLeftShape", {1, 7, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 2, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 5, 1}, "triangleBottomRightShape", {1, 8}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 8, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_2_2", {2, 2, 7, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"characterChangePoint1_2_2"},{"slide"},{"purple"},{2},{1},{2,2,6,3},{2},{2,2,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 1, 4}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{"orange"},{1},{1},{2,2,1,4},{2},{2,2,1,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 2, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 4, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_2"},{"slide"},{"orange"},{1},{1},{2,2,4,4},{2},{2,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_2", {2, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_2", {2, 2, 2, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 5, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_2_2", {2, 2, 5, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, 11}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 1, 1}, "triangleTopLeftShape", {1, 6}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 3, 1}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{"orange"},{2},{1},{1,3,2,2},{2},{1,3,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 1, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_3", {1, 3, 4, 3}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_3"},{"slide"},{"orange"},{2},{1},{1,3,3,3},{2},{1,3,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_3", {1, 3, 3, 4}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_3", {1, 3, 4, 4}, "triangleTopLeftShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_3", {1, 3, 1, 5}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_3", {1, 3, 2, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"slide"},{"lightBlue"},{1},{1},{1,3,2,5},{2},{1,3,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_3", {1, 3, 5, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_3"},{"slide"},{"orange"},{1},{1},{1,3,5,5},{2},{1,3,6,5},{3},{1,3,7,5}})

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 5, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 7, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 6, 1}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 1}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 2}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 4, 2}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 7, 1}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 3, 4, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 2, 1, 3}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t