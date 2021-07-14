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

    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "right")
    newShape("manualFan","manualFan2_1_1", {1, 1, 7, 1}, "left")

    newShape("door","door1_1_1", {1, 1, 7, 1}, "right", {"disabled"})

    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1})
    newTransition("triangle3_1_1", "slide", {"green"}, {{1,1,3,2},{1,1,3,3}})

    newShape("switch","switch1", {1, 1, 2, 4}, { {"door-open", "door1_1_1"} }, {"one-way"})

    newShape("shape","triangle4_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 15, "breakable"})

    newShape("shape","triangle5_1_1", {1, 1, 3, 5}, "triangleTopLeftShape", {1})

    newShape("door","door2_1_1", {1, 1, 7, 5}, "right")

    -------------

    newShape("shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1})
    newTransition("triangle1_2_1", "autoSlide", {timePerSquare = 500, labelled = false, pauseTime = 0}, {{1,1,5,1},{1,1,7,1}})

    newShape("shape","bar1_2_1", {2, 1, 5, 3}, "bar", {"vert", 2})
    newShape("shape","bar1_2_1", {2, 1, 7, 3}, "bar", {"vert", 2})

    newShape("simple","simple1_2_1", {2, 1, 1, 5})
    newTransition("simple1_2_1", "slide", {"lightBlue"}, {{2,1,1,1},{2,1,1,4},{2,1,1,5}})

    newShape("shape","triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape", {1, 15})

    newShape("simple","simple2_2_1", {2, 1, 5, 5})
    newTransition("simple2_2_1", "slide", {"lightBlue"}, {{2,1,5,4},{2,1,5,5}})

    newShape("shape","triangle3_2_1", {2, 1, 7, 5}, "triangleTopRightShape", {1})

    newShape("endPoint","endPoint1_2_1", {2, 1, 6, 5})

    newShape("door","door1_2_1", {2, 1, 1, 3}, "left", {"enabled"})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 1, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 6, 5}, 75)
    newShape("item","coins", {1, 1, 2, 2}, 300)
    newShape("item","coins", {2, 1, 4, 1}, 250)
    newShape("item","coins", {2, 1, 2, 1}, 90)
    newShape("item","big-present", {2, 1, 4, 5}, {})

    newShape("item","small-present", {2, 1, 7, 4}, {})

    newShape("item","small-present", {1, 1, 1, 3}, {})

    newShape("item","hook", {2, 1, 3, 2, 1, 3 })
end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
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
};

t.clocktimeGainedOnce = false;
t.bombGainedOnce = false;
t.hookshotGainedOnce = false;
t.jetpackGainedOnce = false;

--TIMER

t.levelHasTimer = false;

------------------------

--BOMB

t.bombIsInUse = false
t.bombInUseCounter = 0
t.bombIsExplodingCounter = 0

t.bombArray = {}

t.initialDirection = t.ballFirstDirection

return t
