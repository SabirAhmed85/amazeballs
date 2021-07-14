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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 2}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 2}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,5},{1,1,4,5}})
    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right")

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 1}, "down")
    newShape("shape", "triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 7, 1})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 3, 2}, "down")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 2}, "down")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,5,2},{2,1,6,2}})
    newShape("door", "door2_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 4}, "triangleBottomLeftShape", {1})
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,4},{2,1,4,4}})
    newShape("shape", "triangle3_2_1", {2, 1, 7, 4}, "triangleTopRightShape", {1})
    newShape("shape", "triangle4_2_1", {2, 1, 3, 5}, "triangleTopLeftShape", {1, 6})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 4, 5}, "down")
    newShape("shape", "triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple1_2_1", {2, 1, 7, 5})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "redCoin", {1, 1, 1, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 4, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 4, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 5}, 75)
    newShape("item", "coins", {2, 1, 6, 5}, 75)
    --newShape("item", "small-present", {1, 1, 4, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t