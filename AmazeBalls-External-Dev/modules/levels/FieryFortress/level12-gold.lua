local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 1, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 1, "triangleTopAndBottomShape", 2, 19})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,1},{2},{1,1,3,1}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 1, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 4, 3, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{timePerSquare = 400},{1},{1},{1,1,4,3},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 6, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 2, 3, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 7, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 2, 4, "triangleBottomRightShape", 1, 3})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 3, 4, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 6, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_1", 1, 1, 7, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 2, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,1,5},{2},{1,1,2,5},{3},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 6, 5, "left"})

    -- 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 1, "triangleBottomRightShape", 1, 3, "breakable"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 5, 1, "bar", "horz"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 6, 1, "triangleBottomRightShape", 1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,1},{2},{1,2,6,1}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 7, 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 2, 2, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 4, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 6, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","compass", 1, 2, 5, 3})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_2", 1, 2, 6, 3, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_2", 1, 2, 7, 3, "triangleBottomLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_2", 1, 2, 2, 4, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 3, 4})
    table.insert(shapeArrayParameters,{"shape","triangle9_1_2", 1, 2, 4, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_2", 1, 2, 1, 5})
    table.insert(shapeArrayParameters,{"shape","triangle10_1_2", 1, 2, 2, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 6, 4, "bar", "horz"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 6, 4})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 7, 4, "bar", "horz"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan5_1_2", 1, 2, 3, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle11_1_2", 1, 2, 2, 5, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 6, 5, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","triangle12_1_2", 1, 2, 7, 5, "triangleTopLeftShape", 1, _, "fire"})

    --ALL SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 7, 2, { {"slide","bar2_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 1, 3, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 4, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 6, 5, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 3, 2, "present1_3_2", {} })
    --table.insert(shapeArrayParameters,{"item","coins", 1, 1, 2, 2, 200})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
