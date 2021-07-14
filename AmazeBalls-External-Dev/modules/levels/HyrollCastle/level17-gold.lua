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
    newShape("item", "map", {1, 1, 3, 1})
    newShape("backFire", "backFire1_1_1", {1, 1, 5, 1})
    newShape("shape", "bar1_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 1}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 2}, "right")
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 7, 2})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 3})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 5, 2}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 6, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 7, 4}, "down")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 1, 5}, "up")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 5, 5}, "left")
    newShape("shape", "bar2_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 7, 1}, "down")
    newShape("shape", "triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle3_1_2", {1, 2, 7, 2}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle4_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape")
    newShape("backFire", "backFire1_1_2", {1, 2, 5, 3})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,5,3},{1,2,5,5}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 1, 4}, "right")
    newShape("door", "door2_1_2", {1, 2, 7, 4}, "right")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 1, 1}, "left")
    newShape("shape", "bar1_2_2", {2, 2, 2, 1}, "bar", {"horz"})
    newShape("shape", "triangle1_2_2", {2, 2, 4, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_2_2", {2, 2, 2, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("shape", "bar2_2_2", {2, 2, 4, 2}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 2}, "right")
    newTransition("autoFan1_2_2", "slide", {}, {{2,2,4,2},{2,2,6,2},{2,2,6,3}})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 3, 3}, "up")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,3,1},{2,2,3,2},{2,2,3,3}})
    newShape("shape", "triangle3_2_2", {2, 2, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("door", "door2_2_2", {2, 2, 1, 5}, "left")
    newShape("autoFan", "autoFan3_2_2", {2, 2, 3, 5}, "left")

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 2, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 6, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 7, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 2, 2, 345})
    newShape("item", "coins", {2, 2, 1, 1}, 85)
    newShape("item", "big-present", {1, 1, 4, 4}, {})
    newShape("item", "small-present", {1, 2, 2, 5}, {})
    newShape("item", "small-present", {1, 1, 5, 3}, {})
    newShape("item", "small-present", {2, 2, 2, 1}, {})
    newShape("item", "hook", {2, 2, 4, 3}, {})
    newShape("item", "bomb", {1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
