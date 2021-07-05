local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

	-- 1-1
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1", 1, 1, 1, 1, 2, 1, 2, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz"}))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleLeftAndRightShape", {1}))

    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 6, 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,6,1},{2},{1,1,6,2},{3},{1,1,6,3}})

    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 8, 1}, "bar", {"horz"}))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"}))

    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_1_1", {1, 1, 3, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,3,3},{2},{1,1,3,4}})

    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 7, 4}))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape"))

    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    -- 2-1
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 5, 1}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{2},{1},{2,1,3,1},{2},{2,1,5,1}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 6, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{"lightDarkBlue"},{2},{1},{2,1,4,2},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_2_1", {2, 1, 2, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_2_1"},{"slide"},{"lightDarkBlue"},{1},{1},{2,1,2,3},{2},{2,1,3,3},{3},{2,1,4,3}})
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_2_1", {2, 1, 5, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,5,3},{2},{2,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 4}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{3},{1},{2,1,4,4},{2},{2,1,5,5},{3},{2,1,6,5}})

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 1, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 4, 5}, "purpleCoin"))

    --ITEMS   
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 5, 350}) 
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 1}, 90)) 
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {1, 1, 3, 1, 2, 3 })    
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 6, 4}, {}))

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
