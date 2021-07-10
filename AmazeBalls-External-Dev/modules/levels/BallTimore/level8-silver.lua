local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 5, 1}, {"none","right","down","none"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 7, 1})
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 3, 2}, {"none","right","none","none"})
    addToTransitionArray(ta,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,2,2},{2},{1,1,3,2},{3},{1,1,3,1}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "spitter","spitter3_1_1", {1, 1, 5, 3}, {"none","right","none","none"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 3}, "down")
    addToShapeArray(sp, "spitter","spitter4_1_1", {1, 1, 3, 4, "up","none","none","none"})
    addToTransitionArray(ta,{{"spitter4_1_1"},{"slide"},{},{1},{1},{1,1,3,4},{2},{1,1,3,5}})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 4}, "up")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "spitter","spitter5_1_1", {1, 1, 2, 5, "up","none","none","left"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, 2, "icy"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 7, 6}, "bar", {"vert", 4})

    --SCREEN 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 1}, "triangleTopRightShape", {1, 16, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 4, 2}, {"none","none","down","none"})
    addToTransitionArray(ta,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{2},{2,1,5,2}})
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 2, 3, "up","right","none","none"})
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 3, 3}, "up")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 3}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar1_2_1"},{"switchSlide"},{},{2},{1},{2,1,6,2},{2},{2,1,6,3}})
    addToShapeArray(sp, "endPoint","manualFan2_2_1", {2, 1, 6, 3})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 8, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "spitter","spitter3_2_1", {2, 1, 4, 4}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter3_2_1"},{"slide"},{},{1},{1},{2,1,4,4},{2},{2,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 5, 4}, "right")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "spitter","spitter4_2_1", {2, 1, 2, 5, "up","none","none","left"})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 5, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "spitter","spitter5_2_1", {2, 1, 7, 5, "up","none","none","left"})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 5, 6}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 5}, { {"slide","bar1_2_1"} }, "two-way", "not-labelled")
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 7, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 3, 3}, 100)
    addToShapeArray(sp, "item","coins", {1, 1, 1, 5}, 20)
    addToShapeArray(sp, "item","coins", {2, 1, 2, 1}, 75)
    addToShapeArray(sp, "item","superDummy", 1, 1, 5, 2}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 6, 5}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 5, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
