local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 4, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 2}, "right"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 3, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 3, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 6, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_3_1"},{"slide"},{"orange"},{2},{1},{2,1,5,2},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 4}, "triangleBottomLeftShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_1"},{"slide"},{"green"},{2},{1},{2,1,3,4},{2},{2,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 7, 4}, "triangleTopRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 3, 5}, "triangleTopLeftShape", {1, 6}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 4, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 7, 5}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 1, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 4, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 4, 1}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 6, 5}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 5}, 75))
    --table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 4, 4}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t