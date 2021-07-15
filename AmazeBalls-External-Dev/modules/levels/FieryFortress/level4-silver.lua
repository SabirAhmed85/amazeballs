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
    newShape("shape", "triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape", {1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 2}, "right")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 2})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 3}, "triangleTopAndBottomShape", {1})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,3,3},{1,1,4,3}})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 4}, "triangleTopAndBottomShape", {2})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 2, 1}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,1,1},{1,2,2,1}})
    newShape("shape", "triangle1_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,6,1},{1,2,7,1}})
    newShape("shape", "triangle2_1_2", {1, 2, 3, 3}, "triangleTopRightShape", {1})
    newTransition("triangle2_1_2", "slide", {}, {{1,2,3,3},{1,2,4,3}})
    newShape("shape", "triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1})
    newTransition("triangle4_1_2", "slide", {}, {{1,2,1,5},{1,2,2,5}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 7, 5}, "left")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,6,5},{1,2,7,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "redCoin", {1, 2, 4, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 3, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 5, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 4}, 75)
    newShape("item", "coins", {1, 1, 5, 1}, 125)
    newShape("item", "coins", {1, 1, 1, 3}, 75)
    newShape("item", "small-present", {1, 2, 1, 3}, {})


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
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t