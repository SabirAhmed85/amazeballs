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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 1}, "right")
    newShape("shape", "triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 3}, "left")
    newShape("manualFan", "manualFan2_1_1", {1, 1, 5, 3}, "down")
    newTransition("manualFan2_1_1", "slide", {}, {{1,1,4,4},{1,1,4,3},{1,1,5,3}})
    newShape("shape", "triangle4_1_1", {1, 1, 7, 3}, "triangleTopRightShape")
    newShape("shape", "triangle5_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    newShape("shape", "triangle6_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape")
    newShape("shape", "triangle7_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 4}, "down")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 1, 5}, "up")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 5, 5}, "left")
    newShape("shape", "bar2_1_1", {1, 1, 7, 5}, "bar", {"horz", 3})
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 2-1
    newShape("door", "door1_1_2", {1, 2, 1, 1}, "up")
    newShape("manualFan", "manualFan1_1_2", {1, 2, 2, 1}, "up")
    newShape("manualFan", "manualFan2_1_2", {1, 2, 4, 1}, "right")
    newShape("manualFan", "manualFan3_1_2", {1, 2, 6, 1}, "down")
    newShape("manualFan", "manualFan4_1_2", {1, 2, 4, 2}, "down")
    newTransition("manualFan4_1_2", "slide", {}, {{1,2,4,2},{1,2,4,3}})
    newShape("manualFan", "manualFan5_1_2", {1, 2, 6, 3}, "left")
    newShape("manualFan", "manualFan6_1_2", {1, 2, 1, 4}, "up")
    newShape("manualFan", "manualFan7_1_2", {1, 2, 4, 4}, "right")
    newShape("shape", "bar1_1_2", {1, 2, 6, 4}, "bar", {"vert", 2})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 4}, "left")
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 4})
    newShape("shape", "bar2_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    newShape("shape", "triangle1_1_2", {1, 2, 2, 5}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_1_2", {1, 2, 7, 5}, "triangleBottomRightShape", {1, 8})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "redCoin", {1, 2, 6, 2}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 7, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 2, 3}, 85)
    newShape("item", "coins", {1, 1, 3, 5, 125})
    newShape("item", "small-present", {1, 2, 3, 4}, {})

    newShape("item", "big-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
