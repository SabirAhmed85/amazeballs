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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 2, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 3, 3}, "triangleTopLeftShape")
    newShape("shape","triangle5_1_1", {1, 1, 5, 3}, "triangleBottomRightShape")
    newShape("shape","triangle6_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle7_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle8_1_1", {1, 1, 1, 5}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 5, 5}, "down")
    newShape("shape","triangle9_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 2}, "down")
    newTransition("autoFan1_1_2", "autoSlide", {timePerSquare = 600}, {{1,2,4,2},{1,2,4,5}})
    newShape("spitter","spitter1_1_2", {1, 2, 5, 1}, {"none","right","none","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,5,1},{1,2,5,2}})
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape")
    newShape("gun","gun1_1_2", {1, 2, 2, 4}, "right")
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 5})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
