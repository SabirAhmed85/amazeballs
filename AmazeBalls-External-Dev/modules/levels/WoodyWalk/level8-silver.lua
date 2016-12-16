local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    --1-1

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,1},{2},{1,1,3,2},{3},{1,1,4,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 3, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 200, pauseTime = 0},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 6, 3, "none","none","down", "none"} )
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 1, 5, "bar", "horz"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 2, 5, "right"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"green"},{3},{1},{1,1,2,2},{2},{1,1,2,3},{3},{1,1,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 7, 5, "left"} )
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"} )
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 6, 5, "down"} )

    --1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up"} )

    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 1, 1, "right"} )

    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 6, 1} )

    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 3, "triangleBottomRightShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,4,3},{2},{1,2,4,2},{3},{1,2,6,2}})

    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 4, 5, "triangleTopLeftShape", 1})


    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 7, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 5, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 6, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 3, 250})  
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 5, 200}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 1, 500})   
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 6, 5, "present1_1_1", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 3, 1, "present2_1_2", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 1, "present3_1_1", {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 4, 1, "present4_1_2", {} })
    table.insert(shapeArrayParameters,{"item","fireCape", 1, 2, 2, 1, 1, 3 })

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
