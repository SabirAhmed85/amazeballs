local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 2}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, 9})
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{"green"},{3},{1},{1,1,1,1},{2},{1,1,2,1},{3},{1,1,3,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,1},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 4}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right", {"disabled"})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 1, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{"green"},{2},{1},{1,2,4,2},{2},{1,2,5,1}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,4},{2},{1,2,3,4},{3},{1,2,4,4}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 6})
    addToTransitionArray(ta,{{"triangle3_1_2"},{"slide"},{"green"},{3},{1},{1,2,1,2},{2},{1,2,3,3},{3},{1,2,6,4}})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 6, 3})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{"green"},{1},{1},{2,1,6,3},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 7, 3}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar2_2_1"},{"slide"},{"green"},{2},{1},{2,1,6,3},{2},{2,1,7,3}})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 6, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle8_2_1", {2, 1, 7, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle9_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 3, 5})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 5, 5}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar3_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,4},{2},{2,1,5,5}})
    addToShapeArray(sp, "shape","triangle10_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")

    --SWITCHES    
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 3, 1}, { {"door-open","door1_1_1"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 6, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 2}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 2, 4}, 140))
    addToShapeArray(sp, "item","coins", {1, 1, 5, 1}, 75)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 1, 300}) 
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 1}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 3, 3}, {})

    addToShapeArray(sp, "item","coins", {1, 2, 7, 4, 105})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
