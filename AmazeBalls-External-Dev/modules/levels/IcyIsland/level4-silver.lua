local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 6, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 6, 4}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 3, 3}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 1, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 3, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 5, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 7, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan5_2_1", {2, 1, 2, 2}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan6_2_1", {2, 1, 4, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan6_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{2},{2,1,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan7_2_1", {2, 1, 6, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan7_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan8_2_1", {2, 1, 5, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan9_2_1", {2, 1, 7, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan10_2_1", {2, 1, 1, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan11_2_1", {2, 1, 3, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan12_2_1", {2, 1, 6, 4}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan12_2_1"},{"slide"},{},{2},{1},{2,1,6,3},{2},{2,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan13_2_1", {2, 1, 2, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan14_2_1", {2, 1, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 5, 5}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"slide"},{},{3},{1},{2,1,3,3},{"*"},{2,1,4,3},{"*"},{2,1,4,4},{2},{2,1,5,4},{3},{2,1,5,5}})

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_2_2", {2, 2, 2, 1, "none","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{3},{1},{2,2,2,1},{2},{2,2,2,3},{3},{2,2,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_2_2", {2, 2, 5, 2, "none","none","none","left"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_2_2"},{"slide"},{},{3},{1},{2,2,5,1},{2},{2,2,5,2},{3},{2,2,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 4, 5}, "triangleBottomRightShape", {1, 14, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 1, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 1, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 1, 5}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 2, 1}, 27))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 6, 1}, 135))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 4, 4}, 80))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 6, 5}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 6, 1}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 4, 1}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","hook", {2, 1, 7, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {2, 2, 6, 5}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
