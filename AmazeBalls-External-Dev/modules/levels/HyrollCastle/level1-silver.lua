local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,1},{2},{1,1,2,1},{3},{1,1,5,1}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 6, 1, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 1, "left"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,6,1},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,5},{2},{1,1,3,5},{3},{1,1,4,5},{4},{1,1,5,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door4_1_1", 1, 1, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 7, 5, "up"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door4_1_2", 1, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 2, "doubleBar", "vert"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 4, 2, "doubleBar", "vert"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 1, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 4, 2})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 3, "triangleLeftAndRightShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{2},{1},{1,2,7,2},{2},{1,2,7,3}})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 2, 3, 4, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    }} )
    table.insert(shapeArrayParameters,{"door","door5_1_2", 1, 2, 7, 5, "down"})

    --SCREEN 1-3
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 3, 2, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_3", 1, 3, 6, 2, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{"silver"},{1},{1},{1,3,6,2},{2},{1,3,7,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 2, 3, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_3", 1, 3, 5, 3, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_3", 1, 3, 6, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_3"},{"slide"},{"silver"},{1},{1},{1,3,6,3},{2},{1,3,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 1, 4, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_3", 1, 3, 5, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_1_3"},{"slide"},{"silver"},{1},{1},{1,3,5,4},{2},{1,3,7,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_3", 1, 3, 3, 5, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_1_3"},{"slide"},{"silver"},{2},{1},{1,3,2,4},{2},{1,3,3,5}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_3", 1, 3, 2, 5})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 3, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 3, 1, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 2, 100})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 2, 3, 1, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    table.insert(shapeArrayParameters,{"item","clock", 1, 1, 1, 3, "clock1_1_1", 10, 1})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 4, 210})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 4, 40})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 1, 420})
    table.insert(shapeArrayParameters,{"item","coins", 1, 3, 4, 2, 125})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 4, 1, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 4, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
