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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 1}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, 2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 1}, "left")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,6,1},{1,1,7,1}})
    newShape("simple", "simple1_1_1", {1, 1, 2, 2})
    newShape("shape", "bar1_1_1", {1, 1, 3, 2}, "bar", {"horz", 3})
    newTransition("bar1_1_1", "autoSlide", {labelled = false}, {{1,1,3,1},{1,1,3,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    newShape("simple", "simple2_1_1", {1, 1, 5, 2})
    newTransition("simple2_1_1", "slide", {}, {{1,1,5,1},{1,1,5,2}})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 1, 3}, "up")
    newShape("autoFan", "autoFan4_1_1", {1, 1, 2, 3}, "left")
    newShape("shape", "triangle3_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle4_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "icy"})
    newTransition("triangle4_1_1", "switchSlide", {labelled = false}, {{1,1,7,2},{1,1,7,3}})
    newShape("shape", "bar2_1_1", {1, 1, 1, 5}, "bar", {"vert", 2})
    newTransition("bar2_1_1", "autoSlide", {labelled = false}, {{1,1,1,5},{1,1,2,5}})
    newShape("door", "door1_1_1", {1, 1, 1, 5}, "down"))    newShape("shape", "triangle5_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, _, "icy"})
    newTransition("triangle6_1_1", "switchSlide", {labelled = false}, {{1,1,7,4},{1,1,7,5}})
    newShape("door", "door2_1_1", {1, 1, 7, 5}, "down")
    --SCREEN 2-1
    newShape("shape", "bar1_2_1", {2, 1, 2, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 1}, "left")
    newTransition("manualFan1_2_1", "slide", {}, {{2,1,2,1},{2,1,2,2}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "down")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 5, 2}, "right")
    newShape("shape", "bar2_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 2}, "triangleBottomRightShape")
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left", {"disabled"})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 3, 3}, "right")
    newTransition("manualFan2_2_1", "slide", {}, {{2,1,3,3},{2,1,3,4}})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 7, 3}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    newShape("endPoint", "endPoint1_2_1", {2, 1, 1, 5})
    newShape("simple", "simple1_2_1", {2, 1, 2, 5})
    newTransition("simple1_2_1", "slide", {}, {{2,1,2,5},{2,1,3,5}})
    newShape("shape", "triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    newShape("shape", "bar3_2_1", {2, 1, 7, 5}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape", "triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("door", "door1_1_2", {1, 2, 7, 1}, "up")
    newShape("shape", "triangle3_1_2", {1, 2, 4, 2}, "triangleBottomRightShape", {1, 9, "breakable"})
    newTransition("triangle3_1_2", "switchSlide", {}, {{1,2,1,2},{1,2,4,2}})
    newShape("item", "map", {1, 2, 6, 2})
    newShape("shape", "triangle4_1_2", {1, 2, 5, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle5_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_1_2", {1, 2, 7, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle7_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    newShape("door", "door2_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 2, 1}, "up")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 3, 1}, "right")
    newShape("shape", "bar1_2_2", {2, 2, 5, 1}, "bar", {"vert"})
    newShape("manualFan", "manualFan2_2_2", {2, 2, 5, 1}, "right")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 1}, "down")
    newShape("shape", "bar2_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan3_2_2", {2, 2, 1, 2}, "down")
    newShape("manualFan", "manualFan4_2_2", {2, 2, 4, 2}, "down")
    newShape("manualFan", "manualFan5_2_2", {2, 2, 7, 2}, "left")
    newShape("manualFan", "manualFan6_2_2", {2, 2, 3, 3}, "right")
    newShape("shape", "bar3_2_2", {2, 2, 5, 3}, "bar", {"horz", 2})
    newShape("manualFan", "manualFan7_2_2", {2, 2, 5, 3}, "up")
    newShape("manualFan", "manualFan8_2_2", {2, 2, 2, 4}, "up")
    newShape("manualFan", "manualFan9_2_2", {2, 2, 4, 4}, "left")
    newShape("shape", "bar4_2_2", {2, 2, 7, 4}, "bar", {"vert", 2})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 1, 5}, "right")
    newShape("manualFan", "manualFan10_2_2", {2, 2, 3, 5}, "up")
    newShape("shape", "bar5_2_2", {2, 2, 4, 5}, "bar", {"horz", 2})
    newShape("shape", "triangle1_2_2", {2, 2, 5, 5}, "triangleTopRightShape")
    newShape("shape", "bar6_2_2", {2, 2, 3, 6}, "bar", {"vert", 2})
    newShape("shape", "bar7_2_2", {2, 2, 4, 6}, "bar", {"vert", 4})

    --ALL SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 4, 4}, { {"slide", "triangle3_1_2"} }, {"one-way"})
    newShape("switch", "switch2_1_1", {1, 1, 1, 5}, { {"slide", "triangle4_1_1"},{"slide", "triangle6_1_1"},{"door-open", "door1_2_1"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem", "purple", {1, 1, 3, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 7, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 6, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {2, 2, 3, 2}, "purple")
    newShape("gem", "purple", {2, 2, 1, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 5}, "purple")
    newShape("gem", "purple", {2, 2, 3, 2}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 4}, "purple")
    newShape("gem", "redCoin", {2, 1, 4, 3}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 2, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 3}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 5, 3}, 180)
    newShape("item", "coins", {2, 1, 4, 5, 125})
    newShape("item", "coins", {1, 2, 5, 5}, 50)
    newShape("item", "coins", {1, 2, 7, 5}, 50)
    newShape("item", "coins", {2, 2, 1, 4}, 165)
    newShape("item", "coins", {2, 2, 4, 5}, 65)
    newShape("item", "small-present", {1, 2, 1, 4}, {})

    newShape("item", "small-present", {2, 1, 2, 4}, {})

    newShape("item", "big-present", {1, 1, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
