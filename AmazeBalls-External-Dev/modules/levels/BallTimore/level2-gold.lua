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
    newShape("gun","gun1_1_1", {1, 1, 2, 2}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 7, 3})
    newShape("gun","gun1_1_1", {1, 1, 2, 4}, "right")
    newShape("simple","simple1_1_1", {1, 1, 6, 5})
    newShape("shape","triangle2_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,4},{1,1,7,5}})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 6, 1}, "up")
    newShape("gun","gun1_1_2", {1, 2, 4, 2}, "left")
    newShape("shape","triangle2_1_2", {1, 2, 2, 3}, "triangleBottomRightShape")
    newShape("shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape")
    newTransition("triangle4_1_2", "slide", {}, {{1,2,2,5},{1,2,4,5},{1,2,4,4}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
