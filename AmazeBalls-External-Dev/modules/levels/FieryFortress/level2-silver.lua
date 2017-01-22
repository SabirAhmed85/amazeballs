local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 1, "down"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,1},{2},{1,1,3,1}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleTopAndBottomShape", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 2, 2, "right"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,2,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,3},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 3, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{2},{1},{1,1,7,2},{2},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 5, 5})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 2, 2, "up"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{"orange"},{1},{1},{1,2,2,2},{2},{1,2,2,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 4, 3, "up"} )
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 3, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,3},{2},{1,2,7,3}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,3,5},{2},{1,2,5,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 5, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 2, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 4, 450})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 2, 50})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 5, 1, "present1_5_1", {
        {"item","clock", _, _, _, _, _, 5, 1},
        {"item","clock", _, _, _, _, _, 10, 1},
        } })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 5, 4, "present2_5_4", {
        

        } })


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t