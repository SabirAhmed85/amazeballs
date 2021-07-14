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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleLeftAndRightShape", {1})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,1},{1,1,1,3}})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleBottomRightShape")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 2})
    newShape("shape", "triangle3_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,5,3},{1,1,7,3},{1,1,6,4}})
    newShape("shape", "triangle4_1_1", {1, 1, 4, 5}, "triangleTopAndBottomShape", {1})
    newTransition("triangle4_1_1", "slide", {}, {{1,1,4,5},{1,1,5,5}})

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 2, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,1,1},{2,1,2,1}})
    newShape("shape", "triangle2_2_1", {2, 1, 3, 1}, "triangleBottomRightShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,1},{2,1,4,2}})
    newShape("shape", "triangle3_2_1", {2, 1, 3, 3}, "triangleTopRightShape")
    newTransition("triangle3_2_1", "slide", {}, {{2,1,1,4},{2,1,2,3},{2,1,3,3}})
    newShape("shape", "triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")
    newTransition("triangle4_2_1", "slide", {}, {{2,1,4,3},{2,1,4,4},{2,1,6,4},{2,1,7,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 3, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 3, 4}, "purpleCoin")

    newShape("item", "coins", {1, 1, 3, 3}, 65))
    newShape("item", "coins", {2, 1, 1, 3}, 75)
    newShape("item", "small-present", {2, 1, 6, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
