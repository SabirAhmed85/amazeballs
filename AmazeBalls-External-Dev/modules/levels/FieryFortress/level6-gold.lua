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

    -- SCREEN 1-1
    newShape("shape", "bar1_1_1", {1, 1, 2, 3}, "bar", {"horz", 3})
    newShape("shape", "bar2_1_1", {1, 1, 3, 4}, "bar", {"horz"})
    newTransition("bar2_1_1", "slide", {"brown"}, {{1,1,3,3},{1,1,3,4}})
    newShape("shape", "bar3_1_1", {1, 1, 5, 3}, "bar", {"horz", 3})
    newTransition("bar2_1_1", "slide", {"brown"}, {{1,1,5,3},{1,1,5,4}})
    newShape("shape", "bar4_1_1", {1, 1, 6, 3}, "bar", {"horz", 3})
    newTransition("bar2_1_1", "slide", {"brown"}, {{1,1,6,2},{1,1,6,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 3}, "right")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,7,3},{1,1,7,4}})
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")

    -- 2-1
    newShape("simple", "simple1_2_1", {2, 1, 1, 1})
    newTransition("simple1_2_1", "slide", {}, {{2,1,1,1},{2,1,1,2},{2,1,1,3}})
    newShape("shape", "triangle1_2_1", {2, 1, 7, 1}, "triangleTopLeftShape", {1, 6})
    newShape("item", "map", {2, 1, 3, 3})
    newShape("shape", "triangle2_2_1", {2, 1, 4, 2, "triangleTopAndBottomShape", 1, 18})
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 2, 4}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,3,1},{2,1,2,1,"*"},{2,1,2,4}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 5, 3}, "down")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,4,3},{2,1,5,3},{2,1,5,5,"*"},{2,1,7,5}})
    newShape("shape", "bar1_2_1", {2, 1, 7, 5}, "bar", {"vert", 3})
    newShape("door", "door2_2_1", {2, 1, 3, 5}, "down")
    newShape("door", "door3_2_1", {2, 1, 5, 5}, "down")

    -- 2-2
    newShape("item", "compass", {2, 2, 5, 1})
    newShape("door", "door1_2_2", {2, 2, 7, 1}, "up")
    newShape("endPoint", "endPoint1_1_1", 2, 2, 1, 2})
    newShape("shape", "bar1_2_2", {2, 2, 2, 2}, "bar", {"horz"})
    newTransition("bar1_2_2", "slide", {"brown"}, {{2,2,2,2},{2,2,2,3}})
    newShape("shape", "triangle1_2_2", {2, 2, 3, 2}, "triangleTopLeftShape")
    newShape("shape", "triangle2_2_2", {2, 2, 7, 2}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan1_2_2", {2, 2, 2, 4}, "right")
    newTransition("autoFan1_2_2", "slide", {}, {{2,2,2,4},{2,2,4,4},{2,2,5,2}})
    newShape("autoFan", "autoFan2_2_2", {2, 2, 5, 5}, "down")

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 2}, "purple")
    newShape("gem", "purple", {2, 2, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "redCoin", {2, 2, 3, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 7, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --newShape("item", "coins", {2, 1, 4, 4}, 250)
    --newShape("item", "coins", {2, 1, 6, 3}, 250)
    newShape("item", "big-present", {2, 2, 3, 5}, {})

    newShape("item", "small-present", {1, 1, 6, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
