local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right", {"disabled"})
    addToShapeArray(sp, "tunnel","tunnel1_1_1", {1, 1, 1, 2, 1, 2, 2, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,3,1}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 7, 2}, "left")
    addToShapeArray(sp, "gun","gun2_1_1", {1, 1, 1, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 4}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"switchSlide"},{},{2},{1},{1,1,6,1},{2},{1,1,6,4}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 5}, "bar", {"vert"})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{},{2},{1},{1,1,6,5},{2},{1,1,7,5}})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 4, 5})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{3},{1},{1,1,2,5},{2},{1,1,3,5},{3},{1,1,4,5}})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 2}, "down")
    addToTransitionArray(ta,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,2,1},{2},{2,1,2,2}})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 4, 3}, "left")
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 5, 3})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --SCREEN 1-2
    addToShapeArray(sp, "item","compass", {1, 2, 4, 1})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape", {1, 22, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 4, 5}, "triangleBottomLeftShape", {1, 25, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 3, 4}, { {"door-open","door1_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 60)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 1}, 110)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 4}, 220)
    addToShapeArray(sp, "item","small-present", {1, 2, 4, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
