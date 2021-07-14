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
    newShape("shape","triangle1_1_1", {1, 1, 4, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape","bar1_1_1", {1, 1, 5, 2}, "bar", {"vert", 3})
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("gem","redCoin", {1, 1, 2, 3}, "redCoin")
    newShape("shape","triangle2_1_1", {1, 1, 6, 3}, "triangleTopRightShape", {1, 10, "breakable"})

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 1}, "up")
    newShape("simple","simple1_2_1", {2, 1, 2, 2})
    newShape("shape","triangle1_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape","triangle2_2_1", {2, 1, 7, 3}, "triangleBottomRightShape", {1, _})
    newShape("shape","triangle3_2_1", {2, 1, 1, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("shape","triangle5_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle6_2_1", {2, 1, 7, 4}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("door","door1_2_1", {2, 1, 7, 4}, "right")

    --SCREEN 3-1
    newShape("autoFan","autoFan1_3_1", {3, 1, 4, 1}, "down")
    newShape("shape","triangle1_3_1", {3, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan2_3_1", {3, 1, 4, 2}, "down")
    newShape("shape","triangle2_3_1", {3, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("autoFan","autoFan3_3_1", {3, 1, 4, 3}, "down")
    newShape("shape","triangle3_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape", {1, _})
    newShape("shape","triangle4_3_1", {3, 1, 1, 4}, "triangleBottomLeftShape")
    newShape("endPoint","endPoint1_3_1", {3, 1, 4, 4})
    newShape("shape","triangle5_3_1", {3, 1, 1, 5}, "triangleTopRightShape")
    newShape("simple","simple1_3_1", {3, 1, 3, 5})
    newShape("autoFan","autoFan4_2_2", 3, 1, 5, 5}, "up")
    newTransition("autoFan4_2_2", "autoSlide", {timePerSquare = 600, pauseTime = 0}, {{3,1,5,5},{3,1,6,5},{3,1,7,5}})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 3, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 5, 1}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("item","map", {1, 2, 4, 2})
    newShape("shape","triangle3_1_2", {1, 2, 3, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
