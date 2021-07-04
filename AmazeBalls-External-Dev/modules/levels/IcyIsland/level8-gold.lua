local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 4}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 3, 4}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 2, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 1, 6}, "bar", {"vert", 4}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 2, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 1, 6, 1}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 2, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 1, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 4, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 6, 3}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 7, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 6, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 2, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_1", {2, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_2_1", {2, 1, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan7_2_1", {2, 1, 7, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_2_1", {2, 1, 7, 5}, "down"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 2, 1}, "up"))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 5, 1, 20))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_2", {2, 2, 2, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_2", {2, 2, 4, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 5, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 4, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_2", {2, 2, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 2, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_2", {2, 2, 6, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 7, 5}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,5},{2},{2,2,7,5}})

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_1", {2, 1, 6, 2}, { {"slide","bar1_2_2"} }, {"one-way"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 2, 5, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 2, 7, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 7, 4}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 3, 1, 125}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 1, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","hook", {1, 1, 2, 3}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
