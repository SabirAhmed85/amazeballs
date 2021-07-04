local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 2, 2}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 4, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_1", {2, 1, 5, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 6, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 7, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_1", {2, 1, 6, 2}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{1},{1},{2,1,6,2},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 6, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_2_1", {2, 1, 7, 2}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar6_2_1"},{"slide"},{},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 1, 3}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 7, 3}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,7,3},{2},{2,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 3, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,3,5},{2},{2,1,3,4},{3},{2,1,4,4},{4},{2,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_1", {2, 1, 6, 4}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 1, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 5, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_1", {2, 1, 6, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_1"},{"slide"},{},{2},{1},{2,1,5,5},{2},{2,1,6,5}})

    -- 2-2
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_2", {2, 2, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 2}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,2},{2},{2,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,1},{2},{2,2,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_2", {2, 2, 7, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_2", {2, 2, 1, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 1, 3}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,1,3},{2},{2,2,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 4, 3}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"switchSlide"},{},{1},{2},{2,2,4,2},{2},{2,2,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 5, 3}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_2"},{"switchSlide"},{},{1},{2},{2,2,5,2},{2},{2,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 2, 1, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 3, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_2", {2, 2, 7, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_2", {2, 2, 4, 5}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,4},{2},{2,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("item","compass", {2, 2, 6, 5}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_2_2", {2, 2, 7, 5}))

    -- 1-3
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 5, 1}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 6, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_3", {1, 3, 2, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_3", {1, 3, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 6, 2}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_3", {1, 3, 1, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_1_3", {1, 3, 3, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_3", {1, 3, 5, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_3"},{"slide"},{},{1},{1},{1,3,5,3},{2},{1,3,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_3", {1, 3, 7, 3}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_3"},{"slide"},{},{1},{1},{1,3,7,3},{2},{1,3,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_3", {1, 3, 2, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_3"},{"slide"},{},{1},{1},{1,3,2,4},{2},{1,3,4,4},{3},{1,3,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 3, 4}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_3", {1, 3, 2, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 3, 3, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "triangle", properties = {shape = "triangleTopRightShape" } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape" } }
        }})
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 3, 5, 5}, {
        --{name = "simple"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left", "right"} } }
    }})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_3", {1, 3, 2, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_3", {1, 3, 3, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_1_3", {1, 3, 4, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar7_1_3", {1, 3, 5, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_3", {1, 3, 7, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 7, 5}, "right"))

    -- 2-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_3", {2, 3, 7, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_3", {2, 3, 1, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_3", {2, 3, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_3", {2, 3, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 1, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_3", {2, 3, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_3", {2, 3, 5, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_2_3", {2, 3, 7, 4}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_2_3", {2, 3, 3, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_3", {2, 3, 6, 5}, "right"))

    --ALL SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_1", {2, 1, 2, 1}, { {"slide","autoFan2_2_2"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_2_1", {2, 1, 6, 3}, { {"slide","autoFan3_2_2"},{"slide","bar4_2_2"},{"slide","bar1_2_2"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 3, 2, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 6, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 2, 5}, "purpleCoin"))

    --ITEMS
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 5, 1}, 250))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 7, 2}, 150))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 7, 1}, 90))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 1, 4}, 90))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 1, 5}, 60))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 3, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 3, 1, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 1, 3, 2}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
