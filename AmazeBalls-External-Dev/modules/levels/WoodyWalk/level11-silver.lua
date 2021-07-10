local addToShapeArray = require("utils.add-to-shape-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;	--------  CREATE OBJECTS HERE   -----------

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, 8})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,1},{2},{1,1,3,2}})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{3},{1},{1,1,5,2},{2},{1,1,5,1},{3},{1,1,6,1}})

    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 4}, "triangleTopLeftShape", {1, 11})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,3},{2},{1,1,3,4},{3},{1,1,3,5}})

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 5, 4}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,5,3},{2},{1,1,5,4}})

    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{"green"},{2},{1},{1,1,7,3},{2},{1,1,7,4}})

    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    -------------

    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "down")
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 3, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,2,1},{2},{2,1,3,1},{3},{2,1,5,1}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"})

    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 2, 2}, "triangleLeftAndRightShape", {1})

    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 3}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 6, 3}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{"brown"},{1},{1},{2,1,6,3},{2},{2,1,6,4}})

    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 7, 3}, "bar", {"horz"})

    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_2_1", {2, 1, 7, 3})

    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,1,4},{2},{2,1,2,4},{3},{2,1,4,4}})

    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 4, 5})

    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "fire"})

    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "fire"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 1, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 75)
    addToShapeArray(sp, "item","big-present", {1, 1, 1, 5}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 6, 2}, {})

    addToShapeArray(sp, "item","coins", {2, 1, 5, 4, 350})  

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
