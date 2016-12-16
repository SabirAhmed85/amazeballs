local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 2, "triangleTopRightShape", 1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,2},{2},{1,1,2,1}})
    
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 1, "triangleBottomRightShape", 1, 14})

    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,2,4},{2},{1,1,2,3},{3},{1,1,4,3}})

    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{1},{1},{1,1,5,2},{2},{1,1,6,3}})
    
    table.insert(shapeArrayParameters,{"switch","switch1", 1, 1, 7, 2, { {"door-open", "door1_1_1"} }, "one-way" } )

    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 7, 3, "bar", "vert", 2})

    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 4, "triangleTopRightShape"})

    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 4, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,4},{2},{1,1,5,4},{3},{1,1,7,4}})

    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 3, "right", "enabled"} )

    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 3, 5, "down", "disabled"} )

    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 6, 6, "bar", "vert", 3})

    -------------
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up", "enabled"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 1, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 6, 1})

    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 2, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,2},{2},{1,2,2,3}})

    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 3, "triangleBottomLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,3},{2},{1,2,7,3}})

    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 6, 5, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{2},{1},{1,2,6,4},{2},{1,2,6,5}})

    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 3, 4, "triangleTopRightShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 3, 5, "right"})

    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1, _, "fire"})

    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 2, 5, "triangleTopLeftShape", 1, _, "breakable"})

    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 5, "bar", "horz", 2})

    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 2, 1, "up", "enabled"} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 6, 5, "redCoin"} )
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 4, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 3, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 2, 150})    
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 7, 1, "present1_1_1", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 4, 2, "present2_1_2", {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
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
