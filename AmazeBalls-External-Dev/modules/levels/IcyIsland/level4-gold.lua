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
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,1},{1,1,5,2,"*"},{1,1,6,2}})
    newShape("shape", "triangle3_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle4_1_1", {1, 1, 4, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle5_1_1", {1, 1, 1, 3}, "triangleLeftAndRightShape", {1})
    newShape("shape", "triangle6_1_1", {1, 1, 4, 3}, "triangleTopRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 7, 4}, "bar", {"horz", 2})
    newShape("door", "door2_1_1", {1, 1, 7, 4}, "right")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 5})
    newShape("shape", "bar2_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 2, 1}, "triangleTopLeftShape", {1, 6})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,1},{2,1,2,2}})
    newShape("shape", "triangle2_2_1", {2, 1, 7, 1}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,3},{2,1,4,2},{2,1,4,1,"*"},{2,1,7,1}})
    newShape("door", "door2_2_1", {2, 1, 1, 2}, "left")
    newShape("shape", "triangle3_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    newShape("shape", "triangle4_2_1", {2, 1, 7, 2}, "triangleTopRightShape")
    newShape("shape", "triangle5_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_2_1", {2, 1, 5, 4}, "bar", {"horz", 2})
    newShape("door", "door2_2_1", {2, 1, 1, 5}, "left")
    newShape("shape", "triangle6_2_1", {2, 1, 2, 5}, "triangleBottomLeftShape")
    newShape("characterChangePoint", "characterChangePoint1_2_1", {2, 1, 6, 5})
    newShape("shape", "triangle7_2_1", {2, 1, 7, 5}, "triangleBottomRightShape")
    newTransition("triangle7_2_1", "slide", {}, {{2,1,7,3},{2,1,7,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "redCoin", {1, 1, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 1, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 3, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 4}, 125)
    newShape("item", "coins", {1, 1, 2, 5}, 85)
    newShape("item", "small-present", {2, 1, 4, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
