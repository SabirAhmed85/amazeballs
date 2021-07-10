local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 7, 1})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,7,1}})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 5, 2})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 1, 3}, "left")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 3}, "blueCoin")
    addToShapeArray(sp, "item","big-present", {1, 1, 6, 3}, {})

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 1, 5}, "down")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{},{1},{1},{1,2,2,1},{2},{1,2,4,1}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 3}, "bar", {"horz"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 1, 5}, "up")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 5}, "down")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 7, 5})

    --SCREEN 1-3
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 1, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door2_1_3", {1, 3, 7, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 6, 3}, "down")
    addToTransitionArray(ta,{{"autoFan1_1_3"},{"slide"},{},{2},{1},{1,3,6,2},{2},{1,3,6,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_3", {1, 3, 2, 4}, "right")
    addToTransitionArray(ta,{{"autoFan2_1_3"},{"slide"},{},{1},{1},{1,3,2,4},{2},{1,3,3,4}})
    addToShapeArray(sp, "item","map", {1, 3, 6, 4})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 7, 4}, "triangleBottomLeftShape", {1, 4})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 3, 5}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 3, 5}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle1_1_3"},{"slide"},{},{1},{1},{1,3,3,5},{2},{1,3,4,5}})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-4
    addToShapeArray(sp, "door","door1_1_4", {1, 4, 4, 1}, "up")
    addToShapeArray(sp, "item","mystery-block", {1, 4, 4, 2}, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "triangle", properties = {shape = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up","right","left"} } }
    })
    addToShapeArray(sp, "simple","simple1_1_1", 1, 4, 2, 4})
    addToShapeArray(sp, "item","mystery-block", {1, 4, 4, 4}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","right"} } }
    })

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 4, 4}, { {"door-open","door1_2_3"},{"door-open","door3_2_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 4
t.screenHorzTotal = 1
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
