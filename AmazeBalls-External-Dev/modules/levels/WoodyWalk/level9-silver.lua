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

   -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})

    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right", {"enabled"})

    newShape("simple", "simple1_1_1", {1, 1, 3, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,2},{1,1,3,3}})

    newShape("shape", "triangle2_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "breakable"})

    newShape("shape", "triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1})

    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 4})

    newShape("simple", "simple2_1_1", {1, 1, 6, 2})
    newTransition("simple2_1_1", "slide", {}, {{1,1,5,4},{1,1,6,2}})

    newShape("shape", "triangle4_1_1", {1, 1, 2, 5}, "triangleTopLeftShape", {1})

    newShape("shape", "triangle5_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1})

    -- 2-1

    newShape("autoFan", "autoFan1_2_1", {2, 1, 1, 1}, "down")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 6, 1}, "down")
    newTransition("manualFan1_2_1", "slide", {"silver"}, {{2,1,5,1},{2,1,6,1}})
    newShape("shape", "triangle1_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,2,},{2,1,2,1,"*"},{2,1,3,1}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 1, 3}, "down")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,1,3},{2,1,1,4}})
    newShape("shape", "triangle2_2_1", {2, 1, 5, 3}, "triangleTopRightShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,5,3},{2,1,5,5,"*"},{2,1,6,5}})
    newShape("shape", "bar1_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    newShape("shape", "bar2_2_1", {2, 1, 1, 4}, "bar", {"horz", 3})
    newShape("shape", "triangle3_2_1", {2, 1, 4, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "left")
    newShape("backFire", "backFire1_2_1", {2, 1, 1, 5})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,1,5},{2,1,2,5},{2,1,3,2}})
    newShape("characterChangePoint", "characterChangePoint1_2_1", {2, 1, 7, 5})

    --GEMS
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "redCoin", {2, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 5, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 7, 4}, 250)
    newShape("item", "small-present", {2, 1, 6, 3}, {})

    newShape("item", "big-present", {2, 1, 2, 4}, {})

    newShape("item", "characterSpecial", {1, 1, 1, 4, 1, 3 })
    newShape("item", "hook", {2, 1, 7, 2, 1, 3 })
end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
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
