local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 2, 1})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 2}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,2},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 300, pauseTime = 100},{1},{1},{1,1,3,4},{2},{1,1,4,4}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 1, 5})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 4, 5})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 5})

    -- 1-2
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, 20, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 2, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 3}, "down")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"slide"},{"orange"},{2},{1},{1,2,3,2},{2},{1,2,3,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 4, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 6}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle9_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,5},{2},{1,2,7,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","small-present", {1, 2, 2, 4}, {})

    --addToShapeArray(sp, "item","coins", {1, 2, 7, 1}, 250)
    --addToShapeArray(sp, "item","something", 1, 1, 6, 4})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
