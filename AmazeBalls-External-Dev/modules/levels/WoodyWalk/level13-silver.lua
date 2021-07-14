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

    newShape("simple", "simple1_1_1", {1, 1, 1, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,1,1},{1,1,4,1},{1,1,7,1}})

    newShape("shape", "triangle1_1_1", {1, 1, 4, 2}, "triangleLeftAndRightShape", {2})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleLeftAndRightShape", {1})

    newShape("simple", "simple2_1_1", {1, 1, 7, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,2,4},{1,1,7,4},{1,1,7,3}})

    newShape("shape", "bar1_1_1", {1, 1, 1, 6}, "bar", {"vert", 2})
    newShape("door", "door1_1_1", {1, 1, 2, 5, "down", "enabled"})

    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 5}, "down")
    newTransition("manualFan1_1_1", "switchSlide", {labelled = false}, {{1,1,2,5},{1,1,3,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 6, 5}, "left")

    newShape("shape", "bar2_1_1", {1, 1, 3, 6}, "bar", {"vert"})

    -------------

    -- 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomLeftShape", {1, 2})
    newShape("switch", "switch1_1_2", {1, 2, 4, 1}, { {"slide", "manualFan1_1_1"} }, {"one-way", "not-labelled"})
    newShape("shape", "triangle2_1_2", {1, 2, 5, 1}, "triangleBottomRightShape")
    newShape("shape", "bar1_1_2", {1, 2, 7, 1, "bar", "horz", 2})
    newTransition("bar1_1_2", "slide", {"brown"}, {{1,2,7,1},{1,2,7,2}})
    newShape("simple", "simple1_1_2", {1, 2, 2, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,2,2},{1,2,6,2}})
    newShape("shape", "bar2_1_2", {1, 2, 1, 3}, "bar", {"vert", 4})
    newShape("backFire", "backFire1_1_2", {1, 2, 3, 3})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,3,1},{1,2,3,3},{1,2,3,5}})
    newShape("shape", "triangle3_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle4_1_2", {1, 2, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar3_1_2", {1, 2, 6, 5}, "bar", {"vert", 2})
    newTransition("bar3_1_2", "slide", {"brown"}, {{1,2,6,5},{1,2,7,5}})
    newShape("shape", "triangle6_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1})
    newShape("door", "door1_1_2", {1, 2, 2, 5}, "down")
    newShape("shape", "triangle7_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 5})

    -- 1-3
    newShape("shape", "triangle1_1_3", {1, 3, 1, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_3", {1, 3, 3, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("door", "door1_1_3", {1, 3, 5, 1}, "up")
    newShape("spitter", "spitter1_1_3", {1, 3, 7, 1}, {"none", "right", "none"}, "left")
    newShape("shape", "triangle3_1_3", {1, 3, 4, 2}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle4_1_3", {1, 3, 4, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("manualFan", "manualFan1_1_3", {1, 3, 3, 4}, "right")
    newShape("shape", "triangle5_1_3", {1, 3, 6, 4}, "triangleBottomRightShape", {1, 14, "breakable"})
    newShape("shape", "triangle6_1_3", {1, 3, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_1_3", {1, 3, 4, 5})
    newTransition("backFire1_1_3", "slide", {}, {{1,3,1,3},{1,3,1,5,"*"},{1,3,4,5}})
    newShape("shape", "triangle7_1_3", {1, 3, 5, 5}, "triangleTopLeftShape", {1, 6})
    newTransition("triangle7_1_3", "slide", {}, {{1,3,5,3},{1,3,5,4},{1,3,5,5}})
    newShape("shape", "bar1_1_3", {1, 3, 7, 5}, "bar", {"horz"})

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 3, 1, 2}, "purple")
    newShape("gem", "purple", {1, 3, 3, 2}, "purple")
    newShape("gem", "purple", {1, 3, 5, 2}, "purple")
    newShape("gem", "purple", {1, 3, 7, 2}, "purple")
    newShape("gem", "purple", {1, 3, 2, 1}, "purple")
    newShape("gem", "purple", {1, 3, 2, 4}, "purple")
    newShape("gem", "purple", {1, 3, 5, 1}, "purple")
    newShape("gem", "purple", {1, 3, 4, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 3}, "purple")
    newShape("gem", "purple", {1, 3, 7, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 1, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 3, 6, 1}, "purpleCoin")

    --ITEMS   
    newShape("item", "coins", {1, 1, 4, 5}, 500)
    newShape("item", "coins", {1, 2, 1, 2, 450})    
    newShape("item", "coins", {1, 3, 3, 3, 300})    
    newShape("item", "small-present", {1, 3, 2, 3}, {})

    newShape("item", "small-present", {1, 3, 6, 5}, {})

    newShape("item", "big-present", {1, 2, 7, 2}, {})

    newShape("item", "big-present", {1, 1, 1, 5}, {})


end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
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
