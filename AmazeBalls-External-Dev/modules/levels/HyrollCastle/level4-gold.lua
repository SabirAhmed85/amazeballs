local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 1, 1}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_1_1", {1, 1, 4, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_1", {1, 1, 4, 2}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire2_1_1", {1, 1, 7, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan2_1_1", {1, 1, 4, 4}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,4,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 1, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_1", {1, 1, 3, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_1", {1, 1, 5, 5}, "down"))
    table.insert(shapeArrayParameters, getShapeArray("door","door4_1_1", {1, 1, 7, 5}, "down"))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 1, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 4, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door4_1_2", {1, 2, 5, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("door","door5_1_2", {1, 2, 6, 1, "up", "disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door6_1_2", {1, 2, 7, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 5, 2}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 6, 2}, "triangleTopLeftShape", {1, 11, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 2, 3}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 4, 3}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,4,3},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 1, 4}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 3, 4}, "triangleTopLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle6_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle7_1_2", {1, 2, 2, 5}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 4, 5}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle8_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, 13}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle9_1_2", {1, 2, 7, 5}, "triangleTopLeftShape"))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 4, 5}, { {"door-open", "door5_1_2"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 2, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {1, 2, 6, 3}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 7, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {1, 2, 4, 1}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 1, 3}, 75))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 3, 2}, 60))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 7, 3, 45}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 1, 5, 5, 175}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 7, 1}, {}))


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
