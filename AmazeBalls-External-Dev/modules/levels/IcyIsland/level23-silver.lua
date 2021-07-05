local t = {}
local getShapeArray = require("utils.get-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("characterChangePoint","characterChangePoint1_1_1", {1, 1, 5, 1}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_1_1", {1, 1, 2, 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_1_1", {1, 1, 7, 3}, "triangleLeftAndRightShape", {1}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("door","door1_1_1", {1, 1, 7, 3}, "right"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "hyroll"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle4_1_1", {1, 1, 3, 4}, "triangleLeftAndRightShape", {2}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle5_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"}))

    --SCREEN 2-1
    table.insert(shapeArrayParameters, getShapeArray("door","door1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "left"))
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle1_2_1", {2, 1, 6, 1}, "triangleBottomRightShape", {1, 14, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_2_1", {2, 1, 8, 1}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_2_1", {2, 1, 1, 2}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_2_1", {2, 1, 3, 2}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan2_2_1", {2, 1, 4, 2}, "right"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_2_1"},{"slide"},{},{2},{1},{2,1,2,1},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters, getShapeArray("door","door2_2_1", {2, 1, 7, 3}, "right", {"disabled"}))
    table.insert(shapeArrayParameters, getShapeArray("manualFan","manualFan3_2_1", {2, 1, 1, 4}, "down"))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_2_1"},{"slide"},{},{1},{1},{2,1,1,4},{2},{2,1,2,2},{3},{2,1,3,2}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar4_2_1", {2, 1, 3, 4}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("backFire","backFire1_2_1", {2, 1, 5, 4}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,5,4}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar5_2_1", {2, 1, 3, 5}, "bar", {"horz", 3}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar6_2_1", {2, 1, 5, 5}, "bar", {"vert", 4}))
    table.insert(shapeArrayParameters, getShapeArray("simple","simple1_2_1", {2, 1, 6, 5}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,5,5},{2},{2,1,6,5},{3},{2,1,6,4},{4},{2,1,7,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_2_1", {2, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "icy"}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar7_2_1", {2, 1, 3, 6}, "bar", {"vert", 3}))

    --SCREEN 3-1
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape"))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter1_3_1", {3, 1, 1, 3, "up","right","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_3_1"},{"slide"},{},{2},{1},{3,1,1,1},{2},{3,1,1,3}})
    table.insert(shapeArrayParameters, getShapeArray("shape","bar1_3_1", {3, 1, 3, 3}, "bar", {"horz", 2}))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar2_3_1", {3, 1, 3, 3}, "bar", {"vert", 2}))
    table.insert(shapeArrayParameters, getShapeArray("endPoint","endPoint1_3_1", {3, 1, 3, 3}))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {3, 1, 4, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("item","mystery-block", {3, 1, 7, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    }))
    table.insert(shapeArrayParameters, getShapeArray("shape","bar3_3_1", {3, 1, 3, 4}, "bar", {"vert", 3}))
    table.insert(shapeArrayParameters, getShapeArray("spitter","spitter2_3_1", {3, 1, 7, 4, "up","none","none","none"}))
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_3_1"},{"autoSlide"},{timePerSlide = 600},{1},{1},{3,1,7,4},{2},{3,1,7,5}})
    table.insert(shapeArrayParameters, getShapeArray("shape","triangle2_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, 13}))

    --SWITCHES
    table.insert(shapeArrayParameters, getShapeArray("switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open", "door2_2_1"} }))

    --GEMS
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 4, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 6, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 1, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 3, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {1, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 1, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 3, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 6, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 4, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {2, 1, 5, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 3, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 2}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 4, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 2, 5}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 7, 1}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 5, 3}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purple", {3, 1, 1, 4}, "purple"))
    table.insert(shapeArrayParameters, getShapeArray("gem","redCoin", {3, 1, 3, 5}, "redCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","blueCoin", {1, 1, 5, 2}, "blueCoin"))
    table.insert(shapeArrayParameters, getShapeArray("gem","purpleCoin", {2, 1, 3, 5}, "purpleCoin"))
    --ITEMS
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {2, 1, 7, 1}, 225))
    table.insert(shapeArrayParameters, getShapeArray("item","coins", {3, 1, 6, 3}, 310))
    table.insert(shapeArrayParameters, getShapeArray("item","big-present", {3, 1, 2, 3}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {2, 1, 1, 2}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","small-present", {1, 1, 5, 4}, {}))
    table.insert(shapeArrayParameters, getShapeArray("item","bomb", {1, 1, 2, 4}, {}))

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
