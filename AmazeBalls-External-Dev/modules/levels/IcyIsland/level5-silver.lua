local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 2, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"switchSlide"},{},{1},{1},{1,1,5,2},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 7, 3, "none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,7,1},{2},{1,1,7,2},{3},{1,1,7,3}})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 2, 4, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{3},{1},{1,1,1,2},{2},{1,1,2,3},{3},{1,1,2,4}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 3, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 4, 4, "bar", "vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"switchSlide"},{},{2},{1},{1,1,3,4},{2},{1,1,4,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 4, "triangleBottomLeftShape", 1, 3, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_1", 1, 1, 6, 4, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 7, 4, "triangleTopLeftShape", 1, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"slide"},{},{1},{1},{1,1,7,4},{2},{1,1,7,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan4_1_1", 1, 1, 3, 5, "right"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_1_1"},{"slide"},{},{1},{1},{1,1,3,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 6, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 3, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 3, 3, "triangleBottomLeftShape", 1, 4, "breakable"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 2, 1, "triangleBottomLeftShape", 1, 4, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 7, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 2, 7, 3, {} })
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 4, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 7, 4})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 3, 3, { {"slide","bar1_1_1"},{"slide","bar2_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 2, 1, 3, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 2, 5, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 1, 1, 5, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 1, 4, 235})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 4, 1, 170})
    table.insert(shapeArrayParameters,{"item","big-present", 1, 1, 6, 5, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 5, 5, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 1, 1, {}})
    table.insert(shapeArrayParameters,{"item","hook", 2, 1, 6, 3, {}})
    table.insert(shapeArrayParameters,{"item","dummyBall", 1, 2, 2, 2, {}})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
