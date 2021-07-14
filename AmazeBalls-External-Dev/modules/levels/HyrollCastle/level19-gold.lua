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
    newShape("shape", "triangle1_1_1", {1, 1, 3, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 1}, "left")
    newShape("shape", "triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 3, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle5_1_1", {1, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right", {"disabled"})
    newShape("shape", "triangle7_1_1", {1, 1, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle8_1_1", {1, 1, 3, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle9_1_1", {1, 1, 5, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle10_1_1", {1, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle11_1_1", {1, 1, 3, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple1_1_1", {1, 1, 4, 5})
    newShape("shape", "triangle12_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SCREEN 2-1
    newShape("backFire", "backFire1_2_1", {2, 1, 3, 1})
    newShape("shape", "triangle1_2_1", {2, 1, 6, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,4,2},{2,1,5,2},{2,1,5,2},{2,1,6,1}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 3}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,6,3},{2,1,7,4}})
    newShape("shape", "bar1_2_1", {2, 1, 1, 4}, "bar", {"horz", 3})
    newShape("shape", "triangle2_2_1", {2, 1, 3, 4}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "flip-horizontal")
    newShape("manualFan", "manualFan1_2_1", {2, 1, 3, 5}, "up")
    newShape("door", "door1_2_1", {2, 1, 3, 5}, "down")
    newShape("shape", "triangle3_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle3_2_1", "flip-horizontal")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 4, 1}, "up")

    --SCREEN 2-2
    newShape("endPoint", "endPoint1_2_2", {2, 2, 3, 4})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 3, 3}, { {"door-open", "door1_1_1"} }, {"one-way"})

    --GEM
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 5}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 2, 3, 3}, "purple")
    newShape("gem", "redCoin", {1, 1, 5, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 7, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 5, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 1, 3}, 65)
    newShape("item", "coins", {2, 1, 2, 2}, 80)
    newShape("item", "coins", {2, 2, 3, 2}, 130)
    newShape("item", "big-present", {1, 1, 4, 3}, {})
    newShape("item", "big-present", {2, 1, 1, 4}, {})
    newShape("item", "small-present", {1, 2, 4, 3}, {})
    newShape("item", "small-present", {2, 1, 6, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
