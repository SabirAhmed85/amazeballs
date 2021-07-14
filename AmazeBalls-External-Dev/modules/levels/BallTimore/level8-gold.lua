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
    newShape("shape", "triangle1_1_1", {1, 1, 6, 1}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,6,1},{1,1,6,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("gun", "gun1_1_1", {1, 1, 3, 2}, "left")
    newShape("gun", "gun2_1_1", {1, 1, 5, 2}, "right")
    newShape("shape", "triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape")
    newShape("spitter", "spitter1_1_1", {1, 1, 4, 4}, {"none", "none", "none", "left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 4}, "up")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 2, 5}, "right")
    newShape("door", "door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("endPoint", "endPoint1_2_1", {2, 1, 7, 1})
    newShape("gun", "gun1_2_1", {2, 1, 1, 3}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 3, 4}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,4},{2,1,3,5}})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 7, 5}, "left")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
