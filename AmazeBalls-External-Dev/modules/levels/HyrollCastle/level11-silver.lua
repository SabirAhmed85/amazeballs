local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 2, 1}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 7, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{3},{1},{1,1,3,1},{2},{1,1,5,1},{3},{1,1,7,1},{4},{1,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 3, 3}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,3},{2},{1,1,4,3},{3},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 3, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 4, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_1", {1, 1, 5, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 5, 5, "triangleBottomLeftShape"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 5, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"switchSlide"},{},{2},{1},{1,2,3,1},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 7, 2}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 4, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_1_2", {1, 2, 4, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{},{1},{1},{1,2,4,5},{2},{1,2,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 7, 6}, "bar", {"vert", 2}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 4, 1, { {"slide", "bar1_1_2"} }, "one-way", "not-labelled" })

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 5, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 4, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 1, 1}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 5}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 4, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 1, 5, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
