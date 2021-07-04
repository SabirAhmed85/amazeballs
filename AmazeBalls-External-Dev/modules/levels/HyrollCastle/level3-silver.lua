local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 7, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 2, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 5, 5}, "right"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{3},{1},{1,2,2,1},{2},{1,2,3,1},{"*"},{1,2,3,2},{3},{1,2,4,2},{4},{1,2,4,3},{"*"},{1,2,3,3},{5},{1,2,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 5, 3}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{"silver"},{1},{1},{1,2,5,3},{2},{1,2,6,2},{3},{1,2,6,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"orange"},{1},{1},{1,2,6,4},{2},{1,2,6,5}})
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_2", {1, 2, 7, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopLeftShape", {1, 6, "breakable"}))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("item","map", {2, 2, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_2_2", {2, 2, 2, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 6, 4}, "triangleTopLeftShape", {1, _, "hyroll"}))

    --SCREEN 3-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_2", {3, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_2", {3, 2, 6, 2}, "triangleBottomLeftShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_2", {3, 2, 1, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_2", {3, 2, 3, 4}, "triangleTopLeftShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_2", {3, 2, 6, 4}, "triangleTopLeftShape", {1, _, "icy"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 2, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 4, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {3, 2, 5, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 4, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 5, 4}, 20))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 6, 3}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 2, 1, 4}, 500))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 4, 1}, 90))
    table.insert(shapeArrayParameters, getShapeArray("item","bomb", {1, 1, 2, 4 }))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 2, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 1, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {3, 2, 5, 2}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
