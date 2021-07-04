local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 5, 1}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 16}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_1", {1, 1, 3, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,4,2},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,5,2},{2},{1,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_1_1", {1, 1, 6, 2}, "left"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_1"},{"autoSlide"},{pauseTime = 1500, isActiveWhenSliding = false},{1},{1},{1,1,6,2},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 4}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"vert", 2}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomRightShape"))
    --table.insert(shapeArrayParameters, getShapeArray("timeOut","timeOut1_2_1", {2, 1, 4, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 1, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 3, 2}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_2_1", {2, 1, 5, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 7, 2}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_2_1", {2, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 5, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 1, 4}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 7, 3}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan4_2_1", {2, 1, 1, 4}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan3_2_1", {2, 1, 3, 4}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 1, 7, 2}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 5, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 6, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 4, 1}, 250))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 5, 5}, 150))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 4, 4}, {}))

    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {1, 1, 1, 3}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
