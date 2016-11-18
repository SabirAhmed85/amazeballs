local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 1, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 1, 2, "down"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 6, 2, "none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"spitter","spitter2_1_1", 1, 1, 4, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,4,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 3, 4, "down"})
    table.insert(shapeArrayParameters,{"spitter","spitter3_1_1", 1, 1, 6, 4, "none", "none", "down", "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 1, 5, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 2, 5, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_1", 1, 1, 7, 5, "left"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 2, 1, "none","right","down","none"})
    table.insert(shapeArrayParameters,{"spitter","spitter2_2_1", 2, 1, 4, 1, "up","right","down","left"})
    table.insert(shapeArrayParameters,{"spitter","spitter3_2_1", 2, 1, 6, 1, "none","none","down","left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 1, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 2, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 4, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"spitter","spitter4_2_1", 2, 1, 7, 2, "none","right","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter4_2_1"},{"slide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,3}})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 1, 3, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 2, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 3, 4, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,3,3},{2},{2,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 7, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_1", 2, 1, 1, 5})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 3, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 5, 5, "bar", "horz"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 6, 5, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_2_1", 2, 1, 7, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_1", 2, 1, 8, 5, "bar", "horz", 2})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 1, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 5, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 1, 95})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 4, 75})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 4, 125})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 5, 5, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
