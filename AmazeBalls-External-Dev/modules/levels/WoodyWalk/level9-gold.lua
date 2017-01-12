local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 4, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 2, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 3, 3, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{2},{1},{1,1,2,3},{2},{1,1,3,3}})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_1", 1, 1, 3, 5, 2} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 5, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 5} )

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 2, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,4,2},{2},{1,2,5,2},{3},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 3, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,3},{2},{1,2,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 4, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,4},{2},{1,2,2,4},{3},{1,2,3,4}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 6, 4})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 3, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 7, 2, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 1, 170}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 4, 70}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 5, 60}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 4, 130}) 
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 6, 5, "present1_6_5", {
		{"simple"},
		{"simple"}
	} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 2, 5, "present2_2_5", {
		{"simple"},
		{"item","bomb", _, _, _, _, _, 1, {"left"}, 1},
		{"item","bomb", _, _, _, _, _, 1, {"right"}, 1},
	} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 1, 5, "present3_1_5", {
		{"item","clock", _, _, _, _, _, 5, 1},
		{"item","clock", _, _, _, _, _, 10, 1}
	} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
