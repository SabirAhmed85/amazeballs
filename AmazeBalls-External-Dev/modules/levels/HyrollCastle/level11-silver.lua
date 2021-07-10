local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 1})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 7, 1})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{3},{1},{1,1,3,1},{2},{1,1,5,1},{3},{1,1,7,1},{4},{1,1,7,2}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 3}, "right")
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,3},{2},{1,1,4,3},{3},{1,1,5,3}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 4, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 5, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 5}, "triangleBottomLeftShape")

    --SCREEN 1-2
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 5, 1})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar1_1_2"},{"switchSlide"},{},{2},{1},{1,2,3,1},{2},{1,2,3,2}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 2}, "bar", {"horz"})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 4, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 4, 5})
    addToTransitionArray(ta,{{"backFire2_1_2"},{"slide"},{},{1},{1},{1,2,4,5},{2},{1,2,7,5}})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 7, 6}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 4, 1}, { {"slide", "bar1_1_2"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 5}, 90)
    addToShapeArray(sp, "item","coins", {1, 2, 4, 4}, 150)
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
