local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "characterChangePoint","characterChangePoint1_1_1", {1, 1, 5, 1})
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 2, 2})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 7, 3}, "triangleLeftAndRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 4}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 2-1
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 1}, "left")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 1}, "triangleBottomRightShape", {1, 14, "icy"})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 1, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 3, 2}, "bar", {"vert", 4})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 4, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_2_1"},{"slide"},{},{2},{1},{2,1,2,1},{2},{2,1,4,2}})
    addToShapeArray(sp, "door","door2_2_1", {2, 1, 7, 3}, "right", {"disabled"})
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 1, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan3_2_1"},{"slide"},{},{1},{1},{2,1,1,4},{2},{2,1,2,2},{3},{2,1,3,2}})
    addToShapeArray(sp, "shape","bar4_2_1", {2, 1, 3, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "backFire","backFire1_2_1", {2, 1, 5, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_2_1"},{"slide"},{},{2},{1},{2,1,3,4},{2},{2,1,5,4}})
    addToShapeArray(sp, "shape","bar5_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar6_2_1", {2, 1, 5, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 6, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_2_1"},{"slide"},{},{2},{1},{2,1,5,5},{2},{2,1,6,5},{3},{2,1,6,4},{4},{2,1,7,3}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "icy"})
    addToShapeArray(sp, "shape","bar7_2_1", {2, 1, 3, 6}, "bar", {"vert", 3})

    --SCREEN 3-1
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "spitter","spitter1_3_1", {3, 1, 1, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_3_1"},{"slide"},{},{2},{1},{3,1,1,1},{2},{3,1,1,3}})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 3, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar2_3_1", {3, 1, 3, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 3, 3})
    addToShapeArray(sp, "item","mystery-block", {3, 1, 4, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    })
    addToShapeArray(sp, "item","mystery-block", {3, 1, 7, 3}, {
        {name = "triangle", properties = {shape = {"triangleTopLeftShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"up"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "spitter", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up","left"} } }
    })
    addToShapeArray(sp, "shape","bar3_3_1", {3, 1, 3, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter2_3_1", {3, 1, 7, 4, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_3_1"},{"autoSlide"},{timePerSlide = 600},{1},{1},{3,1,7,4},{2},{3,1,7,5}})
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, 13})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open", "door2_2_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {3, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 1, 3, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 1, 7, 1}, 225)
    addToShapeArray(sp, "item","coins", {3, 1, 6, 3}, 310)
    addToShapeArray(sp, "item","big-present", {3, 1, 2, 3}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 1, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 4}, {})
    addToShapeArray(sp, "item","bomb", {1, 1, 2, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
