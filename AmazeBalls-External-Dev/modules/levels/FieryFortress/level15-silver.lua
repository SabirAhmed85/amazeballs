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
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,1},{1,1,2,2}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 1}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("door", "door2_1_1", {1, 1, 7, 2}, "right")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 3}, "right")
    newShape("item", "map", {1, 1, 6, 3})
    newShape("door", "door3_1_1", {1, 1, 7, 3}, "right")
    newShape("simple", "simple1_1_1", {1, 1, 4, 4})
    newTransition("simple1_1_1", "slide", {}, {{1,1,2,4},{1,1,3,4},{1,1,4,4}})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 4, 5}, "up")
    newShape("shape", "triangle2_1_1", {1, 1, 6, 5}, "triangleTopLeftShape")

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, 7})
    newShape("shape", "triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,4,2},{2,1,5,2}})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 3}, "up")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 4, 4}, "right")
    newShape("endPoint", "endPoint1_2_1", {2, 1, 7, 4})
    newShape("shape", "triangle3_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 9})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 3, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 4, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 6, 3}, 150)
    newShape("item", "coins", {1, 1, 1, 3}, 250)
    newShape("item", "coins", {2, 1, 5, 4}, 90)
    newShape("item", "small-present", {2, 1, 7, 2}, {})

    newShape("item", "small-present", {2, 1, 2, 2}, {})

    newShape("item", "big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t