local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gun","gun1_1_1", 1, 1, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 4, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-vertical"}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 4})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 5, "triangleTopRightShape", 1, _, "fire"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 5, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 5, 2, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 8, 3, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"switchSlide"},{},{1},{1},{2,1,8,3},{2},{2,1,8,4}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 3, 4, "triangleTopLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","bar2_2_1", 2, 1, 5, 4, "bar", "horz"})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"gun","gun1_3_1", 3, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_3_1", 3, 1, 4, 2, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_3_1", 3, 1, 6, 3, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_3_1"},{"slide"},{},{1},{1},{3,1,6,3},{2},{3,1,7,3},{3},{3,1,7,2}})
    table.insert(shapeArrayParameters,{"door","door1_3_1", 3, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","bar1_3_1", 3, 1, 2, 4, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 2, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_3_1"},{"slide"},{},{1},{1},{3,1,2,4},{2},{3,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar2_3_1", 3, 1, 7, 4, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_3_1"},{"slide"},{},{2},{1},{3,1,6,4},{2},{3,1,7,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 7, 5, "up"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_2_1", 2, 1, 6, 4, { {"slide","bar1_2_1"} }, "one-way" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 4, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 3, 1, 1, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 1, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 2, 55})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 5, 4, 65})
    table.insert(shapeArrayParameters,{"item","coins", 3, 1, 4, 3, 140})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 7, 2, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 3
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
