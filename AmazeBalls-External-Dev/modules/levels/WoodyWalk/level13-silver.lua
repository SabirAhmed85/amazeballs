local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,1},{2},{1,1,4,1},{3},{1,1,7,1}})

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 2, "triangleLeftAndRightShape", 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 2, "triangleLeftAndRightShape", 1})

    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,2,4},{2},{1,1,7,4},{3},{1,1,7,3}})

    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 6, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down", "enabled"})

    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 5, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,2,5},{2},{1,1,3,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 5, "left"})

    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 3, 6, "bar", "vert"})

    -------------

    -- 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomLeftShape", 1, 2})
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 4, 1, { {"slide", "manualFan1_1_1"} }, "one-way", "not-labelled" })
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 7, 1, "bar","horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{"brown"},{1},{1},{1,2,7,1},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,2,2},{2},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 1, 3, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,3,1},{2},{1,2,3,3},{3},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 3, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 2, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 5, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 6, 5, "bar", "vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_2"},{"slide"},{"brown"},{1},{1},{1,2,6,5},{2},{1,2,7,5}})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 6, 5, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 5})

    -- 1-3
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 1, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_3", 1, 3, 3, 1, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_3", 1, 3, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_3", 1, 3, 7, 1, "none", "right", "none", "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_3", 1, 3, 4, 2, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_3", 1, 3, 4, 3, "triangleBottomRightShape", 1, 9, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_3", 1, 3, 3, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_3", 1, 3, 6, 4, "triangleBottomRightShape", 1, 14, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_3", 1, 3, 7, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_3", 1, 3, 4, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_3"},{"slide"},{"green"},{2},{1},{1,3,1,3},{"*"},{1,3,1,5},{2},{1,3,4,5}})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_3", 1, 3, 5, 5, "triangleTopLeftShape", 1, 6})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_3"},{"slide"},{"green"},{3},{1},{1,3,5,3},{2},{1,3,5,4},{3},{1,3,5,5}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_3", 1, 3, 7, 5, "bar", "horz"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 5, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 1, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 3, 6, 1, "purpleCoin"})

    --ITEMS   
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 5, 500}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 450})    
    table.insert(shapeArrayParameters,{"item","coins", 1, 3, 3, 3, 300})    
    table.insert(shapeArrayParameters,{"item","small-present", 1, 3, 2, 3, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 3, 6, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 7, 2, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 1, 5, {} })

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
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
    {"bomb", false},
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
