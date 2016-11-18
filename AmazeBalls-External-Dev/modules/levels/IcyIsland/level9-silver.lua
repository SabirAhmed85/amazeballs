local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{3},{1},{1,1,6,3},{2},{1,1,6,2},{3},{1,1,7,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 3, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 6, 4, "right"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 5, "triangleTopRightShape", 1, 10})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 5, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{},{2},{1},{1,1,5,3},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters,{"door","door3_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 7, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 2, "left"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_1", 2, 1, 1, 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 3, 2, "left"})
    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 4, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 3, "triangleBottomRightShape", 1, 8})
    table.insert(shapeArrayParameters,{"door","door4_2_1", 2, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 4, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{3},{1},{2,1,3,4},{2},{2,1,4,4},{3},{2,1,5,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_2_1", 2, 1, 6, 5, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 7, 5, "triangleTopLeftShape"})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 1, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 5, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_3_1", 3, 1, 1, 3, "up","none","none","none"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_3_1", 3, 1, 6, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 5, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_3_1"},{"autoSlide"},{timePerSquare = 480, pauseTime = 0},{2},{1},{3,1,5,3},{2},{3,1,5,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 3, 1, 7, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 6, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 2, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 2, 135})
    table.insert(shapeArrayParameters,{"item","coins", 3, 1, 3, 4, 330})
    table.insert(shapeArrayParameters,{"item","big-present", 3, 1, 7, 3, {}})
    table.insert(shapeArrayParameters,{"item","big-present", 3, 1, 3, 1, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 5, 2, {}})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 1, 5, 2, {}})
    table.insert(shapeArrayParameters,{"item","fireCape", 2, 1, 1, 5, {}})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
