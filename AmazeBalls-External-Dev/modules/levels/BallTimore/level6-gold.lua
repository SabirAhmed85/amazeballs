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
    newShape("gun","gun1_1_1", {1, 1, 3, 1}, "down")
    newShape("shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 2}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,3,3},{1,1,5,2}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 4, 4}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,5},{1,1,7,4}})
    newShape("door","door1_1_1", {1, 1, 7, 4}, "right")
    newShape("simple","simple1_1_1", {1, 1, 2, 5})

    --SCREEN 2-1
    newShape("gun","gun1_2_1", {2, 1, 5, 1}, "down")
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 2}, "left")
    newTransition("autoFan1_2_1", "autoSlide", {timePerSquare=600}, {{2,1,2,2},{2,1,6,2}})
    newShape("backFire","backFire1_2_1", {2, 1, 2, 4})
    newShape("endPoint","endPoint1_2_1", {2, 1, 4, 4})

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
