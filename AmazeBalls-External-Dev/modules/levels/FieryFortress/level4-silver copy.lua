local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;    --addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 1}, "triangleTopRightShape", {1, 1})
        
    -- addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 3, 1}, "down")
    
    --addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 3, 1})

    --addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "icy"})

    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})

    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, _, "fire"})

    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 5}, "bar", {"horz", _})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,5},{2},{1,1,2,4}})

    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 2}, "up", "right", "down", "left")
    addToTransitionArray(ta,{{"spitter1_1_1"},{"slide"},{"darkBlue"},{1},{1},{1,1,1,2},{2},{1,1,1,3},{3},{1,1,2,3}})
    
    --addToShapeArray(sp, "tunnel","tunnel1", {1, 1, 7, 3, 1, 1, 7, 4, "right"}, "left")

    addToShapeArray(sp, "item","mystery-block", {1, 1, 5, 1}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "bar", properties = { shape = "horz"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })

    addToShapeArray(sp, "item","mystery-block", {1, 1, 5, 2}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })

    addToShapeArray(sp, "item","map", {1, 1, 3, 2})

    addToShapeArray(sp, "item","compass", {1, 1, 4, 2})

    addToShapeArray(sp, "item","bomb", {1, 1, 2, 1, "bomb1_1_1", 3, {"right", "left", "up", "down"}, 3})

    addToShapeArray(sp, "item","bomb", {1, 1, 2, 4, "bomb1_1_1", 3, {"right", "left", "up", "down"}, 3})

    --addToShapeArray(sp, "item","bomb", {1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3})

    --addToShapeArray(sp, "item","bomb", {1, 1, 2, 5, "bomb3_1_1", {3, "right", "left", "up", "down"}, 6})

    --addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 2})
    --addToTransitionArray(ta,{{"simple1_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,2},{2},{1,1,7,2}})

    --addToShapeArray(sp, "item","hook-shot", 1, 1, 4, 2, "hookshot1_1_1", "down", 3, 3})

    addToShapeArray(sp, "item","hook", {1, 1, 6, 1, "hookshot2_1_1", "down", 2, 3})

    --addToShapeArray(sp, "item","jet", 1, 1, 7, 1, "jetpack1_1_1", "down", 3})

    --addToShapeArray(sp, "item","clock-time", 1, 1, 3, 2, "clock1_1_1", 10, 1})

    -- addToTransitionArray(shapeArrayParameters,  {"item","item-present", 1, 1, 7, 2, "present2_1_1", 
    --                                         { 
    --                                             -- {"item","bomb", {1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3},
    --                                             {"item","clock-time", 1, 1, 3, 2, "clock1_1_1", 10, 1},
    --                                             {"shape", "triangleTopRightShape"},
    --                                             -- {"shape"}, "triangleTopRightShape", {"breakable"},
    --                                             {"spitter", "up", "right", "down", "left"},
    --                                             {"manualFan", "right"},
    --                                             {"manualFan", "down"}

    --                                             -- when adding to screen : check ShapeArrayParameters for all similar objects in screen, add them up and add 1
    --                                             -- to get the name of this shape, then add the HorzValue of the Screen and Vert value for the other two numbers in the name
    --                                             -- State should always be one, For now kill bars will not be included in mystery-block shapes
    --                                             -- Give it HorzSquare and VertSquare values based on which block its used on
    --                                             -- Create new object out of all these details and add it to ShapeArrayParameters, and create a new Shape too 
    --                                         } 
    --                                     })
   
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
     
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")

    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin")

    addToShapeArray(sp, "gem","blueCoin", {1, 1, 7, 1}, "blueCoin")
    
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 2}, "redCoin")
    
    --addToShapeArray(sp, "gem","gold", 1, 1, 6, 1, "gold"})
    
    --addToShapeArray(sp, "laser", "long-beam", 1, 1, 6, 1}, "down")

    --addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 2, "up", "right", "none"}, "left")
    
    --addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 1, 2, "up", "right", "none"}, "left")
    
    --addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 4, 4}, "left")

    --addToShapeArray(sp, "gun","gun2_1_1", {1, 1, 7, 2}, "left")

    addToShapeArray(sp, "endPoint","endPoint", 1, 1, 4, 3})
    
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleLeftAndRightShape", {1})
    addToTransitionArray(ta,{{"triangle3_1_1"},{"flip-horizontal"}})
    
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5, "down", "enabled"})
    
    --addToShapeArray(sp, "manualFan","manFan1_1_1", 2, 3, 1, 4}, "down")
    
    addToShapeArray(sp, "manualFan","manFan3_1_1", {1, 1, 3, 3}, "left")
    
    --addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, 4})
    
    --addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 1, 5}, {"none", "right", "down", "none"})
    
    --addToShapeArray(sp, "shape","triangle10_1_1", {1, 1, 7, 1}, "triangleBottomRightShape", {1})
    
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    --addToTransitionArray(ta,{{"triangle7_1_1"},{"flip-horizontal"}})
    addToTransitionArray(ta,{{"triangle7_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,5},{2},{1,1,7,3}})
    
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 2, 7, 3}, "up")
    addToTransitionArray(ta,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,2,7,3},{2},{1,2,7,4}})
    
    addToShapeArray(sp, "shape","triangle8_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1})
    
    --addToShapeArray(sp, "shape","triangle9_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, 5})
    --addToTransitionArray(ta,{{"triangle9_1_1"},{"flip-horizontal"}})
    
    ---------
    -------- SCREEN 2
    
    --addToShapeArray(sp, "endPoint","endPoint", 1, 1, 3, 2})
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
t.backgroundImage = "images/level-images/castle-background.jpg"

------
-- MAP

t.mapObtained = false

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
