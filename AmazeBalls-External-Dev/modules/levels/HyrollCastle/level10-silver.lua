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
    newShape("shape", "bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    newShape("shape", "bar2_1_1", {1, 1, 5, 1}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 5, 1}, "right")
    newShape("shape", "bar3_1_1", {1, 1, 6, 2}, "bar", {"vert"})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 7, 1}, "down")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape", "triangle1_1_1", {1, 1, 1, 2}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,2},{1,1,2,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,3,2},{1,1,4,2}})
    newShape("shape", "bar4_1_1", {1, 1, 5, 3}, "bar", {"horz", 4})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 3, 4})
    newShape("shape", "bar5_1_1", {1, 1, 7, 4}, "bar", {"vert", 2})
    newShape("shape", "triangle3_1_1", {1, 1, 2, 5}, "triangleTopLeftShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,2,3},{1,1,2,5}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 5}, "right")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,5,5},{1,1,5,2},{1,1,7,3}})
    newShape("shape", "triangle4_1_1", {1, 1, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar6_1_1", {1, 1, 7, 5}, "bar", {"horz"})
    newShape("backFire", "backFire1_1_1", {1, 1, 7, 5})
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 2, 1}, "triangleTopRightShape", {1, 13})
    newShape("simple", "simple2_2_1", {2, 1, 4, 1})
    newTransition("simple2_2_1", "slide", {}, {{2,1,4,1},{2,1,4,2}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 1}, "left")
    newShape("autoFan", "autoFan2_2_1", {2, 1, 3, 2}, "down")
    --newShape("gem", "redCoin", {2, 1, 3, 4}, "redCoin")
    newShape("door", "door2_2_1", {2, 1, 1, 5}, "left")
    newShape("shape", "triangle2_2_1", {2, 1, 3, 5}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,5},{2,1,5,5}})

    -- ALL SWITCHES
    newShape("switch", "switch2_2_1", {2, 1, 3, 3}, { {"flip-vertical", "triangle1_2_1"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 6, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 2, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 6, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {2, 1, 2, 5}, 90)
    newShape("item", "coins", {2, 1, 5, 3}, 180)
    newShape("item", "small-present", {2, 1, 2, 3}, {})

    newShape("item", "big-present", {1, 1, 6, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
