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
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {_, 2})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {_, 1})
    newShape("simple", "simple1_1_1", {1, 1, 5, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,4,2},{1,1,5,2},{1,1,5,1},{1,1,6,3}})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 3}, "triangleLeftAndRightShape", {2})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 3}, "triangleLeftAndRightShape", {1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 4}, "left")
    newShape("simple", "simple2_1_1", {1, 1, 7, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,3,5},{1,1,7,4},{1,1,7,2}})
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2

    newShape("shape", "triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape")
    newTransition("triangle1_1_2", "slide", {"brown"}, {{1,2,6,1},{1,2,7,2}})
    newShape("shape", "bar1_1_2", {1, 2, 2, 2, "doubleBar", "horz"})
    newTransition("bar1_1_2", "slide", {"brown"}, {{1,2,2,1},{1,2,2,2},{1,2,2,3}})
    newShape("simple", "simple1_1_2", {1, 2, 3, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,3,2},{1,2,3,3}})
    newShape("shape", "bar2_1_2", {1, 2, 5, 2, "doubleBar", "horz"})
    newTransition("bar2_1_2", "slide", {"brown"}, {{1,2,5,2},{1,2,5,3}})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 6, 3})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
