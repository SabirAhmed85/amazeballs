local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopAndBottomShape", {2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomLeftShape", {1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 3, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_1", {1, 1, 4, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_1", {1, 1, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_1", {1, 1, 1, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, 10, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 5}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,6,3},{2},{1,1,6,5}})

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 5, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 1, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,1,2},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 3, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, 11, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 5, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 6, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 3, 5}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{2},{1},{2,1,2,5},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 6, 5}, "up"))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 5, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 3, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_3_1", {3, 1, 2, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_1", {3, 1, 3, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_1", {3, 1, 7, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_1", {3, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_1", {3, 1, 3, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_3_1", {3, 1, 5, 4}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_3_1"},{"slide"},{},{2},{1},{3,1,5,3},{2},{3,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_3_1", {3, 1, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape"))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 1, 1, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {3, 1, 2, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 2}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 7, 2}, 12))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 7, 2}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 3, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {3, 1, 4, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {3, 1, 1, 3}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
