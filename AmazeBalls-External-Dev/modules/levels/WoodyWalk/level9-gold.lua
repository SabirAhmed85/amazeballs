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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 4, 1}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle3_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,2},{1,1,5,3}})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle5_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape")
    newTransition("triangle4_1_1", "slide", {}, {{1,1,2,3},{1,1,3,3}})
    --newShape("timeOut", "timeOut1_1_1", {1, 1, 3, 5, 2})
    newShape("shape", "triangle1_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 5}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 5, 5}, "bar", {"vert", 3})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 4, 2}, "triangleTopAndBottomShape", {1})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,4,2},{1,2,5,2},{1,2,6,2}})
    newShape("shape", "triangle2_1_2", {1, 2, 2, 3}, "triangleTopAndBottomShape", {2})
    newTransition("triangle2_1_2", "slide", {}, {{1,2,2,3},{1,2,4,3}})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 4}, "triangleTopAndBottomShape", {1})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,1,4},{1,2,2,4},{1,2,3,4}})
    newShape("backFire", "backFire1_1_2", {1, 2, 6, 4})

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 1, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 3, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 7, 2}, "purpleCoin")

    newShape("item", "coins", {1, 1, 2, 1}, 170)
    newShape("item", "coins", {1, 1, 6, 4}, 70)
    newShape("item", "coins", {1, 2, 5, 5}, 60)
    newShape("item", "coins", {1, 2, 7, 4}, 130)
    newShape("item", "small-present", {1, 2, 6, 5}, {})

    newShape("item", "big-present", {1, 1, 2, 5}, {})

    newShape("item", "small-present", {1, 2, 1, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
