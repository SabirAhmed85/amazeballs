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

   --1-1

    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,1},{1,1,3,2},{1,1,4,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 1}, "down")
    newShape("shape", "bar1_1_1", {1, 1, 4, 3}, "bar", {"horz", 2})
    newTransition("bar1_1_1", "autoSlide", {timePerSquare = 200, pauseTime = 0}, {{1,1,4,3},{1,1,4,4}})
    newShape("spitter", "spitter1_1_1", {1, 1, 6, 3}, {"none", "none", "down", "none"})
    newShape("shape", "bar2_1_1", {1, 1, 1, 5}, "bar", {"horz"})
    newShape("simple", "simple1_1_1", {1, 1, 2, 5}, "right")
    newTransition("simple1_1_1", "slide", {}, {{1,1,2,2},{1,1,2,3},{1,1,2,5}})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 5}, "left")
    newShape("door", "door1_1_1", {1, 1, 4, 5}, "down")
    newShape("door", "door2_1_1", {1, 1, 6, 5}, "down")

    --1-2
    newShape("door", "door1_1_2", {1, 2, 1, 1}, "up")

    newShape("manualFan", "manualFan1_1_2", {1, 2, 1, 1}, "right")

    newShape("endPoint", "endPoint1_1_2", {1, 2, 6, 1})

    newShape("shape", "triangle1_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})

    newShape("simple", "simple1_1_2", {1, 2, 4, 3})
    newTransition("simple1_1_2", "slide", {}, {{1,2,4,3},{1,2,4,2},{1,2,6,2}})

    newShape("shape", "triangle2_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})

    newShape("shape", "triangle3_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1})


    --GEMS
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "redCoin", {1, 2, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 5, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 6, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 7, 3}, 250)
    newShape("item", "coins", {1, 2, 7, 5}, 200)
    newShape("item", "coins", {1, 2, 5, 1}, 500)
    newShape("item", "small-present", {1, 1, 6, 5}, {})

    newShape("item", "big-present", {1, 2, 3, 1}, {})

    newShape("item", "big-present", {1, 1, 4, 1}, {})

    newShape("item", "small-present", {1, 2, 4, 1}, {})

    newShape("item", "fireCape", {1, 2, 2, 1, 1, 3 })

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"

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
