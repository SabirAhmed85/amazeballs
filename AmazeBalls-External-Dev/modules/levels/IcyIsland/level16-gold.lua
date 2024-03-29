local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 1, 1, "none","right","down","none"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_3", 1, 1, 3, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,2,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 2, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,4,1},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 5, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 7, 2, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 3, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 3, 3, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_3", 1, 1, 7, 4, "bar", "vert"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 3, 4})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 5, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 4, "triangleTopLeftShape", 1, 11})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 1, 5, "up","right","none","none"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_1", 1, 1, 4, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_3", 1, 1, 5, 6, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan6_1_1", 1, 1, 7, 5, "up"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 7, 1, "none","none","down","left"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 2, "triangleTopLeftShape", 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,2,2},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 8, 3, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 4, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 5, 4, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 5, 5, "up"})
    table.insert(shapeArrayParameters,{"spitter","spitter2_2_1", 2, 1, 7, 5, "up","none","none","left"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 4, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 6, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 7, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 3, 90})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 1, 4, 75})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 4, 200})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 2, 1, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 1, 1, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 5, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
