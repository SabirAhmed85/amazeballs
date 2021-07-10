local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 1, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 3, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"vert", 1})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 6, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar6_1_2", {1, 2, 7, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 2}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"green"},{3},{1},{1,2,4,3},{2},{1,2,6,2},{3},{1,2,7,2}})
    addToShapeArray(sp, "shape","bar7_1_2", {1, 2, 4, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,2,3},{2},{1,2,2,4},{3},{1,2,3,2}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 4}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle3_1_2"},{"slide"},{"green"},{4},{1},{1,2,5,4},{"*"},{1,2,5,5},{2},{1,2,6,5},{3},{1,2,6,4},{4},{1,2,7,4}})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 1})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,1},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 3}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 3}, "triangleLeftAndRightShape", {2})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,2},{2},{1,1,6,3}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 4}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 4})
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 4, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 6, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 3}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 80)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 5}, 120)
    addToShapeArray(sp, "item", "small-present", {1, 2, 1, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
