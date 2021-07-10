local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 4}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 1}, "triangleBottomRightShape", {1, 21, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle3_1_2"},{"slide"},{},{3},{1},{1,2,4,1},{2},{1,2,5,1}})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 2}, "right")
    addToTransitionArray(ta,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,1,2},{2},{1,2,2,2},{3},{1,2,3,2}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 2, 4}, "up")
    addToTransitionArray(ta,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,2,4},{2},{1,2,3,4},{3},{1,2,4,4},{4},{1,2,4,5}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 7, 4}, "down")
    addToTransitionArray(ta,{{"autoFan3_1_2"},{"slide"},{},{2},{1},{1,2,7,2},{2},{1,2,7,4}})
    addToShapeArray(sp, "autoFan","autoFan4_1_2", {1, 2, 1, 5}, "right")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 2-2
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", 2, 2, 1, 1}, {"none","none","down","none"})
    addToTransitionArray(ta,{{"spitter1_1_1"},{"autoSlide"},{timePerSlide=480},{1},{1},{2,2,1,1},{2},{2,2,7,1}})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","mystery-block", {2, 2, 3, 3}, {
        {name = "backFire"},
        {name = "simple"},
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 3}, "triangleBottomRightShape", {1, 3})
    addToShapeArray(sp, "item","mystery-block", {2, 2, 5, 3}, {
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"down","left"} } }
    })
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 1, 4})
    addToTransitionArray(ta,{{"simple1_2_2"},{"slide"},{},{1},{1},{2,2,1,4},{2},{2,2,2,4}})
    addToShapeArray(sp, "backFire","backFire1_2_2", {2, 2, 7, 4})
    addToTransitionArray(ta,{{"backFire1_2_2"},{"slide"},{},{2},{1},{2,2,6,4},{2},{2,2,7,4}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 2, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 6, 5}, "triangleTopRightShape")

    --SCREEN 2-3
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 3, 1}, "triangleBottomRightShape", {1, 14, "breakable"})
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 5, 1}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar1_2_3"},{"switchSlide"},{},{1},{1},{2,3,5,1},{2},{2,3,5,2}})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 6, 1}, "triangleTopLeftShape", {1, 26, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 7, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 4, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 7, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 4, 3}, "left")
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 6, 3}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_2_3", {2, 3, 1, 4})
    addToShapeArray(sp, "spitter","spitter1_2_3", {2, 3, 2, 4}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter1_2_3"},{"switchSlide"},{},{1},{1},{2,3,2,4},{2},{2,3,3,4}})
    addToShapeArray(sp, "autoFan","autoFan4_2_3", {2, 3, 4, 5}, "up")
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 6, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 7, 5}, "triangleTopRightShape")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 2, 5}, { {"door-open","door2_1_2"} })

    addToShapeArray(sp, "switch","switch1_2_3", {2, 3, 5, 1}, { {"slide","bar1_2_3"},{"slide","spitter1_2_3"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
