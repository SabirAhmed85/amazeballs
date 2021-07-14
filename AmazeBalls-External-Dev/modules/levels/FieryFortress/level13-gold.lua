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
    newShape("simple", "simple1_1_1", {1, 1, 3, 1})
    newShape("shape", "bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 2})
    newShape("simple", "simple1_1_1", {1, 1, 2, 2})
    newShape("shape", "triangle1_1_1", {1, 1, 3, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "bar2_1_1", {1, 1, 1, 4}, "bar", {"horz"})
    newShape("shape", "triangle3_1_1", {1, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("simple", "simple1_1_1", {1, 1, 5, 5})
    newShape("door", "door1_1_1", {1, 1, 5, 5, "down", "disabled"})

    -- 1-2
    newShape("backFire", "backFire1_1_2", {1, 2, 1, 1})
    newTransition("backFire1_1_2", "slide", {timePerSquare = 100}, {{1,2,1,1},{1,2,4,1}})
    newShape("backFire", "backFire2_1_2", {1, 2, 5, 1})
    newTransition("backFire2_1_2", "slide", {timePerSquare = 100}, {{1,2,5,1},{1,2,7,1}})
    newShape("shape", "bar1_1_2", {1, 2, 3, 2}, "bar", {"vert", 2})
    newShape("backFire", "backFire3_1_2", {1, 2, 2, 2})
    newTransition("backFire3_1_2", "slide", {timePerSquare = 100}, {{1,2,2,2},{1,2,3,2}})
    newShape("shape", "bar2_1_2", {1, 2, 5, 3}, "bar", {"vert", 2})
    newTransition("bar2_1_2", "switchSlide", {timePerSquare = 100}, {{1,2,4,3},{1,2,5,3}})
    newShape("backFire", "backFire4_1_2", {1, 2, 6, 3})
    newTransition("backFire4_1_2", "slide", {timePerSquare = 100}, {{1,2,6,3},{1,2,7,3}})
    newShape("shape", "bar3_1_2", {1, 2, 7, 3}, "bar", {"vert", 4})
    newShape("shape", "bar4_1_2", {1, 2, 2, 4}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 2, 4})
    newShape("shape", "bar5_1_2", {1, 2, 5, 4}, "bar", {"vert", 4})
    newTransition("bar5_1_2", "switchSlide", {timePerSquare = 100}, {{1,2,3,4},{1,2,5,4}})
    newShape("shape", "bar6_1_2", {1, 2, 1, 5}, "bar", {"vert", 4})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 1, 5}, "right")
    newShape("autoFan", "autoFan2_1_2", {1, 2, 2, 5}, "up")
    newShape("backFire", "backFire5_1_2", {1, 2, 4, 5})
    newTransition("backFire5_1_2", "slide", {timePerSquare = 100}, {{1,2,3,5},{1,2,4,5},{1,2,5,4},{1,2,6,4}})
    newShape("shape", "bar7_1_2", {1, 2, 5, 6}, "bar", {"vert", 4})
    newTransition("bar7_1_2", "switchSlide", {timePerSquare = 100}, {{1,2,4,6},{1,2,5,6}})

    --ALL SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 5, 3}, { {"door-open", "door1_1_1"} })

    newShape("switch", "switch1_1_2", {1, 2, 4, 2}, { {"slide", "bar2_1_2"},{"slide", "bar7_1_2"} })
    newShape("switch", "switch2_1_2", {1, 2, 3, 3}, { {"slide", "bar5_1_2"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 2}, "purple")
    newShape("gem", "purple", {1, 2, 4, 3}, "purple")
    newShape("gem", "purple", {1, 2, 4, 2}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "redCoin", {1, 2, 6, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 2, 2, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 1, 4}, "purpleCoin")
    --ITEMS
    newShape("item", "big-present", {1, 2, 1, 3}, {})

    --newShape("item", "coins", {1, 2, 3, 4}, 250)
    --newShape("item", "coins", {1, 1, 1, 2}, 90)
    --newShape("item", "coins", {1, 1, 1, 4}, 100)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
