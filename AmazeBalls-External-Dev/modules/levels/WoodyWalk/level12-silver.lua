local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,2},{2},{1,1,2,1}})
    
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 1}, "triangleBottomRightShape", {1, 14})

    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,2,4},{2},{1,1,2,3},{3},{1,1,4,3}})

    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{1},{1},{1,1,5,2},{2},{1,1,6,3}})
    
    addToShapeArray(sp, "switch","switch1", {1, 1, 7, 2}, { {"door-open", "door1_1_1"} }, {"one-way"})

    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 3}, "bar", {"vert", 2})

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleTopRightShape")

    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,4},{2},{1,1,5,4},{3},{1,1,7,4}})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 3}, "right", {"enabled"})

    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5, "down", "disabled"})

    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 6}, "bar", {"vert", 3})

    -------------
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1, "up", "enabled"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 1}, "bar", {"vert"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 6, 1})

    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,2},{2},{1,2,2,3}})

    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,3},{2},{1,2,7,3}})

    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,4},{2},{1,2,6,5}})

    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 3, 4}, "triangleTopRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 3, 5}, "right")

    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "fire"})

    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})

    addToShapeArray(sp, "door","door2_1_2", {1, 2, 2, 1, "up", "enabled"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 6, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 2, 1, 2}, 150)
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 4, 2}, {})

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
