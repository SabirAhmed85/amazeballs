local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{3},{1},{1,1,2,1},{2},{1,1,4,1},{3},{1,1,5,1}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 6, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "up")
    --addToShapeArray(sp, "timeOut","timeOut1_1_1", {1, 1, 2, 2, 2})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 5, 2}, "up")
    addToShapeArray(sp, "item","mystery-block", {1, 1, 2, 3}, {
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"right", "down", "left"} } }
    })
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 4, 3}, "up")
    --addToShapeArray(sp, "gem","purpleCoin", {1, 1, 5, 3}, "purpleCoin")
    addToShapeArray(sp, "item","mystery-block", {1, 1, 6, 3}, {
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "triangle", properties = {shape = "triangleTopLeftShape"} },
        {name = "spitter", properties = {directions = {"left"} } }
    })
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,6,2},{2},{1,1,7,3}})
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_1_1"},{"slide"},{"green"},{1},{1},{1,1,2,4},{2},{1,1,4,4},{3},{1,1,6,4}})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "simple","simple2_1_1", {1, 1, 1, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_1"},{"slide"},{"lightBlue"},{2},{1},{1,1,1,4},{2},{1,1,1,5}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 2, 6}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 4, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 6, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_1_1", {1, 1, 7, 5})

    -- 2-1
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 1, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{"orange"},{2},{1},{2,1,3,1},{2},{2,1,3,2}})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 5, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{"orange"},{1},{1},{2,1,5,2},{2},{2,1,6,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 7, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_1"},{"slide"},{"green"},{2},{1},{2,1,7,1},{2},{2,1,7,2}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 3, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{"orange"},{2},{1},{2,1,2,4},{2},{2,1,3,4}})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 5, 4}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{"orange"},{1},{1},{2,1,5,4},{2},{2,1,5,5}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 7, 5}, "triangleTopRightShape")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 1, 6, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 6, 5}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 5, 3}, 350)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 1}, 50)
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 3}, {})

    addToShapeArray(sp, "item","big-present", {2, 1, 6, 3}, {})

    addToShapeArray(sp, "item","coins", {2, 1, 7, 4}, 70)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
