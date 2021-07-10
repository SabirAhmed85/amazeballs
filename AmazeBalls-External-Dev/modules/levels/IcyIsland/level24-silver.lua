local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"autoSlide"},{},{1},{1},{1,1,1,3},{2},{1,1,2,3}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "item","map", {1, 1, 3, 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 4, 3}, {"none","right","none","none"})
    addToShapeArray(sp, "manualFan","manualFan1_1_1", {1, 1, 6, 3}, "up")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 3}, "right")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 1, 5})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 2, 5}, "up")
    addToShapeArray(sp, "spitter","spitter2_1_1", {1, 1, 5, 5}, {"none","none","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_1"},{"switchSlide"},{labelled = false},{2},{1},{1,1,4,5},{2},{1,1,5,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 6, 5}, "right")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 1, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 4, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, 9})
    addToShapeArray(sp, "manualFan","manualFan2_2_1", {2, 1, 5, 2}, "down")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 6, 2}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan2_2_1", {2, 1, 2, 3}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_2_1", {2, 1, 4, 3}, "down")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan3_2_1", {2, 1, 3, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan2_2_1"},{"slide"},{},{3},{1},{2,1,1,3},{"*"},{2,1,1,4},{2},{2,1,2,4},{2},{2,1,3,4}})
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 5, 4})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 1}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_2"},{"switchSlide"},{},{1},{1},{1,2,6,1},{2},{1,2,6,2}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 7, 1}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 4, 2}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_2"},{"switchSlide"},{},{1},{1},{1,2,3,2},{2},{1,2,4,2}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 5, 2}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{},{1},{1},{1,2,5,2},{2},{1,2,5,3}})
    addToShapeArray(sp, "shape","bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 2, 3}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 3}, "up")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 6, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"flip-horizontal"}})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 7, 4}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{1},{1},{1,2,7,4},{2},{1,2,7,5}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar4_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})

    --SCREEN 2-2
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 5, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,4,1},{2},{2,2,5,1}})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 4, 3}, {"none","none","none","left"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 2, 4}, "triangleBottomRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_2_2"},{"slide"},{},{2},{1},{2,2,1,3},{2},{2,2,2,4}})
    addToShapeArray(sp, "item","compass", {2, 2, 5, 4})
    addToShapeArray(sp, "simple", "simple1_2_2", {2, 2, 1, 5})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 6, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_2_1", {2, 1, 3, 5}, { {"slide","bar1_1_2"} }, {"one-way"})

    addToShapeArray(sp, "switch","switch1_1_2", {1, 2, 6, 1}, { {"slide","spitter2_1_1"} }, {"one-way", "not-labelled"})
    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {2, 1, 2, 1}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 7, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 5}, "purpleCoin")
    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 2, 1}, 21)
    addToShapeArray(sp, "item","coins", {1, 2, 3, 5}, 26)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 2}, 180)
    addToShapeArray(sp, "item","big-present", {2, 1, 1, 2}, {})
    addToShapeArray(sp, "item","small-present", {1, 2, 5, 1}, {})
    addToShapeArray(sp, "item","iceCape", {2, 2, 2, 1}, {})
    addToShapeArray(sp, "item","dummyBall", {2, 1, 5, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
