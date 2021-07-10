local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   
    
    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 2}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, 1})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, 2})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,4,1},{2},{1,1,5,3}})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 2, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 6, 4}, "left")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1})
    addToTransitionArray(ta,{{"triangle5_1_1"},{"slide"},{"green"},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan5_1_1", {1, 1, 5, 5}, "right")
    addToTransitionArray(ta,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,5},{2},{1,1,5,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 6, 2}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 3})
    addToTransitionArray(ta,{{"simple1_1_2"},{"slide"},{"lightBlue"},{4},{1},{1,2,1,2},{2},{1,2,3,3},{3},{1,2,4,3},{4},{1,2,5,3},{"*"},{1,2,5,4},{5},{1,2,7,4}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 2, 4}, "down")
    addToShapeArray(sp, "autoFan","autoFan5_1_2", {1, 2, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 2, 5}, "down")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "autoFan","autoFan6_1_2", {1, 2, 4, 5}, "up")
    addToShapeArray(sp, "item","mystery-block", {1, 2, 7, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right", "none", "left"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 7, 5}, "right")

    -- 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 1, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 3, 1}, "down")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 5, 1}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_2", {2, 2, 7, 3})
    addToTransitionArray(ta,{{"characterChangePoint1_2_2"},{"slide"},{"purple"},{2},{1},{2,2,6,3},{2},{2,2,7,3}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 1, 4}, "left")
    addToTransitionArray(ta,{{"autoFan2_2_2"},{"slide"},{"orange"},{1},{1},{2,2,1,4},{2},{2,2,1,5}})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 2, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 4, 4}, "up")
    addToTransitionArray(ta,{{"autoFan4_2_2"},{"slide"},{"orange"},{1},{1},{2,2,4,4},{2},{2,2,4,5}})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 5}, "left")
    addToShapeArray(sp, "autoFan","autoFan5_2_2", {2, 2, 2, 5}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 5, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan6_2_2", {2, 2, 5, 5}, "up")
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 1, 1}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 3, 1}, "down")
    addToTransitionArray(ta,{{"autoFan1_1_3"},{"slide"},{"orange"},{2},{1},{1,3,2,2},{2},{1,3,3,1}})
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 6, 2}, "triangleBottomLeftShape", {1, 2})
    addToShapeArray(sp, "autoFan","autoFan2_1_3", {1, 3, 1, 3}, "down")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "autoFan","autoFan3_1_3", {1, 3, 4, 3}, "left")
    addToTransitionArray(ta,{{"autoFan3_1_3"},{"slide"},{"orange"},{2},{1},{1,3,3,3},{2},{1,3,4,3}})
    addToShapeArray(sp, "shape","triangle5_1_3", {1, 3, 3, 4}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle6_1_3", {1, 3, 4, 4}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle7_1_3", {1, 3, 1, 5}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "simple","simple1_1_3", {1, 3, 2, 5})
    addToTransitionArray(ta,{{"simple1_1_3"},{"slide"},{"lightBlue"},{1},{1},{1,3,2,5},{2},{1,3,3,5}})
    addToShapeArray(sp, "autoFan","autoFan4_1_3", {1, 3, 5, 5}, "up")
    addToTransitionArray(ta,{{"autoFan4_1_3"},{"slide"},{"orange"},{1},{1},{1,3,5,5},{2},{1,3,6,5},{3},{1,3,7,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 3, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 5, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 7, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 6, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 3, 1}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 4, 2}, 90)
    addToShapeArray(sp, "item","coins", {1, 3, 4, 2}, 90)
    addToShapeArray(sp, "item","coins", {2, 2, 7, 1}, 250)
    addToShapeArray(sp, "item","small-present", {1, 3, 4, 5}, {})

    addToShapeArray(sp, "item","big-present", {2, 2, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t