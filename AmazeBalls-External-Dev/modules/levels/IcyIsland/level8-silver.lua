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
    newShape("shape", "bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 2})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 1}, "left")
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 2}, "up")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 5, 2}, "left")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,5,2},{1,1,6,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 3}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,2,3},{1,1,3,3}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 6, 3}, "right")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 7, 4}, "up")
    newTransition("manualFan3_1_1", "slide", {}, {{1,1,6,4},{1,1,7,4}})
    newShape("manualFan", "manualFan4_1_1", {1, 1, 3, 5}, "up")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 4, 5}, "up")
    newShape("manualFan", "manualFan5_1_1", {1, 1, 6, 5}, "left")

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 3}, "down")
    newShape("shape", "triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "down")

    --SCREEN 2-2
    newShape("autoFan", "autoFan1_2_2", {2, 2, 1, 1}, "down")
    newShape("spitter", "spitter1_2_2", {2, 2, 3, 3}, {"none", "right", "none", "none"})
    newTransition("spitter1_2_2", "autoSlide", {timePerSquare = 600, labelled = false}, {{2,2,1,3},{2,2,3,3}})
    newShape("shape", "triangle1_2_2", {2, 2, 5, 3}, "triangleTopLeftShape")
    newTransition("triangle1_2_2", "flip-vertical")
    newShape("endPoint", "endPoint1_2_2", {2, 2, 7, 3})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 1, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 7, 3}, "purple")
    newShape("gem", "redCoin", {2, 2, 5, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 2, 6, 3}, 12)
    newShape("item", "coins", {1, 1, 6, 5}, 150)
    newShape("item", "small-present", {2, 2, 7, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
