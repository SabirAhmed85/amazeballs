local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 1})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 5, 2, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0},{2},{1},{1,1,4,2},{2},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,1,3},{2},{1,1,3,3},{3},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 3, 4, "bar", "vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"autoSlide"},{timePerSquare = 340, pauseTime = 0},{2},{1},{1,1,2,4},{2},{1,1,3,4}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 6, 3, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_1", 1, 1, 6, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_1"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,1,2,4},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","bar5_1_1", 1, 1, 1, 6, "bar", "vert"})
    table.insert(shapeArrayParameters,{"simple","simple2_1_1", 1, 1, 2, 5})
    table.insert(shapeArrayParameters,{"shape","bar6_1_1", 1, 1, 6, 6, "bar", "vert", 2})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 2, "triangleTopRightShape", 1, 13})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 4, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,4,2},{2},{1,2,5,2}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 4, 3, "triangleLeftAndRightShape", 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 3, "triangleLeftAndRightShape", 1})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_2", 1, 2, 7, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{2},{1},{1,2,7,2},{2},{1,2,7,4}})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 1, 2, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 1, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 4, 75})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 3, 3, 90})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 4, "present1_5_4", {} })
    table.insert(shapeArrayParameters,{"item","clock", 1, 2, 1, 3 })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
