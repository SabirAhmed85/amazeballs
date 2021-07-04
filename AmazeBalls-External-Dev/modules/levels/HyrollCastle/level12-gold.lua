local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 1, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_1_1", {1, 1, 2, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 2, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,2,1},{3},{1,1,3,1}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 1, 3}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,1,3},{2},{1,1,1,5}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 5, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,3,4},{2},{1,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_1_1", {1, 1, 3, 5}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{2},{1},{1,1,5,5},{2},{1,1,6,5},{3},{1,1,6,3},{4},{1,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_1_1", {1, 1, 8, 5}, "bar", {"horz"}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 5, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,5,1},{3},{1,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_2", {1, 2, 7, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,6,2},{2},{1,2,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_1_2", {1, 2, 2, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"slide"},{},{2},{1},{1,2,1,3},{2},{1,2,1,2},{3},{1,2,2,2}})
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_2", {1, 2, 3, 3}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{3},{1},{1,2,1,5},{2},{1,2,3,5},{3},{1,2,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_1_2", {1, 2, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{},{2},{1},{1,2,5,5},{2},{1,2,6,5},{3},{1,2,6,4}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_2", {2, 2, 1, 3}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_2", {2, 2, 5, 3}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 7, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 2, 4, 3}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 3, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 2}, 225))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 7, 3}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 2, 4, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 7, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 7, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 4, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","characterSpecial", {2, 2, 6, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
