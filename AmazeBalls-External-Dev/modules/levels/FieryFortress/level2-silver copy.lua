local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1})

    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 2}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 2, 3}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle4_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,3},{2},{1,1,2,4}})

    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1})

    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 5}, "triangleTopRightShape", {1})
    addToTransitionArray(ta,{{"triangle6_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,5},{2},{1,1,7,5}})

    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 2, 5})

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.backgroundImage = "images/level-images/background.png"

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
