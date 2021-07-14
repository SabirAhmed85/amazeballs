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
    newShape("shape", "bar1_1_1", {1, 1, 7, 1}, "bar", {"horz"})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 2}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 2}, "down")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 1, 3}, "up")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,1,3},{1,1,2,3}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 3}, "up")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 7, 3}, "left")
    newShape("shape", "triangle1_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan5_1_1", {1, 1, 5, 4}, "down")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 6, 4})
    newShape("autoFan", "autoFan6_1_1", {1, 1, 7, 4}, "up")
    newTransition("autoFan6_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("backFire", "backFire1_1_1", {1, 1, 2, 5})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,5},{1,1,2,5},{1,1,3,5}})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 5}, "triangleTopRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 6, 1}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 2, 2}, "left")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 4, 2}, "right")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,4,2},{2,1,6,3}})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 7, 2}, "down")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 2, 3}, "down")
    newShape("autoFan", "autoFan4_2_1", {2, 1, 3, 4}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 6, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "redCoin", {2, 1, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 6, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 2}, 80)
    newShape("item", "small-present", {2, 1, 2, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
