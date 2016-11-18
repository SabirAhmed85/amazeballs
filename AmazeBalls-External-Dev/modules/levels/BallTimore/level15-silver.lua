local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 7, 2, "none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{4},{1},{1,1,2,2},{2},{1,1,3,2},{3},{1,1,5,2},{4},{1,1,7,2}})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 3, 5, {
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"right","down"} } }
    }} )
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 5, 5, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    }} )
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 6, 5, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } }
    }} )
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 1, 5})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 5, "up"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 1, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 2, 1, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 6, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 5, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_1", 2, 1, 6, 2, "triangleBottomRightShape", 1, 8, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_1", 2, 1, 7, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle10_2_1", 2, 1, 1, 4, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_1", 2, 1, 2, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,3,3},{2},{2,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_1", 2, 1, 4, 4, "triangleTopLeftShape", 1, 6, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 7, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{2},{1},{2,1,7,3},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle11_2_1", 2, 1, 1, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle12_2_1", 2, 1, 3, 5, "triangleTopRightShape", 1, 10, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle13_2_1", 2, 1, 5, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle14_2_1", 2, 1, 6, 5, "triangleTopRightShape", 1, _, "breakable"})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"shape","bar1_3_1", 3, 1, 5, 1, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"gem","redCoin", 3, 1, 5, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"shape","bar2_3_1", 3, 1, 6, 1, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 2, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"slide"},{},{2},{1},{3,1,2,1},{2},{3,1,2,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 4, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 6, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple2_3_1", 3, 1, 7, 2})
    table.insert(shapeArrayParameters,{"door","door1_3_1", 3, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 3, 1, 4, 3, "triangleTopRightShape", 1, 13, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_1", 3, 1, 6, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","big-present", 3, 1, 1, 4, {} })
    table.insert(shapeArrayParameters,{"shape","bar3_3_1", 3, 1, 3, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"backFire","backFire1_3_1", 3, 1, 3, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_3_1"},{"slide"},{},{2},{1},{3,1,1,1},{"*"},{3,1,1,3},{"*"},{3,1,3,3},{2},{3,1,3,4},{3},{3,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar4_3_1", 3, 1, 5, 4, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"shape","bar5_3_1", 3, 1, 4, 5, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"shape","bar6_3_1", 3, 1, 5, 5, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"simple","simple2_3_1", 3, 1, 2, 5})

    --SCREEN 3-2
    table.insert(shapeArrayParameters,{"shape","triangle1_3_2", 3, 2, 2, 1, "triangleTopRightShape", 1, 16, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_2", 3, 2, 5, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_2", 3, 2, 6, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle4_3_2", 3, 2, 1, 2, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","bar1_3_2", 3, 2, 2, 2, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"shape","triangle5_3_2", 3, 2, 3, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_3_2", 3, 2, 4, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_3_2", 3, 2, 5, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_2", 3, 2, 1, 3, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_2", 3, 2, 7, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle8_3_2", 3, 2, 3, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle9_3_2", 3, 2, 4, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_3_2", 3, 2, 2, 5, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle10_3_2", 3, 2, 2, 5, "triangleBottomLeftShape", 1, 7, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle11_3_2", 3, 2, 5, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle12_3_2", 3, 2, 6, 5, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_3_2", 3, 2, 2, 1, "up"})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 3
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
