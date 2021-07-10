local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 1-1
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 3, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,3,1},{2},{1,1,4,1}})
    addToShapeArray(sp, "gun","gun1_1_1", {1, 1, 5, 1}, "down")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_1"},{"slide"},{},{1},{1},{1,1,3,2},{2},{1,1,4,2}})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 3, 4, "up","right","none","none"})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 1, 5, "down", "disabled"})
    addToShapeArray(sp, "door","door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    addToShapeArray(sp, "endPoint","endPoint1_2_1", {2, 1, 1, 1})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 6, 1}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_2_1"},{"slide"},{},{1},{1},{2,1,6,1},{2},{2,1,7,1}})
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 3, 2}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_1"},{"slide"},{},{1},{2},{2,1,3,1},{2},{2,1,3,2}})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"switchSlide"},{},{1},{1},{2,1,7,2},{2},{2,1,7,4}})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_2_1", {2, 1, 1, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_1"},{"switchSlide"},{},{2},{1},{2,1,1,3},{2},{2,1,1,4}})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 3, 4}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_2_1"},{"switchSlide"},{},{1},{1},{2,1,3,4},{2},{2,1,4,4}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "gun","gun1_2_1", {2, 1, 7, 5}, "left")

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 1, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 3, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_2"},{"slide"},{},{2},{1},{1,2,2,1},{2},{1,2,3,1}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, 2, "icy"})
    addToShapeArray(sp, "manualFan","manualFan2_1_2", {1, 2, 6, 1}, "down")
    addToShapeArray(sp, "item","map", {1, 2, 7, 1})
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{},{1},{1},{1,2,1,2},{2},{1,2,3,2},{3},{1,2,5,2}})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 6, 2}, "right")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 5, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 5, 3, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_2"},{"slide"},{},{2},{1},{1,2,2,3},{2},{1,2,5,3},{3},{1,2,6,3}})
    addToShapeArray(sp, "door","door3_1_2", {1, 2, 7, 3}, "right")
    addToShapeArray(sp, "tunnel","tunnel1_1_2", {1, 2, 2, 4, 2, 1, 4, 1}, "down")
    addToShapeArray(sp, "spitter","spitter2_1_2", {1, 2, 6, 4}, {"none","right","none","left"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter2_1_2"},{"slide"},{},{2},{1},{1,2,3,4},{2},{1,2,6,4}})
    addToShapeArray(sp, "door","door4_1_2", {1, 2, 7, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5, "icy"})
    addToShapeArray(sp, "spitter","spitter3_1_2", {1, 2, 5, 5, "up","right","none","none"})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter3_1_2"},{"slide"},{},{2},{1},{1,2,4,5},{2},{1,2,5,5},{3},{1,2,6,5}})
    addToShapeArray(sp, "door","door5_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "spitter","spitter1_2_2", {2, 2, 4, 1}, {"none","right","down","left"})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 2}, "right")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 2, 2}, "triangleTopLeftShape", {1, _, "hyroll"})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle5_2_2", {2, 2, 5, 2}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle6_2_2", {2, 2, 7, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 3}, "left")
    addToShapeArray(sp, "shape","triangle7_2_2", {2, 2, 3, 3}, "triangleTopLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 4, 3}, "right")
    addToShapeArray(sp, "shape","triangle8_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 4}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 1, 4}, "up")
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 3, 4}, "bar", {"horz"})
    addToShapeArray(sp, "gun","gun1_2_2", {2, 2, 4, 4}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 7, 4}, "right")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 5}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 2, 5}, "left")
    addToShapeArray(sp, "shape","bar2_2_2", {2, 2, 3, 5}, "bar", {"horz", 4})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 3, 5}, "down")
    addToShapeArray(sp, "shape","triangle9_2_2", {2, 2, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle10_2_2", {2, 2, 6, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 3, 5}, "down")

    --SCREEN 2-3
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 7, 1}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 1, 2}, "down")
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 3, 2}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 7, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle4_2_3", {2, 3, 2, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 5, 4}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_2_3"},{"slide"},{},{2},{1},{2,3,5,3},{2},{2,3,5,4}})
    addToShapeArray(sp, "shape","triangle5_2_3", {2, 3, 2, 5}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle6_2_3", {2, 3, 6, 5}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle6_2_3"},{"slide"},{},{2},{1},{2,3,5,5},{2},{2,3,6,5}})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 1, 1}, { {"slide","triangle2_2_1"},{"slide","triangle4_2_1"},{"slide","manualFan1_2_1"},{"slide","autoFan1_2_3"},{"slide","triangle6_2_3"} }, {"one-way"})

    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 5}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 3, 1, 3}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 6, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 6, 5}, 65)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 3}, 85)
    addToShapeArray(sp, "item","coins", {2, 2, 5, 4, 385})
    addToShapeArray(sp, "item","coins", {2, 2, 2, 3}, 75)
    addToShapeArray(sp, "item","small-present", {2, 2, 4, 2}, {})

    addToShapeArray(sp, "item","small-present", {2, 3, 7, 1}, {})

    addToShapeArray(sp, "item","big-present", {1, 1, 7, 2}, {})

    addToShapeArray(sp, "item","big-present", {2, 3, 4, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
