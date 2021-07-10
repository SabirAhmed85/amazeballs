local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1

    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 2}, "right")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 3, 3}, "up")
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, 13, "breakable"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 3})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,4},{2},{1,1,4,5}})
    addToShapeArray(sp, "item","map", {1, 1, 6, 4})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 1, 5})
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 5}, { {"door-open", "door4_2_1"}, {"door-open", "door2_2_1"} })
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 5}, "left")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 7, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple3_1_1", {1, 1, 7, 5})

    -- 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 1, 3}, "left")

    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 5, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,3,1},{2},{2,1,5,1}})

    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,4,2},{2},{2,1,6,2}})

    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 3, 3}, "triangleBottomRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "simple","simple3_2_1", {2, 1, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple3_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,5,3},{2},{2,1,6,3},{3},{2,1,7,3}})

    addToShapeArray(sp, "simple","simple4_2_1", {2, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple4_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,1,4},{2},{2,1,2,4},{3},{2,1,4,4}})

    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, 5})

    addToShapeArray(sp, "door","door3_2_1", {2, 1, 7, 3}, "right", {"enabled"})

    addToShapeArray(sp, "door","door4_2_1", {2, 1, 3, 5, "down", "disabled"})

    -------------

    addToShapeArray(sp, "simple","simple1_3_1", {3, 1, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_3_1"},{"slide"},{"lightBlue"},{2},{1},{3,1,2,1},{2},{3,1,2,3},{3},{3,1,2,5}})

    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 5, 1}, "triangleTopAndBottomShape", {1})

    addToShapeArray(sp, "door","door1_3_1", {3, 1, 7, 1}, "right", {"disabled"})

    addToShapeArray(sp, "manualFan","manualFan1_3_1", {3, 1, 1, 2}, "down")

    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 6, 2}, "triangleBottomRightShape", {1, _, "fire"})

    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 1, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"switchSlide"},{timePerSquare = 500, pauseTime = 0, labelled = false},{2},{1},{3,1,1,3},{2},{3,1,1,4}})
    addToShapeArray(sp, "switch","switch1", {3, 1, 4, 2}, { {"slide", "autoFan1_3_1"}, {"door-open", "door1_3_1"} }, "one-way", "not-labelled")

    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 6, 4}, "triangleTopLeftShape", {1, _, "fire"})

    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 5, 5}, "triangleTopAndBottomShape", {2})

    addToShapeArray(sp, "door","door2_3_1", {3, 1, 7, 5}, "right", {"enabled"})

    -------------

    -- 4-1
    addToShapeArray(sp, "shape","triangle1_4_1", {4, 1, 1, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "shape","triangle2_4_1", {4, 1, 4, 1}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "endPoint","endPoint1_4_1", {4, 1, 7, 1})
    addToShapeArray(sp, "shape","triangle3_4_1", {4, 1, 1, 2}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "shape","triangle4_4_1", {4, 1, 6, 2}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "shape","triangle5_4_1", {4, 1, 1, 3}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "shape","bar1_4_1", {4, 1, 3, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_4_1"},{"slide"},{"brown"},{2},{1},{4,1,3,1},{2},{4,1,3,3}})
    addToShapeArray(sp, "shape","triangle6_4_1", {4, 1, 4, 3}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "shape","triangle7_4_1", {4, 1, 5, 3}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "shape","bar2_4_1", {4, 1, 6, 4}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_4_1"},{"slide"},{"brown"},{2},{1},{4,1,5,4},{2},{4,1,6,4}})
    addToShapeArray(sp, "shape","triangle8_4_1", {4, 1, 7, 3}, "triangleTopLeftShape", {1})
    addToShapeArray(sp, "simple","simple1_4_1", {4, 1, 1, 4})
    addToShapeArray(sp, "shape","triangle9_4_1", {4, 1, 5, 4}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_4_1"},{"slide"},{"green"},{2},{1},{4,1,5,4},{2},{4,1,5,5}})
    addToShapeArray(sp, "shape","triangle10_4_1", {4, 1, 1, 5}, "triangleTopLeftShape", {1, 6})
    addToShapeArray(sp, "shape","triangle11_4_1", {4, 1, 6, 5}, "triangleTopLeftShape", {1})

    -- 2-2

    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{"lightBlue"},{1},{1},{2,2,2,2},{"*"},{2,2,2,1},{2},{2,2,5,1}})
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 3, 2}, {"none", "right", "none"}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{"darkBlue"},{1},{1},{2,2,3,2},{2},{2,2,3,3},{3},{2,2,3,5}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 2}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 1, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 5, 3}, "triangleTopRightShape", {1, 16, "breakable"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 4}, "right")
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 4, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 6, 4}, "triangleTopRightShape", {1, 17})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_2"},{"slide"},{"green"},{2},{1},{2,2,5,4},{2},{2,2,6,4}})
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 1, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 5}, "up")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 4, 5}, "right")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 7, 5}, "bar", {"horz", 2})

    -- 3-2
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 1, 1}, "triangleTopLeftShape", {1, 15, "breakable"})
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 3, 1}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_3_2", {3, 2, 5, 1}, "triangleBottomRightShape", {1, 8, "breakable"})
    addToShapeArray(sp, "shape","triangle5_3_2", {3, 2, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_3_2", {3, 2, 3, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_3_2", {3, 2, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle8_3_2", {3, 2, 7, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_3_2"},{"slide"},{"green"},{2},{1},{3,2,6,3},{2},{3,2,7,2}})
    addToShapeArray(sp, "shape","triangle9_3_2", {3, 2, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 4, 4}, "up")
    addToShapeArray(sp, "shape","triangle10_3_2", {3, 2, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_3_2", {3, 2, 5, 5}, "left")
    addToShapeArray(sp, "shape","triangle11_3_2", {3, 2, 6, 5}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 7, 5}, "up")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {4, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {4, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 5, 2}, "purpleCoin")

    --ITEMS   
    addToShapeArray(sp, "item","coins", {3, 2, 4, 2}, 700)
    addToShapeArray(sp, "item","coins", {2, 1, 7, 2}, 350)
    addToShapeArray(sp, "item","coins", {2, 2, 6, 5}, 550)
    addToShapeArray(sp, "item","coins", {2, 2, 7, 3}, 12)
    addToShapeArray(sp, "item","coins", {3, 1, 7, 3}, 90)
    addToShapeArray(sp, "item","coins", {3, 1, 4, 4}, 35)
    addToShapeArray(sp, "item","characterSpecial", {2, 2, 5, 5, 2, 3 })    
    addToShapeArray(sp, "item","small-present", {2, 1, 6, 4}, {})
    addToShapeArray(sp, "item","small-present", {2, 2, 7, 2}, {})

    addToShapeArray(sp, "item","big-present", {3, 2, 5, 3}, {})

    addToShapeArray(sp, "item","big-present", {2, 2, 4, 3}, {})

    addToShapeArray(sp, "item","big-present", {3, 1, 7, 4}, {})


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
    {"bomb", {false},
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
