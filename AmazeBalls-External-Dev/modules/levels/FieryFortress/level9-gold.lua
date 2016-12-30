local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 1, 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 3, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 4, 1, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 4, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 4, 2, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 6, 1, "bar", "vert", 4})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 6, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 1, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 1, 5, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 3, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 4, 3, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 6, 3, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 7, 3})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 2, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 4, 4, "triangleTopRightShape", 1, 1, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 6, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 2, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_1", 1, 1, 6, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle9_1_1"},{"slide"},{"orange"},{2},{1},{1,1,5,5},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_1", 1, 1, 7, 5})

    -- 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 5, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"simple","simple2_1_2", 1, 2, 2, 2})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 4, 2, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,2,4,1},{2},{1,2,4,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 6, 2, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0},{2},{1},{1,2,6,1},{2},{1,2,6,2},{3},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"simple","simple3_1_2", 1, 2, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple3_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,6,1},{2},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 3, 3, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_1_2"},{"autoSlide"},{timePerSquare = 400, pauseTime = 0, labelled = false},{2},{1},{1,2,2,3},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"simple","simple4_1_2", 1, 2, 5, 3})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 2, 5, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 3, 5, "triangleTopLeftShape"})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 2, 4, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 2, 1, "purpleCoin"})

    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 3, 75}) 
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 6, 3, "present1_1_1", {} })
    table.insert(shapeArrayParameters,{"item", "small-present", 1, 2, 2, 4, "present2_1_2", {} })
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 3, 210}) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
