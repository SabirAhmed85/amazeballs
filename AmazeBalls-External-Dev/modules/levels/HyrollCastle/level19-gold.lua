local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 1, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 5, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 7, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 2, "right", "disabled"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 1, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 3, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_1", 1, 1, 5, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle10_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle11_1_1", 1, 1, 3, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 5})
    table.insert(shapeArrayParameters,{"shape","triangle12_1_1", 1, 1, 5, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"backFire","backFire1_2_1", 2, 1, 3, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{4},{1},{2,1,4,2},{2},{2,1,5,2},{3},{2,1,5,2},{4},{2,1,6,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{1},{2,1,6,3},{2},{2,1,7,4}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 1, 4, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 3, 4, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 3, 5, "up"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 6, 5, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"flip-horizontal"}})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 3, 4})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 3, 3, { {"door-open", "door1_1_1"} }, "one-way" })

    --GEM
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 5, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 1, 7, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 5, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 3, 65})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 2, 2, 80})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 3, 2, 130})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 3, {}})
    table.insert(shapeArrayParameters,{"item","big-present", 2, 1, 1, 4, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 4, 3, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 6, 4, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
