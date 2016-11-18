local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 2, 1, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 5, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 6, 4, "bar", "vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,6,4}})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 5, 4, "triangleTopRightShape", 1, 16, "breakable"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_1", 1, 1, 2, 5, "left"})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 5, 5, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 6, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 1, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 6, 1, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 3, 2, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,2},{2},{1,2,3,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_2", 1, 2, 5, 2, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 5, 3, "down"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan3_1_2", 1, 2, 5, 4, "right"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 3, 5, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"manualFan","manualFan3_1_2", 1, 2, 1, 5, "up"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan4_1_2", 1, 2, 6, 5, "left"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 2, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 5, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 6, 1, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 3, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_2", 2, 2, 6, 2, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 1, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle7_2_2", 2, 2, 5, 3, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_2_2", 2, 2, 6, 3})
    table.insert(shapeArrayParameters,{"shape","triangle8_2_2", 2, 2, 7, 3, "triangleBottomLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 1, 4, "right"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 4, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle9_2_2", 2, 2, 1, 5, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 5, 5, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{1},{1},{2,2,5,5},{2},{2,2,6,5},{3},{2,2,7,5}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 2, 6, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar2_2_2", 2, 2, 3, 6, "bar", "vert", 2})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 7, 2, { {"slide","bar3_1_1"} } })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 5, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 1, 7, 4, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 2, 1, 1, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 2, 7, 1, "purpleCoin"})
    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 1, 1, 400})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 4, {} })
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 7, 4, {} })
    table.insert(shapeArrayParameters,{"item","big-present", 2, 2, 5, 4, {}})
    table.insert(shapeArrayParameters,{"item","fireCape", 1, 2, 4, 2, {}})
    table.insert(shapeArrayParameters,{"item","dummyBall", 1, 1, 1, 3, {}})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
