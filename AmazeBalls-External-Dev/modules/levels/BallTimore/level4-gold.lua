local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 4, 1, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 2, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"switchSlide"},{},{2},{1},{1,1,1,2},{2},{1,1,2,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 2, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 2, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 7, 3, "up"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 1, 4, "bar", "vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{},{1},{1},{1,1,1,4},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomLeftShape", 1, 20, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 4, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 1, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 6, 2, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{2},{1},{1,2,4,2},{2},{1,2,6,2},{3},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 7, 2, "up"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 1, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 1, 4, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 7, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_2", 1, 2, 3, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_2"},{"slide"},{},{2},{1},{1,2,3,4},{2},{1,2,3,5},{3},{1,2,4,5}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 6, 5, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 7, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 1, 4, { {"slide","bar1_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 3, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 4, 85})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 1, 115})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 4, 55})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 6, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
