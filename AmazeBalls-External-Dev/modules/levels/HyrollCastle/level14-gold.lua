local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 7, 1, "bar", "horz"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 2, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 6, 2, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 1, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{},{1},{1},{1,1,1,3},{2},{1,1,2,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 3, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 7, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_1", 1, 1, 5, 4, "down"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 4})
    table.insert(shapeArrayParameters,{"autoFan","autoFan6_1_1", 1, 1, 7, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan6_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 2, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{2},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,3,5}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 2, 2, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 4, 2, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{2},{2,1,6,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 7, 2, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 2, 3, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 3, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 3, 5, "triangleTopLeftShape"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 6, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 6, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 4, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 2, 80})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 2, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
