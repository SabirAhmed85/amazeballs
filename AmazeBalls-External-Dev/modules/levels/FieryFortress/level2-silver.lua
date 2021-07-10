local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 1}, "down")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,1},{2},{1,1,3,1}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 2}, "right")
    addToTransitionArray(ta,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 3})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,3},{2},{1,1,5,3}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1})
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 2}, "up")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"slide"},{"orange"},{1},{1},{1,2,2,2},{2},{1,2,2,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,3},{2},{1,2,7,3}})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 5})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,3,5},{2},{1,2,5,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 45)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 2}, 50)
    addToShapeArray(sp, "item","small-present", {1, 2, 5, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 5, 4}, {})



end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t