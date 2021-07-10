local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 1})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 7, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 5, 3}, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "triangle", properties = {shape = "triangleBottomRightShape"} },
        {name = "autoFan", properties = { directions = {"right"} } },
        {name = "autoFan", properties = { directions = {"down"} } },
        {name = "manualFan", properties = { directions = {"right"} } },
        {name = "manualFan", properties = { directions = {"down"} } },
        {name = "spitter", properties = { directions = {"up","right"} } },
    })
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 5}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 6, 5, "up","none","none","left"})
    addToTransitionArray(ta,{{"spitter1_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down")
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 1, 2}, "down")
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 2, 2, 2, 3, 7, 5, "none"})
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 7, 2, 3})
    --addToTransitionArray(ta,{{"timeOut1_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"})
    addToTransitionArray(ta,{{"triangle1_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,1,3},{2},{2,1,3,3}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 4}, "up")
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 6, 4}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter1_2_1"},{"switchSlide"},{labelled = false},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 7, 4}, "down")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,7,2},{2},{2,1,7,4}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "tunnel","tunnel2_2_1", {2, 1, 4, 5, 4, 3, 2, 1}, "right")
    addToTransitionArray(ta,{{"tunnel2_2_1"},{"switchSlide"},{labelled = false},{2},{1},{2,1,4,4},{2},{2,1,4,5}})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 5, 5}, {"none","none","down","left"})
    addToTransitionArray(ta,{{"spitter2_2_1"},{"switchSlide"},{labelled = false},{1},{1},{2,1,5,5},{2},{2,1,7,5}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 5, "down", "enabled"})

    --SCREEN 3-1
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 2, 1}, "left")
    addToShapeArray(sp, "spitter","spitter1_3_1", {3, 1, 6, 1}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter1_3_1"},{"switchSlide"},{},{1},{1},{3,1,6,1},{2},{3,1,7,1}})
    addToShapeArray(sp, "gun","gun1_3_1", {3, 1, 3, 2}, "left")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 3, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 3, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    --addToShapeArray(sp, "timeOut","timeOut1_3_1", {3, 1, 2, 5, "1"})
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 5, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1, "up", "disabled"})
    addToShapeArray(sp, "gun","gun1_2_2", {2, 2, 1, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 2}, "right")
    addToTransitionArray(ta,{{"autoFan1_2_2"},{"switchSlide"},{labelled = false},{2},{1},{2,2,5,2},{2},{2,2,7,2}})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 3, 3}, "left")
    addToTransitionArray(ta,{{"autoFan2_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,3},{2},{2,2,4,3}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 1, 4}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle2_2_2"},{"switchSlide"},{},{1},{1},{2,2,1,4},{2},{2,2,2,4}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 6, 4}, "left")
    addToTransitionArray(ta,{{"autoFan3_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,4},{2},{2,2,6,4}})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 6, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 7, 5}, "up")

    --SCREEN 3-2
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 2, 1, "up", "disabled"})
    addToShapeArray(sp, "shape","bar1_3_2", {3, 2, 4, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar2_3_2", {3, 2, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door2_3_2", {3, 2, 7, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_3_2", {3, 2, 2, 2, "up","right","down","none"})
    addToTransitionArray(ta,{{"spitter1_3_2"},{"slide"},{},{1},{1},{3,2,2,2},{2},{3,2,3,2}})
    addToShapeArray(sp, "spitter","spitter2_3_2", {3, 2, 7, 2, "up","none","down","left"})
    addToTransitionArray(ta,{{"spitter2_3_2"},{"slide"},{},{2},{1},{3,2,6,2},{2},{3,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 1, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 3, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_3_2", {3, 2, 2, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_3_2", {3, 2, 4, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_3_2", {3, 2, 5, 4}, "down")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 2, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar3_3_2", {3, 2, 3, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar4_3_2", {3, 2, 4, 5}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar4_3_2"},{"switchSlide"},{},{2},{1},{3,2,4,1},{2},{3,2,4,5}})
    addToShapeArray(sp, "door","door2_3_2", {3, 2, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 5, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle4_3_2", {3, 2, 6, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar5_3_2", {3, 2, 7, 5}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar5_3_2"},{"switchSlide"},{},{2},{1},{3,2,7,1},{2},{3,2,7,5}})
    addToShapeArray(sp, "shape","bar6_3_2", {3, 2, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-3
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 1, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 2, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 4, 1}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "backFire","backFire1_2_3", {2, 3, 6, 1})
    addToTransitionArray(ta,{{"backFire1_2_3"},{"switchSlide"},{},{3},{1},{2,3,5,3},{2},{2,3,5,2},{3},{2,3,6,1}})
    addToShapeArray(sp, "door","door2_2_3", {2, 3, 7, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 1, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 3, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 7, 2}, "up")
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 1, 3}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar1_2_3"},{"switchSlide"},{},{1},{1},{2,3,1,2},{2},{2,3,1,3}})
    addToShapeArray(sp, "manualFan","manualFan2_2_3", {2, 3, 2, 3}, "right")
    addToShapeArray(sp, "item","map", {2, 3, 3, 3})
    addToShapeArray(sp, "shape","bar2_3_2", 2, 3, 5, 3}, "bar", {"horz", 3})
    --addToShapeArray(sp, "timeOut","timeOut1_2_3", {2, 3, 6, 3, 2})
    addToShapeArray(sp, "spitter","spitter1_2_3", {2, 3, 1, 4, "up","none","none","none"})
    addToTransitionArray(ta,{{"spitter1_2_3"},{"slide"},{},{1},{1},{2,3,1,4},{2},{2,3,2,5}})
    addToShapeArray(sp, "manualFan","manualFan3_2_3", {2, 3, 3, 4}, "right")
    addToShapeArray(sp, "shape","bar3_2_3", {2, 3, 6, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 4, 5}, "triangleBottomLeftShape", {1, 2, "fire"})

    --SCREEN 3-3
    addToShapeArray(sp, "shape","bar1_3_3", {3, 3, 7, 1}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar1_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,5,1},{2},{3,3,7,1}})
    addToShapeArray(sp, "manualFan","manualFan1_3_3", {3, 3, 1, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_3_3", {3, 3, 3, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_3_3", {3, 3, 6, 2}, "up")
    addToTransitionArray(ta,{{"manualFan3_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,4,2},{2},{3,3,6,2}})
    addToShapeArray(sp, "shape","triangle1_3_3", {3, 3, 7, 2}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "door","door1_3_3", {3, 3, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_3_3", {3, 3, 5, 3}, "triangleTopLeftShape", {1, 5})
    addToTransitionArray(ta,{{"triangle2_3_3"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","bar2_3_3", {3, 3, 7, 3}, "bar", {"horz"})
    addToShapeArray(sp, "shape","bar3_3_3", {3, 3, 7, 3}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar3_3_3"},{"switchSlide"},{labelled=false},{2},{1},{3,3,4,3},{2},{3,3,7,3}})
    addToShapeArray(sp, "shape","triangle3_3_3", {3, 3, 2, 4}, "triangleBottomRightShape", {1, 3})
    addToTransitionArray(ta,{{"triangle3_3_3"},{"flip-vertical"}})
    addToShapeArray(sp, "manualFan","manualFan4_3_3", {3, 3, 3, 4}, "right")
    addToTransitionArray(ta,{{"manualFan4_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,3,4},{2},{3,3,4,4}})
    addToShapeArray(sp, "manualFan","manualFan5_3_3", {3, 3, 6, 4}, "right")
    addToTransitionArray(ta,{{"manualFan5_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,6,4},{2},{3,3,7,4}})
    addToShapeArray(sp, "shape","triangle4_3_3", {3, 3, 1, 5}, "triangleBottomRightShape", {1, 9, "fire"})
    addToShapeArray(sp, "shape","bar4_3_3", {3, 3, 3, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan1_3_3", {3, 3, 4, 5}, "down")
    addToTransitionArray(ta,{{"autoFan1_3_3"},{"switchSlide"},{labelled=false},{1},{1},{3,3,4,5},{2},{3,3,5,5}})
    addToShapeArray(sp, "autoFan","autoFan2_3_3", {3, 3, 6, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan6_3_3", {3, 3, 7, 5}, "up")

    --SCREEN 4-3
    addToShapeArray(sp, "simple","simple6_4_3", {4, 3, 4, 1})
    addToShapeArray(sp, "shape","triangle1_4_3", {4, 3, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_4_3", {4, 3, 2, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle3_4_3", {4, 3, 5, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle4_4_3", {4, 3, 3, 3}, "triangleBottomRightShape", {1, 9, "icy"})
    addToShapeArray(sp, "tunnel","tunnel1_4_3", {4, 3, 4, 3, 2, 1, 2, 5}, "left")
    addToShapeArray(sp, "shape","triangle5_4_3", {4, 3, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_4_3", {4, 3, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_4_3", {4, 3, 2, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle8_4_3", {4, 3, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 3, 3}, { {"flip-vertical","triangle1_1_1"} })

    addToShapeArray(sp, "switch","switch1_3_1", {3, 1, 2, 3}, { {"slide","spitter1_3_1"} })

    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 2, 5}, { {"slide","autoFan1_2_2"},{"door-open","door1_2_2"},
    {"slide","triangle1_2_1"},{"slide","spitter1_2_1"},{"slide","autoFan2_2_1"},{"slide","tunnel2_2_1"},{"slide","spitter2_2_1"} }, {"one-way"})
        --remember to include timeOut in switch above

    addToShapeArray(sp, "switch","switch1_3_2", {3, 2, 6, 3}, { {"slide","autoFan3_2_2"} })
    addToShapeArray(sp, "switch","switch2_3_2", {3, 2, 3, 5}, { {"slide","autoFan2_2_2"} })

    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 4, 3}, { {"slide","bar1_2_3"},{"slide","bar1_3_3"},{"slide","manualFan3_3_3"},
    {"slide","bar3_3_3"},{"slide","manualFan4_3_3"},{"slide","manualFan5_3_3"},{"slide","autoFan1_3_3"},{"slide","bar4_3_2"},{"slide","bar5_3_2"} })


    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 3, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {4, 3, 1, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 4, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 4}, 310)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 5}, 185)
    addToShapeArray(sp, "item","coins", {3, 2, 7, 4}, 60)
    addToShapeArray(sp, "item","coins", {3, 2, 4, 2}, 170)
    addToShapeArray(sp, "item","coins", {2, 3, 5, 4}, 165)
    addToShapeArray(sp, "item","coins", {3, 3, 3, 5}, 100)
    addToShapeArray(sp, "item","coins", {3, 3, 2, 1}, 100)
    addToShapeArray(sp, "item","coins", {4, 3, 4, 5}, 500)
    addToShapeArray(sp, "item","coins", {4, 3, 6, 3}, 600)
    addToShapeArray(sp, "item","clock", {4, 3, 3, 2, 15})
    addToShapeArray(sp, "item","hook", {4, 3, 5, 3}, {})

    addToShapeArray(sp, "item","small-present", {2, 3, 7, 4}, {})

    addToShapeArray(sp, "item","small-present", {4, 3, 2, 4}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 6, 3}, {})

    addToShapeArray(sp, "item","big-present", {4, 3, 4, 4}, {})


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
