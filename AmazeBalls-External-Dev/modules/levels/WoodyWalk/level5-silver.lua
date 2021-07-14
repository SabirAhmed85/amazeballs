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

    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1})

    newShape("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopLeftShape", {1})
    newTransition("triangle2_1_1", "slide", {"green"}, {{1,1,5,1},{1,1,6,1}})

    newShape("shape","triangle3_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape", {1})

    newShape("simple","simple1_1_1", {1, 1, 6, 3})

    newShape("endPoint","endPoint1_1_1", {1, 1, 3, 4})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 3, 5}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 2}, 90)
    newShape("item","small-present", {1, 1, 5, 4}, {})


end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
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
