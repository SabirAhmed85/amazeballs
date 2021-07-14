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
    newShape("backFire", "backFire1_1_1", {1, 1, 3, 1})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,3,1},{1,1,4,1}})
    newShape("gun", "gun1_1_1", {1, 1, 5, 1}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 3, 2}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,3,2},{1,1,4,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 5, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 1, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("spitter", "spitter1_1_1", {1, 1, 3, 4, "up", "right", "none", "none"})
    newShape("shape", "triangle5_1_1", {1, 1, 6, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("door", "door1_1_1", {1, 1, 1, 5, "down", "disabled"})
    newShape("door", "door2_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 2-1
    newShape("endPoint", "endPoint1_2_1", {2, 1, 1, 1})
    newShape("shape", "bar1_2_1", {2, 1, 2, 1}, "bar", {"horz", 3})
    newShape("shape", "triangle1_2_1", {2, 1, 6, 1}, "triangleTopLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,6,1},{2,1,7,1}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 2}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,1},{2,1,3,2}})
    newShape("shape", "triangle2_2_1", {2, 1, 7, 2}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "switchSlide", {}, {{2,1,7,2},{2,1,7,4}})
    newShape("shape", "triangle3_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 4}, "up")
    newTransition("manualFan1_2_1", "switchSlide", {}, {{2,1,1,3},{2,1,1,4}})
    newShape("shape", "triangle4_2_1", {2, 1, 3, 4}, "triangleTopRightShape")
    newTransition("triangle4_2_1", "switchSlide", {}, {{2,1,3,4},{2,1,4,4}})
    newShape("door", "door1_2_1", {2, 1, 4, 5}, "down")
    newShape("shape", "triangle5_2_1", {2, 1, 5, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("gun", "gun1_2_1", {2, 1, 7, 5}, "left")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape", "bar1_1_2", {1, 2, 2, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 3, 1}, "right")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,2,1},{1,2,3,1}})
    newShape("shape", "triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "triangle1_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, 2, "icy"})
    newShape("manualFan", "manualFan2_1_2", {1, 2, 6, 1}, "down")
    newShape("item", "map", {1, 2, 7, 1})
    newShape("backFire", "backFire1_1_2", {1, 2, 1, 2})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,1,2},{1,2,3,2},{1,2,5,2}})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 2}, "right")
    newShape("door", "door2_1_2", {1, 2, 7, 2}, "right")
    newShape("shape", "bar2_1_2", {1, 2, 5, 3}, "bar", {"vert", 3})
    newShape("spitter", "spitter1_1_2", {1, 2, 5, 3, "up", "right", "none", "none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,3},{1,2,5,3},{1,2,6,3}})
    newShape("door", "door3_1_2", {1, 2, 7, 3}, "right")
    newShape("tunnel", "tunnel1_1_2", {1, 2, 2, 4, 2, 1, 4, 1}, "down")
    newShape("spitter", "spitter2_1_2", {1, 2, 6, 4}, {"none", "right", "none", "left"})
    newTransition("spitter2_1_2", "slide", {}, {{1,2,3,4},{1,2,6,4}})
    newShape("door", "door4_1_2", {1, 2, 7, 4}, "right")
    newShape("shape", "triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle4_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, 5, "icy"})
    newShape("spitter", "spitter3_1_2", {1, 2, 5, 5, "up", "right", "none", "none"})
    newTransition("spitter3_1_2", "slide", {}, {{1,2,4,5},{1,2,5,5},{1,2,6,5}})
    newShape("door", "door5_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    newShape("shape", "triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("spitter", "spitter1_2_2", {2, 2, 4, 1}, {"none", "right", "down", "left"})
    newShape("shape", "triangle2_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 1, 2}, "right")
    newShape("shape", "triangle3_2_2", {2, 2, 2, 2}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape", "triangle4_2_2", {2, 2, 3, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape", "triangle5_2_2", {2, 2, 5, 2}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape", "triangle6_2_2", {2, 2, 7, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("door", "door1_2_2", {2, 2, 1, 3}, "left")
    newShape("shape", "triangle7_2_2", {2, 2, 3, 3}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 4, 3}, "right")
    newShape("shape", "triangle8_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("door", "door1_2_2", {2, 2, 1, 4}, "left")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 1, 4}, "up")
    newShape("shape", "bar1_2_2", {2, 2, 3, 4}, "bar", {"horz"})
    newShape("gun", "gun1_2_2", {2, 2, 4, 4}, "down")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 7, 4}, "right")
    newShape("door", "door1_2_2", {2, 2, 1, 5}, "left")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 2, 5}, "left")
    newShape("shape", "bar2_2_2", {2, 2, 3, 5}, "bar", {"horz", 4})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 3, 5}, "down")
    newShape("shape", "triangle9_2_2", {2, 2, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle10_2_2", {2, 2, 6, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("door", "door1_2_2", {2, 2, 3, 5}, "down")

    --SCREEN 2-3
    newShape("door", "door1_2_3", {2, 3, 7, 1}, "up")
    newShape("manualFan", "manualFan1_2_3", {2, 3, 1, 2}, "down")
    newShape("shape", "triangle1_2_3", {2, 3, 3, 2}, "triangleTopLeftShape")
    newShape("shape", "triangle2_2_3", {2, 3, 7, 3}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle3_2_3", {2, 3, 1, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle4_2_3", {2, 3, 2, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan", "autoFan1_2_3", {2, 3, 5, 4}, "right")
    newTransition("autoFan1_2_3", "slide", {}, {{2,3,5,3},{2,3,5,4}})
    newShape("shape", "triangle5_2_3", {2, 3, 2, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_2_3", {2, 3, 6, 5}, "triangleBottomLeftShape")
    newTransition("triangle6_2_3", "slide", {}, {{2,3,5,5},{2,3,6,5}})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 1, 1}, { {"slide", "triangle2_2_1"},{"slide", "triangle4_2_1"},{"slide", "manualFan1_2_1"},{"slide", "autoFan1_2_3"},{"slide", "triangle6_2_3"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 2}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 5, 3}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 7, 5}, "purple")
    newShape("gem", "purple", {2, 2, 7, 3}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 3}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 3, 3, 1}, "purple")
    newShape("gem", "purple", {2, 3, 3, 1}, "purple")
    newShape("gem", "purple", {2, 3, 2, 2}, "purple")
    newShape("gem", "purple", {2, 3, 3, 5}, "purple")
    newShape("gem", "purple", {2, 3, 5, 1}, "purple")
    newShape("gem", "purple", {2, 3, 5, 2}, "purple")
    newShape("gem", "purple", {2, 3, 6, 3}, "purple")
    newShape("gem", "purple", {2, 3, 7, 2}, "purple")
    newShape("gem", "purple", {2, 3, 3, 3}, "purple")
    newShape("gem", "purple", {2, 3, 4, 2}, "purple")
    newShape("gem", "redCoin", {1, 1, 3, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 3, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 6, 2}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 5}, 65)
    newShape("item", "coins", {1, 2, 7, 3}, 85)
    newShape("item", "coins", {2, 2, 5, 4, 385})
    newShape("item", "coins", {2, 2, 2, 3}, 75)
    newShape("item", "small-present", {2, 2, 4, 2}, {})

    newShape("item", "small-present", {2, 3, 7, 1}, {})

    newShape("item", "big-present", {1, 1, 7, 2}, {})

    newShape("item", "big-present", {2, 3, 4, 5}, {})


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
