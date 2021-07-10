local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "right")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 2}, "bar", {"vert"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,2,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{},{2},{1},{1,1,3,2},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 5, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 3, 4})
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 7, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 5}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,5,5},{2},{1,1,5,2},{3},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar6_1_1", {1, 1, 7, 5}, "bar", {"horz"})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 7, 5})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 1}, "triangleTopRightShape", {1, 13})
    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 4, 1})
    addToTransitionArray(ta,{{"simple2_2_1"},{"slide"},{},{1},{1},{2,1,4,1},{2},{2,1,4,2}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 1}, "left")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 3, 2}, "down")
    --addToShapeArray(sp, "gem","redCoin", {2, 1, 3, 4}, "redCoin")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 5}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,5},{2},{2,1,5,5}})

    -- ALL SWITCHES
    addToShapeArray(sp, "switch","switch2_2_1", {2, 1, 3, 3}, { {"flip-vertical", "triangle1_2_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 2, 5}, 90)
    addToShapeArray(sp, "item","coins", {2, 1, 5, 3}, 180)
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 3}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 6, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
