local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 1, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 4, 1, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_1", 1, 1, 2, 2})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 5, 2, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 2, "triangleTopRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 2, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_1", 1, 1, 3, 5, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_1", 1, 1, 4, 5, "triangleBottomLeftShape", 1, 2, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_1", 1, 1, 6, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_1", 2, 1, 2, 1, "none","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_1"},{"slide"},{},{1},{1},{2,1,2,1},{2},{2,1,2,2}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_1", 2, 1, 1, 2})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 6, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 6, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"simple","simple2_2_1", 2, 1, 2, 5})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 1, 1, "down"})
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 6, 1, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"switchSlide"},{labelled=false},{1},{1},{2,2,6,1},{2},{2,2,7,1}})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 3, 2, "triangleTopLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 4, 2, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 5, 3, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 1, 4, "triangleTopRightShape", 1, 13})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_2"},{"slide"},{},{2},{1},{2,2,1,3},{2},{2,2,1,4}})
    table.insert(shapeArrayParameters,{"shape","bar1_2_2", 2, 2, 3, 4, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"spitter","spitter1_2_2", 2, 2, 4, 5, "up", "right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{3},{1},{2,2,2,5},{2},{2,2,3,5},{3},{2,2,4,5}})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle6_2_2", 2, 2, 7, 5, "triangleTopLeftShape", 1, _, "breakable"})

    --SCREEN 2-3
    table.insert(shapeArrayParameters,{"door","door1_2_3", 2, 3, 3, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"shape","bar1_2_3", 2, 3, 6, 1, "bar", "vert", 3})
    table.insert(shapeArrayParameters,{"shape","bar2_2_3", 2, 3, 3, 2, "bar", "vert"})
    table.insert(shapeArrayParameters,{"shape","bar3_2_3", 2, 3, 3, 3, "bar", "horz"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_3", 2, 3, 5, 3, "left"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_3", 2, 3, 7, 3, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_3"},{"slide"},{},{3},{1},{2,3,6,1},{2},{2,3,7,2},{3},{2,3,7,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_3", 2, 3, 2, 4, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_3", 2, 3, 3, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_3", 2, 3, 6, 4, "triangleTopLeftShape", 1, 5, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_3", 2, 3, 7, 4, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 3, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"shape","triangle5_2_3", 2, 3, 3, 5, "triangleBottomRightShape", 1, 9, "breakable"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_2_2", 2, 2, 5, 2, { {"slide","triangle1_2_2"} }, "one-way", "not-labelled" })

    table.insert(shapeArrayParameters,{"switch","switch1_2_3", 2, 3, 4, 1, { {"door-open","door1_2_3"} } })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
