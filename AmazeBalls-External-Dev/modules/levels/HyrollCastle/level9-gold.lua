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
    newShape("shape", "triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 2}, "down")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 5, 3})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 4, 4}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 4, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 1}, "up")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,1,1},{2,1,1,2}})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 1}, "down")
    newShape("shape", "bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 6, 1}, "left")
    newShape("door", "door2_2_1", {2, 1, 1, 2}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape")
    newShape("door", "door3_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "bar2_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle2_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 4, 4}, "up")
    newShape("shape", "triangle3_2_1", {2, 1, 1, 5}, "triangleTopLeftShape", {1, 5})
    newShape("shape", "triangle4_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "redCoin", {2, 1, 3, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 7, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 6, 3}, 70)
    newShape("item", "small-present", {2, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
