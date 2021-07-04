local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleLeftAndRightShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,1,1},{2},{1,1,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 7, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,5,3},{2},{1,1,7,3},{3},{1,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 4, 5}, "triangleTopAndBottomShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"slide"},{"green"},{1},{1},{1,1,4,5},{2},{1,1,5,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{2},{1},{2,1,1,1},{2},{2,1,2,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 3, 1}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{"green"},{1},{1},{2,1,3,1},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{3},{1},{2,1,1,4},{2},{2,1,2,3},{3},{2,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{"green"},{4},{1},{2,1,4,3},{2},{2,1,4,4},{3},{2,1,6,4},{4},{2,1,7,5}})

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 3, 4}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 1, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 3, 4}, "purpleCoin"))

    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 3}, 65))) 
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 1, 3}, 75)) 
    table.insert(shapeArrayParameters, getShapeArray("item", "small-present", {2, 1, 6, 3}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
