local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,6,1,},{2},{1,1,6,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 7, 2}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar3_1_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 7, 3}, "left")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right", {"disabled"})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 1, 5}, "down", {"disabled"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 6, 5}, "up")
    addToTransitionArray(ta,{{"autoFan4_1_1"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,1,5,5},{2},{1,1,6,5}})

    -- 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 1}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 4, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "left")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 1, 3}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 3, 2})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 3}, "left")
    addToTransitionArray(ta,{{"autoFan3_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,3},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 1, 4}, "triangleTopRightShape", {1, 13})
    addToTransitionArray(ta,{{"triangle7_2_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,1,1,4},{2},{2,1,1,5}})
    addToShapeArray(sp, "shape","triangle8_2_1", {2, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle9_2_1", {2, 1, 4, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle10_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 6, 4}, "left")
    addToTransitionArray(ta,{{"autoFan4_2_1"},{"slide"},{"orange"},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","triangle11_2_1", {2, 1, 2, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle12_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle12_2_1"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,1,3,5},{2},{2,1,4,5}})
    addToShapeArray(sp, "shape","triangle13_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 6, 5})
    addToShapeArray(sp, "item","map", {2, 1, 7, 5})

    -- 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "down")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 1}, "left")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle4_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{2},{1},{1,2,1,3},{2},{1,2,1,4}})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 3, 4}, "down")
    addToTransitionArray(ta,{{"autoFan4_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{1},{1},{1,2,3,4},{2},{1,2,3,5}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToTransitionArray(ta,{{"triangle5_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{1},{1},{1,2,5,4},{2},{1,2,5,5}})
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 7, 4}, "left")
    addToTransitionArray(ta,{{"autoFan5_1_2"},{"switchSlide"},{timePerSquare = 100, labelled = false},{2},{1},{1,2,7,3},{2},{1,2,7,4}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 2, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 4, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 5}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar2_1_2"},{"slide"},{"brown"},{3},{1},{1,2,7,1},{2},{1,2,7,3},{3},{1,2,7,5}})
    addToShapeArray(sp, "door","door4_1_2", {1, 2, 7, 5}, "right")

    -- 2-2
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 1}, "right")
    addToTransitionArray(ta,{{"autoFan1_2_2"},{"switchSlide"},{timePerSquare = 100},{1},{1},{2,2,2,1},{2},{2,2,2,2}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 8, 1}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 1}, "triangleBottomLeftShape", {1})
    addToTransitionArray(ta,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,1,1},{2},{2,2,1,2}})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar2_2_2"},{"slide"},{"brown"},{1},{1},{2,2,6,2},{2},{2,2,6,4}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 7, 2}, "up")
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 2, 3}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar3_2_2"},{"slide"},{"brown"},{1},{1},{2,2,2,3},{2},{2,2,4,3}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 4, 3}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    --addToShapeArray(sp, "timeOut","timeOut1_2_2", {2, 2, 7, 3, 4})
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 8, 3}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar4_2_2"},{"slide"},{"brown"},{2},{1},{2,2,8,2},{2},{2,2,8,3}})
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 1, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan5_2_2", {2, 2, 5, 4}, "right")
    --addToShapeArray(sp, "timeOut","timeOut2_2_2", {2, 2, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar5_2_2", {2, 2, 7, 5}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar5_2_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{2,2,7,2},{2},{2,2,7,5}})


    -- ALL SWITCHES

    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 2}, { {"slide", "triangle4_1_2"},{"slide", "autoFan4_1_2"},{"slide", "triangle5_1_2"},{"slide", "autoFan5_1_2"} }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 6, 4}, { {"slide", "triangle7_2_1"},{"slide", "triangle12_2_1"} })

    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 2, 1}, { {"door-open", "door1_2_1"}, {"door-open", "door1_1_1"} })

    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 4, 1}, { {"slide", "autoFan4_1_1"}, {"door-open", "door3_1_1"}, {"slide", "bar3_1_1"} }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch2_1_2", {1, 2, 4, 3}, { {"flip-vertical", "triangle1_1_2"}, {"slide", "autoFan1_2_2"}, {"slide", "bar5_2_2"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {1, 2, 5, 3}, 250)
    --addToShapeArray(sp, "item","coins", {2, 1, 2, 3, 40)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
