local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 3, 1, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 7, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 2, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 5, 2, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,5,2},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 3, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,3,3}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 6, 3, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 7, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_1"},{"slide"},{},{1},{1},{1,1,6,4},{2},{1,1,7,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_1", 1, 1, 3, 5, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 4, 5, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan5_1_1", 1, 1, 6, 5, "left"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 3, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 2, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 6, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 5, "down"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 3, 3, "none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"autoSlide"},{timePerSquare = 600, labelled = false},{2},{1},{2,2,1,3},{2},{2,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 5, 3, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 7, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 1, 5, "up"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 2, 5, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 2, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 6, 3, 120})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 6, 5, 150})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 7, 4, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
