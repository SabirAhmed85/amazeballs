local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 2, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 3, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 4, 5, "up","right","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 7, 1}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 2, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 5, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_1", {2, 1, 1, 3, 2, 1, 7, 5, "none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 4, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 6, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_1", {2, 1, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 8, 4}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 5}, "triangleTopRightShape", {1, 13}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 6, 5}, "down"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_2", {2, 2, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 4, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_2", {2, 2, 2, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_2", {2, 2, 6, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_2", {2, 2, 3, 3, 2, 2, 1, 5, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_2", {2, 2, 5, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 4, 4}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{},{2},{1},{2,2,2,5},{"*"},{2,2,2,4},{2},{2,2,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_2", {2, 2, 6, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 2, 5}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_2_2", {2, 2, 3, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 7, 5}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{2},{1},{2,2,6,5},{2},{2,2,7,5}})

    --GEMS  
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 1, 7, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 2, 1, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 4, 3}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 2, 215}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 5}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 6, 3}, 180))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 4, 5, 105}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 4, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {2, 2, 4, 2}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
