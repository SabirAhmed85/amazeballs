local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 5, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,5,1},{2},{1,1,5,4}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 2, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,2},{"*"},{1,1,2,1},{2},{1,1,4,1}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 1, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,4,2},{2},{1,1,4,3},{3},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 1, 4, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, 10})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,7,1}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 1, "triangleTopRightShape", 1, 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 4, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{2},{1,2,3,2},{2},{1,2,4,2},{3},{1,2,4,3},{4},{1,2,4,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 7, 2})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 8, 2, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 2, 3, "triangleBottomRightShape", 1, 8, "breakable"})
    --table.insert(shapeArrayParameters,{"simple","simple2_1_2", 1, 2, 6, 3})
    --table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"autoSlide"},{timePerSquare = 300, pauseTime = 40, labelled = false},{1},{1},{1,2,6,3},{2},{1,2,6,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 7, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 3, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 1, 5, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 4, 5})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 4, 6, "bar", "vert"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 3, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 1, 2, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 4, 195}) 
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 3, 75}) 
    table.insert(shapeArrayParameters,{"item", "small-present", 1, 1, 1, 1, "present1_1_1", {
		{"item","clock", _, _, _, _, _, 15, 1},
		{"item","bomb", _, _, _, _, _, 1, {"down"}, 2},
	} })
    table.insert(shapeArrayParameters,{"item", "big-present", 1, 2, 1, 3, "present2_1_3", {
		{"simple"},
		{"item","bomb", _, _, _, _, _, 2, {"up"}, 1},
		{"item","bomb", _, _, _, _, _, 2, {"left"}, 1},
		{"item","bomb", _, _, _, _, _, 2, {"right"}, 1},
	} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
