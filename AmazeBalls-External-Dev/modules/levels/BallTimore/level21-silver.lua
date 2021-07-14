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
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 3}, "right")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,1,2},{1,1,1,3}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 2}, "left")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 2})
    newShape("shape", "bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 4})
    newShape("shape", "triangle1_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("shape", "bar2_1_1", {1, 1, 7, 4}, "bar", {"vert", 3})
    newShape("door", "door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("door", "door1_1_2", {1, 2, 7, 1}, "up")
    newShape("shape", "triangle2_1_2", {1, 2, 2, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("item", "map", {1, 2, 2, 4})
    newShape("shape", "triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})

    --GEMS
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "redCoin", {1, 2, 2, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 2, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 2}, 150)
    newShape("item", "small-present", {1, 1, 3, 5}, {})

    newShape("item", "small-present", {1, 2, 6, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
