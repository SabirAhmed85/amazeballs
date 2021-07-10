local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 2, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 4, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 6, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan3_1_1", {1, 1, 1, 2}, "down")
    addToTransitionArray(ta,{{"manualFan4_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 3, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 5, 2}, "bar", {"horz"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToTransitionArray(ta,{{"triangle1_1_1"},{"switchSlide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 2, 3}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right", {"disabled"})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 2, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan4_1_1", {1, 1, 3, 4}, "up")
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 7, 4, 4})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar5_1_1", {1, 1, 7, 5}, "bar", {"horz", 2})

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 3}, "down")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 4}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 2, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 5, 2}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 6, 2}, "down")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle2_2_2"},{"slide"},{},{2},{1},{2,2,7,1},{2},{2,2,7,2}})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, 3, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan3_2_2", {2, 2, 4, 3}, "left")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "autoFan","autoFan4_2_2", {2, 2, 2, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 4, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan5_2_2", {2, 2, 6, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_2_2", {2, 2, 7, 4}, "right")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 7, 6}, "bar", {"vert", 2})

    --SCREEN 3-1
    addToShapeArray(sp, "door","door1_3_1", {3, 1, 1, 1}, "left", {"disabled"})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 3, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_3_1", {3, 1, 4, 2}, "up")
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 3, 3}, "triangleTopLeftShape", {1, 15})
    addToTransitionArray(ta,{{"triangle5_3_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 4, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 6, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle7_3_1", {3, 1, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle8_3_1", {3, 1, 4, 4}, "triangleBottomRightShape", {1, 14})
    addToTransitionArray(ta,{{"triangle8_3_1"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle9_3_1", {3, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle10_3_1", {3, 1, 3, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle11_3_1", {3, 1, 4, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 4-1
    addToShapeArray(sp, "door","door1_4_1", {4, 1, 1, 2}, "left")

    --SCREEN 1-2
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 3, 3})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open","door1_1_1"} })
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 3, 5}, { {"slide","triangle1_1_1"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
