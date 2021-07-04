local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 3, 1}))
    table.insert(shapeArrayParameters, getShapeArray("item","map", {1, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 2}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,8,3},{2},{1,1,8,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 3, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 5, 5}, "down"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_1", {2, 1, 7, 1, 1, 1, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 2, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape", {1, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,2},{2},{2,1,5,2},{3},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 1, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 3, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 4, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 4, 5}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,4,5},{2},{2,1,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 6, 5}, "triangleBottomRightShape", {1, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"slide"},{},{3},{1},{2,1,5,3},{2},{2,1,6,3},{3},{2,1,6,5}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_2", {1, 2, 7, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 1, 2}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 5, 3}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{},{1},{1},{1,2,5,3},{2},{1,2,5,4},{3},{1,2,5,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 3, 4}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,2,4},{2},{1,2,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 6, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{3},{1},{1,2,6,1},{2},{1,2,6,2},{3},{1,2,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 7, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopLeftShape", {1, 6, "breakable"}))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("tunnel","tunnel1_2_2", {2, 2, 2, 1, 2, 1, 1, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 2, 2}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 4, 2}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"slide"},{},{2},{1},{2,2,4,1},{2},{2,2,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, 2, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_2", {2, 2, 2, 4}, "triangleBottomRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_2", {2, 2, 4, 4}, "triangleTopRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_2"},{"slide"},{},{1},{1},{2,2,4,4},{2},{2,2,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_2", {2, 2, 6, 4}, "triangleTopLeftShape"))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 1, 7, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 3, 5}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 1, 5, 4}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 3, 2}, 70))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 3}, 65))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 3, 3}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 3, 1}, 110))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 6, 5}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 2, 6, 3}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 5, 5}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
