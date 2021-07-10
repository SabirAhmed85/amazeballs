local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 1})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,4,1}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 6, 2})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{},{2},{1},{1,1,5,2},{2},{1,1,6,2},{3},{1,1,7,2}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 3})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,2,4},{2},{1,1,2,5}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,4,4},{2},{1,1,5,4}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 4}, "up")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5, "down", "disabled"})
    addToShapeArray(sp, "item","map", {1, 1, 6, 5})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 5, 5, "up", "none", "none", "none"})

    --SCREEN 1-2
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 3, 1})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 6, 2})
    addToTransitionArray(ta,{{"simple1_1_2"},{"switchSlide"},{},{2},{1},{1,2,5,2},{2},{1,2,6,2}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 5, 3}, "up")
    addToTransitionArray(ta,{{"manualFan1_1_2"},{"switchSlide"},{},{1},{1},{1,2,5,3},{2},{1,2,6,3}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 4}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 4}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 4, 2}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar1_2_2"},{"slide"},{},{1},{1},{2,2,4,2},{2},{2,2,4,3}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,7,2},{2},{2,2,7,3}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 1, 4}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar3_2_2"},{"switchSlide"},{},{2},{1},{2,2,1,2},{2},{2,2,1,4}})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 1, 4}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 2, 4})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 7, 5}, "up")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 5, 1}, { {"slide","simple1_1_2"},{"slide","manualFan1_1_2"},{"door-open","door1_1_1"},{"slide","bar3_2_2"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 4, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 5}, 220)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 2}, 130)
    addToShapeArray(sp, "item","big-present", {1, 2, 3, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 1}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 2, 1, 4}, {})
    addToShapeArray(sp, "item","bomb", {1, 1, 4, 5}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
