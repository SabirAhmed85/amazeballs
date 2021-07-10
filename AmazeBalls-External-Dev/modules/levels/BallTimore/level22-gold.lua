local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 5}, "bar", {"vert"})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "right")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 4, 1}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 2, 2}, "down")
    addToTransitionArray(ta,{{"manualFan3_2_1"},{"switchSlide"},{},{2},{1},{2,1,2,1},{2},{2,1,2,2}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 2}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 6, 2}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar3_2_1"},{"switchSlide"},{},{1},{1},{2,1,6,2},{2},{2,1,6,3}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 2, 3})
    addToTransitionArray(ta,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,1,3},{2},{2,1,2,3},{3},{2,1,4,3}})
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 6, 3}, "down")
    addToTransitionArray(ta,{{"manualFan4_2_1"},{"switchSlide"},{},{2},{1},{2,1,6,2},{2},{2,1,6,3}})
    addToShapeArray(sp, "backFire","backFire2_2_1", {2, 1, 5, 4})
    addToTransitionArray(ta,{{"backFire2_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,5,4}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, 27, "breakable"})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 6, 5}, "down")
    addToShapeArray(sp, "shape","bar5_2_1", {2, 1, 7, 5, "bar"})
    addToTransitionArray(ta,{{"bar5_2_1"},{"switchSlide"},{},{2},{1},{2,1,4,5},{2},{2,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 2, 1}, {"none","none","none","left"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 1}, "bar", {"horz", 4})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1, "up", "disabled"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 1, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 3, 2}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar3_1_2"},{"switchSlide"},{},{2},{1},{1,2,3,1},{2},{1,2,3,2}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 2}, "up")
    addToTransitionArray(ta,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,3},{"*"},{1,2,6,2},{2},{1,2,7,2}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 2, 3})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 3, 3}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar5_1_2"},{"switchSlide"},{},{1},{1},{1,2,3,3},{2},{1,2,3,5}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, 4})
    addToTransitionArray(ta,{{"triangle4_1_2"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar6_1_2", {1, 2, 5, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 5, 3}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 4, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar7_1_2", {1, 2, 5, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, 25, "breakable"})
    addToShapeArray(sp, "shape","triangle10_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar8_1_2", {1, 2, 5, 5}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle11_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 7, 5}, {"none","none","none","left"})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 6, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "item","map", {2, 2, 7, 3})
    addToShapeArray(sp, "shape","triangle9_2_2", {2, 2, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 5, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 7, 4}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar3_2_2"},{"slide"},{},{2},{1},{2,2,7,3},{2},{2,2,7,4}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 1, 5}, "left")
    addToShapeArray(sp, "door","door3_2_2", {2, 2, 2, 5, "down", "disabled"})
    addToShapeArray(sp, "shape","triangle10_2_2", {2, 2, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle11_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 5, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle12_2_2", {2, 2, 7, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 1}, "triangleTopLeftShape")
    addToShapeArray(sp, "gun","gun1_1_3", {1, 3, 4, 1}, "down")
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 7, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "gun","gun2_1_3", {1, 3, 6, 2}, "down")
    addToShapeArray(sp, "spitter","spitter1_1_3", {1, 3, 3, 3, "up","none","down","none"})
    addToTransitionArray(ta,{{"spitter1_1_3"},{"switchSlide"},{},{2},{1},{1,3,2,3},{2},{1,3,3,3}})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 1, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 3, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 5, 5}, "triangleTopRightShape")
    --addToShapeArray(sp, "timeOut","timeOut1_1_3", {1, 3, 7, 5, 2})

    --SCREEN 2-3
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 7, 1}, "triangleTopLeftShape", {1, 11})
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 1, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right")
    addToShapeArray(sp, "simple","simple1_2_3", {2, 3, 4, 2})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple2_2_3", {2, 3, 4, 4})
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 5, 2}, { {"slide","manualFan3_2_1"} })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 6, 5}, { {"flip-vertical","triangle3_1_1"} })

    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 3, 2}, { {"slide","manualFan4_2_1"} })
    addToShapeArray(sp, "switch","switch2_2_1", {2, 1, 1, 5}, { {"slide","bar3_2_1"} }, {"one-way"})

    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 1, 5}, { {"slide","bar3_1_2"},{"slide","bar5_1_2"} })

    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 6, 2}, { {"door-open","door3_2_2"},{"door-open","door1_1_2"} })

    addToShapeArray(sp, "switch","switch1_1_3", {1, 3, 2, 5}, { {"slide","spitter1_1_3"} })

    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 6, 2}, { {"flip-vertical","triangle1_2_3"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 3, 2, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 3, 5, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 5, 1}, 85)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 5}, 130)
    addToShapeArray(sp, "item","coins", {2, 2, 1, 4}, 28)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3}, 14)
    addToShapeArray(sp, "item","coins", {2, 3, 2, 5}, 90)
    addToShapeArray(sp, "item","coins", {2, 3, 5, 4}, 90)
    addToShapeArray(sp, "item","small-present", {2, 2, 4, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 3, 1, 5}, {})


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
