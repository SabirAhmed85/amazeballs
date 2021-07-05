local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "item","mystery-block", {1, 1, 6, 3}, {
        {name = "shape", properties = {shape = {"triangleTopRightShape"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"right"} } }
    })
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 3, 5}, "down")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 6, 5})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 4, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 6, 1}, "up")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","map", {1, 2, 1, 2})
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 1, 3})
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 5, 3}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"slide"},{"brown"},{1},{1},{1,2,5,3},{2},{1,2,7,3}})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 2, 3}, "bar", {"vert", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"slide"},{"brown"},{1},{1},{1,2,2,3},{2},{1,2,4,3}})
    addToShapeArray(sp, "item","map", {1, 2, 4, 3})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 5, 4}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_2"},{"slide"},{"brown"},{1},{1},{1,2,5,4},{2},{1,2,7,4}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle8_1_2", {1, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle9_1_2", {1, 2, 5, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 1, 3})
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 6, 3}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_3"},{"slide"},{"brown"},{4},{1},{1,3,3,1},{2},{1,3,4,3},{3},{1,3,5,3},{4},{1,3,6,3}})
    addToShapeArray(sp, "shape","bar3_1_3", {1, 3, 3, 4}, "bar", {"horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_3"},{"slide"},{"brown"},{2},{1},{1,3,3,3},{2},{1,3,3,4}})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 7, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{"green"},{1},{1},{1,3,7,3},{2},{1,3,7,4}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 3}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 3, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    addToShapeArray(sp, "item","coins", {1, 1, 1, 3, 375})
    addToShapeArray(sp, "item","coins", {1, 2, 7, 3}, 55))
    addToShapeArray(sp, "item","coins", {1, 3, 2, 3, 140}) 
    addToShapeArray(sp, "item", "small-present", {1, 1, 6, 1}, {})

    table.insert(shapeArrayParameters,  {"item","big-present", {1, 2, 6, 2, "present2_1_1", 
                                            { 
                                                {"item","clock", {1, 2, 3, 2, "clock1_1_1", 10, 1},
                                                {"triangle", "triangleTopRightShape"},
                                                {"spitter", {"up", "right", "down", "left"} },
                                                {"manualFan", "right"},
                                                {"manualFan", "down"},
                                                {"autoFan", "down"}
                                            } 
                                        } ) 

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
