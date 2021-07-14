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
    newShape("shape", "bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 4})
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1})
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("shape", "bar2_1_1", {1, 1, 5, 1}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 5, 1}, "down")
    newShape("shape", "triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1})
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("simple", "simple1_1_1", {1, 1, 6, 2})
    newShape("shape", "triangle4_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1})
    newTransition("triangle4_1_1", "flip-vertical")
    newShape("shape", "triangle5_1_1", {1, 1, 1, 4}, "triangleTopLeftShape", {1})
    newTransition("triangle5_1_1", "flip-horizontal")
    newShape("shape", "bar3_1_1", {1, 1, 2, 5}, "bar", {"vert", 2})
    newShape("shape", "bar4_1_1", {1, 1, 3, 5}, "bar", {"vert", 2})
    newShape("shape", "triangle6_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1})
    newTransition("triangle6_1_1", "flip-horizontal")
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 1})
    newShape("backFire", "backFire1_1_2", {1, 2, 5, 2})
    newTransition("backFire1_1_2", "autoSlide", {timePerSquare = 300, pauseTime = 40}, {{1,2,2,2},{1,2,5,2}})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 2, 4}, "right")
    newShape("shape", "triangle1_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 7, 4}, "up")
    newShape("door", "door1_1_2", {1, 2, 2, 1}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 2, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 6, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 4, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 4, 1}, 70)
    newShape("item", "coins", {1, 2, 7, 2}, 150)
    newShape("item", "small-present", {1, 2, 6, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
