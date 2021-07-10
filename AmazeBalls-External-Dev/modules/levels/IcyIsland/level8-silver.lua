local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 5, 2}, "left")
    addToTransitionArray(ta,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 6, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 7, 4}, "up")
    addToTransitionArray(ta,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,4}})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 3, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 4, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 6, 5}, "left")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 3}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 1, 1}, "down")
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 3, 3}, {"none","right","none","none"})
    addToTransitionArray(ta,{{"spitter1_2_2"},{"autoSlide"},{timePerSquare = 600, labelled = false},{2},{1},{2,2,1,3},{2},{2,2,3,3}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 5, 3}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_2_2"},{"flip-vertical"}})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 7, 3})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 1, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 5, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 2, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 2, 6, 3}, 12)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 150)
    addToShapeArray(sp, "item","small-present", {2, 2, 7, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
