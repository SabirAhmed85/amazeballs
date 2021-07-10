local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"slide"},{},{2},{1},{1,1,5,1},{2},{1,1,6,1}})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 5, 2}, "left")
    addToShapeArray(sp, "gun","gun2_1_1", {1, 1, 5, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 4})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 4}, "bar", {"horz", 3})
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 7, 4, 5})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 5}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,6,4},{2},{1,1,6,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 7, 1}, "right")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 7, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 3, 2}, "left")
    addToTransitionArray(ta,{{"autoFan3_2_1"},{"switchSlide"},{},{1},{1},{2,1,3,2},{2},{2,1,5,2}})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 6, 2}, "down")
    addToTransitionArray(ta,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,6,2}})
    addToShapeArray(sp, "autoFan","autoFan5_2_1", {2, 1, 2, 3}, "down")
    addToTransitionArray(ta,{{"autoFan5_2_1"},{"switchSlide"},{labelled=false},{1},{1},{2,1,2,3},{2},{2,1,2,5}})
    addToShapeArray(sp, "autoFan","autoFan6_2_1", {2, 1, 3, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan7_2_1", {2, 1, 5, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 7, 3}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan8_2_1", {2, 1, 2, 4}, "left")
    addToTransitionArray(ta,{{"autoFan8_2_1"},{"switchSlide"},{},{1},{1},{2,1,2,4},{2},{2,1,3,4}})
    addToShapeArray(sp, "autoFan","autoFan9_2_1", {2, 1, 4, 4}, "down")
    addToTransitionArray(ta,{{"autoFan9_2_1"},{"switchSlide"},{},{2},{1},{2,1,4,3},{2},{2,1,4,4}})
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 7, 4, 5})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 1, 5}, "right")
    addToShapeArray(sp, "autoFan","autoFan10_2_1", {2, 1, 3, 5}, "up")
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan11_2_1", {2, 1, 7, 5}, "up")

    --SCREEN 3-1
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "item","map", {3, 1, 3, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 7, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 4, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door2_3_1", {3, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_3_1", {3, 1, 6, 5})
    addToTransitionArray(ta,{{"simple1_3_1"},{"slide"},{},{2},{1},{3,1,5,5},{2},{3,1,6,5}})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 7, 4}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "door","door3_3_1", {3, 1, 7, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 3, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 6, 1}, "left")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 7, 1}, "up")
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 4, 2})
    addToTransitionArray(ta,{{"backFire1_2_2"},{"slide"},{},{2},{1},{2,2,2,2},{2},{2,2,4,2},{3},{2,2,6,2}})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 3}, "left")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan4_2_2", {2, 2, 3, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 5, 3}, "left")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 6, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan5_2_2", {2, 2, 6, 3}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 1, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan6_2_2", {2, 2, 6, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan7_2_2", {2, 2, 2, 5}, "right")
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 5, 5}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar3_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,5},{2},{2,2,5,5}})
    addToShapeArray(sp, "manualFan","manualFan8_2_2", {2, 2, 5, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 7, 5}, "up")

    --SCREEN 3-2
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 4, 1}, "down")
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 6, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_3_2", {3, 2, 7, 1}, {"none","none","down","left"})
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "gun","gun1_3_2", {3, 2, 5, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door2_3_2", {3, 2, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 1, 2}, { {"slide","autoFan8_2_1"},{"slide","bar3_2_2"} }, {"one-way"})

    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 3, 4}, { {"slide","autoFan5_2_1"} }, {"one-way"})

    addToShapeArray(sp, "switch","switch1_3_2", {3, 2, 3, 3}, { {"slide","autoFan3_2_1"},{"slide","autoFan9_2_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 2, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 5}, 140)
    addToShapeArray(sp, "item","coins", {2, 1, 2, 1}, 85)
    addToShapeArray(sp, "item","coins", {3, 1, 3, 3}, 225)
    addToShapeArray(sp, "item","coins", {3, 1, 2, 5}, 70)
    addToShapeArray(sp, "item","coins", {3, 2, 4, 5}, 190)
    addToShapeArray(sp, "item","coins", {2, 2, 7, 3}, 130)
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 5}, {})

    addToShapeArray(sp, "item","small-present", {3, 1, 6, 2}, {})

    addToShapeArray(sp, "item","big-present", {2, 2, 2, 1}, {})

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
