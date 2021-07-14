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
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,1,2},{1,1,3,2}})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 7, 2}, "left")
    newShape("shape", "bar1_1_1", {1, 1, 1, 3}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 1, 3})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 3}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 7, 3}, "triangleTopRightShape")
    newShape("shape", "triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 5}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("shape", "triangle1_2_1", {2, 1, 3, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 6, 1}, "down")
    newShape("shape", "triangle3_2_1", {2, 1, 1, 2}, "triangleTopRightShape")
    newShape("simple", "simple1_2_1", {2, 1, 3, 2})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 7, 2}, "down")
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "triangle4_2_1", {2, 1, 4, 3}, "triangleTopLeftShape")
    newTransition("triangle4_2_1", "slide", {}, {{2,1,3,3},{2,1,4,3}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 3}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,6,3},{2,1,6,5}})
    newShape("door", "door1_2_1", {2, 1, 1, 4}, "left")
    newShape("characterChangePoint", "characterChangePoint1_2_1", {2, 1, 5, 4})
    newShape("shape", "triangle5_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("simple", "simple2_2_1", {2, 1, 3, 5})
    newTransition("simple2_2_1", "slide", {}, {{2,1,3,4},{2,1,3,5},{2,1,4,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "redCoin", {2, 1, 7, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 2, 3}, 110)
    newShape("item", "small-present", {1, 1, 7, 5}, {})

    newShape("item", "big-present", {2, 1, 5, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
