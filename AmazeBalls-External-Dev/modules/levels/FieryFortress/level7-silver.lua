local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 1, "right"} )
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 1, "bar", "vert", 3} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 5, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleBottomRightShape", 1, 8})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{2},{1},{1,1,1,2},{2},{1,1,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 2, "triangleTopLeftShape", 1, 11})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{"green"},{1},{1},{1,1,5,2},{2},{1,1,7,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 1, 3, "right"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 7, 3, "down"} )
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 4})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_1", 1, 1, 4, 4, "up"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_1_1"},{"slide"},{"orange"},{2},{1},{1,1,3,3},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 4, "triangleTopLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{"green"},{2},{1},{1,1,5,4},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 5, "up"} )
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 5} )
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 5, 5, "triangleTopLeftShape", 1, 11})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 4, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 1, 1, "up"} )
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 2, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 3, 2, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 4, 2, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 5, 2, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"shape","bar5_1_2", 1, 2, 6, 2, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 7, 1, "left"} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 2, 2, "down"} )
    table.insert(shapeArrayParameters,{"switch","switch1_1_2", 1, 2, 4, 2, { {"door-open", "door2_1_2"} } } )
    table.insert(shapeArrayParameters,{"shape","bar6_1_2", 1, 2, 4, 3, "bar", "vert"} )
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 6, 2, "left"} )
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_2", 1, 2, 1, 3} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 2, 3, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 4, 3, "triangleTopLeftShape", 1, 11, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_2", 1, 2, 4, 4, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 4, "triangleTopLeftShape", 1, 15, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_2", 1, 2, 2, 5, "right"} )
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 5} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_2", 1, 2, 7, 5, "up"} )

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 2, 1, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 4, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 3, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 5, 3, 250})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 7, 4, 75})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 6, 1, 75})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 7, 1, "present1_1_1", {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 1, 2, "present2_1_2", {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t