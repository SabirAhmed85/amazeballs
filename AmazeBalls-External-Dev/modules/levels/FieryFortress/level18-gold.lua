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

    -- 1-1
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"vert"})
    newShape("shape", "bar2_1_1", {1, 1, 6, 1}, "bar", {"horz", 4})
    newTransition("bar2_1_1", "slide", {}, {{1,1,6,1,},{1,1,6,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 1}, "down")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 2}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar3_1_1", {1, 1, 7, 2}, "bar", {"horz", 2})
    newTransition("bar3_1_1", "switchSlide", {timePerSquare = 100}, {{1,1,7,2},{1,1,7,3}})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 7, 3}, "left")
    newShape("shape", "triangle4_1_1", {1, 1, 2, 4}, "triangleTopRightShape", {1, _, "fire"})
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right", {"disabled"})
    newShape("door", "door2_1_1", {1, 1, 1, 5}, "down", {"disabled"})
    newShape("shape", "triangle5_1_1", {1, 1, 2, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door", "door3_1_1", {1, 1, 5, 5}, "down")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 6, 5}, "up")
    newTransition("autoFan4_1_1", "switchSlide", {timePerSquare = 100}, {{1,1,5,5},{1,1,6,5}})

    -- 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle2_2_1", {2, 1, 3, 1}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape", "triangle3_2_1", {2, 1, 4, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "left")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,6,1},{2,1,7,1}})
    newShape("shape", "bar1_2_1", {2, 1, 1, 3}, "bar", {"vert"})
    newShape("shape", "triangle4_2_1", {2, 1, 2, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 3, 2})
    newShape("shape", "triangle5_2_1", {2, 1, 4, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle6_2_1", {2, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 3}, "left")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,6,3},{2,1,7,3}})
    newShape("shape", "triangle7_2_1", {2, 1, 1, 4}, "triangleTopRightShape", {1, 13})
    newTransition("triangle7_2_1", "switchSlide", {timePerSquare = 100}, {{2,1,1,4},{2,1,1,5}})
    newShape("shape", "triangle8_2_1", {2, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle9_2_1", {2, 1, 4, 4}, "triangleTopRightShape")
    newShape("shape", "triangle10_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan4_2_1", {2, 1, 6, 4}, "left")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,6,4},{2,1,7,4}})
    newShape("shape", "triangle11_2_1", {2, 1, 2, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle12_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")
    newTransition("triangle12_2_1", "switchSlide", {timePerSquare = 100}, {{2,1,3,5},{2,1,4,5}})
    newShape("shape", "triangle13_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple1_2_1", {2, 1, 6, 5})
    newShape("item", "map", {2, 1, 7, 5})

    -- 1-2
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 1}, "down")
    newShape("door", "door1_1_2", {1, 2, 2, 1}, "up")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 5, 1}, "left")
    newShape("door", "door2_1_2", {1, 2, 7, 1}, "right")
    newShape("shape", "triangle1_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, 6})
    newShape("autoFan", "autoFan3_1_2", {1, 2, 4, 2}, "up")
    newShape("shape", "triangle2_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape")
    newShape("shape", "triangle3_1_2", {1, 2, 7, 2}, "triangleBottomRightShape")
    newShape("door", "door3_1_2", {1, 2, 7, 3}, "right")
    newShape("shape", "triangle4_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newTransition("triangle4_1_2", "switchSlide", {timePerSquare = 100, labelled = false}, {{1,2,1,3},{1,2,1,4}})
    newShape("autoFan", "autoFan4_1_2", {1, 2, 3, 4}, "down")
    newTransition("autoFan4_1_2", "switchSlide", {timePerSquare = 100, labelled = false}, {{1,2,3,4},{1,2,3,5}})
    newShape("shape", "triangle5_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newTransition("triangle5_1_2", "switchSlide", {timePerSquare = 100, labelled = false}, {{1,2,5,4},{1,2,5,5}})
    newShape("autoFan", "autoFan5_1_2", {1, 2, 7, 4}, "left")
    newTransition("autoFan5_1_2", "switchSlide", {timePerSquare = 100, labelled = false}, {{1,2,7,3},{1,2,7,4}})
    newShape("shape", "bar1_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    newShape("shape", "triangle6_1_2", {1, 2, 2, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle7_1_2", {1, 2, 4, 5}, "triangleBottomRightShape")
    newShape("shape", "bar2_1_2", {1, 2, 7, 5}, "bar", {"horz", 2})
    newTransition("bar2_1_2", "slide", {"brown"}, {{1,2,7,1},{1,2,7,3},{1,2,7,5}})
    newShape("door", "door4_1_2", {1, 2, 7, 5}, "right")

    -- 2-2
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 1}, "right")
    newTransition("autoFan1_2_2", "switchSlide", {timePerSquare = 100}, {{2,2,2,1},{2,2,2,2}})
    newShape("shape", "triangle1_2_2", {2, 2, 4, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_2_2", {2, 2, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("door", "door1_2_2", {2, 2, 7, 1}, "up")
    newShape("autoFan", "autoFan2_2_2", {2, 2, 7, 1}, "up")
    newShape("shape", "bar1_2_2", {2, 2, 8, 1}, "bar", {"horz", 4})
    newShape("shape", "triangle3_2_2", {2, 2, 1, 1}, "triangleBottomLeftShape", {1})
    newTransition("triangle3_2_2", "slide", {}, {{2,2,1,1},{2,2,1,2}})
    newShape("shape", "bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    newTransition("bar2_2_2", "slide", {"brown"}, {{2,2,6,2},{2,2,6,4}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 7, 2}, "up")
    newShape("shape", "bar3_2_2", {2, 2, 2, 3}, "bar", {"vert", 4})
    newTransition("bar3_2_2", "slide", {"brown"}, {{2,2,2,3},{2,2,4,3}})
    newShape("shape", "triangle4_2_2", {2, 2, 4, 3}, "triangleTopLeftShape", {1})
    newShape("shape", "triangle5_2_2", {2, 2, 5, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    --newShape("timeOut", "timeOut1_2_2", {2, 2, 7, 3, 4})
    newShape("shape", "bar4_2_2", {2, 2, 8, 3}, "bar", {"horz", 4})
    newTransition("bar4_2_2", "slide", {"brown"}, {{2,2,8,2},{2,2,8,3}})
    newShape("autoFan", "autoFan4_2_2", {2, 2, 1, 4}, "up")
    newShape("autoFan", "autoFan5_2_2", {2, 2, 5, 4}, "right")
    --newShape("timeOut", "timeOut2_2_2", {2, 2, 1, 5, 2})
    newShape("shape", "triangle6_2_2", {2, 2, 2, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle7_2_2", {2, 2, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle8_2_2", {2, 2, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "bar5_2_2", {2, 2, 7, 5}, "bar", {"horz", 4})
    newTransition("bar5_2_2", "switchSlide", {timePerSquare = 100}, {{2,2,7,2},{2,2,7,5}})


    -- ALL SWITCHES

    newShape("switch", "switch1_1_1", {1, 1, 4, 2}, { {"slide", "triangle4_1_2"},{"slide", "autoFan4_1_2"},{"slide", "triangle5_1_2"},{"slide", "autoFan5_1_2"} }, {"one-way", "not-labelled"})
    newShape("switch", "switch2_1_1", {1, 1, 6, 4}, { {"slide", "triangle7_2_1"},{"slide", "triangle12_2_1"} })

    newShape("switch", "switch1_2_1", {2, 1, 2, 1}, { {"door-open", "door1_2_1"}, {"door-open", "door1_1_1"} })

    newShape("switch", "switch1_1_2", {1, 2, 4, 1}, { {"slide", "autoFan4_1_1"}, {"door-open", "door3_1_1"}, {"slide", "bar3_1_1"} }, {"one-way", "not-labelled"})
    newShape("switch", "switch2_1_2", {1, 2, 4, 3}, { {"flip-vertical", "triangle1_1_2"}, {"slide", "autoFan1_2_2"}, {"slide", "bar5_2_2"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 4, 5}, "purple")
    newShape("gem", "purple", {2, 2, 3, 2}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "redCoin", {2, 2, 1, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    --ITEMS
    --newShape("item", "coins", {1, 2, 5, 3}, 250)
    --newShape("item", "coins", {2, 1, 2, 3, 40)
    newShape("item", "small-present", {1, 1, 4, 1}, {})

    newShape("item", "big-present", {1, 1, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
