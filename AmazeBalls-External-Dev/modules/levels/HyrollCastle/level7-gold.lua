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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,2,2},{1,1,3,2}})
    newShape("item", "compass", {1, 1, 4, 2})
    newShape("simple", "simple1_1_1", {1, 1, 5, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,5,3},{1,1,5,2},{1,1,6,2}})
    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape", "triangle4_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_1", {1, 1, 3, 3}, "bar", {"vert", 3})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 4, 3})
    newShape("shape", "bar2_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    newShape("simple", "simple2_1_1", {1, 1, 1, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,1,4},{1,1,2,4}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 4}, "up")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,3,4},{1,1,3,5},{1,1,4,5}})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 4}, "up")
    newShape("item", "map", {1, 1, 2, 5})

    --SCREEN 2-1
    newShape("backFire", "backFire1_2_1", {2, 1, 1, 1})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,1,1},{2,1,1,2}})
    newShape("shape", "bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 2})
    newShape("shape", "triangle1_2_1", {2, 1, 4, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("backFire", "backFire2_2_1", {2, 1, 7, 2})
    newTransition("backFire2_2_1", "slide", {}, {{2,1,7,2},{2,1,7,4}})
    newShape("shape", "bar2_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    newShape("simple", "simple1_2_1", {2, 1, 4, 3})
    newTransition("simple1_2_1", "slide", {}, {{2,1,3,1},{2,1,3,3},{2,1,4,3}})
    newShape("door", "door1_2_1", {2, 1, 1, 4}, "left")
    newShape("shape", "bar3_2_1", {2, 1, 4, 4}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 4}, "up")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,4,4},{2,1,5,4},{2,1,5,3}})
    newShape("shape", "bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    newShape("door", "door2_2_1", {2, 1, 1, 5}, "left")
    newShape("shape", "bar5_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    newTransition("bar5_2_1", "slide", {}, {{2,1,3,4},{2,1,3,5}})
    newShape("shape", "triangle2_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "redCoin", {2, 1, 2, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 6, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 1, 5}, 60)
    newShape("item", "coins", {2, 1, 1, 4}, 90)
    newShape("item", "coins", {1, 1, 6, 5}, 14)
    newShape("item", "small-present", {1, 1, 5, 1}, {})

    newShape("item", "small-present", {2, 1, 7, 5}, {})

    newShape("item", "big-present", {2, 1, 3, 4}, {})


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
