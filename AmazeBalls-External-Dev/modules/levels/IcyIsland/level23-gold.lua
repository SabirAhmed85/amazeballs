local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 2, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{2},{1},{2,1,4,1},{2},{2,1,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 5}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 5, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 5, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"switchSlide"},{},{2},{1},{2,1,5,5},{2},{2,1,7,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 7, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,1},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 1, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,3,3},{3},{1,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 3, 5}, "down"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_2", {2, 2, 4, 1, 2, 1, 6, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 7, 1}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,7,1},{2},{2,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_2", {2, 2, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel2_2_2", {2, 2, 1, 3, 1, 2, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel3_2_2", {2, 2, 7, 3, 3, 2, 6, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 1, 4}, "triangleBottomLeftShape", {1, 2, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 5, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 7, 4, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel4_2_2", {2, 2, 4, 5, 2, 4, 2, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 5}, "down"))

    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_2", {3, 2, 4, 2}, "triangleBottomLeftShape", {1, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_2"},{"slide"},{},{2},{1},{3,2,2,1},{"*"},{3,2,2,2},{2},{3,2,4,2},{3},{3,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_2", {3, 2, 2, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_2", {3, 2, 6, 3, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_2", {3, 2, 2, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_3_2", {3, 2, 2, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_2", {3, 2, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_2", {3, 2, 4, 5}, "bar", {"vert", 2}))

    --SCREEN 1-3
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_3", {1, 3, 2, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{},{2},{1},{1,3,1,1},{2},{1,3,2,1}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_3", {1, 3, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_3", {1, 3, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_1_3", {1, 3, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_3", {1, 3, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 3, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_1_3", {1, 3, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_3", {1, 3, 2, 3}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_3", {1, 3, 5, 3}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_3", {1, 3, 6, 3}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_1_3", {1, 3, 6, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_3", {1, 3, 1, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{},{1},{1},{1,3,1,4},{2},{1,3,1,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_3", {1, 3, 4, 5, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{},{2},{1},{1,3,3,4},{2},{1,3,4,5}})

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_3", {2, 3, 4, 1, "none","none","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_3", {2, 3, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_3", {2, 3, 1, 3, "none","right","down","none"}))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_3", {2, 3, 4, 3, 2, 2, 4, 3, "none"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_2_3", {2, 3, 7, 3, "none","none","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_3", {2, 3, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter4_2_3", {2, 3, 4, 5, "up","right","none","none"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_3", {2, 3, 7, 5}, "up"))

    --SCREEN 3-3
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_3", {3, 3, 7, 1, "triangleBottomLeftShape"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_3_3"},{"switchSlide"},{},{1},{1},{3,3,7,1},{2},{3,3,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_3", {3, 3, 3, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_3_3"},{"slide"},{},{2},{1},{3,3,2,2},{2},{3,3,3,2},{3},{3,3,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_3", {3, 3, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_3_3", {3, 3, 1, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_3", {3, 3, 2, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_3_3", {3, 3, 2, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_3_3"},{"slide"},{},{2},{1},{3,3,1,5},{2},{3,3,2,5},{3},{3,3,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_3", {3, 3, 6, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_3"},{"slide"},{},{1},{1},{3,3,6,5},{2},{3,3,7,3}})

    --SCREEN 2-4
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_4", {2, 4, 4, 1}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,1},{2},{2,4,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_4", {2, 4, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_4", {2, 4, 4, 2}, "bar", {"vert", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,2},{2},{2,4,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_4", {2, 4, 5, 2, "triangleTopAndBottomShape", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_4", {2, 4, 7, 2}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_4", {2, 4, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_4", {2, 4, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_4", {2, 4, 5, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_4", {2, 4, 2, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_4", {2, 4, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_4", {2, 4, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_4", {2, 4, 5, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_4", {2, 4, 6, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_4", {2, 4, 8, 4}, "bar", {"horz", 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_4"},{"switchSlide"},{},{1},{1},{2,4,8,2},{2},{2,4,8,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_4", {2, 4, 2, 5}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_4"},{"slide"},{},{1},{1},{2,4,2,5},{2},{2,4,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_4", {2, 4, 4, 6}, "bar", {"vert", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,6},{2},{2,4,5,6}})

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_3_3", {3, 3, 6, 2, { {"slide","triangle2_2_1"},{"slide","bar1_2_4"},{"slide","bar2_2_4"},{"slide","bar3_2_4"},{"slide","bar4_2_4"} } })
    table.insert(shapeArrayParameters, getShapeArray("switch","switch2_3_3", {3, 3, 4, 4, { {"slide","triangle1_3_3"} } })

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 3, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 3, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 4, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {3, 2, 6, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 2, 6, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 1, 2}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 3, 3, 3}, 140)))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 4, 3, 140})
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 7, 4}, 135)))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 2, 3}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 2, 3}, 110))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 3, 6, 3}, 110))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 6, 1}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 4, 3}, 50))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 3, 5, 3}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 3, 1, 1}, 145)))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 3, 1, 1}, 145)))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 4, 4, 2}, 35)))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 4, 3, 3}, 135)))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 1, 1, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 2, 6, 1, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 3, 5, 5, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {3, 3, 2, 4, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 4, 7, 3, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 2, 3, 3, 1, {} })
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 2, 4, 1, 4, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 4
t.screenHorzTotal = 3
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
