
    --FIERY FORTRESS

    -- Lev 1

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 3, 1}, "up")
    newShape("simple","simple1_1_2", {1, 2, 7, 2})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, 1, {{1,2,2,2},{1,2,4,2},{1,2,6,2},{1,2,7,2}})
    newShape("shape","triangle1_1_2", {1, 2, 2, 3}, "triangleLeftAndRightShape", {1})
    newShape("gem","purple1_1_2", {1, 2, 1, 4}, "purple")
    newShape("simple","simple2_1_2", {1, 2, 3, 4})
    newTransition("simple2_1_2", "slide", {"lightBlue"}, 1, {{1,2,3,4},{1,2,5,4}})
    newShape("shape","triangle2_1_2", {1, 2, 6, 3}, "triangleLeftAndRightShape", {2})
    newShape("gem","purple2_1_2", {1, 2, 7, 4}, "purple")
    newShape("door","door2_1_2", {1, 2, 4, 5}, "down")
    newShape("gem","redCoin", {1, 2, 6, 5}, "redCoin")

    --SCREEN 1-3

    newShape("shape","triangle1_1_3", {1, 3, 1, 1}, "triangleTopRightShape", {1})
    newTransition("triangle1_1_3", "slide", {"green"}, 1, {{1,3,1,1},{1,3,1,2}})
    newShape("gem","purple1_1_3", {1, 3, 4, 1}, "purple")
    newShape("door","door1_1_3", {1, 3, 5, 1}, "up")
    newShape("gem","purple2_1_3", {1, 3, 1, 3}, "purple")
    newShape("shape","triangle2_1_3", {1, 3, 4, 3}, "triangleTopLeftShape", {1})
    newTransition("triangle2_1_3", "slide", {"green"}, 1, {{1,3,4,2},{1,3,4,3},{1,3,4,5}})
    newShape("shape","triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1})
    newShape("gem","blueCoin", {1, 3, 2, 5}, "blueCoin")
    newShape("shape","triangle4_1_3", {1, 3, 5, 5}, "triangleTopRightShape", {1})

    -- lEV 2

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1})
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("gem","blueCoin", {1, 2, 6, 1}, "blueCoin")
    newShape("autoFan","autoFan1_1_2", {1, 2, 7, 1}, "down")
    newShape("gem","purpleCoin", {1, 2, 4, 2}, "purpleCoin")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("autoFan","autoFan2_1_2", {1, 2, 4, 3}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 7, 3}, "triangleTopRightShape", {1})
    newTransition("triangle2_1_2", "slide", {"green"}, 1, {{1,2,5,1},{1,2,7,3}})
    newShape("shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1})
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("simple","simple1_1_2", {1, 2, 5, 5})
    newTransition("simple1_1_2", "slide", {"lightBlue"}, 1, {{1,2,3,5},{1,2,5,5}})
    newShape("autoFan","autoFan3_1_2", {1, 2, 7, 5}, "left")

    -- Lev 3
    --SCREEN 1-1
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("simple","simple1_1_1", {1, 1, 4, 1})
    newTransition("simple1_1_1", "slide", {"lightBlue"}, 1, {{1,1,4,1},{1,1,5,2},{1,1,5,4},{1,1,5,5}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 6, 1}, "triangleTopAndBottomShape", {2})
    newShape("autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    newShape("autoFan","autoFan3_1_1", {1, 1, 2, 2}, "down")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    newShape("autoFan","autoFan4_1_1", {1, 1, 4, 4}, "left")
    newShape("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopAndBottomShape", {1})
    newShape("gem","redCoin", {1, 1, 3, 5}, "redCoin")

    --Old Woody Level 13 Silver, screen 1-2
    newShape("backFire","backFire1_1_2", {1, 2, 1, 1})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, 1, {{1,2,1,1},{1,2,2,1}})

    newShape("simple","simple2_1_2", {1, 2, 3, 1})
    newShape("shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1})
    newTransition("triangle1_1_2", "slide", {"green"}, 1, {{1,2,1,2},{1,2,2,2}})

    newShape("endPoint","endPoint1_1_2", {1, 2, 5, 2})

    newShape("shape","triangle2_1_2", {1, 2, 2, 4}, "triangleBottomLeftShape", {1})
    newShape("manualFan","manualFan1_1_2", {1, 2, 3, 4}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 4}, "left")
    newShape("shape","triangle4_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 3, 5}, "down")

    -- Old Woody Level 14 Silver, screen 4-1
    newShape("simple","simple1_4_1", {4, 1, 6, 1})
    newTransition("simple1_4_1", "slide", {"lightBlue"}, 1, {{4,1,3,1},{4,1,6,1}})

    newShape("endPoint","endPoint1_4_1", {4, 1, 7, 1})

    newShape("simple","simple2_4_1", {4, 1, 3, 3})
    newTransition("simple2_4_1", "slide", {"lightBlue"}, 1, {{4,1,3,3},{4,1,4,3}})

    newShape("shape","triangle1_4_1", {4, 1, 4, 5}, "triangleBottomRightShape", {1})

    newShape("shape","triangle2_4_1", {4, 1, 4, 4}, "triangleTopLeftShape", {1})

    newShape("shape","triangle3_4_1", {4, 1, 5, 4}, "triangleBottomRightShape", {1})

    newShape("shape","triangle4_4_1", {4, 1, 5, 3}, "triangleTopLeftShape", {1})

    newShape("shape","triangle5_4_1", {4, 1, 6, 3}, "triangleBottomRightShape", {1})

    newShape("shape","triangle6_4_1", {4, 1, 6, 2}, "triangleTopLeftShape", {1})

    newShape("shape","triangle7_4_1", {4, 1, 7, 2}, "triangleBottomRightShape", {1})

    newShape("simple","simple3_4_1", {4, 1, 6, 5})

    newShape("simple","simple3_4_1", {4, 1, 6, 4})




