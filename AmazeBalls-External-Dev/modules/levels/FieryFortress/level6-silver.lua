local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    -- 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"autoSlide"},{timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500},{2},{1},{1,1,2,3},{2},{1,1,2,2},{3},{1,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 2, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 2, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"autoSlide"},{timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500},{2},{1},{1,1,2,5},{2},{1,1,2,4},{3},{1,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 6, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 2, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 3, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,5,5},{2},{1,1,6,5},{3},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 6, 6}, "bar", {"vert", 3}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 1, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,1,1},{2},{1,2,1,3},{3},{1,2,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 7, 1}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 7, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{3},{1},{1,2,5,2},{2},{1,2,6,2},{3},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, 13}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_1_2", {1, 2, 4, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,3,5},{2},{1,2,4,5},{3},{1,2,4,4},{4},{1,2,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 5, 5}, "bar", {"vert"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 1, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 1, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 5, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 7, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 2, 4}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 4}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 7, 1}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t