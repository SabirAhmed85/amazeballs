local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local newShape = function(type, name, location, subType, props)
        addToShapeArray(shapeArrayParameters, type, name, location, subType, props);
    end
    local newTransition = function(shapeName, transitionType, props, positionArray)
        addToTransitionArray(mainFunc.allLevelSettings.transitionArrayIndex, shapeArrayParameters, shapeName, transitionType, props, positionArray);
    end

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 2, 3}, "up")
    newShape("shape", "bar1_2_1", {2, 1, 4, 3}, "bar", {"horz", 3})
    newTransition("bar1_2_1", "slide", {}, {{2,1,4,1},{2,1,4,3}})
    newShape("shape", "triangle1_2_1", {2, 1, 2, 5}, "triangleBottomRightShape")
    newShape("door", "door1_2_1", {2, 1, 5, 5}, "down")
    newShape("shape", "triangle2_2_1", {2, 1, 7, 5}, "triangleBottomLeftShape")
    newTransition("triangle2_2_1", "switchSlide", {}, {{2,1,5,5},{2,1,7,5}})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 7, 2}, "up")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,6,1},{1,2,7,2}})
    newShape("autoFan", "autoFan2_1_2", {1, 2, 1, 4}, "up")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,1,4},{1,2,3,3},{1,2,5,3}})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door", "door1_1_2", {1, 2, 3, 5}, "down")

    --SCREEN 2-2
    newShape("tunnel", "tunnel1_2_2", {2, 2, 4, 1, 2, 1, 6, 3}, "left")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 7, 1}, "left")
    newTransition("manualFan1_2_2", "slide", {}, {{2,2,7,1},{2,2,7,2}})
    newShape("shape", "bar1_2_2", {2, 2, 2, 2}, "bar", {"vert", 4})
    newShape("shape", "triangle1_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("simple", "simple1_2_2", {2, 2, 5, 2})
    newShape("tunnel", "tunnel2_2_2", {2, 2, 1, 3, 1, 2, 3, 2}, "down")
    newShape("tunnel", "tunnel3_2_2", {2, 2, 7, 3, 3, 2, 6, 5}, "up")
    newShape("shape", "triangle2_2_2", {2, 2, 1, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 5, 4}, "right")
    newShape("shape", "triangle3_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape")
    newShape("tunnel", "tunnel4_2_2", {2, 2, 4, 5, 2, 4, 2, 2}, "right")
    newShape("door", "door1_2_2", {2, 2, 7, 5}, "down")

    --SCREEN 3-2
    newShape("shape", "triangle1_3_2", {3, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle2_3_2", {3, 2, 4, 2}, "triangleBottomLeftShape", {1, 2})
    newTransition("triangle2_3_2", "slide", {}, {{3,2,2,1},{3,2,2,2,"*"},{3,2,4,2},{3,2,5,2}})
    newShape("autoFan", "autoFan1_3_2", {3, 2, 2, 3}, "up")
    newShape("manualFan", "manualFan1_3_2", {3, 2, 4, 3}, "up")
    newShape("shape", "triangle3_3_2", {3, 2, 6, 3}, "triangleBottomLeftShape")
    newShape("shape", "bar1_3_2", {3, 2, 2, 4}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan2_3_2", {3, 2, 2, 4}, "down")
    newShape("door", "door1_3_2", {3, 2, 2, 5}, "down")
    newShape("shape", "bar2_3_2", {3, 2, 4, 5}, "bar", {"vert", 2})

    --SCREEN 1-3
    newShape("manualFan", "manualFan1_1_3", {1, 3, 2, 1}, "right")
    newTransition("manualFan1_1_3", "slide", {}, {{1,3,1,1},{1,3,2,1}})
    newShape("manualFan", "manualFan2_1_3", {1, 3, 3, 1}, "right")
    newShape("manualFan", "manualFan3_1_3", {1, 3, 5, 1}, "down")
    newShape("manualFan", "manualFan4_1_3", {1, 3, 6, 1}, "up")
    newShape("door", "door1_1_3", {1, 3, 7, 1}, "right")
    newShape("item", "map", {1, 3, 1, 2})
    newShape("manualFan", "manualFan5_1_3", {1, 3, 1, 3}, "left")
    newShape("shape", "bar1_1_3", {1, 3, 2, 3}, "bar", {"horz", 3})
    newShape("shape", "triangle1_1_3", {1, 3, 5, 3}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "bar2_1_3", {1, 3, 6, 3}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan6_1_3", {1, 3, 6, 4}, "right")
    newShape("autoFan", "autoFan1_1_3", {1, 3, 1, 5}, "up")
    newTransition("autoFan1_1_3", "slide", {}, {{1,3,1,4},{1,3,1,5}})
    newShape("shape", "triangle2_1_3", {1, 3, 4, 5}, "triangleBottomLeftShape")
    newTransition("triangle2_1_3", "slide", {}, {{1,3,3,4},{1,3,4,5}})

    --SCREEN 2-3
    newShape("autoFan", "autoFan1_2_3", {2, 3, 1, 1}, "down")
    newShape("spitter", "spitter1_2_3", {2, 3, 4, 1}, {"none", "none", "down", "left"})
    newShape("autoFan", "autoFan2_2_3", {2, 3, 7, 1}, "left")
    newShape("spitter", "spitter2_2_3", {2, 3, 1, 3}, {"none", "right", "down", "none"})
    newShape("tunnel", "tunnel1_2_3", {2, 3, 4, 3, 2, 2, 4, 3, "none"})
    newShape("spitter", "spitter3_2_3", {2, 3, 7, 3}, {"none", "none", "down", "left"})
    newShape("autoFan", "autoFan3_2_3", {2, 3, 1, 5}, "right")
    newShape("spitter", "spitter4_2_3", {2, 3, 4, 5, "up", "right", "none", "none"})
    newShape("autoFan", "autoFan4_2_3", {2, 3, 7, 5}, "up")

    --SCREEN 3-3
    newShape("shape", "triangle1_3_3", {3, 3, 7, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_3_3", "switchSlide", {}, {{3,3,7,1},{3,3,7,2}})
    newShape("manualFan", "manualFan1_3_3", {3, 3, 3, 2}, "right")
    newTransition("manualFan1_3_3", "slide", {}, {{3,3,2,2},{3,3,3,2},{3,3,4,2}})
    newShape("door", "door1_3_3", {3, 3, 1, 3}, "left")
    newShape("manualFan", "manualFan2_3_3", {3, 3, 1, 3}, "down")
    newShape("autoFan", "autoFan1_3_3", {3, 3, 2, 3}, "left")
    newShape("backFire", "backFire1_3_3", {3, 3, 2, 5})
    newTransition("backFire1_3_3", "slide", {}, {{3,3,1,5},{3,3,2,5},{3,3,4,5}})
    newShape("shape", "triangle2_3_3", {3, 3, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle2_3_3", "slide", {}, {{3,3,6,5},{3,3,7,3}})

    --SCREEN 2-4
    newShape("shape", "bar1_2_4", {2, 4, 4, 1}, "bar", {"vert", 2})
    newTransition("bar1_2_4", "switchSlide", {}, {{2,4,4,1},{2,4,5,1}})
    newShape("endPoint", "endPoint1_2_4", {2, 4, 4, 1})
    newShape("shape", "bar2_2_4", {2, 4, 4, 2}, "bar", {"vert", 3})
    newTransition("bar2_2_4", "switchSlide", {}, {{2,4,4,2},{2,4,5,2}})
    newShape("shape", "triangle1_2_4", {2, 4, 5, 2}, "triangleTopAndBottomShape", {2})
    newShape("shape", "triangle2_2_4", {2, 4, 7, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle3_2_4", {2, 4, 1, 3}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape", "triangle4_2_4", {2, 4, 4, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle5_2_4", {2, 4, 5, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_4", {2, 4, 2, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_4", {2, 4, 7, 1}, "up")
    newShape("autoFan", "autoFan1_2_4", {2, 4, 1, 2}, "right")
    newShape("autoFan", "autoFan2_2_4", {2, 4, 5, 4}, "right")
    newShape("manualFan", "manualFan1_2_4", {2, 4, 6, 4}, "up")
    newShape("shape", "bar3_2_4", {2, 4, 8, 4}, "bar", {"horz", 4})
    newTransition("bar3_2_4", "switchSlide", {}, {{2,4,8,2},{2,4,8,4}})
    newShape("autoFan", "autoFan3_2_4", {2, 4, 2, 5}, "down")
    newTransition("autoFan3_2_4", "slide", {}, {{2,4,2,5},{2,4,4,4}})
    newShape("shape", "bar4_2_4", {2, 4, 4, 6}, "bar", {"vert", 2})
    newTransition("bar4_2_4", "switchSlide", {}, {{2,4,4,6},{2,4,5,6}})

    --SWITCHES
    newShape("switch", "switch1_3_3", {3, 3, 6, 2}, { {"slide", "triangle2_2_1"},{"slide", "bar1_2_4"},{"slide", "bar2_2_4"},{"slide", "bar3_2_4"},{"slide", "bar4_2_4"} })
    newShape("switch", "switch2_3_3", {3, 3, 4, 4}, { {"slide", "triangle1_3_3"} })

    --GEMS
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 3, 3, 2}, "purple")
    newShape("gem", "purple", {1, 3, 3, 5}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 3, 7, 1}, "purple")
    newShape("gem", "purple", {1, 3, 6, 5}, "purple")
    newShape("gem", "purple", {1, 3, 2, 4}, "purple")
    newShape("gem", "purple", {1, 3, 5, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 2}, "purple")
    newShape("gem", "purple", {2, 2, 4, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 3}, "purple")
    newShape("gem", "purple", {2, 2, 5, 3}, "purple")
    newShape("gem", "purple", {2, 2, 3, 2}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 3, 4, 2}, "purple")
    newShape("gem", "purple", {2, 3, 4, 4}, "purple")
    newShape("gem", "purple", {2, 3, 3, 3}, "purple")
    newShape("gem", "purple", {2, 3, 5, 3}, "purple")
    newShape("gem", "purple", {2, 3, 1, 2}, "purple")
    newShape("gem", "purple", {2, 3, 1, 4}, "purple")
    newShape("gem", "purple", {2, 3, 7, 2}, "purple")
    newShape("gem", "purple", {2, 3, 7, 4}, "purple")
    newShape("gem", "purple", {2, 3, 2, 1}, "purple")
    newShape("gem", "purple", {2, 3, 5, 1}, "purple")
    newShape("gem", "purple", {2, 3, 3, 5}, "purple")
    newShape("gem", "purple", {2, 3, 6, 5}, "purple")
    newShape("gem", "purple", {2, 3, 6, 1}, "purple")
    newShape("gem", "purple", {3, 2, 6, 4}, "purple")
    newShape("gem", "purple", {3, 2, 5, 3}, "purple")
    newShape("gem", "purple", {3, 2, 3, 3}, "purple")
    newShape("gem", "purple", {3, 2, 2, 5}, "purple")
    newShape("gem", "purple", {3, 2, 7, 2}, "purple")
    newShape("gem", "purple", {3, 2, 3, 1}, "purple")
    newShape("gem", "purple", {3, 2, 1, 1}, "purple")
    newShape("gem", "purple", {3, 2, 1, 2}, "purple")
    newShape("gem", "purple", {3, 2, 5, 1}, "purple")
    newShape("gem", "purple", {3, 2, 7, 1}, "purple")
    newShape("gem", "purple", {3, 3, 2, 1}, "purple")
    newShape("gem", "purple", {3, 3, 5, 2}, "purple")
    newShape("gem", "purple", {3, 3, 6, 3}, "purple")
    newShape("gem", "purple", {3, 3, 4, 3}, "purple")
    newShape("gem", "purple", {3, 3, 3, 3}, "purple")
    newShape("gem", "purple", {3, 3, 1, 2}, "purple")
    newShape("gem", "purple", {3, 3, 1, 4}, "purple")
    newShape("gem", "purple", {3, 3, 2, 1}, "purple")
    newShape("gem", "purple", {3, 3, 4, 1}, "purple")
    newShape("gem", "purple", {2, 4, 6, 5}, "purple")
    newShape("gem", "purple", {2, 4, 1, 5}, "purple")
    newShape("gem", "purple", {2, 4, 2, 1}, "purple")
    newShape("gem", "purple", {2, 4, 2, 3}, "purple")
    newShape("gem", "purple", {2, 4, 3, 4}, "purple")
    newShape("gem", "purple", {2, 4, 7, 4}, "purple")
    newShape("gem", "purple", {2, 4, 6, 3}, "purple")
    newShape("gem", "purple", {2, 4, 7, 1}, "purple")
    newShape("gem", "purple", {2, 4, 3, 2}, "purple")
    newShape("gem", "redCoin", {3, 2, 6, 2}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 6, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 1, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 3, 3, 3}, 140)
    newShape("item", "coins", {2, 1, 4, 3}, 14)
    newShape("item", "coins", {1, 2, 7, 4}, 135)
    newShape("item", "coins", {2, 2, 2, 3}, 75)
    newShape("item", "coins", {2, 3, 2, 3}, 110)
    newShape("item", "coins", {2, 3, 6, 3}, 110)
    newShape("item", "coins", {3, 2, 6, 1}, 150)
    newShape("item", "coins", {3, 2, 4, 3}, 50)
    newShape("item", "coins", {3, 3, 5, 3}, 250)
    newShape("item", "coins", {3, 3, 1, 1}, 145)
    newShape("item", "coins", {3, 3, 1, 1}, 145)
    newShape("item", "coins", {2, 4, 4, 2}, 35)
    newShape("item", "coins", {2, 4, 3, 3}, 135)
    newShape("item", "small-present", {1, 2, 1, 1}, {})

    newShape("item", "small-present", {2, 2, 6, 1}, {})

    newShape("item", "small-present", {2, 3, 5, 5}, {})

    newShape("item", "small-present", {3, 3, 2, 4}, {})

    newShape("item", "small-present", {2, 4, 7, 3}, {})

    newShape("item", "big-present", {2, 3, 3, 1}, {})

    newShape("item", "big-present", {2, 4, 1, 4}, {})


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
