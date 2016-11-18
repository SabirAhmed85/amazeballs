local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 1, 2, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{},{1},{1},{1,1,1,2},{2},{1,1,1,5}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 2, 3, "bar", "horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{},{1},{1},{1,1,2,3},{2},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 5, 3, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 4, 4, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-horizontal"}})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 2, 5})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 3, 5, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_1"},{"switchSlide"},{},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 7, 5, "triangleBottomRightShape", 1, 3, "breakable"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_2", 1, 2, 3, 1, "none", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,3,1}})
    table.insert(shapeArrayParameters,{"spitter","spitter2_1_2", 1, 2, 4, 2, "none", "none", "down", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{1},{1},{1,2,4,2},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"autoSlide"},{},{2},{1},{1,2,2,3},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 5, 4, "bar", "vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"autoSlide"},{},{2},{1},{1,2,4,4},{2},{1,2,5,4}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 2, 5})
    table.insert(shapeArrayParameters,{"spitter","spitter3_1_2", 1, 2, 5, 5, "up", "none", "none", "none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,3,5},{2},{1,2,5,5}})


    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 6, 5, { {"slide","manualFan1_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 4, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 7, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 3, 50})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 1, 500})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 1, 4, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 2, 4, {} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
