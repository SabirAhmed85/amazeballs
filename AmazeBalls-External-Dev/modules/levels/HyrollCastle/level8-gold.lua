local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 2, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 4, 3, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 7, 3}, "bar", {"horz", 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 480, pauseTime = 0, labelled = false},{1},{1},{1,1,7,3},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 4}, "right"))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 4, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_2_1", {2, 1, 4, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{"*"},{2,1,4,3},{2},{2,1,5,3},{3},{2,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 7, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 1, 4})) -- instead of timeout for now
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_1", {2, 1, 1, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape", {1, 7}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,2,4},{2},{2,1,3,4},{3},{2,1,3,3}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 4, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{},{1},{1},{2,1,4,4},{2},{2,1,4,5}})
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_2_1", {2, 1, 6, 4}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape", {1, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 5, 5}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 7, 5}, "right"))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_3_1", {3, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_3_1", {3, 1, 2, 1, "triangleBottomLeftShape"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_3_1", {3, 1, 6, 1}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_3_1", {3, 1, 7, 1}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple2_3_1", {3, 1, 4, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 5, 2}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_3_1", {3, 1, 5, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_3_1", {3, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_3_1", {3, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_3_1", {3, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable", 6}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple3_3_1", {3, 1, 6, 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_3_1", {3, 1, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_3_1", {3, 1, 7, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_3_1", {3, 1, 6, 5}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan4_3_1", {3, 1, 7, 5}, "down"))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {3, 1, 1, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 3, 4}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {3, 1, 4, 4}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 7, 3, 245}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 6, 1, 395}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 4, 5}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 2, 1, 7, 2, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", 3, 1, 5, 4, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 1, 4, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 2, 1, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {3, 1, 7, 3, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","fireCape", 2, 1, 2, 5, {}})
    table.insert(shapeArrayParameters, getShapeArray("item","dummyBall", 3, 1, 2, 5, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
