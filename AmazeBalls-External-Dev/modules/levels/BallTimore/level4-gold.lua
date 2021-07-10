local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 2}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar1_1_1"},{"switchSlide"},{},{2},{1},{1,1,1,2},{2},{1,1,2,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 3}, "up")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 1, 4}, "bar", {"vert"})
    addToTransitionArray(ta,{{"bar3_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomLeftShape", {1, 20, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 2}, "left")
    addToTransitionArray(ta,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,4,2},{2},{1,2,6,2},{3},{1,2,6,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 7, 2}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 1, 3})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 1, 4}, "down")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 4}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 3, 5}, "right")
    addToTransitionArray(ta,{{"autoFan4_1_2"},{"slide"},{},{2},{1},{1,2,3,4},{2},{1,2,3,5},{3},{1,2,4,5}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 4}, { {"slide","bar1_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 3, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 4}, 85)
    addToShapeArray(sp, "item","coins", {1, 1, 7, 1}, 115)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 55)
    addToShapeArray(sp, "item","small-present", {1, 1, 6, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
