local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    -- 2-1
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 2, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 5, 1}, "bar", {"vert"})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 6, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 7, 1}, "down")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar5_2_1", {2, 1, 6, 2}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar5_2_1"},{"slide"},{},{1},{1},{2,1,6,2},{2},{2,1,7,2}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 6, 2}, "up")
    addToShapeArray(sp, "shape","bar6_2_1", {2, 1, 7, 2}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar6_2_1"},{"slide"},{},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 1, 3}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 7, 3}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,7,3},{2},{2,1,7,5}})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 3, 4})
    addToTransitionArray(ta,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,3,5},{2},{2,1,3,4},{3},{2,1,4,4},{4},{2,1,5,3}})
    addToShapeArray(sp, "shape","triangle7_2_1", {2, 1, 6, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 1, 5}, "up")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 5, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_2_1", {2, 1, 6, 5}, "up")
    addToTransitionArray(ta,{{"autoFan5_2_1"},{"slide"},{},{2},{1},{2,1,5,5},{2},{2,1,6,5}})

    -- 2-2
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 1, 1})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 2}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar1_2_2"},{"switchSlide"},{},{1},{1},{2,2,3,2},{2},{2,2,5,2}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    addToTransitionArray(ta,{{"bar2_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,1},{2},{2,2,6,2}})
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 7, 2})
    addToShapeArray(sp, "shape","bar3_2_2", {2, 2, 1, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 3}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle3_2_2"},{"slide"},{},{1},{1},{2,2,1,3},{2},{2,2,2,3}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 4, 3}, "right")
    addToTransitionArray(ta,{{"autoFan2_2_2"},{"switchSlide"},{},{1},{2},{2,2,4,2},{2},{2,2,4,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 5, 3}, "right")
    addToTransitionArray(ta,{{"autoFan3_2_2"},{"switchSlide"},{},{1},{2},{2,2,5,2},{2},{2,2,5,3}})
    addToShapeArray(sp, "item","map", {2, 2, 1, 4})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 7, 4})
    addToShapeArray(sp, "shape","bar4_2_2", {2, 2, 4, 5}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar4_2_2"},{"switchSlide"},{},{2},{1},{2,2,4,4},{2},{2,2,4,5}})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "item","compass", {2, 2, 6, 5})
    addToShapeArray(sp, "backFire","backFire2_2_2", {2, 2, 7, 5})

    -- 1-3
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 1, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 5, 1}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 6, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_3", {1, 3, 7, 1}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_3", {1, 3, 2, 2}, "down")
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 3, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan4_1_3", {1, 3, 4, 2}, "down")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 6, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan5_1_3", {1, 3, 3, 3}, "up")
    addToShapeArray(sp, "backFire","backFire1_1_3", {1, 3, 5, 3})
    addToTransitionArray(ta,{{"backFire1_1_3"},{"slide"},{},{1},{1},{1,3,5,3},{2},{1,3,6,3}})
    addToShapeArray(sp, "shape","triangle6_1_3", {1, 3, 7, 3}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle6_1_3"},{"slide"},{},{1},{1},{1,3,7,3},{2},{1,3,7,4}})
    addToShapeArray(sp, "shape","triangle7_1_3", {1, 3, 2, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle7_1_3"},{"slide"},{},{1},{1},{1,3,2,4},{2},{1,3,4,4},{3},{1,3,6,4}})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 3, 4}, "bar", {"vert"})
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 2, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "item","mystery-block", {1, 3, 3, 5}, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "triangle", properties = {shape = "triangleTopRightShape" } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape" } }
        }})
    addToShapeArray(sp, "item","mystery-block", {1, 3, 5, 5}, {
        --{name = "simple"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left", "right"} } }
    }})
    addToShapeArray(sp, "shape","bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar4_1_3", {1, 3, 2, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar5_1_3", {1, 3, 3, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar6_1_3", {1, 3, 4, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar7_1_3", {1, 3, 5, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle8_1_3", {1, 3, 7, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 7, 5}, "right")

    -- 2-3
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 1, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 1, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 5, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 7, 1}, "bar", {"horz"})
    addToShapeArray(sp, "door","door2_2_3", {2, 3, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_3", {2, 3, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_3", {2, 3, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 1, 4}, "up")
    addToShapeArray(sp, "shape","triangle7_2_3", {2, 3, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 5, 4}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle8_2_3", {2, 3, 7, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_2_3", {2, 3, 3, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 6, 5}, "right")

    --ALL SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 2, 1}, { {"slide","autoFan2_2_2"} })
    addToShapeArray(sp, "switch","switch2_2_1", {2, 1, 6, 3}, { {"slide","autoFan3_2_2"},{"slide","bar4_2_2"},{"slide","bar1_2_2"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 3, 2, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 6, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 2, 5}, "purpleCoin")

    --ITEMS
    --addToShapeArray(sp, "item","coins", {2, 2, 5, 1}, 250)
    --addToShapeArray(sp, "item","coins", {2, 1, 7, 2}, 150)
    --addToShapeArray(sp, "item","coins", {2, 3, 7, 1}, 90)
    --addToShapeArray(sp, "item","coins", {1, 3, 1, 4}, 90)
    --addToShapeArray(sp, "item","coins", {2, 3, 1, 5}, 60)
    --addToShapeArray(sp, "item","coins", {2, 3, 3, 4}, 150)
    addToShapeArray(sp, "item","small-present", {1, 3, 1, 5}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 3, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
