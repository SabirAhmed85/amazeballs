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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleTopAndBottomShape", {2})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("backFire", "backFire1_1_1", {1, 1, 6, 3})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,6,5},{1,1,6,3},{1,1,7,2}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 4}, "down")
    newShape("shape", "triangle5_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("spitter", "spitter1_1_1", {1, 1, 1, 5}, {"none", "right", "none", "none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,1,2},{1,1,1,3},{1,1,1,5}})
    newShape("door", "door1_1_1", {1, 1, 3, 5}, "down")
    newShape("shape", "triangle7_1_1", {1, 1, 4, 5}, "triangleBottomRightShape", {1, 9, "breakable"})

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 1}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 2, 3}, "up")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,1,4},{2,1,2,3}})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 3}, "left")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,5,3},{2,1,6,3}})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_2_1", {2, 1, 5, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 2, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("manualFan", "manualFan1_1_2", {1, 2, 2, 2}, "left")
    newShape("spitter", "spitter1_1_2", {1, 2, 5, 2}, {"none", "none", "none", "left"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,5,2},{1,2,5,4},{1,2,5,5}})
    newShape("shape", "triangle2_1_2", {1, 2, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 3, 3}, "right")
    newShape("shape", "triangle3_1_2", {1, 2, 6, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 1, 4})
    newShape("gun", "gun1_1_2", {1, 2, 7, 4}, "down")
    newShape("shape", "bar1_1_2", {1, 2, 7, 5}, "bar", {"horz"})
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
