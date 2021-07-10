local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 16})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 2})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,3,4}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,4,2},{2},{1,1,4,4}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down")
    addToTransitionArray(ta,{{"manualFan2_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,5,2},{2},{1,1,5,4}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 6, 2}, "left")
    addToTransitionArray(ta,{{"manualFan3_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,6,2},{2},{1,1,6,4}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"vert", 2})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomRightShape")
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 4, 1, 2})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 2})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 5, 3}, "right")
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 1, 4}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 7, 3}, "up")
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan4_2_1", {2, 1, 1, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 3, 4}, "left")
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 5, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 250)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 5}, 150)
    addToShapeArray(sp, "item","small-present", {2, 1, 4, 4}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 1, 3}, {})

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
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
