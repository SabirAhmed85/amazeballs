local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 3, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 2, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 1, 3, "present1_1_1", 
                                            { 
                                                -- put BOMB here
                                                {"item","clock", 1, 1, 3, 2, "clock1_1_1", 10, 1},
                                                {"triangle", "triangleTopRightShape"},
                                            } 
                                        })
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 3, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 3})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 1, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 3, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 4, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 6, 5, "down"})

    -- 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleTopRightShape", 1, 1, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 1, "triangleTopLeftShape", 1, 5})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 6, 2, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 8, 2, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 6, 3, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 6, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,6,3},{2},{1,2,6,4}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 8, 3, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 1, 5, "bar", "horz", 4})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 1, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,1,4},{2},{1,2,1,5}})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_2", 1, 2, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{3},{1},{1,2,3,2},{2},{1,2,3,3},{3},{1,2,3,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 7, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 4, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 1, 3, "present2_1_1", {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 7, 4, "present3_1_2", {} })
    --table.insert(shapeArrayParameters,{"item","coins", 1, 1, 4, 1, 90})
    --table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 4, 250})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
