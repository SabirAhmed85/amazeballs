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
    newShape("tunnel", "tunnel1_1_1", {1, 1, 4, 1, 1, 1, 6, 1}, "up")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    newShape("item", "big-present", {1, 2, 7, 3}, {})

    newShape("shape", "triangle3_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 4})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
