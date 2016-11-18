local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "left"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{"orange"},{1},{1},{1,1,4,1},{2},{1,1,6,1}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,2},{2},{1,1,2,2},{3},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 3, "left"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"orange"},{1},{1},{1,1,6,3},{2},{1,1,7,3},{3},{1,1,7,4}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 1, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 4, 5, "up"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_1"},{"slide"},{"orange"},{2},{1},{1,1,4,4},{2},{1,1,4,5},{3},{1,1,5,3}})

    -- SCREEN 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 6, 1, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 2, 2, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 2, "right"} )
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 6, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 7, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 1, 4, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 2, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 3, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 5, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 7, 4, "right"} )
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 5, 5, "triangleTopRightShape", 1, 1, "breakable"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 3, 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 6, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 7, 2, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 2, 3, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 6, 3, "left"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{"orange"},{1},{1},{2,2,6,3},{2},{2,2,7,4}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_2", 2, 2, 3, 4} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{"lightBlue"},{2},{1},{2,2,3,5},{2},{2,2,3,4},{3},{2,2,4,2},{4},{2,2,5,1}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 5, 4, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 2, 5, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 6, 5, "right"} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 5, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 2, 3, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 2, 4, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 3, 1, 90})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 2, 80})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 3, 300})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 3, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 5, 1, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t