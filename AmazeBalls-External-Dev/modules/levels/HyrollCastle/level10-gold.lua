local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,4,3},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 5, 3, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 2, 5, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 5, 5, "left"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 5, 5, "down", "disabled"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 5, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 7, 1, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 2, "triangleBottomRightShape", 1, _, "hyroll"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 5, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 3, "triangleTopLeftShape", 1, 5, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 2, 4, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 5, 5, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"switchSlide"},{labelled = false},{2},{1},{1,2,5,4},{2},{1,2,5,5}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_2", 1, 2, 7, 5, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 5, "right", "disabled"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 1, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 3, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 2, 2, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 1, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 3, 5})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 2, 4, { {"door-open", "door1_1_1"} } })

    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 2, 1, { {"door-open", "door1_1_2"} }, "one-way" })
    table.insert(shapeArrayParameters,{"switch","switch2_1_2", 1, 2, 3, 4, { {"slide", "autoFan3_1_2"} }, "one-way", "not-labelled" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 1, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 2, 5, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 4, 4, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 1, 115}) 
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 7, 5, 295}) 
    table.insert(shapeArrayParameters,{"item", "small-present", 1, 2, 1, 1, {} })
    table.insert(shapeArrayParameters,{"item", "big-present", 2, 2, 3, 1, {} })
    table.insert(shapeArrayParameters,{"item", "hook", 1, 1, 4, 1, {} })
    table.insert(shapeArrayParameters,{"item", "bomb", 1, 2, 4, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
