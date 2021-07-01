local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"horz"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,7,1},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 6, 2, "up","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3},{3},{1,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 2, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, 3, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, 20, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,1,5},{2},{1,1,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 3, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 3, 6}, "bar", {"vert", 3}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_1", {2, 1, 7, 1, "none","none","down","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_1", {2, 1, 1, 2, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_1"},{"slide"},{},{1},{1},{2,1,1,2},{2},{2,1,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_2_1", {2, 1, 4, 2, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_2_1"},{"slide"},{},{2},{1},{2,1,4,1},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 1, 5}, "bar", {"vert"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{},{1},{1},{2,1,1,5},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 3, 5, "down", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 4, 5}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 6, 5}, "bar", {"vert", 4}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 1, 1, "none","none","down","none"}))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 1, 2, 3, 1, {} })
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_2", {1, 2, 3, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_2", {1, 2, 3, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_2", {1, 2, 4, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 7, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopRightShape"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_1_2", {1, 2, 4, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,6,5}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 1, "left", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 2, 1}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{},{1},{1},{2,2,2,1},{2},{2,2,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 5, 1}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,5,1},{2},{2,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_2", {2, 2, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_2", {2, 2, 3, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 3}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"switchSlide"},{},{1},{2},{2,2,1,3},{2},{2,2,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"switchSlide"},{},{1},{1},{2,2,4,3},{2},{2,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 3, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 4, 4}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"switchSlide"},{},{1},{1},{2,2,4,4},{2},{2,2,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 6, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_2"},{"switchSlide"},{},{1},{1},{2,2,6,4},{2},{2,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("gun","gun2_2_2", {2, 2, 2, 5}, "up"))

    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_3_2", {3, 2, 1, 1, 2, 3, 6, 1, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_2", {3, 2, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 5, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_2", {3, 2, 8, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_2", {3, 2, 3, 2}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_3_2", {3, 2, 6, 2, 3, 2, 5, 5, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 3, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_2", {3, 2, 6, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_2", {3, 2, 7, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_3_2", {3, 2, 1, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_3_2"},{"slide"},{},{1},{1},{3,2,1,4},{2},{3,2,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 1, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel3_3_2", {3, 2, 2, 4, 3, 2, 5, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_2", {3, 2, 5, 4}, "right"))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 1, 5}, 250))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_2", {3, 2, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel4_3_2", {3, 2, 7, 5, 3, 2, 1, 3, "none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel4_3_2"},{"switchSlide"},{},{2},{1},{3,2,7,4},{2},{3,2,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_2", {3, 2, 7, 5, "right", "disabled"}))

    --SCREEN 4-2
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_4_2", {4, 2, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_4_2", {4, 2, 1, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_4_2", {4, 2, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun2_4_2", {4, 2, 5, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_4_2", {4, 2, 7, 2}, "bar", {"vert", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_4_2"},{"switchSlide"},{},{2},{1},{4,2,5,2},{2},{4,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_4_2", {4, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_4_2", {4, 2, 4, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_4_2", {4, 2, 7, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun3_4_2", {4, 2, 2, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun4_4_2", {4, 2, 6, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_4_2", {4, 2, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_4_2", {4, 2, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_4_2", {4, 2, 2, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_4_2", {4, 2, 4, 5}, "triangleTopLeftShape"))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_3", {2, 3, 3, 2}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_3"},{"slide"},{},{1},{1},{2,3,3,2},{2},{2,3,3,3}})
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_3", {2, 3, 4, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 6, 2}, "triangleBottomRightShape", {1, 9}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_3"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 7, 2}, "right"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut2_2_3", {2, 3, 1, 3, 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_3", {2, 3, 4, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_3"},{"slide"},{},{2},{1},{2,3,3,3},{2},{2,3,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_3", {2, 3, 5, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_3", {2, 3, 6, 3}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_3"},{"slide"},{},{1},{1},{2,3,5,3},{2},{2,3,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_3", {2, 3, 2, 4}, "bar", {"vert", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_3"},{"slide"},{},{2},{1},{2,3,2,4},{2},{2,3,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 2, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_3"},{"slide"},{},{2},{1},{2,3,2,4},{2},{2,3,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_3", {2, 3, 3, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_3", {2, 3, 2, 5}, "bar", {"horz", 3}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut3_2_3", {2, 3, 4, 5, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_3", {2, 3, 5, 5}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_2_3", {2, 3, 6, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 6, 5, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_3"},{"flip-horizontal"}})

    --SCREEN 3-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_3", {3, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_3", {3, 3, 1, 1}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {3, 3, 2, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_3_3", {3, 3, 3, 1, 3, 3, 3, 5, "none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel1_3_3"},{"slide"},{},{1},{1},{3,3,3,1},{2},{3,3,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_3", {3, 3, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_3", {3, 3, 4, 1}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_3"},{"slide"},{},{1},{1},{3,3,4,1},{2},{3,3,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_3_3", {3, 3, 5, 1, 3, 3, 3, 4, "none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel2_3_3"},{"slide"},{},{1},{1},{3,3,5,1},{2},{3,3,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_3", {3, 3, 6, 1}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_3", {3, 3, 7, 1}, "triangleTopLeftShape", {1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_3_3", {3, 3, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_3", {3, 3, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_3_3", {3, 3, 1, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_3", {3, 3, 4, 3}, "triangleBottomLeftShape", {1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_3_3"},{"slide"},{},{2},{1},{3,3,3,3},{2},{3,3,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_3", {3, 3, 7, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {3, 3, 7, 3}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel3_3_3", {3, 3, 2, 4, 3, 3, 7, 4, "none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"tunnel3_3_3"},{"slide"},{},{2},{1},{3,3,1,4},{2},{3,3,2,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_3", {3, 3, 6, 4}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_3_3"},{"slide"},{},{1},{1},{3,3,6,4},{2},{3,3,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_3", {3, 3, 1, 5}, "triangleTopRightShape", {1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_3_3", {3, 3, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_3_3", {3, 3, 5, 5, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_3_3"},{"flip-vertical"}})

    --SCREEN 4-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_4_3", {4, 3, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_4_3", {4, 3, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_4_3", {4, 3, 1, 2, "up","none","down","none"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_4_3", {4, 3, 2, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_4_3"},{"slide"},{},{1},{1},{4,3,2,2},{2},{4,3,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_4_3", {4, 3, 5, 2, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_4_3"},{"flip-vertical"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_4_3", {4, 3, 6, 2}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_4_3", {4, 3, 7, 2, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_4_3", {4, 3, 6, 3, "none","none","none","left"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_4_3", {4, 3, 7, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_4_3"},{"slide"},{},{1},{1},{4,3,7,3},{2},{4,3,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_4_3", {4, 3, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_4_3", {4, 3, 5, 5, "triangleBottomLeftShape"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 4, 2, { {"door-open","door1_2_2"},{"slide","autoFan1_2_2"},{"slide","tunnel4_3_2"},{"door-open","door2_3_2"} }, "one-way", "not-labelled" })

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_3_3", {3, 3, 2, 3, { {"slide","triangle1_2_2"},{"slide","triangle3_2_2"} }, "one-way" })
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_3_3", {3, 3, 6, 3, { {"slide","triangle2_2_2"},{"slide","triangle4_2_2"} }, "one-way" })

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_4_3", {4, 3, 3, 3, { {"slide","bar1_4_2"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 4
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
