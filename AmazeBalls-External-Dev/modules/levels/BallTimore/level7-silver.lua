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
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 1}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 1, 2}, "left")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,2},{1,1,2,1,"*"},{1,1,3,1}})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,3,2},{1,1,4,2}})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 5, 2}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 1, 3}, "bar", {"horz"})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 3, 3}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 4, 3}, "triangleTopLeftShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,4,3},{1,1,4,5}})
    newShape("manualFan", "manualFan3_1_1", {1, 1, 7, 3}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 1, 4}, "down")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,1,4},{1,1,1,3,"*"},{1,1,2,3}})
    newShape("tunnel", "tunnel1_1_1", {1, 1, 2, 4, 1, 1, 6, 2, "none"})
    newShape("manualFan", "manualFan4_1_1", {1, 1, 3, 4}, "up")
    newShape("shape", "triangle4_1_1", {1, 1, 6, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan", "manualFan5_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 2, 1}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape", "triangle3_2_1", {2, 1, 3, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape", "bar1_2_1", {2, 1, 3, 3}, "bar", {"horz"})
    newShape("shape", "triangle4_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape", "bar2_2_1", {2, 1, 6, 3}, "bar", {"horz"})
    newShape("shape", "triangle5_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 4, 5})

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 2, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 5, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 5, 1}, 160)
    newShape("item", "coins", {1, 1, 5, 4}, 180)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
