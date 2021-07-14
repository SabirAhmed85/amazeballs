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

    newShape("shape", "bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, 8})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle4_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 3, 2}, "right")
    newShape("shape", "triangle5_1_1", {1, 1, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 3, 3}, "up")
    newShape("shape", "triangle7_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("simple", "simple1_1_1", {1, 1, 7, 3})
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape", "bar2_1_1", {1, 1, 1, 4}, "bar", {"horz", 3})
    newShape("simple", "simple2_1_1", {1, 1, 4, 4})
    newTransition("simple2_1_1", "slide", {}, {{1,1,4,4},{1,1,4,5}})
    newShape("item", "map", {1, 1, 6, 4})
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 1, 5})
    newShape("switch", "switch1_1_1", {1, 1, 2, 5}, { {"door-open", "door4_2_1"}, {"door-open", "door2_2_1"} })
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 5}, "left")
    newShape("shape", "bar3_1_1", {1, 1, 7, 5}, "bar", {"horz", 3})
    newShape("simple", "simple3_1_1", {1, 1, 7, 5})

    -- 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 2}, "left")
    newShape("door", "door2_2_1", {2, 1, 1, 3}, "left")

    newShape("simple", "simple1_2_1", {2, 1, 5, 1})
    newTransition("simple1_2_1", "slide", {}, {{2,1,3,1},{2,1,5,1}})

    newShape("simple", "simple2_2_1", {2, 1, 6, 2})
    newTransition("simple2_2_1", "slide", {}, {{2,1,4,2},{2,1,6,2}})

    newShape("shape", "triangle1_2_1", {2, 1, 3, 3}, "triangleBottomRightShape", {1, _, "breakable"})

    newShape("simple", "simple3_2_1", {2, 1, 5, 3})
    newTransition("simple3_2_1", "slide", {}, {{2,1,5,3},{2,1,6,3},{2,1,7,3}})

    newShape("simple", "simple4_2_1", {2, 1, 4, 4})
    newTransition("simple4_2_1", "slide", {}, {{2,1,1,4},{2,1,2,4},{2,1,4,4}})

    newShape("shape", "triangle2_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, 1})
    newShape("shape", "triangle3_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, 5})

    newShape("door", "door3_2_1", {2, 1, 7, 3}, "right", {"enabled"})

    newShape("door", "door4_2_1", {2, 1, 3, 5, "down", "disabled"})

    -------------

    newShape("simple", "simple1_3_1", {3, 1, 2, 3})
    newTransition("simple1_3_1", "slide", {}, {{3,1,2,1},{3,1,2,3},{3,1,2,5}})

    newShape("shape", "triangle1_3_1", {3, 1, 5, 1}, "triangleTopAndBottomShape", {1})

    newShape("door", "door1_3_1", {3, 1, 7, 1}, "right", {"disabled"})

    newShape("manualFan", "manualFan1_3_1", {3, 1, 1, 2}, "down")

    newShape("shape", "triangle2_3_1", {3, 1, 6, 2}, "triangleBottomRightShape", {1, _, "fire"})

    newShape("autoFan", "autoFan1_3_1", {3, 1, 1, 4}, "right")
    newTransition("autoFan1_3_1", "switchSlide", {timePerSquare = 500, pauseTime = 0, labelled = false}, {{3,1,1,3},{3,1,1,4}})
    newShape("switch", "switch1", {3, 1, 4, 2}, { {"slide", "autoFan1_3_1"}, {"door-open", "door1_3_1"} }, "one-way", "not-labelled")

    newShape("shape", "triangle3_3_1", {3, 1, 6, 4}, "triangleTopLeftShape", {1, _, "fire"})

    newShape("shape", "triangle4_3_1", {3, 1, 5, 5}, "triangleTopAndBottomShape", {2})

    newShape("door", "door2_3_1", {3, 1, 7, 5}, "right", {"enabled"})

    -------------

    -- 4-1
    newShape("shape", "triangle1_4_1", {4, 1, 1, 1}, "triangleBottomRightShape", {1})
    newShape("shape", "triangle2_4_1", {4, 1, 4, 1}, "triangleBottomLeftShape", {1})
    newShape("endPoint", "endPoint1_4_1", {4, 1, 7, 1})
    newShape("shape", "triangle3_4_1", {4, 1, 1, 2}, "triangleTopRightShape", {1})
    newShape("shape", "triangle4_4_1", {4, 1, 6, 2}, "triangleBottomLeftShape", {1})
    newShape("shape", "triangle5_4_1", {4, 1, 1, 3}, "triangleBottomRightShape", {1})
    newShape("shape", "bar1_4_1", {4, 1, 3, 3}, "bar", {"horz", 4})
    newTransition("bar1_4_1", "slide", {"brown"}, {{4,1,3,1},{4,1,3,3}})
    newShape("shape", "triangle6_4_1", {4, 1, 4, 3}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle7_4_1", {4, 1, 5, 3}, "triangleBottomRightShape", {1})
    newShape("shape", "bar2_4_1", {4, 1, 6, 4}, "bar", {"vert", 3})
    newTransition("bar2_4_1", "slide", {"brown"}, {{4,1,5,4},{4,1,6,4}})
    newShape("shape", "triangle8_4_1", {4, 1, 7, 3}, "triangleTopLeftShape", {1})
    newShape("simple", "simple1_4_1", {4, 1, 1, 4})
    newShape("shape", "triangle9_4_1", {4, 1, 5, 4}, "triangleTopRightShape", {1})
    newTransition("triangle9_4_1", "slide", {}, {{4,1,5,4},{4,1,5,5}})
    newShape("shape", "triangle10_4_1", {4, 1, 1, 5}, "triangleTopLeftShape", {1, 6})
    newShape("shape", "triangle11_4_1", {4, 1, 6, 5}, "triangleTopLeftShape", {1})

    -- 2-2

    newShape("shape", "triangle1_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "bar1_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    newShape("simple", "simple1_2_2", {2, 2, 2, 2})
    newTransition("simple1_2_2", "slide", {}, {{2,2,2,2},{2,2,2,1,"*"},{2,2,5,1}})
    newShape("spitter", "spitter1_2_2", {2, 2, 3, 2}, {"none", "right", "none"}, "left")
    newTransition("spitter1_2_2", "slide", {"darkBlue"}, {{2,2,3,2},{2,2,3,3},{2,2,3,5}})
    newShape("shape", "triangle2_2_2", {2, 2, 6, 2}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle3_2_2", {2, 2, 1, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle4_2_2", {2, 2, 5, 3}, "triangleTopRightShape", {1, 16, "breakable"})
    newShape("door", "door1_2_2", {2, 2, 7, 3}, "right")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 1, 4}, "right")
    newShape("shape", "triangle5_2_2", {2, 2, 4, 4}, "triangleBottomLeftShape")
    newShape("shape", "triangle6_2_2", {2, 2, 6, 4}, "triangleTopRightShape", {1, 17})
    newTransition("triangle6_2_2", "slide", {}, {{2,2,5,4},{2,2,6,4}})
    newShape("shape", "triangle7_2_2", {2, 2, 1, 5}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 5}, "up")
    newShape("autoFan", "autoFan2_2_2", {2, 2, 4, 5}, "right")
    newShape("shape", "bar2_2_2", {2, 2, 7, 5}, "bar", {"horz", 2})

    -- 3-2
    newShape("door", "door1_3_2", {3, 2, 1, 1}, "up")
    newShape("shape", "triangle1_3_2", {3, 2, 1, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("shape", "triangle2_3_2", {3, 2, 3, 1}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape", "triangle3_3_2", {3, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_3_2", {3, 2, 5, 1}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape", "triangle5_3_2", {3, 2, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_3_2", {3, 2, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle7_3_2", {3, 2, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle8_3_2", {3, 2, 7, 2}, "triangleTopLeftShape")
    newTransition("triangle8_3_2", "slide", {}, {{3,2,6,3},{3,2,7,2}})
    newShape("shape", "triangle9_3_2", {3, 2, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_3_2", {3, 2, 4, 4}, "up")
    newShape("shape", "triangle10_3_2", {3, 2, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_3_2", {3, 2, 5, 5}, "left")
    newShape("shape", "triangle11_3_2", {3, 2, 6, 5}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("manualFan", "manualFan1_3_2", {3, 2, 7, 5}, "up")

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {3, 2, 2, 1}, "purple")
    newShape("gem", "purple", {3, 1, 3, 2}, "purple")
    newShape("gem", "purple", {3, 1, 7, 2}, "purple")
    newShape("gem", "purple", {3, 1, 3, 4}, "purple")
    newShape("gem", "purple", {3, 1, 5, 4}, "purple")
    newShape("gem", "purple", {3, 1, 4, 3}, "purple")
    newShape("gem", "purple", {3, 1, 6, 3}, "purple")
    newShape("gem", "purple", {3, 1, 1, 3}, "purple")
    newShape("gem", "purple", {3, 1, 1, 5}, "purple")
    newShape("gem", "purple", {3, 1, 4, 1}, "purple")
    newShape("gem", "purple", {3, 1, 4, 5}, "purple")
    newShape("gem", "purple", {4, 1, 2, 3}, "purple")
    newShape("gem", "purple", {4, 1, 3, 3}, "purple")
    newShape("gem", "purple", {4, 1, 4, 2}, "purple")
    newShape("gem", "purple", {4, 1, 2, 5}, "purple")
    newShape("gem", "purple", {4, 1, 4, 5}, "purple")
    newShape("gem", "purple", {4, 1, 7, 2}, "purple")
    newShape("gem", "purple", {4, 1, 7, 4}, "purple")
    newShape("gem", "purple", {4, 1, 3, 4}, "purple")
    newShape("gem", "purple", {4, 1, 7, 5}, "purple")
    newShape("gem", "purple", {3, 2, 1, 3}, "purple")
    newShape("gem", "purple", {3, 2, 3, 3}, "purple")
    newShape("gem", "purple", {3, 2, 2, 5}, "purple")
    newShape("gem", "purple", {3, 2, 6, 1}, "purple")
    newShape("gem", "purple", {3, 2, 6, 4}, "purple")
    newShape("gem", "purple", {3, 2, 1, 2}, "purple")
    newShape("gem", "purple", {3, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 2, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "redCoin", {4, 1, 2, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 4, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {3, 1, 5, 2}, "purpleCoin")

    --ITEMS   
    newShape("item", "coins", {3, 2, 4, 2}, 700)
    newShape("item", "coins", {2, 1, 7, 2}, 350)
    newShape("item", "coins", {2, 2, 6, 5}, 550)
    newShape("item", "coins", {2, 2, 7, 3}, 12)
    newShape("item", "coins", {3, 1, 7, 3}, 90)
    newShape("item", "coins", {3, 1, 4, 4}, 35)
    newShape("item", "characterSpecial", {2, 2, 5, 5, 2, 3 })    
    newShape("item", "small-present", {2, 1, 6, 4}, {})
    newShape("item", "small-present", {2, 2, 7, 2}, {})

    newShape("item", "big-present", {3, 2, 5, 3}, {})

    newShape("item", "big-present", {2, 2, 4, 3}, {})

    newShape("item", "big-present", {3, 1, 7, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
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
