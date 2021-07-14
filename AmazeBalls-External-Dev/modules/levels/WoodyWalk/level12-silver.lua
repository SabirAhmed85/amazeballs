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

    newShape("shape", "triangle1_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 13})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,1}})
    
    newShape("shape", "triangle3_1_1", {1, 1, 4, 1}, "triangleBottomRightShape", {1, 14})

    newShape("simple", "simple1_1_1", {1, 1, 2, 3})
    newTransition("simple1_1_1", "slide", {}, {{1,1,2,4},{1,1,2,3},{1,1,4,3}})

    newShape("backFire", "backFire1_1_1", {1, 1, 5, 2})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,5,2},{1,1,6,3}})
    
    newShape("switch", "switch1", {1, 1, 7, 2}, { {"door-open", "door1_1_1"} }, {"one-way"})

    newShape("shape", "bar1_1_1", {1, 1, 7, 3}, "bar", {"vert", 2})

    newShape("shape", "triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape")

    newShape("simple", "simple2_1_1", {1, 1, 4, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,4,4},{1,1,5,4},{1,1,7,4}})

    newShape("endPoint", "endPoint1_1_1", {1, 1, 7, 3}, "right", {"enabled"})

    newShape("door", "door1_1_1", {1, 1, 3, 5, "down", "disabled"})

    newShape("shape", "bar1_1_1", {1, 1, 6, 6}, "bar", {"vert", 3})

    -------------
    newShape("door", "door1_1_2", {1, 2, 1, 1, "up", "enabled"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape", "bar1_1_2", {1, 2, 3, 1}, "bar", {"vert"})
    newShape("shape", "triangle1_1_2", {1, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_1_2", {1, 2, 6, 1})

    newShape("shape", "triangle2_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1})
    newTransition("triangle2_1_2", "slide", {}, {{1,2,2,2},{1,2,2,3}})

    newShape("shape", "triangle3_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,6,3},{1,2,7,3}})

    newShape("shape", "triangle4_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1})
    newTransition("triangle4_1_2", "slide", {}, {{1,2,6,4},{1,2,6,5}})

    newShape("shape", "triangle5_1_2", {1, 2, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})

    newShape("autoFan", "autoFan2_1_2", {1, 2, 3, 5}, "right")

    newShape("shape", "triangle6_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "fire"})

    newShape("shape", "triangle7_1_2", {1, 2, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    newShape("shape", "bar2_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})

    newShape("door", "door2_1_2", {1, 2, 2, 1, "up", "enabled"})

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 4, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 3, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 1, 2}, 150)
    newShape("item", "small-present", {1, 1, 7, 1}, {})

    newShape("item", "big-present", {1, 2, 4, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"

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
