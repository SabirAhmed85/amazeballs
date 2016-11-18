local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------
    
    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 1, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 1, "triangleTopAndBottomShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{"green"},{1},{1},{2,1,3,1},{2},{2,1,4,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 7, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 6, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 1, 3, "right"} )
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 4, 3, "triangleTopAndBottomShape", 1, 12})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{2},{1},{2,1,3,3},{2},{2,1,4,3}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 3, 4} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{"lightBlue"},{3},{1},{2,1,2,1},{2},{2,1,2,3},{"*"},{2,1,2,4},{3},{2,1,3,4},{4},{2,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 7, 5, "bar", "vert", 4} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"autoSlide"},{timePerSquare = 600, pauseTime = 0},{2},{1},{2,1,6,5},{2},{2,1,7,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_1", 2, 1, 7, 3, "left"} )
    table.insert(shapeArrayParameters,{"item","compass", 2, 1, 1, 5} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_2_1", 2, 1, 7, 4, "down"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan6_2_1", 2, 1, 2, 5, "up"} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan5_2_1"},{"slide"},{"orange"},{1},{1},{2,1,2,5},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"simple","simple2_2_1", 2, 1, 5, 5} )
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 6, 5, "triangleTopAndBottomShape", 1})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_2_2", 2, 2, 2, 1} )
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 5, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 6, 1, "down"} )
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 2, 2, "bar", "vert", 3} )
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 2, "triangleBottomRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{"green"},{1},{1},{2,2,2,2},{2},{2,2,4,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 5, 2, "up"} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_2", 2, 2, 6, 2, "down"} )
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 7, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_2"},{"slide"},{"brown"},{2},{1},{2,2,4,3},{2},{2,2,7,3}})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_2"},{"slide"},{"orange"},{1},{1},{2,2,6,2},{2},{2,2,7,1}})
    table.insert(shapeArrayParameters,{"door","door3_2_2", 2, 2, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 4, 3, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_2"},{"slide"},{"green"},{1},{1},{2,2,4,3},{2},{2,2,7,5}})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 2, 4, "triangleTopRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"slide"},{"green"},{1},{1},{2,2,2,4},{2},{2,2,2,5}})
    table.insert(shapeArrayParameters,{"shape","bar3_2_2", 2, 2, 3, 4, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_2"},{"slide"},{"brown"},{2},{1},{2,2,3,3},{2},{2,2,3,4}})
    table.insert(shapeArrayParameters,{"shape","bar4_2_2", 2, 2, 4, 4, "bar", "horz", 3} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_2_2", 2, 2, 6, 4, "left"} )
    table.insert(shapeArrayParameters,{"shape","bar5_2_2", 2, 2, 4, 6, "bar", "vert", 2} )

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 1, "triangleTopLeftShape", 1})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 4, 1} )
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 2, 2, "bar", "vert", 3} )
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 2, "bar", "vert", 2} )
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 2, "up"} )
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 6, 3} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,6,2},{2},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 2, 3, "bar", "horz", 2} )
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 6, 3, "bar", "horz", 3} )
    table.insert(shapeArrayParameters,{"shape","bar5_1_2", 1, 2, 4, 5, "bar", "vert", 3} )
    table.insert(shapeArrayParameters,{"simple","simple2_1_2", 1, 2, 3, 5} )
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,2,5},{2},{1,2,3,5},{3},{1,2,5,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 1, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 2, 2, 5, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 2, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 5, 90})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 3, 5, 150})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 4, 3, 75})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 3, 3, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 5, 2, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 2, 3, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t