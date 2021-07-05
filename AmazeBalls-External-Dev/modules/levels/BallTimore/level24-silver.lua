local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 2, 1}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 7, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 5, 3}, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "triangle", properties = {shape = "triangleBottomRightShape"} },
        {name = "autoFan", properties = { directions = {"right"} } },
        {name = "autoFan", properties = { directions = {"down"} } },
        {name = "manualFan", properties = { directions = {"right"} } },
        {name = "manualFan", properties = { directions = {"down"} } },
        {name = "spitter", properties = { directions = {"up","right"} } },
    }))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 2, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 6, 5, "up","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_1", {2, 1, 1, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_1", {2, 1, 2, 2, 2, 3, 7, 5, "none"}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_1", {2, 1, 7, 2, 3}))
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"timeOut1_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,1,3},{2},{2,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 2, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_1", {2, 1, 6, 4}, {"none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"switchSlide"},{labelled = false},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 7, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,7,2},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_2_1", {2, 1, 4, 5, 4, 3, 2, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel2_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,4,4},{2},{2,1,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_1", {2, 1, 5, 5}, {"none","none","down","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"switchSlide"},{labelled = false},{1},{1},{2,1,5,5},{2},{2,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 7, 5, "down", "enabled"}))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_1", {3, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_1", {3, 1, 2, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_3_1", {3, 1, 6, 1}, {"none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_3_1"},{"switchSlide"},{},{1},{1},{3,1,6,1},{2},{3,1,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_3_1", {3, 1, 3, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 3, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_1", {3, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_1", {3, 1, 3, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_1", {3, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_3_1", {3, 1, 2, 5, "1"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_3_1", {3, 1, 5, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_2", {2, 2, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 4, 2}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 7, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{labelled = false},{2},{1},{2,2,5,2},{2},{2,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 3, 3}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,3},{2},{2,2,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 1, 4}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"switchSlide"},{},{1},{1},{2,2,1,4},{2},{2,2,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 6, 4}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,4},{2},{2,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 8, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, 13, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 6, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 7, 5}, "up"))

    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_2", {3, 2, 2, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_2", {3, 2, 4, 1}, "bar", {"vert"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_2", {3, 2, 6, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_2", {3, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_3_2", {3, 2, 2, 2, "up","right","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_3_2"},{"slide"},{},{1},{1},{3,2,2,2},{2},{3,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_3_2", {3, 2, 7, 2, "up","none","down","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_3_2"},{"slide"},{},{2},{1},{3,2,6,2},{2},{3,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_2", {3, 2, 1, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 3, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_3_2", {3, 2, 2, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_3_2", {3, 2, 4, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_3_2", {3, 2, 5, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 1, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_2", {3, 2, 2, 5}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_3_2", {3, 2, 3, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_3_2", {3, 2, 4, 5}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_3_2"},{"switchSlide"},{},{2},{1},{3,2,4,1},{2},{3,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_2", {3, 2, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_2", {3, 2, 5, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_2", {3, 2, 6, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_3_2", {3, 2, 7, 5}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_3_2"},{"switchSlide"},{},{2},{1},{3,2,7,1},{2},{3,2,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_3_2", {3, 2, 3, 6}, "bar", {"vert", 3}))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 1, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 2, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 4, 1}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_3", {2, 3, 6, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_3"},{"switchSlide"},{},{3},{1},{2,3,5,3},{2},{2,3,5,2},{3},{2,3,6,1}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_3", {2, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_3", {2, 3, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 7, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_3", {2, 3, 1, 3}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_3"},{"switchSlide"},{},{1},{1},{2,3,1,2},{2},{2,3,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_3", {2, 3, 2, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 3, 3, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_2", 2, 3, 5, 3}, "bar", {"horz", 3}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_3", {2, 3, 6, 3, 2}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_3", {2, 3, 1, 4, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_3"},{"slide"},{},{1},{1},{2,3,1,4},{2},{2,3,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_3", {2, 3, 3, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_3", {2, 3, 6, 4}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 4, 5}, "triangleBottomLeftShape", {1, 2, "fire"}))

    --SCREEN 3-3
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_3", {3, 3, 7, 1}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,5,1},{2},{3,3,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_3", {3, 3, 1, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_3_3", {3, 3, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_3_3", {3, 3, 6, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,4,2},{2},{3,3,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_3", {3, 3, 7, 2}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_3", {3, 3, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_3", {3, 3, 5, 3}, "triangleTopLeftShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_3", {3, 3, 7, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_3_3", {3, 3, 7, 3}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,4,3},{2},{3,3,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_3", {3, 3, 2, 4}, "triangleBottomRightShape", {1, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_3_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_3_3", {3, 3, 3, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,3,4},{2},{3,3,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_3_3", {3, 3, 6, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,6,4},{2},{3,3,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_3", {3, 3, 1, 5}, "triangleBottomRightShape", {1, 9, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_3_3", {3, 3, 3, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_3", {3, 3, 4, 5}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,4,5},{2},{3,3,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_3_3", {3, 3, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_3_3", {3, 3, 7, 5}, "up"))

    --SCREEN 4-3
    table.insert(shapeArrayParameters, getShapeArray("simple","simple6_4_3", {4, 3, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_4_3", {4, 3, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_4_3", {4, 3, 2, 2}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_4_3", {4, 3, 5, 2}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_4_3", {4, 3, 3, 3}, "triangleBottomRightShape", {1, 9, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_4_3", {4, 3, 4, 3, 2, 1, 2, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_4_3", {4, 3, 3, 4}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_4_3", {4, 3, 5, 4}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_4_3", {4, 3, 2, 5}, "triangleTopRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_4_3", {4, 3, 6, 5}, "triangleTopLeftShape", {1, _, "icy"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 3, 3}, { {"flip-vertical","triangle1_1_1"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_3_1", {3, 1, 2, 3}, { {"slide","spitter1_3_1"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_2", {2, 2, 2, 5}, { {"slide","autoFan1_2_2"},{"door-open","door1_2_2"},
    {"slide","triangle1_2_1"},{"slide","spitter1_2_1"},{"slide","autoFan2_2_1"},{"slide","tunnel2_2_1"},{"slide","spitter2_2_1"} }, {"one-way"}))
        --remember to include timeOut in switch above

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_3_2", {3, 2, 6, 3}, { {"slide","autoFan3_2_2"} }))
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_3_2", {3, 2, 3, 5}, { {"slide","autoFan2_2_2"} }))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_3", {2, 3, 4, 3}, { {"slide","bar1_2_3"},{"slide","bar1_3_3"},{"slide","manualFan3_3_3"},
    {"slide","bar3_3_3"},{"slide","manualFan4_3_3"},{"slide","manualFan5_3_3"},{"slide","autoFan1_3_3"},{"slide","bar4_3_2"},{"slide","bar5_3_2"} }))


    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {4, 3, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 3, 5, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {4, 3, 1, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {3, 1, 4, 1}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 4}, 310))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 3, 5}, 185))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 7, 4}, 60))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 4, 2}, 170))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 5, 4}, 165))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 3, 3, 5}, 100))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 3, 2, 1}, 100))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {4, 3, 4, 5}, 500))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {4, 3, 6, 3}, 600))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {4, 3, 3, 2, 15}))
    table.insert(shapeArrayParameters, getShapeArray("item","hook", {4, 3, 5, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 3, 7, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {4, 3, 2, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 6, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {4, 3, 4, 4}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
