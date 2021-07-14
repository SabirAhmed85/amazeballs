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

    --SCREEN 1-1
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 1}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 5, 1}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 5, 2}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 2}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 3, 3}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,2},{1,1,3,3}})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle4_1_1", {1, 1, 2, 5}, "triangleBottomRightShape")
    newShape("door", "door2_1_1", {1, 1, 2, 5}, "down")
    newShape("shape", "bar2_1_1", {1, 1, 5, 5}, "bar", {"vert"})
    newShape("door", "door3_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("shape", "bar1_2_1", {2, 1, 1, 1}, "bar", {"vert", 2})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 1}, "right")
    newShape("shape", "bar2_2_1", {2, 1, 4, 1}, "bar", {"horz", 4})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 3, 1}, "down")
    newShape("manualFan", "manualFan3_2_1", {2, 1, 2, 2}, "down")
    newTransition("manualFan3_2_1", "switchSlide", {}, {{2,1,2,1},{2,1,2,2}})
    newShape("shape", "triangle1_2_1", {2, 1, 4, 2}, "triangleBottomRightShape", {1, 3})
    newShape("shape", "bar3_2_1", {2, 1, 6, 2}, "bar", {"horz", 4})
    newTransition("bar3_2_1", "switchSlide", {}, {{2,1,6,2},{2,1,6,3}})
    newShape("shape", "triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("backFire", "backFire1_2_1", {2, 1, 2, 3})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,1,3},{2,1,2,3},{2,1,4,3}})
    newShape("manualFan", "manualFan4_2_1", {2, 1, 6, 3}, "down")
    newTransition("manualFan4_2_1", "switchSlide", {}, {{2,1,6,2},{2,1,6,3}})
    newShape("backFire", "backFire2_2_1", {2, 1, 5, 4})
    newTransition("backFire2_2_1", "slide", {}, {{2,1,3,4},{2,1,5,4}})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "left")
    newShape("shape", "triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 5})
    newShape("shape", "bar2_2_1", {2, 1, 3, 5}, "bar", {"vert", 4})
    newShape("shape", "triangle4_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, 27, "breakable"})
    newShape("door", "door2_2_1", {2, 1, 6, 5}, "down")
    newShape("shape", "bar5_2_1", {2, 1, 7, 5, "bar"})
    newTransition("bar5_2_1", "switchSlide", {}, {{2,1,4,5},{2,1,7,5}})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("spitter", "spitter1_1_2", {1, 2, 2, 1}, {"none", "none", "none", "left"})
    newShape("shape", "bar1_1_2", {1, 2, 5, 1}, "bar", {"horz", 4})
    newShape("door", "door1_1_2", {1, 2, 6, 1, "up", "disabled"})
    newShape("shape", "triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "bar2_1_2", {1, 2, 1, 2}, "bar", {"horz", 4})
    newShape("shape", "bar3_1_2", {1, 2, 3, 2}, "bar", {"horz", 3})
    newTransition("bar3_1_2", "switchSlide", {}, {{1,2,3,1},{1,2,3,2}})
    newShape("shape", "triangle3_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar4_1_2", {1, 2, 5, 2}, "bar", {"horz", 4})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 7, 2}, "up")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,6,3},{1,2,6,2,"*"},{1,2,7,2}})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 2, 3})
    newShape("shape", "bar5_1_2", {1, 2, 3, 3}, "bar", {"horz", 4})
    newTransition("bar5_1_2", "switchSlide", {}, {{1,2,3,3},{1,2,3,5}})
    newShape("shape", "triangle4_1_2", {1, 2, 3, 3}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle4_1_2", "flip-horizontal")
    newShape("shape", "bar6_1_2", {1, 2, 5, 3}, "bar", {"horz", 4})
    newShape("shape", "triangle5_1_2", {1, 2, 5, 3}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape", "triangle6_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape", "triangle7_1_2", {1, 2, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle8_1_2", {1, 2, 4, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "bar7_1_2", {1, 2, 5, 4}, "bar", {"horz", 4})
    newShape("shape", "triangle9_1_2", {1, 2, 6, 4}, "triangleBottomLeftShape", {1, 25, "breakable"})
    newShape("shape", "triangle10_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "bar8_1_2", {1, 2, 5, 5}, "bar", {"horz", 4})
    newShape("shape", "triangle11_1_2", {1, 2, 5, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("spitter", "spitter1_1_2", {1, 2, 7, 5}, {"none", "none", "none", "left"})

    --SCREEN 2-2
    newShape("shape", "bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle1_2_2", {2, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_2", {2, 2, 3, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door", "door1_2_2", {2, 2, 6, 1}, "up")
    newShape("shape", "triangle4_2_2", {2, 2, 6, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 1}, "right")
    newShape("shape", "triangle5_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_2", {2, 2, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle7_2_2", {2, 2, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle8_2_2", {2, 2, 4, 3}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("item", "map", {2, 2, 7, 3})
    newShape("shape", "triangle9_2_2", {2, 2, 3, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar2_2_2", {2, 2, 5, 4}, "bar", {"horz", 3})
    newShape("shape", "bar3_2_2", {2, 2, 7, 4}, "bar", {"horz"})
    newTransition("bar3_2_2", "slide", {}, {{2,2,7,3},{2,2,7,4}})
    newShape("door", "door2_2_2", {2, 2, 1, 5}, "left")
    newShape("door", "door3_2_2", {2, 2, 2, 5, "down", "disabled"})
    newShape("shape", "triangle10_2_2", {2, 2, 3, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle11_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "bar4_2_2", {2, 2, 5, 5}, "bar", {"vert", 3})
    newShape("shape", "triangle12_2_2", {2, 2, 7, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SCREEN 1-3
    newShape("shape", "triangle1_1_3", {1, 3, 2, 1}, "triangleTopLeftShape")
    newShape("gun", "gun1_1_3", {1, 3, 4, 1}, "down")
    newShape("door", "door1_1_3", {1, 3, 7, 1}, "up")
    newShape("shape", "triangle2_1_3", {1, 3, 7, 1}, "triangleTopRightShape")
    newShape("gun", "gun2_1_3", {1, 3, 6, 2}, "down")
    newShape("spitter", "spitter1_1_3", {1, 3, 3, 3, "up", "none", "down", "none"})
    newTransition("spitter1_1_3", "switchSlide", {}, {{1,3,2,3},{1,3,3,3}})
    newShape("shape", "triangle3_1_3", {1, 3, 5, 3}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_3", {1, 3, 1, 5}, "bar", {"horz", 3})
    newShape("shape", "triangle4_1_3", {1, 3, 3, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle5_1_3", {1, 3, 5, 5}, "triangleTopRightShape")
    --newShape("timeOut", "timeOut1_1_3", {1, 3, 7, 5, 2})

    --SCREEN 2-3
    newShape("shape", "triangle1_2_3", {2, 3, 7, 1}, "triangleTopLeftShape", {1, 11})
    newShape("shape", "triangle2_2_3", {2, 3, 1, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan", "autoFan1_2_3", {2, 3, 2, 2}, "right")
    newShape("simple", "simple1_2_3", {2, 3, 4, 2})
    newShape("shape", "triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple2_2_3", {2, 3, 4, 4})
    newShape("door", "door1_2_3", {2, 3, 1, 5}, "left")
    newShape("shape", "triangle4_2_3", {2, 3, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 5, 2}, { {"slide", "manualFan3_2_1"} })
    newShape("switch", "switch2_1_1", {1, 1, 6, 5}, { {"flip-vertical", "triangle3_1_1"} })

    newShape("switch", "switch1_2_1", {2, 1, 3, 2}, { {"slide", "manualFan4_2_1"} })
    newShape("switch", "switch2_2_1", {2, 1, 1, 5}, { {"slide", "bar3_2_1"} }, {"one-way"})

    newShape("switch", "switch1_1_2", {1, 2, 1, 5}, { {"slide", "bar3_1_2"},{"slide", "bar5_1_2"} })

    newShape("switch", "switch1_2_2", {2, 2, 6, 2}, { {"door-open", "door3_2_2"},{"door-open", "door1_1_2"} })

    newShape("switch", "switch1_1_3", {1, 3, 2, 5}, { {"slide", "spitter1_1_3"} })

    newShape("switch", "switch1_2_3", {2, 3, 6, 2}, { {"flip-vertical", "triangle1_2_3"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 3, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 2, 2}, "purple")
    newShape("gem", "purple", {2, 2, 3, 3}, "purple")
    newShape("gem", "purple", {2, 2, 4, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 3, 2, 4}, "purple")
    newShape("gem", "purple", {1, 3, 7, 5}, "purple")
    newShape("gem", "purple", {1, 3, 3, 4}, "purple")
    newShape("gem", "purple", {1, 3, 3, 1}, "purple")
    newShape("gem", "purple", {1, 3, 3, 2}, "purple")
    newShape("gem", "purple", {1, 3, 2, 2}, "purple")
    newShape("gem", "purple", {1, 3, 1, 1}, "purple")
    newShape("gem", "purple", {1, 3, 1, 1}, "purple")
    newShape("gem", "purple", {2, 3, 7, 5}, "purple")
    newShape("gem", "purple", {2, 3, 2, 1}, "purple")
    newShape("gem", "purple", {2, 3, 3, 2}, "purple")
    newShape("gem", "purple", {2, 3, 5, 2}, "purple")
    newShape("gem", "purple", {2, 3, 7, 4}, "purple")
    newShape("gem", "purple", {2, 3, 2, 4}, "purple")
    newShape("gem", "purple", {2, 3, 4, 5}, "purple")
    newShape("gem", "purple", {2, 3, 1, 3}, "purple")
    newShape("gem", "redCoin", {2, 3, 2, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 7, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 3, 5, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 5, 1}, 85)
    newShape("item", "coins", {1, 2, 3, 5}, 130)
    newShape("item", "coins", {2, 2, 1, 4}, 28)
    newShape("item", "coins", {2, 2, 6, 3}, 14)
    newShape("item", "coins", {2, 3, 2, 5}, 90)
    newShape("item", "coins", {2, 3, 5, 4}, 90)
    newShape("item", "small-present", {2, 2, 4, 1}, {})

    newShape("item", "big-present", {1, 3, 1, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
