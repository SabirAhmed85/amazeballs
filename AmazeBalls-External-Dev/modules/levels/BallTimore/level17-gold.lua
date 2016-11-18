local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"simple","simple1_1_1", 1, 1, 4, 1})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 4, 3, {
        {name = "triangle", properties = {directions = {"triangleBottomRightShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    }} )
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 7, 3, {
        {name = "triangle", properties = {directions = {"triangleTopLeftShape"} } },
        {name = "triangle", properties = {directions = {"triangleBottomLeftShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"down"} } }
    }} )
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 4, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 1, 1, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_2", 1, 2, 3, 2, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"switchSlide"},{},{1},{1},{1,2,3,2},{2},{1,2,3,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 2, "triangleBottomRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"gun","gun1_1_2", 1, 2, 7, 2, "left"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_2", 1, 2, 6, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,6,3},{2},{1,2,7,3}})
    table.insert(shapeArrayParameters,{"gun","gun2_1_2", 1, 2, 1, 4, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 3, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 4, 5, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 5, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"door","door3_1_2", 1, 2, 6, 5, "down"})

    --SCREEN 1-3
    table.insert(shapeArrayParameters,{"door","door1_1_3", 1, 3, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_1_3", 1, 3, 4, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door3_1_3", 1, 3, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"item","map", 1, 3, 3, 2})
    table.insert(shapeArrayParameters,{"simple","simple1_1_3", 1, 3, 4, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_3"},{"switchSlide"},{},{1},{1},{1,3,2,3},{2},{1,3,3,3},{3},{1,3,4,3}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 5, 3, "triangleBottomRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_3", 1, 3, 6, 3, "triangleTopLeftShape", 1, 3})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_3", 1, 3, 3, 5, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_3", 1, 3, 7, 5, "up"})

    --SWITCHES    
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 7, 5, { {"slide","triangle2_1_2"} }, "one-way" })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
