local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 7, 3}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 7, 1}, {"none","none","none","left"})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 5, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 2, 5}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{1},{1},{1,2,2,5},{"*"},{1,2,2,4},{2},{1,2,4,4}})
    addToShapeArray(sp, "spitter","spitter2_1_2", {1, 2, 4, 5}, {"none","right","none","none"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle7_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --SCREEN 1-3
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 6, 1}, "triangleTopRightShape", {1, 16})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "spitter","spitter1_1_3", {1, 3, 6, 2, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_3"},{"slide"},{},{2},{1},{1,3,5,2},{2},{1,3,6,2}})
    addToShapeArray(sp, "spitter","spitter2_1_3", {1, 3, 2, 3, "up","none","down","none"})
    addToShapeArray(sp, "spitter","spitter3_1_3", {1, 3, 6, 4}, {"none","none","down","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_3"},{"slide"},{},{2},{1},{1,3,5,4},{2},{1,3,6,4}})
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 5, 5}, "up")
    addToShapeArray(sp, "endPoint","endPoint1_1_3", {1, 3, 7, 5})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 2, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 4, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 4, 5}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 220)
    addToShapeArray(sp, "item","coins", {1, 2, 5, 5}, 90)
    addToShapeArray(sp, "item","coins", {1, 3, 6, 3}, 34)
    addToShapeArray(sp, "item","big-present", {1, 1, 4, 3}, {})
    addToShapeArray(sp, "item","big-present", {1, 3, 1, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 1, 7, 5}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 3}, {})
    addToShapeArray(sp, "item","small-present", {1, 3, 3, 1}, {})
    addToShapeArray(sp, "item","hook", {1, 1, 1, 4}, {})
    addToShapeArray(sp, "item","characterSpecial", {1, 2, 4, 2}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 3, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
