local addToShapeArray = require("utils.add-to-shape-array");
local t = {};


local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;	--------  CREATE OBJECTS HERE   -----------

    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 7, 1}, "left")

    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 1}, "right", {"disabled"})

    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})

    addToShapeArray(sp, "switch","switch1", {1, 1, 2, 4}, { {"door-open", "door1_1_1"} }, {"one-way"})

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, 15, "breakable"})

    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 5}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "door","door2_1_1", {1, 1, 7, 5}, "right")

    -------------

    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"autoSlide"},{timePerSquare = 500, labelled = false, pauseTime = 0},{2},{1},{1,1,5,1},{2},{1,1,7,1}})

    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 5, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 3}, "bar", {"vert", 2})

    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,1,1},{2},{2,1,1,4},{3},{2,1,1,5}})

    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape", {1, 15})

    addToShapeArray(sp, "simple","simple2_2_1", {2, 1, 5, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,5,4},{2},{2,1,5,5}})

    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 5}, "triangleTopRightShape", {1})

    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 6, 5})

    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 3}, "left", {"enabled"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 1, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 6, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 75)
    addToShapeArray(sp, "item","coins", {1, 1, 2, 2}, 300)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 1}, 250)
    addToShapeArray(sp, "item","coins", {2, 1, 2, 1}, 90)
    addToShapeArray(sp, "item","big-present", {2, 1, 4, 5}, {})

    addToShapeArray(sp, "item","small-present", {2, 1, 7, 4}, {})

    addToShapeArray(sp, "item","small-present", {1, 1, 1, 3}, {})

    addToShapeArray(sp, "item","hook", {2, 1, 3, 2, 1, 3 })
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
