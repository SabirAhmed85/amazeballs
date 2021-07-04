local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,1},{2},{1,1,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 4, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 6, 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_1", {1, 1, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 4, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{3},{1},{1,1,2,4},{2},{1,1,3,4},{3},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", {1, 1, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 6, 5}, "triangleTopLeftShape"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, 7}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{2},{1},{2,1,4,2},{2},{2,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", 2, 1, 6, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_1", 2, 1, 4, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", 2, 1, 7, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 9}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 3, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 4, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 3}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 3}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 5, 4}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 7, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 2, 2}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 5, 3}, {}))


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