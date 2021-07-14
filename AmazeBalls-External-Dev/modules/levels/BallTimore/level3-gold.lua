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
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(sp, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, startPositionIndex, positionArray)
        addToTransitionArray(ta, shapeName, transitionType, props, startPositionIndex, positionArray);
    end

    --SCREEN 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape")
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 2, 2})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 2}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape", "triangle5_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 3, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle7_1_1", {1, 1, 4, 5}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape", "triangle8_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    newShape("spitter", "spitter1_2_1", {2, 1, 2, 1}, {"none", "right", "none", "none"})
    newTransition("spitter1_2_1", "slide", {}, {{2,1,2,1},{2,1,2,2}})
    newShape("simple", "simple1_2_1", {2, 1, 1, 2})
    newShape("shape", "triangle2_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 4}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("simple", "simple2_2_1", {2, 1, 2, 5})

    --SCREEN 2-2
    newShape("autoFan", "autoFan1_2_2", {2, 2, 1, 1}, "down")
    newShape("door", "door1_2_2", {2, 2, 2, 1}, "up")
    newShape("shape", "triangle1_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_2_2", "switchSlide", {labelled=false}, {{2,2,6,1},{2,2,7,1}})
    newShape("shape", "triangle2_2_2", {2, 2, 3, 2}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape", "triangle3_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 5, 3}, "down")
    newShape("shape", "triangle4_2_2", {2, 2, 1, 4}, "triangleTopRightShape", {1, 13})
    newTransition("triangle4_2_2", "slide", {}, {{2,2,1,3},{2,2,1,4}})
    newShape("shape", "bar1_2_2", {2, 2, 3, 4}, "bar", {"vert", 3})
    newShape("spitter", "spitter1_2_2", {2, 2, 4, 5}, "up", {"right", "none", "none"})
    newTransition("spitter1_2_2", "slide", {}, {{2,2,2,5},{2,2,3,5},{2,2,4,5}})
    newShape("door", "door2_2_2", {2, 2, 5, 5}, "down")
    newShape("shape", "triangle6_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-3
    newShape("door", "door1_2_3", {2, 3, 3, 1, "up", "disabled"})
    newShape("shape", "bar1_2_3", {2, 3, 6, 1}, "bar", {"vert", 3})
    newShape("shape", "bar2_2_3", {2, 3, 3, 2}, "bar", {"vert"})
    newShape("shape", "bar3_2_3", {2, 3, 3, 3}, "bar", {"horz"})
    newShape("autoFan", "autoFan1_2_3", {2, 3, 5, 3}, "left")
    newShape("autoFan", "autoFan2_2_3", {2, 3, 7, 3}, "left")
    newTransition("autoFan2_2_3", "slide", {}, {{2,3,6,1},{2,3,7,2},{2,3,7,3}})
    newShape("shape", "triangle1_2_3", {2, 3, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_3", {2, 3, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_3", {2, 3, 6, 4}, "triangleTopLeftShape", {1, 5, "icy"})
    newShape("shape", "triangle4_2_3", {2, 3, 7, 4}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("gem", "purple", {2, 3, 2, 5}, "purple")
    newShape("shape", "triangle5_2_3", {2, 3, 3, 5}, "triangleBottomRightShape", {1, 9, "breakable"})

    --SWITCHES
    newShape("switch", "switch1_2_2", {2, 2, 5, 2}, { {"slide", "triangle1_2_2"} }, {"one-way", "not-labelled"})
    newShape("switch", "switch1_2_3", {2, 3, 4, 1}, { {"door-open", "door1_2_3"} });
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
