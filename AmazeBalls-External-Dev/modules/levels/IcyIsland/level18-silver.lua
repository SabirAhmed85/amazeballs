local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 1, 2, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 3, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 3, "triangleTopRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 7, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,7,1},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 2, 5, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    }} )
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 5, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 5, 5, {
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"right"} } }
    }} )
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 2, 6, "bar", "vert", 2})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 2, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 5, 2, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_1", 2, 1, 4, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 3, 4, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{1},{1},{2,1,3,4},{2},{2,1,5,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 6, 4, "right"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_1", 2, 1, 4, 5, "down"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 3, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_2", 3, 1, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 3, 1, 7, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_2", 3, 1, 1, 2, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_2", 3, 1, 4, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 3, 1, 5, 2, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{},{3},{1},{3,1,4,4},{"*"},{3,1,4,3},{2},{3,1,5,3},{3},{3,1,5,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 3, 1, 6, 2, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{1},{1},{3,1,6,2},{"*"},{3,1,6,3},{2},{3,1,7,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 3, 1, 3, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 3, 1, 7, 4, "up"})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 3, 1, 1, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 3, 1, 1, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_2", 3, 1, 5, 5, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_2"},{"slide"},{},{2},{1},{3,1,5,4},{2},{3,1,5,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 1, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 1, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 3, 1, 2, 3, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 5, 120})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 3, 140})
    table.insert(shapeArrayParameters,{"item","small-present", 3, 1, 1, 4, {}})
    table.insert(shapeArrayParameters,{"item","clock", 1, 1, 4, 2, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
