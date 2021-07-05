local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,1},{2},{1,1,2,1},{3},{1,1,5,1}})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 6, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{"lightDarkBlue"},{2},{1},{1,1,6,1},{2},{1,1,6,2}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 5}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,1,5},{2},{1,1,3,5},{3},{1,1,4,5},{4},{1,1,5,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 2, 5}, "down")
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "door","door3_1_1", {1, 1, 4, 5}, "down")
    addToShapeArray(sp, "door","door4_1_1", {1, 1, 5, 5}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 5, 1}, "up")
    addToShapeArray(sp, "door","door4_1_2", {1, 2, 7, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 2, "doubleBar", "vert"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 2, "doubleBar", "vert"})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 1, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 2, 2}, "right")
    addToShapeArray(sp, "item","map", {1, 2, 4, 2})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 3}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{2},{1},{1,2,7,2},{2},{1,2,7,3}})
    addToShapeArray(sp, "item","mystery-block", {1, 2, 3, 4}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "spitter", properties = {directions = {"up", "right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    })
    addToShapeArray(sp, "door","door5_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 3, 2}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 6, 2}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{"silver"},{1},{1},{1,3,6,2},{2},{1,3,7,2}})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 3}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "manualFan","manualFan2_1_3", {1, 3, 5, 3}, "down")
    addToShapeArray(sp, "manualFan","manualFan3_1_3", {1, 3, 6, 3}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_1_3"},{"slide"},{"silver"},{1},{1},{1,3,6,3},{2},{1,3,7,3}})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 1, 4}, "triangleBottomRightShape", {1, 8})
    addToShapeArray(sp, "manualFan","manualFan4_1_3", {1, 3, 5, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan4_1_3"},{"slide"},{"silver"},{1},{1},{1,3,5,4},{2},{1,3,7,4}})
    addToShapeArray(sp, "manualFan","manualFan5_1_3", {1, 3, 3, 5}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan5_1_3"},{"slide"},{"silver"},{2},{1},{1,3,2,4},{2},{1,3,3,5}})
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 2, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 2}, 100)
    addToShapeArray(sp, "item","bomb", {1, 2, 3, 1, "bomb2_1_1", {3, "right", "left", "up"}, 3})
    addToShapeArray(sp, "item","clock", {1, 1, 1, 3, "clock1_1_1", 10, 1})
    addToShapeArray(sp, "item","coins", {1, 2, 2, 4}, 21)
    addToShapeArray(sp, "item","coins", {1, 2, 1, 4}, 4)
    addToShapeArray(sp, "item","coins", {1, 2, 6, 1, 42)
    addToShapeArray(sp, "item","coins", {1, 3, 4, 2, 125})
    addToShapeArray(sp, "item","big-present", {1, 2, 4, 1}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
