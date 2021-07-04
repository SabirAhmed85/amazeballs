local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 2, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 8, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_1_1", {1, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_1_1", {1, 1, 4, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 8, 5}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_1_1", {1, 1, 7, 5}, "up"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 6, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_3", {1, 3, 3, 1, "up","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_3"},{"switchSlide"},{},{1},{1},{1,3,3,1},{2},{1,3,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 4, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 6, 2}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,6,2},{2},{1,3,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 6, 2}, "down"))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 6, 4}, 250))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_3", {1, 3, 4, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_3", {1, 3, 6, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_3"},{"slide"},{},{2},{1},{1,3,4,4},{2},{1,3,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_3", {1, 3, 6, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple1", 1, 3, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 2}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_3", {1, 3, 5, 2}, { {"slide","spitter1_1_3"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 3, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 3, 3, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 7, 2}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 2, 27))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 1}, 85))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 3, 2}, 50))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 2, 2, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 7, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","dummyBall", {1, 2, 1, 5}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 3
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
