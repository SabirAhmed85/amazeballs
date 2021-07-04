local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_1", {1, 1, 7, 2, 1, 1, 2, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 1, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 4, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 5, 3, "up","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 7, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 3, 4, "up","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,2,4},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 2, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 2, 1, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,1,1},{2},{1,2,2,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 4, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_2", {1, 2, 3, 2, "up","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,3,2},{3},{1,2,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 6, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 3, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_2", {1, 2, 4, 3, "none","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,3,3},{2},{1,2,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 3}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{2},{1},{1,2,5,1},{2},{1,2,6,3},{3},{1,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_2", {1, 2, 4, 4}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_1_2", {1, 2, 4, 4, "up","none","down","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_2"},{"slide"},{},{2},{1},{1,2,1,4},{2},{1,2,4,4},{3},{1,2,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter5_1_2", {1, 2, 3, 5, "up","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter5_1_2"},{"slide"},{},{1},{1},{1,2,3,5},{2},{1,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 4, 5, "down", "disabled"}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("item","compass", {1, 3, 5, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 6, 1}, "triangleBottomLeftShape", {1, 2, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_3", {1, 3, 4, 2, "none","none","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 2, 3}, "triangleBottomRightShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_3", {1, 3, 7, 3, 1, 2, 1, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 3, 4, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 7, 2}, { {"door-open","door2_1_2"} }, "two-way", "not-labelled"))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_3", {1, 3, 6, 3}, { {"door-open","door1_1_2"} }, "two-way", "not-labelled"))
    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 3, 2, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 4, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 6, 5}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 1, 2}, 50))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 7, 1}, 110))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 3}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 3, 2, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 2, 1}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 6, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
