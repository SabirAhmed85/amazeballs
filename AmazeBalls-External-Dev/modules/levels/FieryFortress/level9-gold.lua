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
    newShape("backFire", "backFire1_1_1", {1, 1, 1, 1})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 1}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 4, 1}, "right")
    newShape("shape", "bar2_1_1", {1, 1, 4, 2}, "bar", {"vert", 3})
    newShape("shape", "bar3_1_1", {1, 1, 6, 1}, "bar", {"vert", 4})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 6, 1})
    newShape("shape", "triangle1_1_1", {1, 1, 1, 2}, "triangleTopRightShape")
    newShape("shape", "triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("item", "map", {1, 1, 5, 2})
    newShape("shape", "triangle4_1_1", {1, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar4_1_1", {1, 1, 6, 3}, "bar", {"vert", 3})
    newShape("simple", "simple1_1_1", {1, 1, 7, 3})
    newShape("shape", "triangle6_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle7_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("shape", "triangle8_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door", "door1_1_1", {1, 1, 2, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 4, 5}, "down")
    newShape("shape", "triangle9_1_1", {1, 1, 6, 5}, "triangleTopRightShape")
    newTransition("triangle9_1_1", "slide", {}, {{1,1,5,5},{1,1,6,5}})
    newShape("backFire", "backFire2_1_1", {1, 1, 7, 5})

    -- 1-2
    newShape("door", "door1_1_2", {1, 2, 3, 1}, "up")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 1}, "up")
    newShape("simple", "simple1_1_2", {1, 2, 5, 1})
    newShape("shape", "triangle1_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    newShape("simple", "simple2_1_2", {1, 2, 2, 2})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 4, 2}, "down")
    newTransition("autoFan2_1_2", "autoSlide", {timePerSquare = 400, pauseTime = 0, labelled = false}, {{1,2,4,1},{1,2,4,2}})
    newShape("shape", "bar1_1_2", {1, 2, 6, 2}, "bar", {"horz", 4})
    newTransition("bar1_1_2", "autoSlide", {timePerSquare = 400, pauseTime = 0}, {{1,2,6,1},{1,2,6,2},{1,2,6,3}})
    newShape("simple", "simple3_1_2", {1, 2, 6, 2})
    newTransition("simple3_1_2", "slide", {}, {{1,2,6,1},{1,2,6,2}})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 3, 3}, "right")
    newTransition("autoFan3_1_2", "autoSlide", {timePerSquare = 400, pauseTime = 0, labelled = false}, {{1,2,2,3},{1,2,3,3}})
    newShape("simple", "simple4_1_2", {1, 2, 5, 3})
    newShape("shape", "triangle2_1_2", {1, 2, 7, 3}, "triangleTopLeftShape")
    newShape("shape", "triangle3_1_2", {1, 2, 2, 5}, "triangleTopRightShape")
    newShape("shape", "triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "redCoin", {1, 2, 4, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 2, 1}, "purpleCoin")

    newShape("item", "coins", {1, 1, 5, 3}, 75)
    newShape("item", "big-present", {1, 1, 6, 3}, {})

    newShape("item", "small-present", {1, 2, 2, 4}, {})

    newShape("item", "coins", {1, 1, 1, 3, 210}) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
