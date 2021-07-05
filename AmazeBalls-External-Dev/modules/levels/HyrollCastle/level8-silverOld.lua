local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    --table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleTopRightShape", {1, 1}))
        
    -- table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 1}, "down"))
    
    --table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_1", {1, 1, 3, 1}))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"}))

    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 1, 5}, "bar", {"horz", _}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,5},{2},{1,1,2,4}})

    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 1, 2, "up", "right", "down"}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{"blue"},{1},{1},{1,1,1,2},{2},{1,1,1,3},{3},{1,1,2,3}})
    
    --table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1", 1, 1, 7, 3, 7, 4, "right"}, "left"))

    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {1, 1, 5, 2}))

    table.insert(shapeArrayParameters, getShapeArray("item","fullMap", 1, 1, 3, 2}))

    table.insert(shapeArrayParameters, getShapeArray("item","partialMap", 1, 1, 5, 2}))

    --table.insert(shapeArrayParameters, getShapeArray("item","compass", {1, 1, 4, 2}))

    table.insert(shapeArrayParameters, getShapeArray("item","bomb", {1, 1, 2, 1, "bomb1_1_1", {3, "right", "left", "up", "down"}, 3}))

    --table.insert(shapeArrayParameters, getShapeArray("item","bomb", {1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3}))

    --table.insert(shapeArrayParameters, getShapeArray("item","bomb", {1, 1, 2, 5, "bomb3_1_1", {3, "right", "left", "up", "down"}, 6}))

    --table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 7, 2}))
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,2},{2},{1,1,7,2}})

    table.insert(shapeArrayParameters, getShapeArray("item","hook-shot", 1, 1, 4, 2, "hookshot1_1_1", "down", 3, 3}))

    table.insert(shapeArrayParameters, getShapeArray("item","hook-shot", 1, 1, 6, 1, "hookshot2_1_1", "down", 2, 3}))

    table.insert(shapeArrayParameters,  {"item","item-present", 1, 1, 7, 1, "present1_1_1", 
                                            { 
                                                -- {"item","bomb", {1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3},
                                                {"item","clock-time", 1, 1, 3, 2, "clock1_1_1", 10, 1},
                                                {"shape", "triangleTopRightShape"},
                                                {"shape"}, "triangleTopRightShape", {"breakable"},
                                                {"spitter", "up", "right", "down", "left"},
                                                {"autoFan", "down"},
                                                {"autoFan", "up"},
                                                {"manualFan", "down"}

                                                -- when adding to screen : check ShapeArrayParameters for all similar objects in screen, add them up and add 1
                                                -- to get the name of this shape, then add the HorzValue of the Screen and Vert value for the other two numbers in the name
                                                -- State should always be one, For now kill bars will not be included in mystery-block shapes
                                                -- Give it HorzSquare and VertSquare values based on which block its used on
                                                -- Create new object out of all these details and add it to ShapeArrayParameters, and create a new Shape too 
                                            } 
                                        }))

    --table.insert(shapeArrayParameters, getShapeArray("item","jet-pack", 1, 1, 7, 1, "jetpack1_1_1", "down", 3}))

    --table.insert(shapeArrayParameters, getShapeArray("item","clock-time", 1, 1, 3, 2, "clock1_1_1", 10, 1}))

    -- table.insert(shapeArrayParameters,  {"item","item-present", 1, 1, 6, 2, "present2_1_1", 
    --                                         { 
    --                                             -- {"item","bomb", {1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3},
    --                                             {"item","clock-time", 1, 1, 3, 2, "clock1_1_1", 10, 1},
    --                                             {"shape", "triangleTopRightShape"},
    --                                             -- {"shape"}, "triangleTopRightShape", {"breakable"},
    --                                             {"spitter", "up", "right", "down", "left"},
    --                                             {"autoFan", "down"}
    --                                             -- {"manualFan", "down"},

    --                                             -- when adding to screen : check ShapeArrayParameters for all similar objects in screen, add them up and add 1
    --                                             -- to get the name of this shape, then add the HorzValue of the Screen and Vert value for the other two numbers in the name
    --                                             -- State should always be one, For now kill bars will not be included in mystery-block shapes
    --                                             -- Give it HorzSquare and VertSquare values based on which block its used on
    --                                             -- Create new object out of all these details and add it to ShapeArrayParameters, and create a new Shape too 
    --                                         } 
    --                                     }))
   
    table.insert(shapeArrayParameters, getShapeArray("gem","purple1", 1, 1, 2, 5}, "purple"))
     
    table.insert(shapeArrayParameters, getShapeArray("gem","purple2", 1, 1, 3, 5}, "purple"))

    --table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin1", 1, 1, 2, 5}, "purpleCoin"))

    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin1", 1, 1, 3, 1}, "blueCoin"))
    
    table.insert(shapeArrayParameters, getShapeArray("gem","red", 1, 1, 5, 1}, "redCoin"))
    
    --table.insert(shapeArrayParameters, getShapeArray("gem","gold", 1, 1, 6, 1, "gold"}))
    
    --table.insert(shapeArrayParameters, getShapeArray("laser", "long-beam", 1, 1, 6, 1}, "down"))

    --table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 1, 2, "up", "right", "none"}, "left"))
    
    --table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_1_1", {1, 1, 1, 2, "up", "right", "none"}, "left"))
    
    --table.insert(shapeArrayParameters, getShapeArray("gun","gun1_1_1", {1, 1, 4, 4}, "left"))

    --table.insert(shapeArrayParameters, getShapeArray("gun","gun2_1_1", {1, 1, 7, 2}, "left"))

    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint", 1, 1, 4, 3}))
    
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleLeftAndRightShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5, "down", "enabled"}))
    
    --table.insert(shapeArrayParameters, getShapeArray("manualFan","manFan1_1_1", 2, 3, 1, 4}, "down"))
    
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manFan3_1_1", {1, 1, 3, 3}, "left"))
    
    --table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, 4}))
    
    --table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_1_1", {1, 1, 1, 5}, {"none", "right", "down", "none"}))
    
    --table.insert(shapeArrayParameters, getShapeArray("shape","triangle10_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1}))
    
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1}))
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"flip-horizontal"}})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle7_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,5},{2},{1,1,7,3}})
    
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_2", {1, 2, 7, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"silver"},{1},{1},{1,2,7,3},{2},{1,2,7,4}})
    
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1}))
    
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_1_1"},{"flip-horizontal"}})
    
    ---------
    -------- SCREEN 2
    
    --table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint", 1, 1, 3, 2}))
end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 2
t.ballFirstDirection = "down"

------
-- MAP

t.partialMapObtained = false
t.fullMapObtained = false

t.partialMapNecessary = true
t.partialMapScreensArray = {{2,1}}

t.fullMapNecessary = true
t.fullMapScreensArray = {{2,2}}

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

------------------------

--BOMB

t.bombIsInUse = false
t.bombInUseCounter = 0
t.bombIsExplodingCounter = 0

t.bombArray = {}

t.initialDirection = t.ballFirstDirection

return t
