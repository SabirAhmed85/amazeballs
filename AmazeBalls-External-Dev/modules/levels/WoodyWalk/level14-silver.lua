local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1

    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 2, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 6, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 1, 3, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 5, 3, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 3})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"} )
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 1, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,4},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 6, 4})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_1", 1, 1, 1, 5})
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 2, 5, { {"door-open", "door4_2_1"}, {"door-open", "door2_2_1"} } })
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 7, 5, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"simple","simple3_1_1", 1, 1, 7, 5})

    -- 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 2, "left"} )
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 3, "left"} )

    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 5, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,3,1},{2},{2,1,5,1}})

    table.insert(shapeArrayParameters,{"simple","simple2_2_1", 2, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,4,2},{2},{2,1,6,2}})

    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 3, "triangleBottomRightShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"simple","simple3_2_1", 2, 1, 5, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple3_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,5,3},{2},{2,1,6,3},{3},{2,1,7,3}})

    table.insert(shapeArrayParameters,{"simple","simple4_2_1", 2, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple4_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,1,4},{2},{2,1,2,4},{3},{2,1,4,4}})

    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 5, "triangleTopRightShape", 1, 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 7, 5, "triangleTopLeftShape", 1, 5})

    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 7, 3, "right", "enabled"} )

    table.insert(shapeArrayParameters,{"door","door4_2_1", 2, 1, 3, 5, "down", "disabled"} )

    -------------

    table.insert(shapeArrayParameters,{"simple","simple1_3_1", 3, 1, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_3_1"},{"slide"},{"lightBlue"},{2},{1},{3,1,2,1},{2},{3,1,2,3},{3},{3,1,2,5}})

    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 5, 1, "triangleTopAndBottomShape", 1})

    table.insert(shapeArrayParameters,{"door","door1_3_1", 3, 1, 7, 1, "right", "disabled"} )

    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_1", 3, 1, 1, 2, "down"})

    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 6, 2, "triangleBottomRightShape", 1, _, "fire"})

    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 1, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"switchSlide"},{timePerSquare = 500, pauseTime = 0, labelled = false},{2},{1},{3,1,1,3},{2},{3,1,1,4}})
    table.insert(shapeArrayParameters,{"switch","switch1", 3, 1, 4, 2, { {"slide", "autoFan1_3_1"}, {"door-open", "door1_3_1"} }, "one-way", "not-labelled" } )

    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 3, 1, 6, 4, "triangleTopLeftShape", 1, _, "fire"})

    table.insert(shapeArrayParameters,{"shape","triangle4_3_1", 3, 1, 5, 5, "triangleTopAndBottomShape", 2})

    table.insert(shapeArrayParameters,{"door","door2_3_1", 3, 1, 7, 5, "right", "enabled"} )

    -------------

    -- 4-1
    table.insert(shapeArrayParameters,{"shape","triangle1_4_1", 4, 1, 1, 1, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_4_1", 4, 1, 4, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_4_1", 4, 1, 7, 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_4_1", 4, 1, 1, 2, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_4_1", 4, 1, 6, 2, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle5_4_1", 4, 1, 1, 3, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","bar1_4_1", 4, 1, 3, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_4_1"},{"slide"},{"brown"},{2},{1},{4,1,3,1},{2},{4,1,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle6_4_1", 4, 1, 4, 3, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle7_4_1", 4, 1, 5, 3, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","bar2_4_1", 4, 1, 6, 4, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_4_1"},{"slide"},{"brown"},{2},{1},{4,1,5,4},{2},{4,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle8_4_1", 4, 1, 7, 3, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"simple","simple1_4_1", 4, 1, 1, 4})
    table.insert(shapeArrayParameters,{"shape","triangle9_4_1", 4, 1, 5, 4, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_4_1"},{"slide"},{"green"},{2},{1},{4,1,5,4},{2},{4,1,5,5}})
    table.insert(shapeArrayParameters,{"shape","triangle10_4_1", 4, 1, 1, 5, "triangleTopLeftShape", 1, 6})
    table.insert(shapeArrayParameters,{"shape","triangle11_4_1", 4, 1, 6, 5, "triangleTopLeftShape", 1})

    -- 2-2

    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 6, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 1, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"simple","simple1_2_2", 2, 2, 2, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{"lightBlue"},{1},{1},{2,2,2,2},{"*"},{2,2,2,1},{2},{2,2,5,1}})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 3, 2, "none", "right", "none", "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{"darkBlue"},{1},{1},{2,2,3,2},{2},{2,2,3,3},{3},{2,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 6, 2, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 1, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 5, 3, "triangleTopRightShape", 1, 16, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 7, 3, "right"} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 2, 2, 1, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 4, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 6, 4, "triangleTopRightShape", 1, 17})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_2"},{"slide"},{"green"},{2},{1},{2,2,5,4},{2},{2,2,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_2", 2, 2, 1, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 2, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 4, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 7, 5, "bar", "horz", 2})

    -- 3-2
    table.insert(shapeArrayParameters,{"door","door1_3_2", 3, 2, 1, 1, "up"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_3_2", 3, 2, 1, 1, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_2", 3, 2, 3, 1, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_2", 3, 2, 4, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_2", 3, 2, 5, 1, "triangleBottomRightShape", 1, 8, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_3_2", 3, 2, 7, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle6_3_2", 3, 2, 3, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_3_2", 3, 2, 5, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_3_2", 3, 2, 7, 2, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle8_3_2"},{"slide"},{"green"},{2},{1},{3,2,6,3},{2},{3,2,7,2}})
    table.insert(shapeArrayParameters,{"shape","triangle9_3_2", 3, 2, 2, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_2", 3, 2, 4, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle10_3_2", 3, 2, 1, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_2", 3, 2, 5, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle11_3_2", 3, 2, 6, 5, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_2", 3, 2, 7, 5, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 4, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 4, 1, 2, 1, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 4, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 3, 1, 5, 2, "purpleCoin"})

    --ITEMS   
    table.insert(shapeArrayParameters,{"item","coins", 3, 2, 4, 2, 700}) 
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 7, 2, 350}) 
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 6, 5, 550})  
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 7, 3, 120})
    table.insert(shapeArrayParameters,{"item","coins", 3, 1, 7, 3, 90})
    table.insert(shapeArrayParameters,{"item","coins", 3, 1, 4, 4, 350})
    table.insert(shapeArrayParameters,{"item","characterSpecial", 2, 2, 5, 5, 2, 3 })    
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 6, 4, "present1_6_4", {
		{"item","bomb", _, _, _, _, _, 1, {"down"}, 1},
		{"item","bomb", _, _, _, _, _, 1, {"left"}, 1}
	} }) 
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 7, 2, "present2_7_2", {
		{"item","bomb", _, _, _, _, _, 1, {"right"}, 1},
		{"item","bomb", _, _, _, _, _, 1, {"up"}, 1}
	} })
    table.insert(shapeArrayParameters,{"item","big-present", 3, 2, 5, 3, "present3_5_3", {
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 10, 1}
	} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 2, 4, 3, "present4_4_3", {
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 10, 1}
	} })
    table.insert(shapeArrayParameters,{"item","big-present", 3, 1, 7, 4, "present5_7_4", {
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 15, 1}
	} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"

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
