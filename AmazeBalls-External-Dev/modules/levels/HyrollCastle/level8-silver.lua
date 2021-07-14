local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end

   --SCREEN 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,5,1},{1,1,6,1},{1,1,7,1}})
    newShape("shape", "bar1_1_1", {1, 1, 2, 2}, "bar", {"horz", 3})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "triangle3_2_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 2, 3})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 4}, "up")
    newShape("shape", "triangle5_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 5}, "left")
    newShape("manualFan", "manualFan2_1_1", {1, 1, 6, 5}, "up")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "down")
    newShape("door", "door2_2_1", {2, 1, 1, 2}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 5, 2}, "left")
    newTransition("manualFan1_2_1", "slide", {}, {{2,1,5,2},{2,1,6,3}})
    newShape("door", "door3_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 1, 4}, "right")
    newShape("characterChangePoint", "characterChangePoint1_2_1", {2, 1, 2, 4})
    newShape("shape", "triangle3_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle4_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 1, 5}, "up")

    --GEMS    
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 1, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 7, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 1, 2}, 150)
    newShape("item", "coins", {2, 1, 5, 4}, 90)
    newShape("item", "coins", {2, 1, 3, 1}, 45)
    newShape("item", "small-present", {2, 1, 7, 3}, {})

    newShape("item", "big-present", {1, 1, 2, 5}, {})


end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
