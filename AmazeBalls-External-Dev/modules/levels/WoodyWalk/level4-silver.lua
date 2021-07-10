local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;

    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 2})
    addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,2},{2},{1,1,4,3}})

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 5}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 4, 5}, 90)
    addToShapeArray(sp, "item","coins", {1, 1, 6, 3, 40})    
    addToShapeArray(sp, "item","big-present", {1, 1, 2, 3}, {})

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"

------
-- MAP

t.partialMapObtained = false
t.fullMapObtained = false

t.partialMapNecessary = true
t.partialMapScreensArray = {{2,1}}

t.fullMapNecessary = true
t.fullMapScreensArray = {{2,2}}

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
