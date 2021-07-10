local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 1, 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 2}, "up")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 3})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{},{3},{1},{1,1,7,2},{2},{1,1,7,3},{3},{1,1,8,3}})
    addToShapeArray(sp, "item","map", {1, 1, 3, 4})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 4}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 5, 5}, "right")
    addToTransitionArray(ta,{{"autoFan3_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 7, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right")

    -- 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 1}, "right")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,1,3},{2},{2,1,3,1}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 2}, "right")
    addToTransitionArray(ta,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,1,2},{2},{2,1,2,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle2_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, 7})
    addToTransitionArray(ta,{{"triangle3_2_1"},{"slide"},{},{2},{1},{2,1,4,2},{"*"},{2,1,4,3},{2},{2,1,5,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 3}, "down")
    addToTransitionArray(ta,{{"autoFan3_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{"*"},{2,1,6,4},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 3}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar1_2_1"},{"slide"},{},{2},{1},{2,1,7,1},{2},{2,1,7,3}})
    addToShapeArray(sp, "item","compass", {2, 1, 7, 3})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 3}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 2, 4}, "right")
    addToTransitionArray(ta,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,1,4},{2},{2,1,2,4}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 4}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 2, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 5, 5}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle6_2_1"},{"slide"},{},{1},{1},{2,1,5,5},{2},{2,1,6,5}})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 6, 5}, "bar", {"vert", 4})

    --ALL SWITCHES

    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 1}, { {"slide", "autoFan3_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 4, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 2}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","big-present", {2, 1, 2, 1}, {})

    --addToShapeArray(sp, "item","coins", {1, 2, 7, 5}, 150)
    --addToShapeArray(sp, "item","coins", {1, 2, 6, 1}, 150)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
