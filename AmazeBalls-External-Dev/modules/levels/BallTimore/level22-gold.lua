local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 2, 5}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 5, 5}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_1", {1, 1, 7, 5}, "right"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 4, 1}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 2, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_2_1"},{"switchSlide"},{},{2},{1},{2,1,2,1},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 4, 2}, "triangleBottomRightShape", {1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 6, 2}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"switchSlide"},{},{1},{1},{2,1,6,2},{2},{2,1,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 2, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,1,3},{2},{2,1,2,3},{3},{2,1,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 6, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_2_1"},{"switchSlide"},{},{2},{1},{2,1,6,2},{2},{2,1,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_2_1", {2, 1, 5, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, 27, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 6, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_1", {2, 1, 7, 5, "bar"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_2_1"},{"switchSlide"},{},{2},{1},{2,1,4,5},{2},{2,1,7,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 2, 1}, {"none","none","none","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 6, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 1, 2}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_2", {1, 2, 3, 2}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_2"},{"switchSlide"},{},{2},{1},{1,2,3,1},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 7, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,3},{"*"},{1,2,6,2},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_2", {1, 2, 3, 3}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_1_2"},{"switchSlide"},{},{1},{1},{1,2,3,3},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_1_2", {1, 2, 5, 3}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 5, 3}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_2", {1, 2, 4, 4}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar7_1_2", {1, 2, 5, 4}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, 25, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle10_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar8_1_2", {1, 2, 5, 5}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle11_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 7, 5}, {"none","none","none","left"}))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 3, 1}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 6, 1}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_2", {2, 2, 2, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, 2, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 2, 7, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_2_2", {2, 2, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 5, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_2", {2, 2, 7, 4}, "bar", {"horz"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"slide"},{},{2},{1},{2,2,7,3},{2},{2,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_2_2", {2, 2, 2, 5, "down", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle10_2_2", {2, 2, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle11_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_2", {2, 2, 5, 5}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle12_2_2", {2, 2, 7, 5}, "triangleBottomLeftShape", {1, _, "breakable"}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 2, 1}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_3", {1, 3, 4, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 7, 1}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun2_1_3", {1, 3, 6, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_3", {1, 3, 3, 3, "up","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_3"},{"switchSlide"},{},{2},{1},{1,3,2,3},{2},{1,3,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 1, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_3", {1, 3, 3, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_3", {1, 3, 5, 5}, "triangleTopRightShape"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_1_3", {1, 3, 7, 5, 2}))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 7, 1}, "triangleTopLeftShape", {1, 11}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 1, 2}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_3", {2, 3, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_2_3", {2, 3, 4, 4}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 5, 2}, { {"slide","manualFan3_2_1"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_1_1", {1, 1, 6, 5}, { {"flip-vertical","triangle3_1_1"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_1", {2, 1, 3, 2}, { {"slide","manualFan4_2_1"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_2_1", {2, 1, 1, 5}, { {"slide","bar3_2_1"} }, {"one-way"}))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_2", {1, 2, 1, 5}, { {"slide","bar3_1_2"},{"slide","bar5_1_2"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_2", {2, 2, 6, 2}, { {"door-open","door3_2_2"},{"door-open","door1_1_2"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_3", {1, 3, 2, 5}, { {"slide","spitter1_1_3"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_3", {2, 3, 6, 2}, { {"flip-vertical","triangle1_2_3"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 3, 2, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 7, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 3, 5, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 5, 1}, 85))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 5}, 130))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 1, 4}, 28))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 6, 3}, 14))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 2, 5}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 5, 4}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 2, 4, 1}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 3, 1, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
