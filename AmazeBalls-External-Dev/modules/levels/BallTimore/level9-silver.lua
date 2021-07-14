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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 1, 1}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 1}, "down")
    newShape("manualFan", "manualFan2_1_1", {1, 1, 7, 1}, "up")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 2, 2}, "triangleTopAndBottomShape", {2})
    newTransition("triangle1_1_1", "flip-vertical")
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape")
    newTransition("triangle2_1_1", "flip-vertical")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 7, 2}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 1, 3}, "triangleLeftAndRightShape", {2})
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("shape", "bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan4_1_1", {1, 1, 5, 4}, "down")
    newShape("shape", "triangle4_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "bar2_1_1", {1, 1, 6, 4}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 4}, "right")
    newShape("manualFan", "manualFan5_1_1", {1, 1, 4, 5}, "down")
    newTransition("manualFan5_1_1", "slide", {}, {{1,1,1,5},{1,1,4,5}})
    newShape("simple", "simple1_1_1", {1, 1, 6, 5})
    newShape("shape", "bar3_1_1", {1, 1, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("spitter", "spitter1_2_1", {2, 1, 1, 1}, {"none", "right", "none", "none"})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 1}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,1},{2,1,4,1},{2,1,6,1}})
    newShape("gun", "gun1_2_1", {2, 1, 2, 2}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 1, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 4, 5}, "down")

    --SCREEN 2-2
    newShape("spitter", "spitter1_2_2", {2, 2, 4, 1}, {"none", "right", "none", "left"})
    newShape("shape", "triangle1_2_2", {2, 2, 5, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("spitter", "spitter2_2_2", {2, 2, 7, 2}, {"none", "none", "none", "left"})
    newTransition("spitter2_2_2", "autoSlide", {timePerSquare = 360, pauseTime = 0}, {{2,2,7,1},{2,2,7,2}})
    newShape("spitter", "spitter3_2_2", {2, 2, 1, 4}, {"none", "right", "none", "none"})
    newTransition("spitter3_2_2", "autoSlide", {timePerSquare = 360, pauseTime = 0}, {{2,2,1,1},{2,2,1,4}})
    newShape("shape", "bar1_2_2", {2, 2, 4, 3}, "bar", {"horz", 2})
    newShape("endPoint", "endPoint1_2_2", {2, 2, 4, 3})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 3}, "left")
    newTransition("autoFan1_2_2", "autoSlide", {timePerSquare = 600, pauseTime = 0}, {{2,2,6,3},{2,2,7,3}})
    newShape("simple", "simple1_2_2", {2, 2, 5, 4})
    newShape("shape", "triangle2_2_2", {2, 2, 5, 5}, "triangleTopRightShape")
    newShape("shape", "triangle3_2_2", {2, 2, 7, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 5, 3}, "purple")
    newShape("gem", "purple", {2, 2, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 4, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 2, 3}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 4, 3}, 14)
    newShape("item", "coins", {2, 1, 7, 5}, 250)
    newShape("item", "coins", {2, 2, 6, 4}, 100)
    newShape("item", "small-present", {2, 1, 6, 4}, {})
    newShape("item", "small-present", {1, 1, 6, 3}, {})
    newShape("item", "big-present", {2, 2, 3, 3}, {})
    newShape("item", "characterSpecial", {2, 2, 2, 1}, {})
    newShape("item", "hook", {1, 1, 4, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
