local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 1, "left"})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 2, 2, {
        {name = "simple"},
        {name = "backFire"},
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up", "down", "left"} } }
    }} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 2, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 5, 2, "up"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 6, 2})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 2, 3, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"down", "left"} } }
    }} )
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 4, 4, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 5, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_1", 1, 1, 4, 5, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 1, 1, "right"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 3, 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 4, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 1, 2, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{"orange"},{2},{1},{2,1,1,2},{2},{2,1,3,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 1, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_1", 2, 1, 1, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 1, 4, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,1,4},{2},{2,1,4,5}})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 6, 4, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_1"},{"slide"},{"orange"},{2},{1},{2,1,1,3},{2},{2,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 1, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_2_1", 2, 1, 4, 5, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 5, 5, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 6, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar4_2_1", 2, 1, 4, 6, "bar", "vert"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 2, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 3, 5, 90})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 6, 5, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
