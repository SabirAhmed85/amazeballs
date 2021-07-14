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
    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 1})
    newShape("item", "map", {1, 1, 5, 2})
    newShape("shape", "triangle1_1_1", {1, 1, 7, 2}, "triangleTopRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,7,2},{1,1,7,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 3}, "up")
    newShape("shape", "bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 3})
    newTransition("bar1_1_1", "slide", {}, {{1,1,8,3},{1,1,8,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 4}, "down")
    newShape("shape", "triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape")
    newShape("door", "door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape")
    newShape("tunnel", "tunnel1_2_1", {2, 1, 7, 1, 1, 1, 5, 1}, "down")
    newShape("simple", "simple1_2_1", {2, 1, 2, 2}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,2},{2,1,5,2},{2,1,7,2}})
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "triangle3_2_1", {2, 1, 1, 5}, "triangleTopRightShape")
    newShape("shape", "bar1_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    newShape("shape", "bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 3})
    newShape("shape", "bar3_2_1", {2, 1, 4, 5}, "bar", {"horz", 3})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 4, 5}, "left")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,4,5},{2,1,5,5}})
    newShape("shape", "triangle4_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle4_2_1", "slide", {}, {{2,1,5,3},{2,1,6,3},{2,1,6,5}})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    newShape("characterChangePoint", "characterChangePoint1_1_2", {1, 2, 7, 1})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 2}, "left")
    newShape("door", "door1_1_2", {1, 2, 7, 2}, "right")
    newShape("shape", "triangle2_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    newTransition("triangle2_1_2", "slide", {}, {{1,2,5,3},{1,2,5,4},{1,2,5,5}})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 3, 4}, "left")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,2,4},{1,2,3,4}})
    newShape("simple", "simple1_1_2", {1, 2, 6, 4})
    newTransition("simple1_1_2", "slide", {}, {{1,2,6,1},{1,2,6,2},{1,2,6,4}})
    newShape("door", "door2_1_2", {1, 2, 7, 4}, "right")
    newShape("shape", "triangle4_1_2", {1, 2, 1, 5}, "triangleTopLeftShape", {1, 6, "breakable"})

    --SCREEN 2-2
    newShape("tunnel", "tunnel1_2_2", {2, 2, 2, 1, 2, 1, 1, 2}, "right")
    newShape("shape", "bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 3})
    newShape("door", "door2_2_2", {2, 2, 6, 1}, "up")
    newShape("shape", "triangle1_2_2", {2, 2, 2, 2}, "triangleTopRightShape")
    newShape("shape", "triangle2_2_2", {2, 2, 4, 2}, "triangleTopRightShape")
    newTransition("triangle2_2_2", "slide", {}, {{2,2,4,1},{2,2,4,2}})
    newShape("shape", "triangle3_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, 2, "hyroll"})
    newShape("shape", "triangle4_2_2", {2, 2, 2, 4}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "triangle5_2_2", {2, 2, 4, 4}, "triangleTopRightShape")
    newTransition("triangle5_2_2", "slide", {}, {{2,2,4,4},{2,2,4,5}})
    newShape("shape", "triangle6_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 2}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 7, 1}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "redCoin", {2, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 3, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 5, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 2}, 70)
    newShape("item", "coins", {1, 2, 3, 3}, 65)
    newShape("item", "coins", {2, 1, 3, 3}, 150)
    newShape("item", "coins", {2, 1, 3, 1}, 110)
    newShape("item", "small-present", {1, 2, 6, 5}, {})

    newShape("item", "small-present", {2, 2, 6, 3}, {})

    newShape("item", "big-present", {1, 1, 5, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
