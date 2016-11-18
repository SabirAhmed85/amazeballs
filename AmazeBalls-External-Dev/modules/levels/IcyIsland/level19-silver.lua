local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 2, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 4, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 6, 2, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 2, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 7, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{},{1},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 5, 3, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 2, 4, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_1_1"},{"slide"},{},{2},{1},{1,1,2,3},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 1, 5, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_1", 1, 1, 4, 5, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_1_1"},{"slide"},{},{2},{1},{1,1,3,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_1", 1, 1, 5, 5, "up"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 2, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,1,1},{2},{2,1,2,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 5, 1, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 1, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 1, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 1, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 2, 1, 8, 5, "bar", "horz", 2})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 5, 1, "up"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 1, 1, "none","right","none","left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 4, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 4, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 1, 5})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 6, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 5, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 2, 5, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 1, 170})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 2, 1, 75})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 3, 5, 95})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 5, 3, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 4, 3, {}})
    table.insert(shapeArrayParameters,{"item","clock", 2, 1, 1, 2, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
