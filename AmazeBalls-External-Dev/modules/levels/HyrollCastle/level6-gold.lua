local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 1, 3}, "up")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 4, 4}, "right")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 1, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 4, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 6, 5}, "triangleTopAndBottomShape", {1})
    addToTransitionArray(ta, "triangle9_1_1", "slide", {}, 3, {{1,1,5,4},{1,1,5,5},{1,1,6,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 2, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 1, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    addToTransitionArray(ta, "bar2_2_1", "slide", {}, 2, {{2,1,3,4},{2,1,3,5}})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle8_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 2, 6}, "bar", {"vert", 4})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"vert"})
    addToTransitionArray(ta, "bar1_2_2", "switchSlide", {}, 1, {{2,2,3,1},{2,2,4,1}})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 1}, "right")
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 3, 2}, "bar", {"vert", 3})
    addToTransitionArray(ta, "bar3_2_2", "switchSlide", {}, 1, {{2,2,3,2},{2,2,4,2}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 3, 2}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToTransitionArray(ta, "triangle1_2_2", "switchSlide", {}, 2, {{2,2,3,1},{2,2,3,2}})
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar5_2_2", {2, 2, 7, 2}, "bar", {"vert"})
    addToTransitionArray(ta, "bar5_2_2", "switchSlide", {}, 2, {{2,2,5,2},{2,2,7,2}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 4, 3})
    addToTransitionArray(ta, "backFire1_1_1", "slide", {}, 1, {{2,2,4,3},{2,2,5,3}})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 2, 4}, "right")
    addToTransitionArray(ta, "manualFan1_2_2", "slide", {}, 3, {{2,2,1,2},{2,2,1,4},{2,2,2,4}})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar6_2_2", {2, 2, 7, 4}, "bar", {"horz", 3})
    addToTransitionArray(ta, "bar6_2_2", "slide", {}, 1, {{2,2,7,4},{2,2,7,5}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 7, 4}, "up")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 2, 5}, "triangleTopRightShape")
    addToTransitionArray(ta, "triangle4_2_2", "slide", {}, 1, {{2,2,2,5},{2,2,3,5},{2,2,4,5}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 7, 5}, "right")

    --SCREEN 3-2
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_3_2", {3, 2, 2, 3}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle5_3_2", {3, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle6_3_2", {3, 2, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 7, 4}, "down")
    addToShapeArray(sp, "simple","simple1_3_2", {3, 2, 1, 5})
    addToShapeArray(sp, "shape","triangle7_3_2", {3, 2, 2, 5}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "endPoint","endPoint1_3_2", {3, 2, 5, 5})
    addToShapeArray(sp, "autoFan","autoFan2_3_2", {3, 2, 7, 5}, "left")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 7, 1}, { {"slide", "triangle1_2_2"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch2_2_2", {2, 2, 4, 2}, { {"slide", "bar1_2_2"},{"slide", "bar2_2_2"},{"slide", "bar3_2_2"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 2, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {3, 2, 2, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 4, 1}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5}, 60)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 3}, 90)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 4}, 51)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 2}, 165)
    addToShapeArray(sp, "item","coins", {2, 2, 1, 5}, 145)
    addToShapeArray(sp, "item","coins", {3, 2, 1, 4}, 285)
    addToShapeArray(sp, "item","big-present", {2, 2, 7, 2}, {})
    addToShapeArray(sp, "item","big-present", {3, 2, 5, 1}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 6, 1}, {})
    addToShapeArray(sp, "item","small-present", {3, 2, 6, 2}, {})
    addToShapeArray(sp, "item","clock", {1, 1, 3, 3}, {})
    addToShapeArray(sp, "item","hook", {3, 2, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
