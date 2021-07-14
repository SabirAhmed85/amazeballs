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
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "triangle3_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 2}, "down")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 2}, "left")
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 6, 3})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 4}, "left")
    newShape("shape", "triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape", {1, 1})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 5, 4}, "up")
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,1},{1,2,3,1}})
    newShape("shape", "bar1_1_2", {1, 2, 3, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle2_1_2", {1, 2, 4, 1}, "triangleTopAndBottomShape", {1})
    newShape("door", "door1_1_2", {1, 2, 6, 1}, "up")
    newShape("shape", "bar2_1_2", {1, 2, 8, 1}, "bar", {"horz", 2})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "slide", {}, {{1,2,1,2},{1,2,1,3}})
    newShape("simple", "simple1_1_2", {1, 2, 2, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,2},{1,2,4,2},{1,2,6,2}})
    newShape("shape", "bar3_1_2", {1, 2, 6, 2}, "bar", {"vert"})
    newShape("shape", "triangle4_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape", "bar4_1_2", {1, 2, 7, 2}, "bar", {"vert"})
    newShape("shape", "triangle5_1_2", {1, 2, 4, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape", "bar5_1_2", {1, 2, 8, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle6_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape")
    newShape("shape", "triangle7_1_2", {1, 2, 2, 4}, "triangleTopRightShape", {1, 1})
    newShape("shape", "triangle8_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape")
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 4})
    newShape("shape", "triangle9_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    newTransition("triangle8_1_2", "slide", {}, {{1,2,2,5},{1,2,3,5}})
    newShape("shape", "triangle10_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar6_1_2", {1, 2, 4, 6}, "bar", {"vert", 3})
    newShape("shape", "bar7_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    newTransition("bar7_1_2", "slide", {}, {{1,2,5,6},{1,2,6,6}})

    --GEMS
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 3, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 5, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 3, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 7, 2}, 80)
    newShape("item", "coins", {1, 1, 6, 5}, 150)
    newShape("item", "coins", {1, 2, 1, 5}, 50)
    newShape("item", "coins", {1, 2, 3, 3}, 20)
    newShape("item", "small-present", {1, 1, 4, 5}, {})

    newShape("item", "big-present", {1, 2, 7, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
