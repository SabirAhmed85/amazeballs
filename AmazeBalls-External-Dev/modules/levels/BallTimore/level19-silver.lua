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

    --SCREEN 1-1
    newShape("gem","redCoin", {1, 1, 4, 1}, "redCoin")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 5}, "left")

    --SCREEN 1-2
    newShape("shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert", 3})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 2}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("door","door1_1_2", {1, 2, 7, 2}, "right", {"disabled"})
    newShape("shape","triangle2_1_2", {1, 2, 2, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("shape","triangle3_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("gem","purple", {1, 2, 6, 5}, "purple")

    --SCREEN 2-2
    newShape("shape","triangle1_2_2", {2, 2, 1, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_2_2", {2, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("spitter","spitter1_2_2", {2, 2, 1, 2, "up", "none", "none", "none"})
    newShape("shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"horz", 4})
    newShape("endPoint","endPoint1_2_2", {2, 2, 5, 2})
    newShape("shape","triangle3_2_2", {2, 2, 6, 2}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape","triangle4_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle5_2_2", {2, 2, 1, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle6_2_2", {2, 2, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle7_2_2", {2, 2, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle8_2_2", {2, 2, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","triangle9_2_2", {2, 2, 1, 5}, "triangleTopRightShape")
    newShape("shape","triangle10_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 5, 4}, { {"door-open","door1_1_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
