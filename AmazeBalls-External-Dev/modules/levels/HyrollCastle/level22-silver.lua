local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 1}, "left")
    addToTransitionArray(ta,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,6,1},{2},{1,1,7,1}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 2})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"autoSlide"},{labelled = false},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 5, 2})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,5,1},{2},{1,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 1, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 2, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 5}, "bar", {"vert", 2})
    addToTransitionArray(ta,{{"bar2_1_1"},{"autoSlide"},{labelled = false},{1},{1},{1,1,1,5},{2},{1,1,2,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down"))    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, _, "icy"})
    addToTransitionArray(ta,{{"triangle6_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "down")
    --SCREEN 2-1
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 1}, "left")
    addToTransitionArray(ta,{{"manualFan1_2_1"},{"slide"},{},{1},{1},{2,1,2,1},{2},{2,1,2,2}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 5, 2}, "right")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 3, 3}, "right")
    addToTransitionArray(ta,{{"manualFan2_2_1"},{"slide"},{},{1},{1},{2,1,3,3},{2},{2,1,3,4}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 7, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 5})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 2, 5})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{},{1},{1},{2,1,2,5},{2},{2,1,3,5}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 7, 5}, "bar", {"vert", 2})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToTransitionArray(ta,{{"triangle3_1_2"},{"switchSlide"},{},{2},{1},{1,2,1,2},{2},{1,2,4,2}})
    addToShapeArray(sp, "item","map", {1, 2, 6, 2})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 2, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 3, 1}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 5, 1}, "bar", {"vert"})
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 5, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "down")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 1, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 4, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 7, 2}, "left")
    addToShapeArray(sp, "manualFan","manualFan6_2_2", {2, 2, 3, 3}, "right")
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 5, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "manualFan","manualFan7_2_2", {2, 2, 5, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan8_2_2", {2, 2, 2, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan9_2_2", {2, 2, 4, 4}, "left")
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 7, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 1, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan10_2_2", {2, 2, 3, 5}, "up")
    addToShapeArray(sp, "shape","bar5_2_2", {2, 2, 4, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar6_2_2", {2, 2, 3, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar7_2_2", {2, 2, 4, 6}, "bar", {"vert", 4})

    --ALL SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 4}, { {"slide", "triangle3_1_2"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 1, 5}, { {"slide", "triangle4_1_1"},{"slide", "triangle6_1_1"},{"door-open", "door1_2_1"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 4, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 3}, 180)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 5, 125})
    addToShapeArray(sp, "item","coins", {1, 2, 5, 5}, 50)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 5}, 50)
    addToShapeArray(sp, "item","coins", {2, 2, 1, 4}, 165)
    addToShapeArray(sp, "item","coins", {2, 2, 4, 5}, 65)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 4}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 2, 4}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
