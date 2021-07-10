local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"vert", 2})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{"brown"},{2},{1},{1,1,3,2},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 10})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")

    -- 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 3, 1})
    addToTransitionArray(ta,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,1,1},{2},{1,2,3,1},{3},{1,2,5,1}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1, 5})
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,2},{2},{1,2,1,3}})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_2", {1, 2, 7, 2})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar1_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,8,1},{2},{1,2,8,2}})
    addToShapeArray(sp, "item","map", {1, 2, 2, 3})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 3, 5})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{3},{1},{1,2,3,3},{2},{1,2,3,4},{3},{1,2,3,5}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 5}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar2_1_2"},{"switchSlide"},{timePerSquare = 100},{2},{1},{1,2,4,4},{2},{1,2,4,5}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar3_1_2"},{"autoSlide"},{timePerSquare = 550, pauseTime = 0},{1},{1},{1,2,5,4},{2},{1,2,6,4}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 4, 5})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 6, 5}, "bar", {"horz", 3})

    -- ALL SWITCHES

    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 1}, { {"slide","triangle3_1_1"} } })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 4, 3}, { {"slide","bar2_1_2"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch3_1_1", {1, 1, 3, 5}, { {"slide","bar1_1_2"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 4, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 1, 1}, 70)
    addToShapeArray(sp, "item","coins", {1, 1, 5, 2}, 90)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 5}, 250)
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
