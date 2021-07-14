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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleTopAndBottomShape", {2})
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "triangle3_1_1", {1, 1, 2, 2}, "triangleBottomRightShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 4, 2}, "right")
    newShape("shape", "triangle4_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 1, 3}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 1, 3}, "up")
    newShape("shape", "triangle5_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newShape("manualFan", "manualFan3_1_1", {1, 1, 4, 4}, "right")
    newShape("shape", "triangle6_1_1", {1, 1, 7, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle7_1_1", {1, 1, 1, 5}, "triangleTopRightShape")
    newShape("shape", "triangle8_1_1", {1, 1, 4, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle9_1_1", {1, 1, 6, 5}, "triangleTopAndBottomShape", {1})
    newTransition("triangle9_1_1", "slide", {}, {{1,1,5,4},{1,1,5,5},{1,1,6,5}})

    --SCREEN 2-1
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 1}, "right")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_2_1", {2, 1, 1, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle3_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle4_2_1", {2, 1, 4, 3}, "triangleTopRightShape")
    newShape("shape", "triangle5_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape")
    newShape("shape", "triangle6_2_1", {2, 1, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle7_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "bar1_2_1", {2, 1, 2, 5}, "bar", {"horz", 3})
    newShape("shape", "bar2_2_1", {2, 1, 3, 5}, "bar", {"horz", 3})
    newTransition("bar2_2_1", "slide", {}, {{2,1,3,4},{2,1,3,5}})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 4, 5}, "down")
    newShape("door", "door1_2_1", {2, 1, 4, 5}, "down")
    newShape("shape", "triangle8_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")
    newShape("shape", "bar3_2_1", {2, 1, 2, 6}, "bar", {"vert", 4})

    --SCREEN 2-2
    newShape("shape", "bar1_2_2", {2, 2, 3, 1}, "bar", {"vert"})
    newTransition("bar1_2_2", "switchSlide", {}, {{2,2,3,1},{2,2,4,1}})
    newShape("shape", "bar2_2_2", {2, 2, 7, 1}, "bar", {"vert", 3})
    newShape("door", "door1_2_2", {2, 2, 7, 1}, "right")
    newShape("shape", "bar3_2_2", {2, 2, 3, 2}, "bar", {"vert", 3})
    newTransition("bar3_2_2", "switchSlide", {}, {{2,2,3,2},{2,2,4,2}})
    newShape("shape", "triangle1_2_2", {2, 2, 3, 2}, "triangleTopLeftShape", {1, 5, "breakable"})
    newTransition("triangle1_2_2", "switchSlide", {}, {{2,2,3,1},{2,2,3,2}})
    newShape("shape", "bar4_2_2", {2, 2, 6, 2}, "bar", {"horz", 2})
    newShape("shape", "bar5_2_2", {2, 2, 7, 2}, "bar", {"vert"})
    newTransition("bar5_2_2", "switchSlide", {}, {{2,2,5,2},{2,2,7,2}})
    newShape("shape", "triangle2_2_2", {2, 2, 6, 2}, "triangleBottomLeftShape", {1, 2})
    newShape("backFire", "backFire1_2_2", {2, 2, 4, 3})
    newTransition("backFire1_1_1", "slide", {}, {{2,2,4,3},{2,2,5,3}})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 2, 4}, "right")
    newTransition("manualFan1_2_2", "slide", {}, {{2,2,1,2},{2,2,1,4},{2,2,2,4}})
    newShape("shape", "triangle3_2_2", {2, 2, 5, 4}, "triangleTopLeftShape")
    newShape("shape", "bar6_2_2", {2, 2, 7, 4}, "bar", {"horz", 3})
    newTransition("bar6_2_2", "slide", {}, {{2,2,7,4},{2,2,7,5}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 7, 4}, "up")
    newShape("shape", "triangle4_2_2", {2, 2, 2, 5}, "triangleTopRightShape")
    newTransition("triangle4_2_2", "slide", {}, {{2,2,2,5},{2,2,3,5},{2,2,4,5}})
    newShape("door", "door2_2_2", {2, 2, 7, 5}, "right")

    --SCREEN 3-2
    newShape("shape", "triangle1_3_2", {3, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle2_3_2", {3, 2, 7, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle3_3_2", {3, 2, 7, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_3_2", {3, 2, 2, 3}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape", "triangle5_3_2", {3, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle6_3_2", {3, 2, 4, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan", "autoFan1_3_2", {3, 2, 7, 4}, "down")
    newShape("simple", "simple1_3_2", {3, 2, 1, 5})
    newShape("shape", "triangle7_3_2", {3, 2, 2, 5}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("endPoint", "endPoint1_3_2", {3, 2, 5, 5})
    newShape("autoFan", "autoFan2_3_2", {3, 2, 7, 5}, "left")

    --SWITCHES
    newShape("switch", "switch1_2_2", {2, 2, 7, 1}, { {"slide", "triangle1_2_2"} }, {"one-way"})
    newShape("switch", "switch2_2_2", {2, 2, 4, 2}, { {"slide", "bar1_2_2"},{"slide", "bar2_2_2"},{"slide", "bar3_2_2"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 3}, "purple")
    newShape("gem", "purple", {2, 2, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 7, 3}, "purple")
    newShape("gem", "purple", {2, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {3, 2, 1, 1}, "purple")
    newShape("gem", "purple", {3, 2, 3, 1}, "purple")
    newShape("gem", "purple", {3, 2, 4, 2}, "purple")
    newShape("gem", "purple", {3, 2, 6, 5}, "purple")
    newShape("gem", "purple", {3, 2, 5, 2}, "purple")
    newShape("gem", "purple", {3, 2, 2, 4}, "purple")
    newShape("gem", "purple", {3, 2, 3, 3}, "purple")
    newShape("gem", "purple", {3, 2, 5, 4}, "purple")
    newShape("gem", "purple", {3, 2, 3, 5}, "purple")
    newShape("gem", "redCoin", {2, 1, 2, 4}, "redCoin")
    newShape("gem", "blueCoin", {3, 2, 2, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 2, 4, 1}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 3, 5}, 60)
    newShape("item", "coins", {1, 1, 7, 1}, 75)
    newShape("item", "coins", {2, 1, 5, 3}, 90)
    newShape("item", "coins", {2, 1, 3, 4}, 51)
    newShape("item", "coins", {2, 2, 2, 2}, 165)
    newShape("item", "coins", {2, 2, 1, 5}, 145)
    newShape("item", "coins", {3, 2, 1, 4}, 285)
    newShape("item", "big-present", {2, 2, 7, 2}, {})
    newShape("item", "big-present", {3, 2, 5, 1}, {})
    newShape("item", "small-present", {2, 2, 6, 1}, {})
    newShape("item", "small-present", {3, 2, 6, 2}, {})
    newShape("item", "clock", {1, 1, 3, 3}, {})
    newShape("item", "hook", {3, 2, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
