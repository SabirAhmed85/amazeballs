local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopAndBottomShape", {2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 2, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,1,2},{2},{1,1,2,2},{3},{1,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 2, 4}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 1, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_1", {1, 1, 1, 5, 1, 2, 7, 5, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 5}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,5,5},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 1, 6}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{},{1},{1},{1,1,1,6},{2},{1,1,2,6}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 2, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 4, 1}, {"none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{3},{1},{1,2,2,1},{2},{1,2,3,1},{3},{1,2,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_2", {1, 2, 3, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 5, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_1_2", {1, 2, 6, 3, 1, 2, 3, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 7, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 1, 5}, "bar", {"vert"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{},{1},{1},{1,2,1,5},{2},{1,2,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_2", {1, 2, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel3_1_2", {1, 2, 5, 5, 1, 2, 4, 3, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 2, 6}, "bar", {"vert", 2}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 2, 3}, { {"slide","bar2_1_1"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 3, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 4, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 7, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 4}, 185))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 2}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 3, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 7, 2}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
