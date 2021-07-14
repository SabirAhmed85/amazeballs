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
    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 1}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("manualFan", "manualFan2_1_1", {1, 1, 1, 2}, "down")
    newShape("spitter", "spitter1_1_1", {1, 1, 6, 2}, {"none", "none", "none", "left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,6,2},{1,1,6,3}})
    newShape("spitter", "spitter2_1_1", {1, 1, 4, 3, "up", "right", "none", "none"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,2,3},{1,1,4,3}})
    newShape("manualFan", "manualFan3_1_1", {1, 1, 3, 4}, "down")
    newShape("spitter", "spitter3_1_1", {1, 1, 6, 4}, {"none", "none", "down"}, "left")
    newTransition("spitter3_1_1", "slide", {}, {{1,1,6,4},{1,1,7,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 1, 5}, "right")
    newShape("manualFan", "manualFan4_1_1", {1, 1, 2, 5}, "left")
    newShape("manualFan", "manualFan5_1_1", {1, 1, 7, 5}, "left")

    --SCREEN 2-1
    newShape("spitter", "spitter1_2_1", {2, 1, 2, 1}, {"none", "right", "down", "none"})
    newShape("spitter", "spitter2_2_1", {2, 1, 4, 1, "up", "right", "down", "left"})
    newShape("spitter", "spitter3_2_1", {2, 1, 6, 1}, {"none", "none", "down", "left"})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleTopLeftShape")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 2}, "down")
    newShape("shape", "bar1_2_1", {2, 1, 4, 2}, "bar", {"horz", 3})
    newShape("spitter", "spitter4_2_1", {2, 1, 7, 2}, {"none", "right", "none", "left"})
    newTransition("spitter4_2_1", "slide", {}, {{2,1,7,2},{2,1,7,3}})
    newShape("shape", "bar2_2_1", {2, 1, 1, 3}, "bar", {"horz"})
    newShape("shape", "triangle2_2_1", {2, 1, 2, 3}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 4}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,3},{2,1,3,4}})
    newShape("shape", "triangle3_2_1", {2, 1, 4, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle4_2_1", {2, 1, 7, 4}, "triangleTopLeftShape")
    newShape("endPoint", "endPoint1_2_1", {2, 1, 1, 5})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 3, 5}, "left")
    newShape("shape", "bar3_2_1", {2, 1, 5, 5}, "bar", {"horz"})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 6, 5}, "left")
    newShape("manualFan", "manualFan3_2_1", {2, 1, 7, 5}, "down")
    newShape("shape", "bar3_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "redCoin", {1, 1, 1, 1}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 5, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 5, 1}, 140)
    newShape("item", "coins", {1, 1, 5, 4}, 75)
    newShape("item", "coins", {2, 1, 6, 4, 125})
    newShape("item", "small-present", {1, 1, 4, 5}, {})

    newShape("item", "big-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
