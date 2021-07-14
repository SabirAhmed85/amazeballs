local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end

    --SCREEN 2-1
    newShape("endPoint", "endPoint1_2_1", {2, 1, 7, 2}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("spitter", "spitter1_2_1", {2, 1, 1, 3, "up", "right", "none", "none"})
    newTransition("spitter2_2_1", "switchSlide", {}, {{2,1,1,3},{2,1,1,4}})
    newShape("shape", "triangle1_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape", "triangle1_2_1", {2, 1, 5, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("spitter", "spitter2_2_1", {2, 1, 7, 4}, {"none", "none", "none", "left"})
    newTransition("spitter2_2_1", "switchSlide", {}, {{2,1,7,4},{2,1,7,5}})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("door", "door1_1_2", {1, 2, 7, 2}, "right")
    newShape("characterChangePoint", "characterChangePoint1_1_2", {1, 2, 3, 2})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle4_1_2", {1, 2, 6, 5}, "triangleTopRightShape", {1, _, "fire"})

    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape")
    newShape("item", "compass", {2, 2, 4, 1})
    newShape("shape", "triangle2_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape")
    newShape("door", "door1_2_2", {2, 2, 7, 1}, "up")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 1}, "up")
    newTransition("autoFan1_2_2", "switchSlide", {}, {{2,2,7,1},{2,2,7,2}})
    --newShape("timeOut", "timeOut1_2_1", {2, 1, 1, 2, 3})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 5, 2}, "down")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,5,2},{2,2,5,3}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 6, 3}, "up")
    newTransition("autoFan3_2_2", "slide", {}, {{2,2,6,2},{2,2,6,3}})
    newShape("autoFan", "autoFan4_2_2", {2, 2, 2, 4}, "right")
    newTransition("autoFan4_2_2", "switchSlide", {}, {{2,2,2,4},{2,2,2,5}})
    newShape("autoFan", "autoFan5_2_2", {2, 2, 3, 4}, "down")
    newTransition("autoFan5_2_2", "switchSlide", {}, {{2,2,3,4},{2,2,3,5}})
    newShape("door", "door2_2_2", {2, 2, 3, 5}, "down")
    newShape("door", "door3_2_2", {2, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 3-2
    newShape("manualFan", "manualFan1_3_2", {3, 2, 1, 1}, "down")
    newShape("manualFan", "manualFan2_3_2", {3, 2, 3, 1}, "down")
    newShape("manualFan", "manualFan3_3_2", {3, 2, 5, 1}, "up")
    newShape("manualFan", "manualFan4_3_2", {3, 2, 7, 1}, "left")
    newShape("door", "door1_3_2", {3, 2, 1, 2}, "left")
    newShape("manualFan", "manualFan5_3_2", {3, 2, 2, 2}, "down")
    newShape("manualFan", "manualFan6_3_2", {3, 2, 4, 2}, "left")
    newShape("manualFan", "manualFan7_3_2", {3, 2, 7, 2}, "right")
    newShape("manualFan", "manualFan8_3_2", {3, 2, 1, 3}, "right")
    newShape("autoFan", "autoFan1_3_2", {3, 2, 2, 3}, "left")
    newShape("shape", "triangle1_3_2", {3, 2, 2, 4}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("autoFan", "autoFan2_3_2", {3, 2, 3, 3}, "up")
    newShape("manualFan", "manualFan9_3_2", {3, 2, 4, 3}, "up")
    newShape("autoFan", "autoFan3_3_2", {3, 2, 5, 3}, "left")
    newShape("gem", "purple", {3, 2, 4, 4}, "purple")
    newShape("shape", "bar1_3_2", {3, 2, 5, 4}, "bar", {"vert", 3})
    newShape("gem", "redCoin", {3, 2, 5, 4}, "redCoin")
    newShape("autoFan", "autoFan4_3_2", {3, 2, 7, 4}, "up")
    newShape("manualFan", "manualFan10_3_2", {3, 2, 2, 5}, "up")
    newShape("autoFan", "autoFan5_3_2", {3, 2, 7, 5}, "down")

    --SCREEN 2-3
    newShape("shape", "triangle1_2_3", {2, 3, 1, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("door", "door1_2_3", {2, 3, 2, 1, "up", "disabled"})
    newShape("autoFan", "autoFan1_2_3", {2, 3, 3, 1}, "down")
    newTransition("autoFan1_2_3", "switchSlide", {}, {{2,3,3,1},{2,3,3,2}})
    newShape("shape", "triangle2_2_3", {2, 3, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_3", {2, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan2_2_3", {2, 3, 2, 2}, "up")
    newTransition("autoFan2_2_3", "switchSlide", {}, {{2,3,2,1},{2,3,2,2}})
    newShape("simple", "simple1_2_3", {2, 3, 4, 2})
    newShape("shape", "triangle4_2_3", {2, 3, 6, 2}, "triangleBottomLeftShape")
    newTransition("triangle4_2_3", "slide", {}, {{2,3,5,1},{2,3,6,2}})
    newShape("backFire", "backFire1_2_3", {2, 3, 5, 3})
    newTransition("backFire1_2_3", "slide", {}, {{2,3,5,3},{2,3,6,3}})
    newShape("shape", "triangle5_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_3", {2, 3, 3, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle7_2_3", {2, 3, 5, 4}, "triangleTopRightShape")
    newTransition("triangle7_2_3", "slide", {}, {{2,3,5,4},{2,3,6,5}})
    newShape("autoFan", "autoFan3_2_3", {2, 3, 1, 5}, "left")
    newShape("manualFan", "manualFan1_2_3", {2, 3, 3, 5}, "right")
    newShape("autoFan", "autoFan4_2_3", {2, 3, 4, 5}, "right")
    newShape("shape", "triangle8_2_3", {2, 3, 7, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SWITCHES
    newShape("switch", "switch1_2_3", {2, 3, 4, 4}, { {"door-open", "door1_2_3"},{"door-open", "door3_2_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
