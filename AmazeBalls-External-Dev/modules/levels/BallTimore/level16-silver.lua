local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 2}, "redCoin")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    addToShapeArray(sp, "item","map", {1, 1, 5, 2})
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 2}, "blueCoin")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 6, 3}, {})

    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right", {"disabled"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 4}, "left")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 7, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 1, 1})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 1}, "left")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 1}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 6, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{},{1},{1},{1,2,7,1},{2},{1,2,7,2}})
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 1, 2}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar2_1_2"},{"switchSlide"},{},{1},{1},{1,2,8,1},{2},{1,2,8,2}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 3}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 6, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 1, 5}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "gem","redCoin", {1, 2, 5, 5}, "redCoin")
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 1, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 4, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 2, 3})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 5, 3}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 7, 3})


    --SCREEN 3-2
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 1, 3}, { {"door-open","door1_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_2", {1, 2, 5, 3}, { {"slide","bar2_1_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
