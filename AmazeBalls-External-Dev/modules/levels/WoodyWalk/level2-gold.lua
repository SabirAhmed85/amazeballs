local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,1,5,1},{2},{1,1,5,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 4}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,1},{2},{1,1,3,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,4},{2},{1,1,6,1}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 5}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 5}, "triangleTopLeftShape")

    -- SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"green"},{4},{1},{1,2,3,4},{"*"},{1,2,3,3},{2},{1,2,4,3},{"*"},{1,2,4,2},{3},{1,2,6,2},{4},{1,2,6,1}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle4_1_2"},{"slide"},{"green"},{2},{1},{1,2,1,5},{2},{1,2,2,5}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 5}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle5_1_2"},{"slide"},{"green"},{2},{1},{1,2,3,5},{2},{1,2,6,5}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 2, 1}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 5, 1}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 65))
    addToShapeArray(sp, "item","coins", {1, 2, 1, 2}, 180)
    addToShapeArray(sp, "item", "small-present", {1, 2, 1, 4}, {})

    addToShapeArray(sp, "item","coins", {1, 1, 4, 2}, 110)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
