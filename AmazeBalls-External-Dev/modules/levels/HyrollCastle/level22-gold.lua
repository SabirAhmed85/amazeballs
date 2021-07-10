local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 4, 1}, "left")
    addToTransitionArray(ta,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,4,1},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"vert"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 3}, "down")
    addToTransitionArray(ta,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,1,3}})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, 4})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,4,3},{2},{1,1,5,3},{3},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 1, 5}, "right")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle5_1_1"},{"slide"},{},{2},{1},{1,1,2,4},{"*"},{1,1,2,5},{2},{1,1,4,5}})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 4, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,4},{2},{2,1,3,5}})
    addToShapeArray(sp, "door","door3_2_1", {2, 1, 2, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, 2})
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,3,1},{2},{1,2,5,1},{"*"},{1,2,5,3},{3},{1,2,6,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 1}, "left")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,6,1},{2},{1,2,6,2}})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 7, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"horz"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 1, 5})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{},{3},{1},{1,2,1,2},{2},{1,2,1,3},{3},{1,2,1,5}})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 3, 5}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar4_1_2"},{"slide"},{},{3},{1},{1,2,3,3},{2},{1,2,3,4},{3},{1,2,3,5}})
    addToShapeArray(sp, "shape","bar5_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})
    addToShapeArray(sp, "item","mystery-block", {1, 2, 5, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","right"} } },
        {name = "spitter", properties = {directions = {"up","right", "down"} } }
    })
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 5, 5}, "down")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 6, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 2, 1}, "up")
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 6, 1, "up", "disabled"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 7, 1}, "up")
    addToTransitionArray(ta,{{"autoFan1_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,1},{2},{2,2,7,1}})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 2, 2}, "up")
    addToTransitionArray(ta,{{"simple1_2_2"},{"slide"},{},{1},{1},{2,2,2,2},{2},{2,2,3,2}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 2}, "triangleLeftAndRightShape", {2})
    addToTransitionArray(ta,{{"triangle1_2_2"},{"slide"},{},{2},{1},{2,2,5,4},{2},{2,2,6,2},{3},{2,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 2, 3}, "up")
    addToTransitionArray(ta,{{"autoFan2_2_2"},{"slide"},{},{2},{1},{2,2,1,3},{2},{2,2,2,3}})
    addToShapeArray(sp, "door","door3_2_2", {2, 2, 1, 4}, "left")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 3, 4}, "triangleLeftAndRightShape", {1})
    addToTransitionArray(ta,{{"triangle3_2_2"},{"switchSlide"},{},{2},{1},{2,2,3,3},{2},{2,2,3,4}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 4, 5}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle4_2_2"},{"slide"},{},{1},{1},{2,2,4,5},{2},{2,2,4,1},{3},{2,2,5,1}})

    --SCREEN 1-3
    --addToShapeArray(sp, "timeOut","timeOut1_1_3", {1, 3, 5, 1, 1})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 3, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 5, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_1_3", {1, 3, 2, 3})
    addToTransitionArray(ta,{{"backFire1_1_3"},{"slide"},{},{1},{1},{1,3,2,3},{2},{1,3,2,4},{3},{1,3,2,5}})
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 3, 3}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_1_3", {1, 3, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle7_1_3", {1, 3, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 5, 5}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,5,4},{2},{1,3,5,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 6, 5})
    addToShapeArray(sp, "shape","triangle8_1_3", {1, 3, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 4}, { {"flip-horizontal", "triangle4_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 3, 4}, { {"flip-horizontal", "triangle1_1_1"} })

    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 2, 5}, { {"slide", "autoFan1_2_2"},{"door-open","door2_2_2"} }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch1_2_2", {2, 2, 1, 4}, { {"slide", "triangle3_2_2"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 3, 4, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 5, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 5}, 170)
    addToShapeArray(sp, "item","coins", {1, 2, 2, 1, 125})
    addToShapeArray(sp, "item","coins", {2, 1, 6, 5}, 65)
    addToShapeArray(sp, "item","coins", {2, 2, 7, 4, 125})
    addToShapeArray(sp, "item","coins", {1, 3, 6, 3}, 110)
    addToShapeArray(sp, "item","big-present", {2, 2, 5, 3}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 5, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 5, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 3, 7, 3}, {})
    addToShapeArray(sp, "item","bomb", {1, 1, 3, 1}, {})
    addToShapeArray(sp, "item","hook", {2, 1, 2, 1}, {})
    addToShapeArray(sp, "item","characterSpecial", {2, 2, 1, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
