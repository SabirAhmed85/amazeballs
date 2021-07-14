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
    newShape("simple", "simple1_1_1", {1, 1, 5, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,5,1},{1,1,5,4}})
    newShape("shape", "triangle1_1_1", {1, 1, 2, 2}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,2},{1,1,2,1,"*"},{1,1,4,1}})
    newShape("shape", "triangle2_1_1", {1, 1, 1, 3}, "triangleBottomRightShape")
    newShape("shape", "bar1_1_1", {1, 1, 2, 3}, "bar", {"vert", 2})
    newShape("simple", "simple2_1_1", {1, 1, 4, 3})
    newTransition("simple2_1_1", "slide", {}, {{1,1,4,2},{1,1,4,3},{1,1,4,4}})
    newShape("shape", "bar2_1_1", {1, 1, 1, 4}, "bar", {"horz", 4})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 1})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,1,5},{1,1,2,5},{1,1,7,1}})
    newShape("door", "door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 2-1
    newShape("shape", "triangle1_1_2", {1, 2, 4, 1}, "triangleTopRightShape", {1, 1})
    newShape("shape", "triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_1_2", {1, 2, 4, 2})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,3,2},{1,2,4,2},{1,2,4,3},{1,2,4,4}})
    newShape("simple", "simple1_1_2", {1, 2, 7, 2})
    newShape("shape", "bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    newShape("shape", "triangle3_1_2", {1, 2, 2, 3}, "triangleBottomRightShape", {1, 8, "breakable"})
    --newShape("simple", "simple2_1_2", {1, 2, 6, 3})
    --newTransition("simple2_1_2", "autoSlide", {timePerSquare = 300, pauseTime = 40, labelled = false}, {{1,2,6,3},{1,2,6,5}})
    newShape("shape", "triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    newShape("shape", "triangle5_1_2", {1, 2, 3, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle6_1_2", {1, 2, 1, 5}, "triangleBottomRightShape", {1, 8})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 4, 5})
    newShape("shape", "bar2_1_2", {1, 2, 4, 6}, "bar", {"vert"})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 2, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 3, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 1, 2}, "purpleCoin")

    newShape("item", "coins", {1, 1, 3, 4, 195})
    newShape("item", "coins", {1, 2, 5, 3}, 75)
    newShape("item", "small-present", {1, 1, 1, 1}, {})

    newShape("item", "big-present", {1, 2, 1, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
