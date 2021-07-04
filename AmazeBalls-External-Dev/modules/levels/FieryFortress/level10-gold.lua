local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{2},{1},{1,1,3,2},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 10}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 5, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 3, 5}, "down"))

    -- 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 3, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,1,1},{2},{1,2,3,1},{3},{1,2,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_2", {1, 2, 7, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,8,1},{2},{1,2,8,2}})
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 2, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 3, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{3},{1},{1,2,3,3},{2},{1,2,3,4},{3},{1,2,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 4, 5}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,4,4},{2},{1,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_2"},{"autoSlide"},{timePerSquare = 550, pauseTime = 0},{1},{1},{1,2,5,4},{2},{1,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 6, 5}, "bar", {"horz", 3}))

    -- ALL SWITCHES

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 4, 1}, { {"slide","triangle3_1_1"} } }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_1_1", {1, 1, 4, 3}, { {"slide","bar2_1_2"} }, "one-way" }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch3_1_1", {1, 1, 3, 5}, { {"slide","bar1_1_2"} }, "one-way" }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple")) 
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))  
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))  
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))   
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 4, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 5, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 1}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 5, 2}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 6, 5}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 7, 1}, {}))
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
