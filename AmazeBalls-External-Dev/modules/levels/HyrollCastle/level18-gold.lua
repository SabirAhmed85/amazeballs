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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 1}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape", "triangle5_1_1", {1, 1, 5, 4}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 2, 5}, "triangleTopRightShape")
    newShape("door", "door1_1_1", {1, 1, 5, 5}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    newShape("manualFan", "manualFan1_1_2", {1, 2, 3, 1}, "left")
    newShape("shape", "bar1_1_2", {1, 2, 5, 1}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 5, 1}, "down")
    newShape("manualFan", "manualFan3_1_2", {1, 2, 2, 2}, "right")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 2}, "down")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 1, 3}, "right")
    newShape("manualFan", "manualFan4_1_2", {1, 2, 2, 3}, "down")
    newShape("autoFan", "autoFan3_1_2", {1, 2, 5, 3}, "left")
    newShape("autoFan", "autoFan4_1_2", {1, 2, 1, 4}, "right")
    newShape("manualFan", "manualFan5_1_2", {1, 2, 3, 4}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan6_1_2", {1, 2, 6, 4}, "right")
    newShape("endPoint", "endPoint1_1_2", {1, 2, 1, 5})
    newShape("manualFan", "manualFan7_1_2", {1, 2, 2, 5}, "up")
    newShape("manualFan", "manualFan8_1_2", {1, 2, 6, 5}, "left")
    newShape("shape", "bar2_1_2", {1, 2, 2,6}, "bar", {"vert", 2})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "redCoin", {1, 2, 7, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 4, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 6, 1}, 125)
    newShape("item", "coins", {1, 1, 4, 1}, 85)
    newShape("item", "small-present", {1, 2, 1, 1}, {})


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
