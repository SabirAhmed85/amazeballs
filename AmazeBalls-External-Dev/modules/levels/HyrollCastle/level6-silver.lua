local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_2_1", {2, 1, 3, 1}))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", 2, 1, 6, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, _, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 7, 2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{"lightDarkBlue"},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_1", {2, 1, 1, 3}, "triangleTopRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 3, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 6, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 8, 3}, "bar", {"horz", 2}))

    --SCREEN 1-2
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,1},{2},{1,2,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_1_2", {1, 2, 5, 1}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{"silver"},{1},{1},{1,2,5,1},{2},{1,2,6,1}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_2", {1, 2, 7, 1}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_2", {1, 2, 2, 2}, "triangleBottomRightShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,2},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape", {1, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,4,2},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_1_2", {1, 2, 4, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_1_2", {1, 2, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("autoFan","autoFan1_1_2", {1, 2, 1, 4}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_1_2", {1, 2, 2, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,2,4},{2},{1,2,2,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_2", {1, 2, 6, 4}, "triangleTopAndBottomShape", {1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_2", {1, 2, 3, 5}, "triangleTopLeftShape"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_2"},{"slide"},{"green"},{2},{1},{1,2,3,4},{2},{1,2,3,5}})
    table.insert(shapeArrayParameters, getShapeArray("door","door3_1_2", {1, 2, 7, 5}, "right"))

    --SCREEN 2-2
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_2", {2, 2, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_2", {2, 2, 3, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_2", {2, 2, 3, 1}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_2", {2, 2, 5, 1}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door3_2_2", {2, 2, 6, 1}, "up"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, 4, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_2", {2, 2, 5, 2}, "up"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{"silver"},{3},{1},{2,2,3,5},{2},{2,2,5,3},{3},{2,2,5,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door4_2_2", {2, 2, 1, 3}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_2", {2, 2, 5, 3}, "bar", {"horz"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_2", {2, 2, 6, 3}, "triangleBottomRightShape"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_2_2", {2, 2, 3, 4}, "triangleTopLeftShape", {1, 6, "breakable"}))
    table.insert(shapeArrayParameters, getShapeArray("door","door5_2_2", {2, 2, 1, 5}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {2, 2, 6, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"up", "left"} } },
        {name = "spitter", properties = {directions = {"up", "left", "down"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_2", {2, 2, 7, 5}, "bar", {"horz"}))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 2, 6, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 2, 6, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {2, 2, 5, 1}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {2, 1, 5, 1}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 2, 3, 3}, "purpleCoin"))

    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {1, 2, 1, 5, 115}))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 2, 2, 4, 26))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 5, 3}, 130))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 3, 2, 45}))
    table.insert(shapeArrayParameters, getShapeArray("item","fireCape", {2, 1, 1, 2, 1, 3 }))
    table.insert(shapeArrayParameters, getShapeArray("item","clock", {1, 2, 1, 4, "clock1_1_1", 10, 1}))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {2, 1, 2, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 2, 6, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 2, 2, 1}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 2, 1}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
