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

    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, 8})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,3,1},{1,1,3,2}})

    newShape("shape", "triangle2_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,5,2},{1,1,5,1},{1,1,6,1}})

    newShape("shape", "triangle3_1_1", {1, 1, 3, 4}, "triangleTopLeftShape", {1, 11})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,3,3},{1,1,3,4},{1,1,3,5}})

    newShape("shape", "triangle4_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1})
    newTransition("triangle4_1_1", "slide", {}, {{1,1,5,3},{1,1,5,4}})

    newShape("shape", "triangle5_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1})
    newTransition("triangle5_1_1", "slide", {}, {{1,1,7,3},{1,1,7,4}})

    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "right")

    -------------

    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("simple", "simple1_2_1", {2, 1, 3, 1})
    newTransition("simple1_2_1", "slide", {}, {{2,1,2,1},{2,1,3,1},{2,1,5,1}})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"})

    newShape("shape", "triangle2_2_1", {2, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    newShape("shape", "bar1_2_1", {2, 1, 4, 3}, "bar", {"vert", 4})
    newShape("shape", "bar2_2_1", {2, 1, 6, 3}, "bar", {"horz", 4})
    newTransition("bar2_2_1", "slide", {"brown"}, {{2,1,6,3},{2,1,6,4}})

    newShape("shape", "bar3_2_1", {2, 1, 7, 3}, "bar", {"horz"})

    newShape("characterChangePoint", "characterChangePoint1_2_1", {2, 1, 7, 3})

    newShape("simple", "simple2_2_1", {2, 1, 4, 4})
    newTransition("simple2_2_1", "slide", {}, {{2,1,1,4},{2,1,2,4},{2,1,4,4}})

    newShape("endPoint", "endPoint1_2_1", {2, 1, 4, 5})

    newShape("shape", "triangle3_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "fire"})

    newShape("shape", "triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "redCoin", {2, 1, 1, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 4, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 5}, 75)
    newShape("item", "big-present", {1, 1, 1, 5}, {})

    newShape("item", "small-present", {2, 1, 6, 2}, {})

    newShape("item", "coins", {2, 1, 5, 4, 350})  

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"

------
-- MAP

t.partialMapObtained = false
t.fullMapObtained = false

t.partialMapNecessary = false

t.fullMapNecessary = false

t.compassObtained = false

--

-- ALL 'TOOL' ITEMS

t.itemToolGainedArray = {
    {"clock-time", false},
    {"bomb", {false}},
    {"hook-shot", false},
    {"jet-pack", false}
}

t.clocktimeGainedOnce = false
t.bombGainedOnce = false
t.hookshotGainedOnce = false
t.jetpackGainedOnce = false

--TIMER

t.levelHasTimer = false

------------------------

--BOMB

t.bombIsInUse = false
t.bombInUseCounter = 0
t.bombIsExplodingCounter = 0

t.bombArray = {}

t.initialDirection = t.ballFirstDirection

return t
