local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   
    
    -- 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 1})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 3, 1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 2, 5}, "right")
    addToTransitionArray(ta,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,5},{2},{1,1,3,5}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 1})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,3,1},{2},{1,2,5,1}})

    addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 7, 2})
    addToTransitionArray(ta,{{"simple2_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,5,2},{2},{1,2,7,2}})

    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 2, 3})

    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "simple","simple3_1_2", {1, 2, 4, 3})
    addToTransitionArray(ta,{{"simple3_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,4,3},{2},{1,2,7,3}})

    addToShapeArray(sp, "simple","simple4_1_2", {1, 2, 6, 4})
    addToTransitionArray(ta,{{"simple4_1_2"},{"slide"},{"lightBlue"},{3},{1},{1,2,1,4},{2},{1,2,4,4},{3},{1,2,6,4}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 7, 5}, 50)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 2, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t