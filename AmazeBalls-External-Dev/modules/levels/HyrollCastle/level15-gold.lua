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
    newShape("endPoint", "endPoint1_1_1", {1, 1, 4, 3})
    --SCREEN 1-2
    newShape("manualFan", "manualFan1_1_2", {1, 2, 2, 1}, "up")
    newShape("autoFan", "autoFan1_1_2", {1, 2, 3, 1}, "left")
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")
    newShape("manualFan", "manualFan2_1_2", {1, 2, 5, 1}, "down")
    newShape("manualFan", "manualFan3_1_2", {1, 2, 7, 1}, "down")
    newShape("shape", "bar1_1_2", {1, 2, 4, 2}, "bar", {"horz", 2})
    newShape("shape", "triangle1_1_2", {1, 2, 4, 2}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "switchSlide", {}, {{1,2,4,2},{1,2,4,3},{1,2,4,4}})
    newShape("manualFan", "manualFan4_1_2", {1, 2, 5, 2}, "right")
    newShape("shape", "triangle2_1_2", {1, 2, 1, 3}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 3, 3}, "down")
    newTransition("autoFan2_1_1", "slide", {}, {{1,2,3,2},{1,2,3,3}})
    newShape("shape", "bar2_1_2", {1, 2, 4, 3}, "bar", {"horz", 2})
    newShape("shape", "triangle3_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    newShape("shape", "triangle5_1_2", {1, 2, 4, 5}, "triangleTopLeftShape")
    newTransition("triangle5_1_1", "switchSlide", {}, {{1,2,4,5},{1,2,6,5},{1,2,7,5}})
    newShape("shape", "bar3_1_2", {1, 2, 6, 6}, "bar", {"vert"})
    newTransition("bar3_1_1", "switchSlide", {}, {{1,2,5,6},{1,2,6,6}})

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 1, 1}, "left")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 1, 1}, "right")
    newShape("shape", "bar1_2_2", {2, 2, 5, 1}, "bar", {"horz"})
    newShape("shape", "triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape", "triangle2_2_2", {2, 2, 3, 2}, "triangleBottomRightShape")
    newShape("shape", "triangle3_2_2", {2, 2, 5, 2}, "triangleBottomLeftShape")
    newShape("shape", "triangle4_2_2", {2, 2, 1, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle5_2_2", {2, 2, 2, 3}, "triangleTopRightShape")
    newTransition("triangle5_2_1", "slide", {}, {{2,2,2,3},{2,2,3,3}})
    newShape("shape", "triangle6_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape")
    newTransition("triangle6_2_1", "slide", {}, {{2,2,5,3},{2,2,6,3}})
    newShape("shape", "triangle7_2_2", {2, 2, 5, 4}, "triangleTopLeftShape")
    newShape("backFire", "backFire1_2_2", {2, 2, 2, 5})
    newShape("shape", "triangle8_2_2", {2, 2, 3, 5}, "triangleTopRightShape")
    newTransition("triangle8_2_1", "switchSlide", {}, {{2,2,3,4},{2,2,3,5}})
    newShape("shape", "triangle9_2_2", {2, 2, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle10_2_2", {2, 2, 6, 5}, "triangleTopLeftShape")

    --SWITCHES
    newShape("switch", "switch1_1_2", {1, 2, 1, 4}, { {"slide", "triangle1_1_1"} })
    newShape("switch", "switch2_1_2", {1, 2, 5, 4}, { {"slide", "triangle5_1_1"} })
    newShape("switch", "switch1_2_2", {2, 2, 4, 4}, { {"slide", "triangle8_2_1"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 2}, "purple")
    newShape("gem", "purple", {2, 2, 2, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 6, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 5}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "redCoin", {1, 2, 2, 2}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 6, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 3, 4}, 225)
    newShape("item", "coins", {2, 2, 3, 1}, 90)
    newShape("item", "small-present", {1, 2, 1, 1}, {})
    newShape("item", "hook", {2, 2, 4, 2}, {})
    newShape("item", "dummyBall", {1, 2, 7, 3, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
