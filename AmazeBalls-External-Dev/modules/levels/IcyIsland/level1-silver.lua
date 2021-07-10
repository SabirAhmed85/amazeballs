local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 2, 1}, {"none","right","none","none"})
    addToTransitionArray(ta,{{"spitter1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,2,1},{2},{1,1,2,3}})
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 4, 2}, {"none","none","down","none"})
    addToTransitionArray(ta,{{"spitter2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,4,1},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 6, 1})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle_2_1", {2, 1, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 1, 5}, {"none","right","none","none"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 6, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 4, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 85)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 3}, 50)
    addToShapeArray(sp, "item","coins", {2, 1, 3, 2}, 105})
    addToShapeArray(sp, "item","small-present", {2, 1, 7, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
