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
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape", {1})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,1},{1,1,3,1}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 1, 2}, "right")
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, 2})
    newShape("shape", "triangle4_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1})
    newTransition("triangle4_1_1", "slide", {}, {{1,1,3,3},{1,1,3,4}})
    newShape("item", "map", {1, 1, 4, 3})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 4}, "down")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,1,4},{1,1,2,2}})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 7, 4}, "down")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 2, 5}, "down")
    newShape("simple", "simple1_1_1", {1, 1, 4, 5})
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,5},{1,1,4,5},{1,1,6,5}})
    newShape("door", "door3_1_1", {1, 1, 5, 5}, "down")
    newShape("door", "door4_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,1},{1,2,2,1}})
    newShape("simple", "simple1_1_2", {1, 2, 4, 1})
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 3}, "up")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,6,1},{1,2,6,3}})
    newShape("door", "door2_1_2", {1, 2, 6, 1}, "up")
    newShape("shape", "triangle2_1_2", {1, 2, 2, 2}, "triangleBottomLeftShape", {1, 4})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 2}, "triangleBottomRightShape", {1})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,3,2},{1,2,5,2}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 7, 2}, "left")
    newShape("autoFan", "autoFan3_1_2", {1, 2, 1, 3}, "right")
    newShape("shape", "triangle4_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 4, 4}, "up")
    newShape("shape", "triangle5_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 6, 4})
    newShape("shape", "triangle6_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle7_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle8_1_2", {1, 2, 5, 5}, "triangleBottomRightShape", {1})

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "redCoin", {1, 2, 3, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 5, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 2, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 5, 3}, 90)
    newShape("item", "coins", {1, 1, 4, 1}, 50)
    newShape("item", "small-present", {1, 2, 3, 3}, {})

    newShape("item", "big-present", {1, 2, 7, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t