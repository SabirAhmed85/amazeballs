local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 1}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 7, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 7, 2}, "down")
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 5, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 2, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 4}, "up")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 3, 4}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar5_1_1"},{"switchSlide"},{},{2},{1},{1,1,3,3},{2},{1,1,3,4}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,6,5},{2},{1,1,6,4},{3},{1,1,7,4}})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5, "down", "disabled"})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 2, 6}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar6_1_1"},{"switchSlide"},{},{2},{1},{1,1,1,6},{2},{1,1,2,6}})
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 3, 5}, "left")
    addToShapeArray(sp, "item","mystery-block", {1, 1, 4, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "simple"},
        {name = "backFire"},
        {name = "spitter", properties = {directions = {"down", "left"} } }
    })
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 6, 5}, "down")
    addToShapeArray(sp, "shape","bar7_1_1", {1, 1, 7, 6}, "bar", {"vert"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 3, 2}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,2},{2},{1,2,3,2}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 3}, "down")
    addToShapeArray(sp, "spitter","spitter2_1_2", {1, 2, 5, 4}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,2,4},{2},{1,2,5,4},{3},{1,2,7,4}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 2, 5}, "down")
    addToShapeArray(sp, "door","door4_1_2", {1, 2, 3, 5}, "down")
    addToShapeArray(sp, "door","door5_1_2", {1, 2, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door6_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_2"},{"slide"},{},{1},{1},{2,2,1,1},{2},{2,2,1,2},{3},{2,2,2,2},{4},{2,2,2,3}})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 4, 1}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{},{2},{1},{2,2,4,1},{2},{2,2,4,2}})
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 5, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 7, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{},{3},{1},{2,2,5,2},{2},{2,2,7,2},{3},{2,2,7,1}})
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "shape","bar5_2_2", {2, 2, 4, 3}, "bar", {"vert"})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 6, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{},{3},{1},{2,2,3,4},{2},{2,2,5,4},{3},{2,2,6,3}})
    addToShapeArray(sp, "shape","bar6_2_2", {2, 2, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar7_2_2", {2, 2, 2, 5}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar7_2_2"},{"switchSlide"},{},{1},{1},{2,2,2,5},{2},{2,2,7,5}})
    addToShapeArray(sp, "backFire","backFire2_2_2", {2, 2, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_2"},{"slide"},{},{2},{1},{2,2,1,5},{2},{2,2,3,5}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 4, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 5, 5}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,5},{2},{2,2,5,5}})
    addToShapeArray(sp, "shape","bar8_2_2", {2, 2, 3, 6}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar9_2_2", {2, 2, 6, 6}, "bar", {"vert", 3})

    --SCREEN 1-3
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 2, 1}, "up")
    addToShapeArray(sp, "door","door2_1_3", {1, 3, 3, 1}, "up")
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 3, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 6, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 7, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 3, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 4, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 5, 3}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_3"},{"switchSlide"},{},{1},{1},{1,3,5,3},{2},{1,3,6,3}})
    addToShapeArray(sp, "door","door3_1_3", {1, 3, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 3, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 5, 4}, "down")
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 6, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"switchSlide"},{},{2},{1},{1,3,5,4},{2},{1,3,6,4}})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 7, 4}, "up")
    addToShapeArray(sp, "door","door4_1_3", {1, 3, 2, 5}, "down")
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 4, 5})
    addToShapeArray(sp, "door","door5_1_3", {1, 3, 4, 5}, "down")
    addToShapeArray(sp, "door","door6_1_3", {1, 3, 5, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 6, 5}, "right")
    addToShapeArray(sp, "door","door7_1_3", {1, 3, 7, 5}, "right", {"disabled"})
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-3
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 1, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 2, 1}, "up")
    addToShapeArray(sp, "door","door2_2_3", {2, 3, 4, 1}, "up")
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 3, 2}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"slide"},{},{2},{1},{2,3,2,2},{2},{2,3,3,2}})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 7, 2}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "shape","bar3_2_3", {2, 3, 2, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "item","map", {2, 3, 4, 3})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 7, 3}, "right")
    addToShapeArray(sp, "spitter","spitter1_2_3", {2, 3, 2, 4}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_3"},{"slide"},{},{2},{1},{2,3,2,3},{2},{2,3,2,4}})
    addToShapeArray(sp, "spitter","spitter2_2_3", {2, 3, 6, 4, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_3"},{"slide"},{},{2},{1},{2,3,6,3},{2},{2,3,6,4}})
    --addToShapeArray(sp, "item","coins", {2, 3, 7, 4}, 250)
    addToShapeArray(sp, "simple","simple1_2_3", {2, 3, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_3"},{"slide"},{},{2},{1},{2,3,1,5},{2},{2,3,3,5},{3},{2,3,4,5}})
    addToShapeArray(sp, "shape","bar4_2_3", {2, 3, 5, 5}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_3"},{"slide"},{},{1},{1},{2,3,5,5},{2},{2,3,6,5}})
    addToShapeArray(sp, "door","door3_2_3", {2, 3, 6, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 7, 5}, "up")

    --SCREEN 1-4
    addToShapeArray(sp, "spitter","spitter1_1_4", {1, 4, 1, 1}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_4"},{"switchSlide"},{},{1},{1},{1,4,1,1},{2},{1,4,3,1}})
    addToShapeArray(sp, "door","door1_1_4", {1, 4, 2, 1, "up", "enabled"})
    addToShapeArray(sp, "door","door2_1_4", {1, 4, 4, 1, "up", "enabled"})
    addToShapeArray(sp, "spitter","spitter2_1_4", {1, 4, 7, 1, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_4"},{"switchSlide"},{},{2},{1},{1,4,6,1},{2},{1,4,7,1}})
    addToShapeArray(sp, "spitter","spitter3_1_4", {1, 4, 1, 2, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_4"},{"switchSlide"},{},{1},{1},{1,4,1,2},{2},{1,4,3,2}})
    addToShapeArray(sp, "spitter","spitter4_1_4", {1, 4, 7, 2}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_1_4"},{"switchSlide"},{l},{2},{1},{1,4,5,2},{2},{1,4,7,2}})
    addToShapeArray(sp, "spitter","spitter5_1_4", {1, 4, 2, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter5_1_4"},{"slide"},{},{1},{1},{1,4,2,3},{2},{1,4,3,3}})
    addToShapeArray(sp, "spitter","spitter6_1_4", {1, 4, 7, 3}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter6_1_4"},{"switchSlide"},{},{2},{1},{1,4,6,3},{2},{1,4,7,3}})
    addToShapeArray(sp, "spitter","spitter7_1_4", {1, 4, 2, 4}, {"none","none","down","none"})
    addToShapeArray(sp, "spitter","spitter8_1_4", {1, 4, 5, 4, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter8_1_4"},{"slide"},{},{2},{1},{1,4,4,4},{2},{1,4,5,4}})
    addToShapeArray(sp, "spitter","spitter9_1_4", {1, 4, 7, 4}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter9_1_4"},{"switchSlide"},{},{2},{1},{1,4,6,4},{2},{1,4,7,4}})
    addToShapeArray(sp, "spitter","spitter10_1_4", {1, 4, 1, 5}, {"none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter10_1_4"},{"switchSlide"},{},{1},{1},{1,4,1,5},{2},{1,4,2,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_4", {1, 4, 3, 5})
    addToShapeArray(sp, "spitter","spitter11_1_4", {1, 4, 7, 5}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter11_1_4"},{"switchSlide"},{},{2},{1},{1,4,6,5},{2},{1,4,7,5}})
    addToShapeArray(sp, "shape","bar1_1_4", {1, 4, 2, 6}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_4", {1, 4, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-4
    addToShapeArray(sp, "shape","triangle1_2_4", {2, 4, 1, 1}, "triangleBottomLeftShape", {1, 2, "icy"})
    addToShapeArray(sp, "door","door1_2_4", {2, 4, 2, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_4", {2, 4, 3, 1}, "down")
    addToShapeArray(sp, "door","door2_2_4", {2, 4, 4, 1}, "up")
    addToShapeArray(sp, "door","door3_2_4", {2, 4, 6, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_2_4", {2, 4, 4, 2}, "up")
    addToShapeArray(sp, "shape","bar1_2_4", {2, 4, 4, 2}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_4"},{"slide"},{},{2},{1},{2,4,4,1},{2},{2,4,4,2}})
    addToShapeArray(sp, "shape","triangle2_2_4", {2, 4, 7, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan3_2_4", {2, 4, 1, 3}, "up")
    addToShapeArray(sp, "shape","triangle3_2_4", {2, 4, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_2_4", {2, 4, 3, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan4_2_4", {2, 4, 4, 3}, "down")
    addToShapeArray(sp, "shape","triangle5_2_4", {2, 4, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_2_4", {2, 4, 6, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_2_4", {2, 4, 2, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_2_4", {2, 4, 6, 4}, "right")
    addToShapeArray(sp, "door","door4_2_4", {2, 4, 1, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_2_4", {2, 4, 2, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_2_4", {2, 4, 4, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan6_2_4", {2, 4, 5, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_2_4", {2, 4, 7, 5}, "down")

    --SCREEN 2-5
    addToShapeArray(sp, "door","door1_2_5", {2, 5, 6, 1}, "up")
    addToShapeArray(sp, "shape","bar1_2_5", {2, 5, 1, 2}, "bar", {"horz", 4})
    --addToShapeArray(sp, "item","coins", {2, 5, 1, 2}, 500)
    addToShapeArray(sp, "shape","bar2_2_5", {2, 5, 1, 3}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar3_2_5", {2, 5, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_2_5", {2, 5, 3, 3}, "triangleBottomLeftShape", {1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_5"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle2_2_5", {2, 5, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_2_5", {2, 5, 3, 5}, "right")
    addToShapeArray(sp, "shape","triangle3_2_5", {2, 5, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open","door1_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 4, 3}, { {"slide","bar5_1_1"},{"slide","bar6_1_1"} })

    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 4, 3}, { {"slide","bar7_2_2"},{"slide","autoFan1_2_2"} })
    addToShapeArray(sp, "switch","switch2_2_2", {2, 2, 6, 5}, { 
        {"slide","spitter1_1_4"},{"slide","spitter2_1_4"},{"slide","spitter3_1_4"},{"slide","spitter4_1_4"},
        {"slide","spitter6_1_4"},{"slide","spitter9_1_4"},{"slide","spitter10_1_4"},{"slide","spitter11_1_4"},
        {"door-open","door1_1_4"},{"door-open","door2_1_4"},
    }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch1_1_3", {1, 3, 1, 4}, { {"door-open","door7_1_3"},{"slide","triangle3_1_3"},{"slide","bar1_1_3"} })


    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 4, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 4, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 4, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 4, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 5, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 4, 4, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 5, 2, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 3, 2, 2}, 80)
    addToShapeArray(sp, "item","coins", {1, 3, 7, 2}, 105)
    addToShapeArray(sp, "item","coins", {1, 4, 5, 1}, 65)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 3}, 75)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3}, 28)
    addToShapeArray(sp, "item","coins", {1, 1, 2, 3}, 34)
    addToShapeArray(sp, "item","coins", {2, 2, 1, 4}, 135)
    addToShapeArray(sp, "item","coins", {2, 4, 4, 4}, 12)
    addToShapeArray(sp, "item","coins", {2, 4, 3, 5}, 65)
    addToShapeArray(sp, "item","coins", {2, 5, 6, 1}, 625)
    addToShapeArray(sp, "item","coins", {2, 5, 5, 5}, 74)
    addToShapeArray(sp, "item","small-present", {1, 4, 4, 2}, {})

    addToShapeArray(sp, "item","small-present", {1, 3, 2, 5}, {})

    addToShapeArray(sp, "item","small-present", {2, 2, 5, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 5, 6, 3}, {})

    addToShapeArray(sp, "item","small-present", {1, 4, 1, 4}, {})

    addToShapeArray(sp, "item","big-present", {2, 3, 2, 2}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 5}, {})

    addToShapeArray(sp, "item","big-present", {2, 5, 1, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 5
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
