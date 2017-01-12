local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 1, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 2, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 3, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 5, 2, "bar", "vert", 1})
    table.insert(shapeArrayParameters,{"shape","bar5_1_2", 1, 2, 6, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar6_1_2", 1, 2, 7, 2, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 2, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{3},{1},{1,2,4,3},{2},{1,2,6,2},{3},{1,2,7,2}})
    table.insert(shapeArrayParameters,{"shape","bar7_1_2", 1, 2, 4, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,2,3},{2},{1,2,2,4},{3},{1,2,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 4, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{4},{1},{1,2,5,4},{"*"},{1,2,5,5},{2},{1,2,6,5},{3},{1,2,6,4},{4},{1,2,7,4}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 2, "triangleTopAndBottomShape", 2})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,1},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 1, 8, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 3, "triangleLeftAndRightShape", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 3, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 3, "triangleLeftAndRightShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,6,2},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 1, 4, "triangleTopAndBottomShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 5, 4, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 4} )
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_1", 1, 1, 4, 5} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 6, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 6, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 1, 3, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 1, 80}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 3, 5, 120}) 
    table.insert(shapeArrayParameters,{"item", "big-present", 1, 2, 1, 4, "present1_1_4", {
		{"simple"}
	} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
