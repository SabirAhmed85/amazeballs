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

    -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 2, 1})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 2}, "right")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 2}, "right")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,3,2},{1,1,4,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("shape", "triangle4_1_1", {1, 1, 6, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape", "bar1_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    newTransition("bar1_1_1", "autoSlide", {timePerSquare = 300, pauseTime = 100}, {{1,1,3,4},{1,1,4,4}})
    newShape("simple", "simple1_1_1", {1, 1, 1, 5})
    newShape("simple", "simple2_1_1", {1, 1, 4, 5})
    newShape("door", "door1_1_1", {1, 1, 5, 5}, "down")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 6, 5})

    -- 1-2
    newShape("shape", "bar1_1_2", {1, 2, 1, 1}, "bar", {"vert"})
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("shape", "triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "bar2_1_2", {1, 2, 7, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle3_1_2", {1, 2, 1, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, 20, "breakable"})
    newShape("shape", "triangle5_1_2", {1, 2, 2, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 3}, "down")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,3,2},{1,2,3,3}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 4, 3}, "up")
    newShape("shape", "triangle6_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "bar1_1_2", {1, 2, 4, 4}, "bar", {"vert", 3})
    newShape("shape", "triangle7_1_2", {1, 2, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle8_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "bar2_1_2", {1, 2, 5, 6}, "bar", {"vert"})
    newShape("shape", "triangle9_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")
    newTransition("triangle9_1_2", "slide", {}, {{1,2,5,5},{1,2,7,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 5, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 2, 5}, "purpleCoin")
    --ITEMS
    newShape("item", "small-present", {1, 2, 2, 4}, {})

    --newShape("item", "coins", {1, 2, 7, 1}, 250)
    --newShape("item", "something", 1, 1, 6, 4})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
