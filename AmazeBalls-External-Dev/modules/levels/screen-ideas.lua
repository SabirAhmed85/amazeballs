
    --FIERY FORTRESS

    -- Lev 1

    --SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 7, 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{4},{1},{1,2,2,2},{2},{1,2,4,2},{3},{1,2,6,2},{4},{1,2,7,2}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 2, 3}, "triangleLeftAndRightShape", {1})
    addToShapeArray(sp, "gem","purple1_1_2", {1, 2, 1, 4}, "purple")
    addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 3, 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,3,4},{2},{1,2,5,4}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 6, 3}, "triangleLeftAndRightShape", {2})
    addToShapeArray(sp, "gem","purple2_1_2", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "door","door2_1_2", {1, 2, 4, 5}, "down")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 6, 5}, "redCoin")

    --SCREEN 1-3

    addToShapeArray(sp, "shape","triangle1_1_3", {1, 3, 1, 1}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{"green"},{1},{1},{1,3,1,1},{2},{1,3,1,2}})
    addToShapeArray(sp, "gem","purple1_1_3", {1, 3, 4, 1}, "purple")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_3"},{"slide"},{"green"},{1},{1},{1,3,1,1},{2},{1,3,1,2}})
    addToShapeArray(sp, "door","door1_1_3", {1, 3, 5, 1}, "up")
    addToShapeArray(sp, "gem","purple2_1_3", {1, 3, 1, 3}, "purple")
    addToShapeArray(sp, "shape","triangle2_1_3", {1, 3, 4, 3}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_3"},{"slide"},{"green"},{2},{1},{1,3,4,2},{2},{1,3,4,3},{3},{1,3,4,5}})
    addToShapeArray(sp, "shape","triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "gem","blueCoin", {1, 3, 2, 5}, "blueCoin")
    addToShapeArray(sp, "shape","triangle4_1_3", {1, 3, 5, 5}, "triangleTopRightShape", {1})

    -- lEV 2

    --SCREEN 1-2
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 4, 1}, "up")
    addToShapeArray(sp, "gem","blueCoin", {1, 2, 6, 1}, "blueCoin")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 1}, "down")
    addToShapeArray(sp, "gem","purpleCoin", {1, 2, 4, 2}, "purpleCoin")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 3}, "purple")
    addToShapeArray(sp, "autoFan","autoFan2_1_2", {1, 2, 4, 3}, "up")
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle2_1_2"},{"slide"},{"green"},{2},{1},{1,2,5,1},{2},{1,2,7,3}})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 5}, "purple")
    addToShapeArray(sp, "simple","simple1_1_2", {1, 2, 5, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{2},{1},{1,2,3,5},{2},{1,2,5,5}})
    addToShapeArray(sp, "autoFan","autoFan3_1_2", {1, 2, 7, 5}, "left")

    -- Lev 3
    --SCREEN 1-1
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 1}, "purple")
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 4, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_1"},{"slide"},{"lightBlue"},{1},{1},{1,1,4,1},{2},{1,1,5,2},{3},{1,1,5,4},{4},{1,1,5,5}})
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 5, 1}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    addToShapeArray(sp, "autoFan","autoFan3_1_1", {1, 1, 2, 2}, "down")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 2}, "purple")
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    addToShapeArray(sp, "autoFan","autoFan4_1_1", {1, 1, 4, 4}, "left")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    addToShapeArray(sp, "gem","redCoin", {1, 1, 3, 5}, "redCoin")

    --Old Woody Level 13 Silver, screen 1-2
    addToShapeArray(sp, "backFire","backFire1_1_2", {1, 2, 1, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"backFire1_1_2"},{"slide"},{"lightDarkBlue"},{1},{1},{1,2,1,1},{2},{1,2,2,1}})

    addToShapeArray(sp, "simple","simple2_1_2", {1, 2, 3, 1})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,1,2},{2},{1,2,2,2}})

    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 5, 2})

    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape", {1})
    addToShapeArray(sp, "manualFan","manualFan1_1_2", {1, 2, 3, 4}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 4, 4}, "left")
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 5}, "down")

    -- Old Woody Level 14 Silver, screen 4-1
    addToShapeArray(sp, "simple","simple1_4_1", {4, 1, 6, 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_4_1"},{"slide"},{"lightBlue"},{2},{1},{4,1,3,1},{2},{4,1,6,1}})

    addToShapeArray(sp, "endPoint","endPoint1_4_1", {4, 1, 7, 1})

    addToShapeArray(sp, "simple","simple2_4_1", {4, 1, 3, 3})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple2_4_1"},{"slide"},{"lightBlue"},{1},{1},{4,1,3,3},{2},{4,1,4,3}})

    addToShapeArray(sp, "shape","triangle1_4_1", {4, 1, 4, 5}, "triangleBottomRightShape", {1})

    addToShapeArray(sp, "shape","triangle2_4_1", {4, 1, 4, 4}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "shape","triangle3_4_1", {4, 1, 5, 4}, "triangleBottomRightShape", {1})

    addToShapeArray(sp, "shape","triangle4_4_1", {4, 1, 5, 3}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "shape","triangle5_4_1", {4, 1, 6, 3}, "triangleBottomRightShape", {1})

    addToShapeArray(sp, "shape","triangle6_4_1", {4, 1, 6, 2}, "triangleTopLeftShape", {1})

    addToShapeArray(sp, "shape","triangle7_4_1", {4, 1, 7, 2}, "triangleBottomRightShape", {1})

    addToShapeArray(sp, "simple","simple3_4_1", {4, 1, 6, 5})

    addToShapeArray(sp, "simple","simple3_4_1", {4, 1, 6, 4})




