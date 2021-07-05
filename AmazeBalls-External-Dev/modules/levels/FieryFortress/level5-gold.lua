local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local widget = require("widget")

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 1}, "down")
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 3, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "item","big-present", {1, 1, 1, 3, "present1_1_1", 
                                            { 
                                                -- put BOMB here
                                                {"item","clock", {1, 1, 3, 2, "clock1_1_1", 10, 1},
                                                {"triangle", "triangleTopRightShape"},
                                            } 
                                        })
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 4, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 7, 3})
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 1, 5}, "right")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 3, 5}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 6, 5}, "down")

    -- 2-1
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 1, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 1}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 6, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 8, 2}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 3}, "bar", {"vert", 4})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 6, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,6,3},{2},{1,2,6,4}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 8, 3}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 1, 5}, "bar", {"horz", 4})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,1,4},{2},{1,2,1,5}})
    addToShapeArray(sp, "backFire","backFire2_1_2", {1, 2, 3, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire2_1_2"},{"slide"},{"lightDarkBlue"},{3},{1},{1,2,3,2},{2},{1,2,3,3},{3},{1,2,3,5}})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 7, 5}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","big-present", {1, 1, 1, 3}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 7, 4}, {})

    --addToShapeArray(sp, "item","coins", {1, 1, 4, 1}, 90)
    --addToShapeArray(sp, "item","coins", {1, 2, 6, 4}, 250)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
