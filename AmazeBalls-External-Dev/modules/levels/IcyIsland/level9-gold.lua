local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right")
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 4, 1})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 7, 1}, {
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down", "right"} } }
    })
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 3}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 2, 5}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    })
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 4, 1}, {"none","right","down","left"})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, 22, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle4_2_1"},{"slide"},{},{1},{1},{2,1,5,3},{2},{2,1,5,4},{3},{2,1,6,5}})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 4, 5}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle6_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "tunnel","tunnel1_2_1", {2, 1, 4, 5, 3, 1, 4, 4, "none"})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 4, 6}, "bar", {"vert"})

    --SCREEN 3-1
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 4, 1})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_3_1", {3, 1, 3, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "simple","simple1_3_1", {3, 1, 2, 3})
    addToTransitionArray(ta,{{"simple1_3_1"},{"slide"},{},{2},{1},{3,1,2,2},{2},{3,1,2,3}})
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 4, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, 1)
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 3, 4}, "down")
    addToTransitionArray(ta,{{"autoFan1_3_1"},{"slide"},{},{2},{1},{3,1,3,1},{2},{3,1,3,4}})
    addToShapeArray(sp, "shape","bar3_3_1", {3, 1, 4, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar4_3_1", {3, 1, 5, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar5_3_1", {3, 1, 6, 4}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar5_3_1"},{"slide"},{},{2},{1},{3,1,6,1},{2},{3,1,6,4}})
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 7, 4}, "triangleTopLeftShape")

    --SWITCHES

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {3, 1, 5, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 1, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 2, 1}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 2, 58)
    addToShapeArray(sp, "item","coins", {3, 1, 6, 4}, 65)
    addToShapeArray(sp, "item","big-present", {1, 1, 4, 4}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 5}, {})
    addToShapeArray(sp, "item","small-present", {3, 1, 1, 3}, {})
    addToShapeArray(sp, "item","characterSpecial", {1, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
