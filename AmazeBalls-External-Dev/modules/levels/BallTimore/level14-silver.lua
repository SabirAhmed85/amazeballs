local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 5, 2}, "left")
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 6, 4}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"switchSlide"},{},{2},{1},{1,1,5,4},{2},{1,1,6,4}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, 16, "breakable"})
    addToShapeArray(sp, "manualFan","manualFan2_1_1", {1, 1, 2, 5}, "left")
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 5, 5}, "bar", {"horz"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_1_1"},{"slide"},{},{2},{1},{1,1,5,4},{2},{1,1,5,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 5}, "down")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 1-2
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 6, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,1,2},{2},{1,2,3,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 5, 2}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 5, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 5, 4}, "right")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 3, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "manualFan","manualFan3_1_2", {1, 2, 1, 5}, "up")
    addToShapeArray(sp, "manualFan","manualFan4_1_2", {1, 2, 6, 5}, "left")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 6, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 6, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 1, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 5, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "endPoint","endPoint1_2_2", {2, 2, 6, 3})
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 1, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 4, 4}, "left")
    addToShapeArray(sp, "shape","triangle9_2_2", {2, 2, 1, 5}, "triangleBottomLeftShape")
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 5, 5, "up","none","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_2_2"},{"slide"},{},{1},{1},{2,2,5,5},{2},{2,2,6,5},{3},{2,2,7,5}})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 6}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 3, 6}, "bar", {"vert", 2})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 7, 2}, { {"slide","bar3_1_1"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 7, 4}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 1, 1}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {2, 2, 7, 1}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {2, 2, 1, 1, 40)
    addToShapeArray(sp, "item","small-present", {1, 1, 4, 4}, {})

    addToShapeArray(sp, "item","small-present", {2, 2, 7, 4}, {})

    addToShapeArray(sp, "item","big-present", {2, 2, 5, 4}, {})
    addToShapeArray(sp, "item","fireCape", {1, 2, 4, 2}, {})
    addToShapeArray(sp, "item","dummyBall", {1, 1, 1, 3}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
