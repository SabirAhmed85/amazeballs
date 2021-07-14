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
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_1", {1, 1, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 3, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle7_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle8_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle9_1_1", {1, 1, 2, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle10_1_1", {1, 1, 4, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle11_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle12_1_1", {1, 1, 7, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle13_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle14_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")
    newShape("shape", "triangle15_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-2
    newShape("manualFan", "manualFan1_1_2", {1, 2, 4, 1}, "down")
    newShape("manualFan", "manualFan2_1_2", {1, 2, 2, 2}, "right")
    newShape("manualFan", "manualFan3_1_2", {1, 2, 4, 2}, "up")
    newShape("shape", "bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    newShape("item", "big-present", {1, 2, 7, 2}, {})

    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 3}, "right")
    newShape("shape", "bar2_1_2", {1, 2, 4, 3}, "bar", {"vert", 3})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 5, 3}, "down")
    newShape("shape", "triangle1_1_2", {1, 2, 6, 3}, "triangleBottomRightShape")
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 3})
    newShape("manualFan", "manualFan4_1_2", {1, 2, 1, 4}, "right")
    newShape("manualFan", "manualFan5_1_2", {1, 2, 2, 4}, "left")
    newShape("autoFan", "autoFan3_1_2", {1, 2, 3, 4}, "up")
    newShape("manualFan", "manualFan6_1_2", {1, 2, 4, 4}, "right")
    newShape("manualFan", "manualFan7_1_2", {1, 2, 7, 4}, "down")
    newShape("shape", "bar3_1_2", {1, 2, 8, 4}, "bar", {"horz", 4})
    newShape("simple", "simple1_1_2", {1, 2, 2, 5})
    newShape("shape", "bar4_1_2", {1, 2, 4, 5}, "bar", {"horz", 4})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 5, 5}, "right")
    newShape("autoFan", "autoFan5_1_2", {1, 2, 6, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 7, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 1, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 2}, 50)
    newShape("item", "coins", {1, 1, 3, 5, 125})
    newShape("item", "small-present", {1, 1, 5, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
