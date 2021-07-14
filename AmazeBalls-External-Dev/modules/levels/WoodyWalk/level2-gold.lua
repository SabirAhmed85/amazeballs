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
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"horz", 2})
    newTransition("bar1_1_2", "slide", {}, {{1,1,5,1},{1,1,5,5}})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 5, 2})
    newShape("shape", "triangle1_1_1", {1, 1, 3, 4}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,1},{1,1,3,4}})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,4},{1,1,6,1}})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 5}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,3,5},{1,1,4,5}})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 5}, "triangleTopLeftShape")

    -- SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 6, 1}, "triangleTopLeftShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,3,4},{1,2,3,3,"*"},{1,2,4,3},{1,2,4,2,"*"},{1,2,6,2},{1,2,6,1}})
    newShape("shape", "bar1_1_2", {1, 2, 2, 3}, "bar", {"horz", 2})
    newTransition("bar1_1_2", "slide", {}, {{1,2,2,3},{1,2,2,4}})
    newShape("shape", "triangle2_1_2", {1, 2, 4, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle3_1_2", {1, 2, 5, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle4_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    newTransition("triangle4_1_2", "slide", {}, {{1,2,1,5},{1,2,2,5}})
    newShape("shape", "triangle5_1_2", {1, 2, 6, 5}, "triangleBottomRightShape")
    newTransition("triangle5_1_2", "slide", {}, {{1,2,3,5},{1,2,6,5}})
    newShape("door", "door1_1_2", {1, 2, 2, 1}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 5, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 5, 1}, "purpleCoin")

    newShape("item", "coins", {1, 2, 2, 4}, 65))
    newShape("item", "coins", {1, 2, 1, 2}, 180)
    newShape("item", "small-present", {1, 2, 1, 4}, {})

    newShape("item", "coins", {1, 1, 4, 2}, 110)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
