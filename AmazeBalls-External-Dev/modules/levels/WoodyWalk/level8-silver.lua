local addToShapeArray = require("utils.add-to-shape-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;	--------  CREATE OBJECTS HERE   -----------

    --1-1

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,1},{2},{1,1,3,2},{3},{1,1,4,3}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 200, pauseTime = 0},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 6, 3}, {"none","none","down", "none"})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 1, 5}, "bar", {"horz"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"green"},{3},{1},{1,1,2,2},{2},{1,1,2,3},{3},{1,1,2,5}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 7, 5}, "left")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 6, 5}, "down")

    --1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")

    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 1, 1}, "right")

    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 1})

    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 3}, "triangleBottomRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,4,3},{2},{1,2,4,2},{3},{1,2,6,2}})

    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1})


    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 3}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 5, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 6, 1}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3}, 250)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 5, 200}) 
    addToShapeArray(sp, "item","coins", {1, 2, 5, 1}, 500)
    addToShapeArray(sp, "item","small-present", {1, 1, 6, 5}, {})

    addToShapeArray(sp, "item","big-present", {1, 2, 3, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 4, 1}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 4, 1}, {})

    addToShapeArray(sp, "item","fireCape", {1, 2, 2, 1, 1, 3 })

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
