local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 3, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 2, 3}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 3, 4}, "right")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 4, 5}, "right")
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 8, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 4, 2})
    addToShapeArray(sp, "autoFan","autoFan6_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})

    --SCREEN 1-3
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 3, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_1_3", {1, 3, 3, 1, "up","none","down","none"})
    addToTransitionArray(ta,{{"spitter1_1_3"},{"switchSlide"},{},{1},{1},{1,3,3,1},{2},{1,3,4,1}})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 4, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 6, 2}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,6,2},{2},{1,3,6,4}})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 6, 2}, "down")
    --addToShapeArray(sp, "item","coins", {1, 3, 6, 4}, 250)
    addToShapeArray(sp, "autoFan","autoFan2_1_3", {1, 3, 4, 4}, "up")
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 6, 4}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar2_1_3"},{"slide"},{},{2},{1},{1,3,4,4},{2},{1,3,6,4}})
    addToShapeArray(sp, "manualFan","manualFan2_1_3", {1, 3, 6, 4}, "left")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 5}, "purple")
    addToShapeArray(sp, "shape","bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_3", {1, 3, 5, 2}, { {"slide","spitter1_1_3"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 3, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 7, 2}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 2}, 27)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 1}, 85)
    addToShapeArray(sp, "item","coins", {1, 3, 3, 2}, 50)
    addToShapeArray(sp, "item","big-present", {1, 2, 2, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 7, 3}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 2, 1, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 3
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
