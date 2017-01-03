local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomLeftShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right", "enabled"} )

    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 3, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})

    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 3, "triangleBottomRightShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 3, "triangleBottomLeftShape", 1})

    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 4} )

    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,5,4},{2},{1,1,6,2}})

    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 5, "triangleTopLeftShape", 1})

    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 5, 5, "triangleTopRightShape", 1})

    -- 2-1

    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 1, "down"} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 6, 1, "down"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{"silver"},{2},{1},{2,1,5,1},{2},{2,1,6,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 2, "triangleBottomRightShape", 1, 9})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{1},{1},{2,1,2,2,},{"*"},{2,1,2,1},{2},{2,1,3,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 1, 3, "down"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,1,3},{2},{2,1,1,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,5,3},{"*"},{2,1,5,5},{2},{2,1,6,5}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 8, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 1, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 5, "left"} )
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_1", 2, 1, 1, 5} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,1,5},{2},{2,1,2,5},{3},{2,1,3,2}})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_1", 2, 1, 7, 5} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 7, 3, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 5, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 4, 250})   
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 6, 3, "present1_6_3", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 2, 4, "present2_2_4", {} })
    table.insert(shapeArrayParameters,{"item","characterSpecial", 1, 1, 1, 4, 1, 3 })
    table.insert(shapeArrayParameters,{"item","hook", 2, 1, 7, 2, 1, 3 })
end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
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
