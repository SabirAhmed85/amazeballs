local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 4, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_1", {1, 1, 6, 1, 1, 1, 2, 4, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 1, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_1_1", {1, 1, 6, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 7, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 4, 5}, "down"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 1, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,2,1},{3},{2,1,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,4,1},{2},{2,1,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 7, 1}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 3, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 3, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,2,2},{2},{2,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 7, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,6,2},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 5, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 6, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_1", {2, 1, 1, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_1"},{"switchSlide"},{},{1},{1},{2,1,1,4},{2},{2,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_2_1", {2, 1, 1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_1"},{"slide"},{},{1},{1},{2,1,1,4},{2},{2,1,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_1", {2, 1, 4, 4}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"slide"},{},{2},{1},{2,1,4,3},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 6, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,5,4},{2},{2,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_2_1", {2, 1, 2, 5}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple3_2_1", {2, 1, 3, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple3_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,5,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 4, 2}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 1, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 2, 3, "up", "right", "down", "none"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 4, 4}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 6, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 2, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 3, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 7, 5}, "triangleBottomLeftShape", {1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_2"},{"flip-vertical"}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 2, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_2", {2, 2, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 6, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_2", {2, 2, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_2", {2, 2, 2, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_2", {2, 2, 3, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_2_2", {2, 2, 6, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan6_2_2"},{"slide"},{},{1},{1},{2,2,6,2},{2},{2,2,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 1, 3}, "left", {"disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan7_2_2", {2, 2, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan8_2_2", {2, 2, 3, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 4}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan9_2_2", {2, 2, 3, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan10_2_2", {2, 2, 5, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan11_2_2", {2, 2, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 1, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan12_2_2", {2, 2, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 5, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan13_2_2", {2, 2, 6, 5}, "left"))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_1", {2, 1, 2, 3}, { {"slide","bar4_2_1"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_2", {2, 2, 1, 1}, { {"door-open","door2_2_2"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 3, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 7, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 1, 2}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 2}, 20))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 4, 1}, 245))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 7, 4}, 29))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 1, 1, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 6, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 1, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","fireCape", {1, 2, 4, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","iceCape", {2, 2, 1, 4}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
