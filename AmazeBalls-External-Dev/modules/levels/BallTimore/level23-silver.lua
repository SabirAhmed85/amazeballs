local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,5,1},{2},{1,1,6,1}})
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 5, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun2_1_1", {1, 1, 5, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 4}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 5, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 6, 4}, "bar", {"horz", 3}))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_1_1", {1, 1, 7, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 6, 5}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,6,4},{2},{1,1,6,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 5, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 3, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"switchSlide"},{},{1},{1},{2,1,3,2},{2},{2,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 6, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_1", {2, 1, 2, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_1"},{"switchSlide"},{labelled=false},{1},{1},{2,1,2,3},{2},{2,1,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_2_1", {2, 1, 3, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan7_2_1", {2, 1, 5, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 7, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan8_2_1", {2, 1, 2, 4}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan8_2_1"},{"switchSlide"},{},{1},{1},{2,1,2,4},{2},{2,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan9_2_1", {2, 1, 4, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan9_2_1"},{"switchSlide"},{},{2},{1},{2,1,4,3},{2},{2,1,4,4}})
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_1", {2, 1, 7, 4, 5}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_2_1", {2, 1, 1, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan10_2_1", {2, 1, 3, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_2_1", {2, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan11_2_1", {2, 1, 7, 5}, "up"))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 2, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {3, 1, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 7, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 2, 2}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopLeftShape", {1, 5, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 4, 3}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_1", {3, 1, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 1, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_1", {3, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_3_1", {3, 1, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_3_1"},{"slide"},{},{2},{1},{3,1,5,5},{2},{3,1,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 7, 4}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_3_1", {3, 1, 7, 5}, "down"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 3, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_2", {2, 2, 6, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_2", {2, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_2", {2, 2, 4, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{2},{1},{2,2,2,2},{2},{2,2,4,2},{3},{2,2,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_2", {2, 2, 2, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_2", {2, 2, 3, 3}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_2", {2, 2, 5, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 6, 3}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan5_2_2", {2, 2, 6, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_2", {2, 2, 1, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan6_2_2", {2, 2, 6, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan7_2_2", {2, 2, 2, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_2", {2, 2, 5, 5}, "bar", {"vert", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,5},{2},{2,2,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan8_2_2", {2, 2, 5, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_2", {2, 2, 7, 5}, "up"))

    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_2", {3, 2, 4, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_2", {3, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_3_2", {3, 2, 7, 1}, {"none","none","down","left"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("gun","gun1_3_2", {3, 2, 5, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 1, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 5, 4}, "triangleTopLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_3_2", {3, 2, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_1", {2, 1, 1, 2}, { {"slide","autoFan8_2_1"},{"slide","bar3_2_2"} }, {"one-way"}))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_2_2", {2, 2, 3, 4}, { {"slide","autoFan5_2_1"} }, {"one-way"}))

    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_3_2", {3, 2, 3, 3}, { {"slide","autoFan3_2_1"},{"slide","autoFan9_2_1"} }, {"one-way"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 2, 1, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {3, 2, 6, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {3, 1, 7, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 5}, 140))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 2, 1}, 85))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 3, 3}, 225))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 2, 5}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 4, 5}, 190))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 7, 3}, 130))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 1, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {3, 1, 6, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 2, 2, 1}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
