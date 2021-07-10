local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 5}, "triangleTopLeftShape", {1})
    addToTransitionArray(ta,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,4},{2},{1,1,2,5}})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1})
    addToTransitionArray(ta,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,1},{2},{1,1,3,1}})

    addToTransitionArray(shapeArrayParameters, {"shape", "triangle3_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 6, 3})

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"

------
-- MAP

t.partialMapObtained = false
t.fullMapObtained = false

t.partialMapNecessary = false
t.partialMapScreensArray = {}

t.fullMapNecessary = false
t.fullMapScreensArray = {}

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

t.toolArray = {}
t.objectArray = {}
------------------------

--BOMB

t.bombIsInUse = false
t.bombInUseCounter = 0
t.bombIsExplodingCounter = 0

t.bombArray = {}

t.initialDirection = t.ballFirstDirection

return t
