local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 2}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,1,5}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar3_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 3}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 4, 4}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 5})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 5}, "down")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"switchSlide"},{},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 5}, "triangleBottomRightShape", {1, 3, "breakable"})

    --SCREEN 1-2
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 3, 1}, {"none", "none", "down", "none"})
    addToTransitionArray(ta,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,3,1}})
    addToShapeArray(sp, "spitter","spitter2_1_2", {1, 2, 4, 2}, {"none", "none", "down", "none"})
    addToTransitionArray(ta,{{"spitter2_1_2"},{"slide"},{},{1},{1},{1,2,4,2},{2},{1,2,5,2}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar1_1_2"},{"autoSlide"},{},{2},{1},{1,2,2,3},{2},{1,2,3,3}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 4}, "bar", {"vert", 2})
    addToTransitionArray(ta,{{"bar2_1_2"},{"autoSlide"},{},{2},{1},{1,2,4,4},{2},{1,2,5,4}})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 2, 5})
    addToShapeArray(sp, "spitter","spitter3_1_2", {1, 2, 5, 5, "up", "none", "none", "none"})
    addToTransitionArray(ta,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,5,5}})


    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 6, 5}, { {"slide","manualFan1_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 3}, 50)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 500)
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 4}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 2, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
