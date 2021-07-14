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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 1}, "right")
    newShape("simple", "simple1_1_1", {1, 1, 4, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,4,1},{1,1,4,3},{1,1,4,4},{1,1,4,5}})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 1}, "left")
    newShape("shape", "triangle1_1_1", {1, 1, 1, 3}, "triangleBottomLeftShape", {1})
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape", "triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1})
    newShape("door", "door2_1_1", {1, 1, 7, 4}, "right")
    newShape("shape", "triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, 13})

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 7, 2}, "up")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 1, 3}, "right")
    newShape("simple", "simple1_2_1", {2, 1, 3, 3})
    newTransition("simple1_2_1", "slide", {}, {{2,1,3,3},{2,1,4,2}})
    newShape("shape", "triangle2_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle3_2_1", {2, 1, 5, 4}, "triangleBottomRightShape", {1})
    newShape("door", "door2_2_1", {2, 1, 7, 4}, "right")
    newShape("shape", "triangle4_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1})
    newShape("shape", "triangle5_2_1", {2, 1, 6, 5}, "triangleTopAndBottomShape", {1})
    newTransition("triangle5_2_1", "slide", {}, {{2,1,5,5},{2,1,6,5}})

    --SCREEN 3-1
    newShape("endPoint", "endPoint1_3_1", {3, 1, 2, 1})
    newShape("autoFan", "autoFan1_3_1", {3, 1, 5, 1}, "left")
    newShape("autoFan", "autoFan2_3_1", {3, 1, 5, 2}, "down")
    newTransition("autoFan2_3_1", "slide", {}, {{3,1,4,2},{3,1,5,2}})
    newShape("backFire", "backFire1_3_1", {3, 1, 1, 1})
    newTransition("backFire1_3_1", "slide", {"lightDarkBlue"}, {{3,1,1,1},{3,1,1,3}})
    newShape("shape", "triangle1_3_1", {3, 1, 2, 3}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("shape", "triangle2_3_1", {3, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_3_1", {3, 1, 4, 4}, "triangleTopAndBottomShape", {1})

    --GEMS
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {3, 1, 2, 4}, "purple")
    newShape("gem", "purple", {3, 1, 7, 4}, "purple")
    newShape("gem", "purple", {3, 1, 4, 1}, "purple")
    newShape("gem", "purple", {3, 1, 5, 3}, "purple")
    newShape("gem", "redCoin", {1, 1, 2, 3}, "redCoin")
    newShape("gem", "blueCoin", {3, 1, 7, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {3, 1, 3, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 4}, 100)
    newShape("item", "coins", {3, 1, 4, 5}, 100)
    newShape("item", "big-present", {3, 1, 7, 1}, {})
    newShape("item", "small-present", {2, 1, 5, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t