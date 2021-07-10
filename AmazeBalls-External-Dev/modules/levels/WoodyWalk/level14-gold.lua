local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 5, 1})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,5,1},{2},{1,1,5,4}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,2},{"*"},{1,1,2,1},{2},{1,1,4,1}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 4, 3})
    addToTransitionArray(ta,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,4,2},{2},{1,1,4,3},{3},{1,1,4,4}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 1)
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,7,1}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 1}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 4, 2})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{2},{1,2,3,2},{2},{1,2,4,2},{3},{1,2,4,3},{4},{1,2,4,4}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 7, 2})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 3}, "triangleBottomRightShape", {1, 8, "breakable"})
    --addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 6, 3})
    --addToTransitionArray(ta,{{"simple2_1_2"},{"autoSlide"},{timePerSquare = 300, pauseTime = 40, labelled = false},{1},{1},{1,2,6,3},{2},{1,2,6,5}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 3, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 1, 5}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 4, 5})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 6}, "bar", {"vert"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 3, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 1, 2}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 3, 4, 195})
    addToShapeArray(sp, "item","coins", {1, 2, 5, 3}, 75)
    addToShapeArray(sp, "item", "small-present", {1, 1, 1, 1}, {})

    addToShapeArray(sp, "item", "big-present", {1, 2, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
