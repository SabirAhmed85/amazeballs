local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 1, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{3},{1},{1,1,2,1},{2},{1,1,4,1},{3},{1,1,5,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 2, "up"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_1", 1, 1, 2, 2, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 4, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 5, 2, "up"})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 2, 3, {
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"right", "down", "left"} } }
    } })
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 3, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 4, 3, "up"})
    --table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 5, 3, "purpleCoin"})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 6, 3, {
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"left"} } }
    } })
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,6,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 2, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,4},{2},{1,1,4,4},{3},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 7, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,1,4},{2},{1,1,1,5}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 2, 6, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 4, 6, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 6, 6, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 7, 5})

    -- 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 1, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{2},{1},{2,1,3,1},{2},{2,1,3,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 5, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,5,2},{2},{2,1,6,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 7, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 7, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 6, 3, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 3, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{"orange"},{2},{1},{2,1,2,4},{2},{2,1,3,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 5, 4, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{"orange"},{1},{1},{2,1,5,4},{2},{2,1,5,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 1, 5, "triangleTopAndBottomShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 7, 5, "triangleTopRightShape"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 6, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 6, 5, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 3, 350}) 
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 1, 50}) 
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 1, 3, "present1_2_1", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 6, 3, "present2_2_1", {} })
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 7, 4, 70}) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
