local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 1, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 7, 1, "left"})

    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right", "disabled"} )

    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})

    table.insert(shapeArrayParameters,{"switch","switch1", 1, 1, 2, 4, { {"door-open", "door1_1_1"} }, "one-way" } )

    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1, 15, "breakable"})

    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 3, 5, "triangleTopLeftShape", 1})

    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 5, "right"} )

    -------------

    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 1, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"autoSlide"},{timePerSquare = 500, labelled = false, pauseTime = 0},{2},{1},{1,1,5,1},{2},{1,1,7,1}})

    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 5, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 7, 3, "bar", "vert", 2})

    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,1,1},{2},{2,1,1,4},{3},{2,1,1,5}})

    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 3, 5, "triangleTopLeftShape", 1, 15})

    table.insert(shapeArrayParameters,{"simple","simple2_2_1", 2, 1, 5, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,5,4},{2},{2,1,5,5}})

    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 7, 5, "triangleTopRightShape", 1})

    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 2, 1, 6, 5} )

    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left", "enabled"} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 4, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 4, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 6, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 5, 75})  
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 2, 300})  
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 1, 250})  
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 2, 1, 90})    
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 4, 5, "present1_4_5", {
		{"shape", "triangleTopLeftShape"},
		{"shape", "triangleTopRightShape"},
		{"shape", "triangleBottomRightShape"}
	} })
	
	--small
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 7, 4, "present2_7_4", {
		{"shape", "triangleBottomRightShape"},
		{"shape", "triangleTopRightShape"},
		{"shape", "triangleTopLeftShape"}
	} })
	
	--small
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 1, 3, "present3_1_3", {
		{"shape", "triangleTopLeftShape"},
	} })
    table.insert(shapeArrayParameters,{"item","hook", 2, 1, 3, 2, 1, 3 })
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
