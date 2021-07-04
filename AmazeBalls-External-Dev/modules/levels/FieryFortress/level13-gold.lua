local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 3, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 2, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 1, 4}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 5, 5}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 5, 5, "down", "disabled"}))

    -- 1-2
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 1, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{timePerSquare = 100},{1},{1},{1,2,1,1},{2},{1,2,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_1_2", {1, 2, 5, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{timePerSquare = 100},{1},{1},{1,2,5,1},{2},{1,2,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire3_1_2", {1, 2, 2, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire3_1_2"},{"slide"},{timePerSquare = 100},{1},{1},{1,2,2,2},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 5, 3}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,4,3},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire4_1_2", {1, 2, 6, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire4_1_2"},{"slide"},{timePerSquare = 100},{1},{1},{1,2,6,3},{2},{1,2,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 7, 3}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 2, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 2, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_2", {1, 2, 5, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,3,4},{2},{1,2,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_1_2", {1, 2, 1, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 2, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire5_1_2", {1, 2, 4, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire5_1_2"},{"slide"},{timePerSquare = 100},{2},{1},{1,2,3,5},{2},{1,2,4,5},{3},{1,2,5,4},{4},{1,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar7_1_2", {1, 2, 5, 6}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar7_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,4,6},{2},{1,2,5,6}})

    --ALL SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 5, 3}, { {"door-open","door1_1_1"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 4, 2}, { {"slide","bar2_1_2"},{"slide","bar7_1_2"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_1_2", {1, 2, 3, 3}, { {"slide","bar5_1_2"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 6, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 2, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 1, 4}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 1, 3}, {}))

    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 4}, 250))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 2}, 90))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 4}, 100))
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
