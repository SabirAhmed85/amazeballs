local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 3, 2}, "bar", {"horz"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{1},{1},{1,1,3,2},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 6, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 4, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 5, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{"brown"},{2},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 7, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{"brown"},{3},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 6, 4}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 5}, "right"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 4, 2, "triangleTopAndBottomShape", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,2},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 2, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{"brown"},{2},{1},{2,1,2,1},{2},{2,1,2,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 3, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 1, 5}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 5, "triangleTopAndBottomShape", 1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,5},{2},{2,1,4,5}})

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 1, 7, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 1, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin"))

    --ITEMS
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 7, 5}, 90))
    --table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 5}, 250))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
