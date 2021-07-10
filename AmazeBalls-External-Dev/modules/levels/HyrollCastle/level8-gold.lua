local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 2, 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 3}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{timePerSquare = 480, pauseTime = 0, labelled = false},{1},{1},{1,1,7,3},{2},{1,1,7,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 4, 1}, "left")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 4, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_2_1"},{"slide"},{},{1},{1},{2,1,4,2},{"*"},{2,1,4,3},{2},{2,1,5,3},{3},{2,1,5,4}})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 7, 3}, "bar", {"vert", 2})
    addToShapeArray(sp, "simple","simple1_2_1", {2, 1, 1, 4})) -- instead of timeout for now
    --addToShapeArray(sp, "timeOut","timeOut1_2_1", {2, 1, 1, 4, 2})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape", {1, 7})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{2},{1},{2,1,2,4},{2},{2,1,3,4},{3},{2,1,3,3}})
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 4, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_1"},{"slide"},{},{1},{1},{2,1,4,4},{2},{2,1,4,5}})
    addToShapeArray(sp, "autoFan","autoFan4_2_1", {2, 1, 6, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan4_2_1"},{"slide"},{},{2},{1},{2,1,5,2},{2},{2,1,6,4}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape", {1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"slide"},{},{2},{1},{2,1,6,5},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 5, 5}, "triangleTopRightShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 7, 5}, "right")

    --SCREEN 3-1
    addToShapeArray(sp, "simple","simple1_3_1", {3, 1, 1, 1})
    addToShapeArray(sp, "shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle2_3_1", {3, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_3_1", {3, 1, 6, 1}, "down")
    addToShapeArray(sp, "shape","triangle3_3_1", {3, 1, 7, 1}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple2_3_1", {3, 1, 4, 2})
    addToShapeArray(sp, "shape","bar1_3_1", {3, 1, 5, 2}, "bar", {"vert", 2})
    addToShapeArray(sp, "endPoint","endPoint1_3_1", {3, 1, 5, 2})
    addToShapeArray(sp, "shape","triangle4_3_1", {3, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_3_1", {3, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_3_1", {3, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable", 6})
    addToShapeArray(sp, "shape","triangle7_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "simple","simple3_3_1", {3, 1, 6, 3})
    addToShapeArray(sp, "shape","triangle8_3_1", {3, 1, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan2_3_1", {3, 1, 7, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan3_3_1", {3, 1, 6, 5}, "right")
    addToShapeArray(sp, "autoFan","autoFan4_3_1", {3, 1, 7, 5}, "down")

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {3, 1, 1, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 3, 4}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {3, 1, 4, 4}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 7, 3}, 245)
    addToShapeArray(sp, "item","coins", {2, 1, 6, 1}, 395)
    addToShapeArray(sp, "item","coins", {3, 1, 4, 5}, 75)
    addToShapeArray(sp, "item","big-present", {2, 1, 7, 2}, {})
    addToShapeArray(sp, "item","big-present", {3, 1, 5, 4}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 1, 4}, {})
    addToShapeArray(sp, "item","small-present", {2, 1, 2, 1}, {})
    addToShapeArray(sp, "item","small-present", {3, 1, 7, 3}, {})
    addToShapeArray(sp, "item","fireCape", {2, 1, 2, 5}, {})
    addToShapeArray(sp, "item","dummyBall", {3, 1, 2, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
