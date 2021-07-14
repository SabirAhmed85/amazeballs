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

    -- SCREEN 1-1
    newShape("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    newShape("backFire","backFire1_1_1", {1, 1, 5, 1})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,5,1},{1,1,5,4},{1,1,7,4}})
    newShape("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleTopLeftShape", {1, 5})
    newShape("shape","triangle3_1_1", {1, 1, 6, 2}, "triangleLeftAndRightShape", {2})
    newShape("shape","triangle4_1_1", {1, 1, 3, 3}, "triangleBottomRightShape")
    newShape("item","map", {1, 1, 4, 3})
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")
    newShape("door","door2_1_1", {1, 1, 3, 5}, "down")
    newShape("endPoint","endPoint1_1_1", {1, 1, 4, 5})
    newShape("door","door3_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    newShape("shape","bar1_1_2", {1, 2, 1, 1}, "bar", {"vert", 2})
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 5, 1}, "up")
    newShape("door","door3_1_2", {1, 2, 6, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle1_1_2", "flip-vertical")
    newShape("shape","triangle2_1_2", {1, 2, 1, 3}, "triangleTopLeftShape")
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,1,3},{1,2,1,2,"*"},{1,2,3,2},{1,2,5,1}})
    newShape("shape","triangle3_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1, 1})
    newShape("shape","triangle4_1_2", {1, 2, 6, 3}, "triangleTopLeftShape")
    newShape("backFire","backFire1_1_2", {1, 2, 4, 4})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,1,4},{1,2,2,4},{1,2,3,4},{1,2,4,4}})
    newShape("shape","triangle5_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    newShape("shape","triangle6_1_2", {1, 2, 3, 5}, "triangleTopLeftShape")
    newShape("shape","bar2_1_2", {1, 2, 4, 6}, "bar", {"vert", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 1, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 3, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 4, 5}, "purpleCoin")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
