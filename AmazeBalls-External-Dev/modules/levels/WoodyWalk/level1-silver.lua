local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 4, "triangleTopRightShape", 1})

    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 5, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,
	{
	{"triangle2_1_1"},
	{"slide"},
	{"green"},
	{2},
	{1},
	{1,1,5,4},
	{2},
	{1,1,5,5}
	})
	
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 5, 2} )
	
	
	--insert a shape, where the shape is named triangle3_1_1, 1 unit width and height, at 3,3, it is a triangle facing top left.
	--table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 3, "triangleTopLeftShape", 1})
	
	--insert function to object, the object is named triangle3_1_1, the function going to be inserted is slide, the shape colour is green, slide direction from 3,3 to 3,4
	--direction referenced in all level settings directionArrayIndex
	--table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,3,3},{2},{1,1,3,4}})
end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 2
t.ballFirstDirection = "down"

------
-- MAP

t.partialMapObtained = false
t.fullMapObtained = false

t.partialMapNecessary = false
t.partialMapScreensArray = {}

t.fullMapNecessary = false
t.fullMapScreensArray = {}

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

t.toolArray = {}
t.objectArray = {}
------------------------

--BOMB

t.bombIsInUse = false
t.bombInUseCounter = 0
t.bombIsExplodingCounter = 0

t.bombArray = {}

t.initialDirection = t.ballFirstDirection

return t
