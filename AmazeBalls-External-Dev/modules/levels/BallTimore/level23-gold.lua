local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 3, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,4,1}})
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 3, 4, "up","right","none","none"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, 4, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5, "down", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 6, 5}, "down"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 6, 1}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{2},{2,1,3,1},{2},{2,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"switchSlide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"switchSlide"},{},{2},{1},{2,1,1,3},{2},{2,1,1,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"switchSlide"},{},{1},{1},{2,1,3,4},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_1", {2, 1, 7, 5}, "left"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 3, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, 2, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_2", {1, 2, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 2, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 1, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,3,2},{3},{1,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 6, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_2", {1, 2, 5, 3}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_2", {1, 2, 5, 3, "up","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,3},{2},{1,2,5,3},{3},{1,2,6,3}})
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_1_2", {1, 2, 2, 4, 2, 1, 4, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_2", {1, 2, 6, 4}, {"none","right","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,3,4},{2},{1,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door4_1_2", {1, 2, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter3_1_2", {1, 2, 5, 5, "up","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,4,5},{2},{1,2,5,5},{3},{1,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door5_1_2", {1, 2, 7, 5}, "right"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_2", {2, 2, 4, 1}, {"none","right","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 2, 2}, "triangleTopLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 5, 2}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 7, 2}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_2_2", {2, 2, 3, 3}, "triangleTopLeftShape", {1, _, "fire"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 4, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 1, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 4}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_2", {2, 2, 4, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 2, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 3, 5}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 3, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_2_2", {2, 2, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle10_2_2", {2, 2, 6, 5}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 3, 5}, "down"))

    --SCREEN 2-3
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_3", {2, 3, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_3", {2, 3, 1, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_3", {2, 3, 3, 2}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_3", {2, 3, 7, 3}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_3", {2, 3, 2, 4}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_3", {2, 3, 5, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_3"},{"slide"},{},{2},{1},{2,3,5,3},{2},{2,3,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_3", {2, 3, 2, 5}, "triangleTopRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_3", {2, 3, 6, 5}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_3"},{"slide"},{},{2},{1},{2,3,5,5},{2},{2,3,6,5}})

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 1, 1}, { {"slide","triangle2_2_1"},{"slide","triangle4_2_1"},{"slide","manualFan1_2_1"},{"slide","autoFan1_2_3"},{"slide","triangle6_2_3"} }, {"one-way"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 3, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 3, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 3, 1, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 6, 2}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 5}, 65))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 7, 3}, 85))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 5, 4, 385}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 2, 3}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 2, 4, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 3, 7, 1}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 7, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 3, 4, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
