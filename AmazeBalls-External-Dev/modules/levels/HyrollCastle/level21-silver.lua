local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 2, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 2, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 1, 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 5, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 2, 5})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 7, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 1})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 2, 1, 2, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"up", "left"} } }
    }} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 5, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,5},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 3, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 4, 4, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,4,4},{3},{1,2,6,4}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 5, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 4, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 7, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 4, 470})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 4, 70})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 5, 80})
    table.insert(shapeArrayParameters,{"item","fireCape", 1, 2, 7, 2, 3, 5})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 3, 4, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 3, 2, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 5, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
