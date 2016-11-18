local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 1, "right"} )
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 1} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,1},{2},{1,1,4,3},{3},{1,1,4,4},{4},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 1, "left"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 3, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 3, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 4, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 1, 5, "triangleTopRightShape", 1, 13})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 1, "left"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 7, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 7, 2, "up"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 1, 3, "right"} )
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 3, 3} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{1},{1},{2,1,3,3},{2},{2,1,4,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 2, 4, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 5, 4, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 2, 5, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_1", 2, 1, 6, 5, "triangleTopAndBottomShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_2_1"},{"slide"},{"green"},{2},{1},{2,1,5,5},{2},{2,1,6,5}})

    --SCREEN 3-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_3_1", 3, 1, 2, 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_3_1", 3, 1, 5, 1, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_3_1", 3, 1, 5, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_3_1"},{"slide"},{"orange"},{2},{1},{3,1,4,2},{2},{3,1,5,2}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_3_1", 3, 1, 1, 1} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_3_1"},{"slide"},{"lightDarkBlue"},{1},{1},{3,1,1,1},{2},{3,1,1,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_3_1", 3, 1, 2, 3, "triangleTopRightShape", 1, 10, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_3_1", 3, 1, 7, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_3_1", 3, 1, 4, 4, "triangleTopAndBottomShape", 1})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 3, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 2, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 3, 1, 7, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 3, 1, 3, 1, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 3, 4, 100})
    table.insert(shapeArrayParameters,{"item","coins", 3, 1, 4, 5, 100})
    table.insert(shapeArrayParameters,{"item","big-present", 3, 1, 7, 1, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 5, 2, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t