local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 1, "bar", "horz", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 4, 1, "none","right","none","left"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"spitter","spitter2_1_1", 1, 1, 6, 2, "up","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 2, 3, "right"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 4, 3})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 1, 4})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_1", 1, 1, 3, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 4, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 8, 4, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 1, 5, "bar", "horz"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 5, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{1},{1},{1,1,5,5},{2},{1,1,5,4},{3},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 7, 5, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 7, 5, "right"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_1", 2, 1, 6, 1, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,6,1}})
    table.insert(shapeArrayParameters,{"gun","gun1_2_1", 2, 1, 7, 1, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_1", 2, 1, 2, 2, "right"})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_2_1", 2, 1, 4, 2, "TheShuttleMickyTake"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_2_1", 2, 1, 2, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_2_1", 2, 1, 6, 3, "right"})
    table.insert(shapeArrayParameters,{"gun","gun2_2_1", 2, 1, 5, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 6, 4, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,6,4},{2},{2,1,7,4}})
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_2_1", 2, 1, 1, 5})
    table.insert(shapeArrayParameters,{"shape","bar1_2_1", 2, 1, 2, 5, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{1},{1},{2,1,2,2},{2},{2,1,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 2, 5, "triangleTopLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 5, 5, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{},{1},{1},{2,1,4,4},{"*"},{2,1,4,5},{2},{2,1,5,5}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 3, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 4, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 1, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 7, 2, 95})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 4, 2, 145})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 2, 5, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 4, 1, {} })
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
