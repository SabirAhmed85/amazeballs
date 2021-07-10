local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 2}, "left")
    addToTransitionArray(ta,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 2}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 7, 2}, "down")
    addToTransitionArray(ta,{{"autoFan3_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 5, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 2, 4}, "right")
    addToTransitionArray(ta,{{"manualFan4_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 1, 5}, "right")
    addToShapeArray(sp, "manualFan","manualFan5_1_1", {1, 1, 4, 5}, "down")
    addToTransitionArray(ta,{{"manualFan5_1_1"},{"slide"},{},{2},{1},{1,1,3,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 2-1
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 2, 1})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,2,1}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 5, 1}, "up")

    --SCREEN 2-2
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 1, 1}, {"none","right","none","left"})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 1, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 2, 6, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 5, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 170)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 1}, 75)
    addToShapeArray(sp, "item","coins", {2, 2, 3, 5}, 140)
    addToShapeArray(sp, "item","big-present", {1, 2, 5, 3}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 4, 3}, {})
    addToShapeArray(sp, "item","clock", {2, 1, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
