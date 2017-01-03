local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    -- 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 6, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 1} )
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 2, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 5, 4, "triangleTopLeftShape", 1, 5, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 6, 4, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})

    -- 1-2
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 2, 1} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 2, "left"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 7, 2, "bar", "horz"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 2} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 7, 3, "up"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 1, 4, "up"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 4, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 4, "triangleTopLeftShape", 1, _, "breakable"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 3, "purpleCoin"})

    --ITEMS
    --table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 4, 500})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 3, 300})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 4, 90})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 5, 3, "present1_5_3", {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 6, 4, "present2_6_4", {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t