local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 4, 1, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_1"},{"slide"},{},{1},{1},{1,1,4,1},{2},{1,1,4,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleBottomRightShape", 1, 9})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 2, 2, "triangleBottomRightShape", 1, 9})
    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 5, 2, "bar", "vert"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 1, 3, "down"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{},{2},{1},{1,1,1,1},{2},{1,1,1,3}})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 4, 3, "triangleBottomLeftShape", 1, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"slide"},{},{1},{1},{1,1,4,3},{2},{1,1,5,3},{3},{1,1,6,2}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 6, 4, "triangleTopLeftShape", 1, 5})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 1, 5, "right"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_1", 1, 1, 4, 5, "triangleTopRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle5_1_1"},{"slide"},{},{2},{1},{1,1,2,4},{"*"},{1,1,2,5},{2},{1,1,4,5}})
    table.insert(shapeArrayParameters,{"door","door2_1_1", 1, 1, 6, 5, "down"})

    --SCREEN 2-1
    table.insert(shapeArrayParameters,{"door","door1_2_1", 2, 1, 1, 1, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_1", 2, 1, 4, 1, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_1", 2, 1, 4, 3, "triangleTopRightShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_1", 2, 1, 6, 3, "triangleBottomLeftShape"})
    table.insert(shapeArrayParameters,{"door","door2_2_1", 2, 1, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_1", 2, 1, 2, 4, "triangleBottomLeftShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,2,4},{2},{2,1,3,5}})
    table.insert(shapeArrayParameters,{"door","door3_2_1", 2, 1, 2, 5, "down"})

    --SCREEN 1-2
    table.insert(shapeArrayParameters,{"shape","triangle1_1_2", 1, 2, 5, 1, "triangleBottomLeftShape", 1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,3,1},{2},{1,2,5,1},{"*"},{1,2,5,3},{3},{1,2,6,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 6, 1, "left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,6,1},{2},{1,2,6,2}})
    table.insert(shapeArrayParameters,{"shape","bar1_1_2", 1, 2, 6, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar2_1_2", 1, 2, 7, 3, "bar", "vert", 2})
    table.insert(shapeArrayParameters,{"shape","bar3_1_2", 1, 2, 5, 4, "bar", "horz"})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 4, "right"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{},{3},{1},{1,2,1,2},{2},{1,2,1,3},{3},{1,2,1,5}})
    table.insert(shapeArrayParameters,{"shape","bar4_1_2", 1, 2, 3, 5, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_2"},{"slide"},{},{3},{1},{1,2,3,3},{2},{1,2,3,4},{3},{1,2,3,5}})
    table.insert(shapeArrayParameters,{"shape","bar5_1_2", 1, 2, 5, 5, "bar", "horz", 2})
    table.insert(shapeArrayParameters,{"item","mystery-block", 1, 2, 5, 5, {
        {name = "triangle", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","right"} } },
        {name = "spitter", properties = {directions = {"up","right", "down"} } }
        } })
    table.insert(shapeArrayParameters,{"door","door2_1_2", 1, 2, 5, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door3_1_2", 1, 2, 6, 5, "down"})

    --SCREEN 2-2
    table.insert(shapeArrayParameters,{"door","door1_2_2", 2, 2, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"door","door2_2_2", 2, 2, 6, 1, "up", "disabled"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_2_2", 2, 2, 7, 1, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_2"},{"switchSlide"},{},{2},{1},{2,2,6,1},{2},{2,2,7,1}})
    table.insert(shapeArrayParameters,{"simple","simple1_2_2", 2, 2, 2, 2, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_2"},{"slide"},{},{1},{1},{2,2,2,2},{2},{2,2,3,2}})
    table.insert(shapeArrayParameters,{"shape","triangle1_2_2", 2, 2, 6, 2, "triangleLeftAndRightShape", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_2"},{"slide"},{},{2},{1},{2,2,5,4},{2},{2,2,6,2},{3},{2,2,7,2}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_2_2", 2, 2, 2, 3, "up"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_2"},{"slide"},{},{2},{1},{2,2,1,3},{2},{2,2,2,3}})
    table.insert(shapeArrayParameters,{"door","door3_2_2", 2, 2, 1, 4, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle2_2_2", 2, 2, 2, 4, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_2_2", 2, 2, 3, 4, "triangleLeftAndRightShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"switchSlide"},{},{2},{1},{2,2,3,3},{2},{2,2,3,4}})
    table.insert(shapeArrayParameters,{"shape","triangle4_2_2", 2, 2, 4, 5, "triangleBottomRightShape"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_2"},{"slide"},{},{1},{1},{2,2,4,5},{2},{2,2,4,1},{3},{2,2,5,1}})

    --SCREEN 1-3
    --table.insert(shapeArrayParameters,{"timeOut","timeOut1_1_3", 1, 3, 5, 1, 1})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 3, 2, "triangleBottomRightShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_3", 1, 3, 5, 2, "triangleTopLeftShape"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_3", 1, 3, 7, 2, "triangleBottomLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_3", 1, 3, 2, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_3"},{"slide"},{},{1},{1},{1,3,2,3},{2},{1,3,2,4},{3},{1,3,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_3", 1, 3, 3, 3, "triangleTopLeftShape", 1, _, "fire"})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_3", 1, 3, 5, 3, "triangleBottomRightShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle6_1_3", 1, 3, 5, 4, "triangleTopLeftShape", 1, _, "icy"})
    table.insert(shapeArrayParameters,{"shape","triangle7_1_3", 1, 3, 3, 5, "triangleTopLeftShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"shape","bar1_1_3", 1, 3, 5, 5, "bar", "horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_3"},{"slide"},{},{1},{1},{1,3,5,4},{2},{1,3,5,5}})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_3", 1, 3, 6, 5})
    table.insert(shapeArrayParameters,{"shape","triangle8_1_3", 1, 3, 7, 5, "triangleTopLeftShape", 1, _, "fire"})

    --SWITCHES
    table.insert(shapeArrayParameters,{"switch","switch1_1_1", 1, 1, 1, 4, { {"flip-horizontal", "triangle4_1_1"} } })
    table.insert(shapeArrayParameters,{"switch","switch2_1_1", 1, 1, 3, 4, { {"flip-horizontal", "triangle1_1_1"} } })

    table.insert(shapeArrayParameters,{"switch","switch1_2_1", 2, 1, 2, 5, { {"slide", "autoFan1_2_2"},{"door-open","door2_2_2"} }, "one-way", "not-labelled" })

    table.insert(shapeArrayParameters,{"switch","switch1_2_2", 2, 2, 1, 4, { {"slide", "triangle3_2_2"} }, "one-way" })

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 5, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 1, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 7, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 2, 2, 2, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 4, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 1, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 6, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 5, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 3, 4, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 5, 2, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 2, 1, 5, 3, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 5, 170})
    table.insert(shapeArrayParameters,{"item","coins", 1, 2, 2, 1, 125})
    table.insert(shapeArrayParameters,{"item","coins", 2, 1, 6, 5, 65})
    table.insert(shapeArrayParameters,{"item","coins", 2, 2, 7, 4, 125})
    table.insert(shapeArrayParameters,{"item","coins", 1, 3, 6, 3, 110})
    table.insert(shapeArrayParameters,{"item","big-present", 2, 2, 5, 3, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 2, 2, 5, 2, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 5, 4, {}})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 3, 7, 3, {}})
    table.insert(shapeArrayParameters,{"item","bomb", 1, 1, 3, 1, {}})
    table.insert(shapeArrayParameters,{"item","hook", 2, 1, 2, 1, {}})
    table.insert(shapeArrayParameters,{"item","characterSpecial", 2, 2, 1, 1, {}})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
