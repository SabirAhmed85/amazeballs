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
    newShape("manualFan", "manualFan2_3_1", {3, 1, 4, 2}, "up")
    newShape("shape", "triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle2_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 2})
    newTransition("bar1_2_1", "slide", {}, {{2,1,2,2},{2,1,2,4}})
    newShape("shape", "triangle3_2_1", {2, 1, 6, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("spitter", "spitter1_2_1", {2, 1, 4, 3, "up", "none", "down", "none"})
    newTransition("spitter1_2_1", "slide", {}, {{2,1,2,3},{2,1,3,3},{2,1,4,3},{2,1,5,3},{2,1,6,3}})
    newShape("shape", "triangle4_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape", "bar2_2_1", {2, 1, 8, 4}, "bar", {"horz", 2})
    newShape("shape", "triangle5_2_1", {2, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 4, 5}, "down")
    newShape("shape", "triangle6_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, 5, "breakable"})

    --SCREEN 3-1
    newShape("door", "door1_3_1", {3, 1, 1, 1}, "left", {"disabled"})
    newShape("shape", "triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape", "triangle2_3_1", {3, 1, 3, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle3_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan1_3_1", {3, 1, 3, 2}, "up")
    newShape("manualFan", "manualFan2_3_1", {3, 1, 4, 2}, "up")
    newShape("shape", "triangle4_3_1", {3, 1, 1, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle5_3_1", {3, 1, 3, 3}, "triangleTopLeftShape", {1, 15})
    newTransition("triangle5_3_1", "flip-vertical")
    newShape("shape", "bar1_3_1", {3, 1, 4, 3}, "bar", {"horz", 4})
    newShape("shape", "triangle6_3_1", {3, 1, 6, 3}, "triangleBottomLeftShape")
    newShape("shape", "triangle7_3_1", {3, 1, 1, 4}, "triangleTopRightShape")
    newShape("shape", "triangle8_3_1", {3, 1, 4, 4}, "triangleBottomRightShape", {1, 14})
    newTransition("triangle8_3_1", "flip-vertical")
    newShape("shape", "triangle9_3_1", {3, 1, 6, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle10_3_1", {3, 1, 3, 5}, "triangleTopRightShape")
    newShape("shape", "triangle11_3_1", {3, 1, 4, 5}, "triangleTopLeftShape", {1, 11})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 1}, "down")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,3,1},{1,2,3,2}})
    newShape("shape", "triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 5, 2}, "up")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,5,2},{1,2,5,3}})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 1, 3}, "right")
    newTransition("autoFan3_1_2", "slide", {}, {{1,2,1,3},{1,2,2,3}})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 3, 3})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan4_1_2", {1, 2, 3, 4}, "up")
    newTransition("autoFan4_1_2", "slide", {}, {{1,2,3,4},{1,2,3,5}})
    newShape("shape", "triangle4_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, 11})

    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_2", {2, 2, 1, 3}, "left")
    newShape("shape", "triangle1_2_2", {2, 2, 2, 3}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape", "triangle1_2_2", {2, 2, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape", "bar1_2_2", {2, 2, 8, 3}, "bar", {"horz", 2})
    newShape("shape", "bar1_2_2", {2, 2, 1, 4}, "bar", {"vert", 3})
    --newShape("item", "coins", {2, 2, 1, 4}, 250)
    newShape("gem", "purple", {2, 2, 5, 4}, "purple")
    newShape("shape", "triangle1_2_2", {2, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle1_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES

    newShape("switch", "switch1_3_1", {3, 1, 5, 4}, { {"door-open", "door1_3_1"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
