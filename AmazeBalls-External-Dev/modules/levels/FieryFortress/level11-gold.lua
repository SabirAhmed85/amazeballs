local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 7, 1, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{2},{1},{1,1,6,1},{2},{1,1,7,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 2, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 3, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,1},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 4, 2, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,2},{2},{1,1,5,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 1, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{"orange"},{2},{1},{1,1,1,1},{2},{1,1,1,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_1", 1, 1, 3, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,2,4},{"*"},{1,1,2,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan6_1_1", 1, 1, 4, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan6_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 8, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 1, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan7_1_1", 1, 1, 2, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan7_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,5},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 5, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 5, "triangleTopLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan8_1_1", 1, 1, 6, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan8_1_1"},{"slide"},{"orange"},{2},{1},{1,1,6,3},{2},{1,1,6,5}})

    -- 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 1, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,1},{2},{1,2,4,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 5, 1, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,1},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 6, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 6, 2, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 6, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 7, 2, "triangleTopLeftShape"})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_2", 1, 2, 1, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 2, 3, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_2"},{"slide"},{"green"},{1},{1},{1,2,2,3},{2},{1,2,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 3, 3, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_2", 1, 2, 5, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_2", 1, 2, 7, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 3, 4, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{"brown"},{1},{1},{1,2,3,4},{2},{1,2,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle10_1_2", 1, 2, 5, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 6, 4, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle11_1_2", 1, 2, 7, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle12_1_2", 1, 2, 1, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle13_1_2", 1, 2, 3, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle14_1_2", 1, 2, 4, 5, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 5, 6, "bar", "vert", 4})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"}) 
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 2, "purple"})  
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})   
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"}) 
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"}) 
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 1, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 7, 5, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 6, 5, {} })
    --table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 2, 90})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 1, 3, 90})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 5, 350})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
