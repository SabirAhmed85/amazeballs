local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    --SCREEN 2-1
    addToShapeArray(sp, "autoFan","autoFan1_2_1", {2, 1, 2, 3}, "up")
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_1"},{"slide"},{},{2},{1},{2,1,4,1},{2},{2,1,4,3}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 5}, "triangleBottomRightShape")
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 5, 5}, "down")
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 5}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_2_1"},{"switchSlide"},{},{2},{1},{2,1,5,5},{2},{2,1,7,5}})

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 2}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_2"},{"slide"},{},{2},{1},{1,2,6,1},{2},{1,2,7,2}})
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 1, 4}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan2_1_2"},{"slide"},{},{1},{1},{1,2,1,4},{2},{1,2,3,3},{3},{1,2,5,3}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 5}, "down")

    --SCREEN 2-2
    addToShapeArray(sp, "tunnel","tunnel1_2_2", {2, 2, 4, 1, 2, 1, 6, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 7, 1}, "left")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,7,1},{2},{2,2,7,2}})
    addToShapeArray(sp, "shape","bar1_2_2", {2, 2, 2, 2}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "simple","simple1_2_2", {2, 2, 5, 2})
    addToShapeArray(sp, "tunnel","tunnel2_2_2", {2, 2, 1, 3, 1, 2, 3, 2}, "down")
    addToShapeArray(sp, "tunnel","tunnel3_2_2", {2, 2, 7, 3, 3, 2, 6, 5}, "up")
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 1, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 5, 4}, "right")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape")
    addToShapeArray(sp, "tunnel","tunnel4_2_2", {2, 2, 4, 5, 2, 4, 2, 2}, "right")
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 7, 5}, "down")

    --SCREEN 3-2
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 4, 2}, "triangleBottomLeftShape", {1, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_2"},{"slide"},{},{2},{1},{3,2,2,1},{"*"},{3,2,2,2},{2},{3,2,4,2},{3},{3,2,5,2}})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 2, 3}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 6, 3}, "triangleBottomLeftShape")
    addToShapeArray(sp, "shape","bar1_3_2", {3, 2, 2, 4}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan2_3_2", {3, 2, 2, 4}, "down")
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 2, 5}, "down")
    addToShapeArray(sp, "shape","bar2_3_2", {3, 2, 4, 5}, "bar", {"vert", 2})

    --SCREEN 1-3
    addToShapeArray(sp, "manualFan","manualFan1_1_3", {1, 3, 2, 1}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_1_3"},{"slide"},{},{2},{1},{1,3,1,1},{2},{1,3,2,1}})
    addToShapeArray(sp, "manualFan","manualFan2_1_3", {1, 3, 3, 1}, "right")
    addToShapeArray(sp, "manualFan","manualFan3_1_3", {1, 3, 5, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan4_1_3", {1, 3, 6, 1}, "up")
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 7, 1}, "right")
    addToShapeArray(sp, "item","map", {1, 3, 1, 2})
    addToShapeArray(sp, "manualFan","manualFan5_1_3", {1, 3, 1, 3}, "left")
    addToShapeArray(sp, "shape","bar1_1_3", {1, 3, 2, 3}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 5, 3}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar2_1_3", {1, 3, 6, 3}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan6_1_3", {1, 3, 6, 4}, "right")
    addToShapeArray(sp, "autoFan","autoFan1_1_3", {1, 3, 1, 5}, "up")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan1_1_3"},{"slide"},{},{1},{1},{1,3,1,4},{2},{1,3,1,5}})
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 4, 5}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{},{2},{1},{1,3,3,4},{2},{1,3,4,5}})

    --SCREEN 2-3
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 1, 1}, "down")
    addToShapeArray(sp, "spitter","spitter1_2_3", {2, 3, 4, 1}, {"none","none","down","left"})
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 7, 1}, "left")
    addToShapeArray(sp, "spitter","spitter2_2_3", {2, 3, 1, 3}, {"none","right","down","none"})
    addToShapeArray(sp, "tunnel","tunnel1_2_3", {2, 3, 4, 3, 2, 2, 4, 3, "none"})
    addToShapeArray(sp, "spitter","spitter3_2_3", {2, 3, 7, 3}, {"none","none","down","left"})
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 1, 5}, "right")
    addToShapeArray(sp, "spitter","spitter4_2_3", {2, 3, 4, 5, "up","right","none","none"})
    addToShapeArray(sp, "autoFan","autoFan4_2_3", {2, 3, 7, 5}, "up")

    --SCREEN 3-3
    addToShapeArray(sp, "shape","triangle1_3_3", {3, 3, 7, 1}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_3_3"},{"switchSlide"},{},{1},{1},{3,3,7,1},{2},{3,3,7,2}})
    addToShapeArray(sp, "manualFan","manualFan1_3_3", {3, 3, 3, 2}, "right")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"manualFan1_3_3"},{"slide"},{},{2},{1},{3,3,2,2},{2},{3,3,3,2},{3},{3,3,4,2}})
    addToShapeArray(sp, "door","door1_3_3", {3, 3, 1, 3}, "left")
    addToShapeArray(sp, "manualFan","manualFan2_3_3", {3, 3, 1, 3}, "down")
    addToShapeArray(sp, "autoFan","autoFan1_3_3", {3, 3, 2, 3}, "left")
    addToShapeArray(sp, "backFire","backFire1_3_3", {3, 3, 2, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_3_3"},{"slide"},{},{2},{1},{3,3,1,5},{2},{3,3,2,5},{3},{3,3,4,5}})
    addToShapeArray(sp, "shape","triangle2_3_3", {3, 3, 6, 5}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_3_3"},{"slide"},{},{1},{1},{3,3,6,5},{2},{3,3,7,3}})

    --SCREEN 2-4
    addToShapeArray(sp, "shape","bar1_2_4", {2, 4, 4, 1}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,1},{2},{2,4,5,1}})
    addToShapeArray(sp, "endPoint","endPoint1_2_4", {2, 4, 4, 1})
    addToShapeArray(sp, "shape","bar2_2_4", {2, 4, 4, 2}, "bar", {"vert", 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,2},{2},{2,4,5,2}})
    addToShapeArray(sp, "shape","triangle1_2_4", {2, 4, 5, 2}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","triangle2_2_4", {2, 4, 7, 2}, "triangleTopLeftShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_2_4", {2, 4, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_4", {2, 4, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_2_4", {2, 4, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle6_2_4", {2, 4, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_2_4", {2, 4, 7, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_4", {2, 4, 1, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan2_2_4", {2, 4, 5, 4}, "right")
    addToShapeArray(sp, "manualFan","manualFan1_2_4", {2, 4, 6, 4}, "up")
    addToShapeArray(sp, "shape","bar3_2_4", {2, 4, 8, 4}, "bar", {"horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_2_4"},{"switchSlide"},{},{1},{1},{2,4,8,2},{2},{2,4,8,4}})
    addToShapeArray(sp, "autoFan","autoFan3_2_4", {2, 4, 2, 5}, "down")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"autoFan3_2_4"},{"slide"},{},{1},{1},{2,4,2,5},{2},{2,4,4,4}})
    addToShapeArray(sp, "shape","bar4_2_4", {2, 4, 4, 6}, "bar", {"vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar4_2_4"},{"switchSlide"},{},{1},{1},{2,4,4,6},{2},{2,4,5,6}})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_3_3", {3, 3, 6, 2}, { {"slide","triangle2_2_1"},{"slide","bar1_2_4"},{"slide","bar2_2_4"},{"slide","bar3_2_4"},{"slide","bar4_2_4"} })
    addToShapeArray(sp, "switch","switch2_3_3", {3, 3, 4, 4}, { {"slide","triangle1_3_3"} })

    --GEMS
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 2, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 6, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 3, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 2, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 4, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 3, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 3, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 6, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 2, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 2, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 5, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 4, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 3, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 1, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {3, 3, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 6, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 1, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 2, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 3, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 6, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 7, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {2, 4, 3, 2}, "purple")
    addToShapeArray(sp, "gem","redCoin", {3, 2, 6, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {2, 2, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 1, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 3, 3, 3}, 140)
    addToShapeArray(sp, "item","coins", {2, 1, 4, 3}, 14)
    addToShapeArray(sp, "item","coins", {1, 2, 7, 4}, 135)
    addToShapeArray(sp, "item","coins", {2, 2, 2, 3}, 75)
    addToShapeArray(sp, "item","coins", {2, 3, 2, 3}, 110)
    addToShapeArray(sp, "item","coins", {2, 3, 6, 3}, 110)
    addToShapeArray(sp, "item","coins", {3, 2, 6, 1}, 150)
    addToShapeArray(sp, "item","coins", {3, 2, 4, 3}, 50)
    addToShapeArray(sp, "item","coins", {3, 3, 5, 3}, 250)
    addToShapeArray(sp, "item","coins", {3, 3, 1, 1}, 145)
    addToShapeArray(sp, "item","coins", {3, 3, 1, 1}, 145)
    addToShapeArray(sp, "item","coins", {2, 4, 4, 2}, 35)
    addToShapeArray(sp, "item","coins", {2, 4, 3, 3}, 135)
    addToShapeArray(sp, "item","small-present", {1, 2, 1, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 2, 6, 1}, {})

    addToShapeArray(sp, "item","small-present", {2, 3, 5, 5}, {})

    addToShapeArray(sp, "item","small-present", {3, 3, 2, 4}, {})

    addToShapeArray(sp, "item","small-present", {2, 4, 7, 3}, {})

    addToShapeArray(sp, "item","big-present", {2, 3, 3, 1}, {})

    addToShapeArray(sp, "item","big-present", {2, 4, 1, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 4
t.screenHorzTotal = 3
t.screenVertTotal = 4
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
