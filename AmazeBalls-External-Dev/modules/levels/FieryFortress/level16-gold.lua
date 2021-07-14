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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle2_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle3_1_1", {1, 1, 7, 1}, "triangleBottomRightShape")
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 1, 2})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 7, 2}, "up")
    newShape("shape", "triangle4_1_1", {1, 1, 4, 3}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape", "triangle5_1_1", {1, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("endPoint", "endPoint1_1_1", {1, 1, 6, 3})
    newShape("shape", "bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 3})
    newTransition("bar1_1_1", "slide", {}, {{1,1,7,2},{1,1,7,3},{1,1,8,3}})
    newShape("item", "map", {1, 1, 3, 4})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 7, 4}, "down")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 5, 5}, "right")
    newTransition("autoFan3_1_1", "switchSlide", {}, {{1,1,5,4},{1,1,5,5}})
    newShape("shape", "triangle7_1_1", {1, 1, 7, 5}, "triangleTopRightShape")
    newShape("door", "door2_1_1", {1, 1, 7, 5}, "right")

    -- 2-1
    newShape("door", "door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 1}, "right")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,1,3},{2,1,3,1}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 2, 2}, "right")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,1,2},{2,1,2,2}})
    newShape("shape", "triangle2_2_1", {2, 1, 6, 2}, "triangleTopLeftShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,5,2},{2,1,6,2}})
    newShape("door", "door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "triangle3_2_1", {2, 1, 5, 3}, "triangleBottomLeftShape", {1, 7})
    newTransition("triangle3_2_1", "slide", {}, {{2,1,4,2},{2,1,4,3,"*"},{2,1,5,3}})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 6, 3}, "down")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,6,3},{2,1,6,4,"*"},{2,1,7,4}})
    newShape("shape", "bar1_2_1", {2, 1, 7, 3}, "bar", {"horz", 2})
    newTransition("bar1_2_1", "slide", {}, {{2,1,7,1},{2,1,7,3}})
    newShape("item", "compass", {2, 1, 7, 3})
    newShape("shape", "bar2_2_1", {2, 1, 8, 3}, "bar", {"horz"})
    newShape("autoFan", "autoFan4_2_1", {2, 1, 2, 4}, "right")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,1,4},{2,1,2,4}})
    newShape("shape", "triangle4_2_1", {2, 1, 4, 4}, "triangleLeftAndRightShape", {2})
    newShape("door", "door3_2_1", {2, 1, 1, 5}, "left")
    newShape("shape", "triangle5_2_1", {2, 1, 1, 5}, "triangleTopLeftShape")
    newShape("shape", "bar3_2_1", {2, 1, 2, 5}, "bar", {"horz", 3})
    newShape("shape", "triangle6_2_1", {2, 1, 5, 5}, "triangleBottomRightShape")
    newTransition("triangle6_2_1", "slide", {}, {{2,1,5,5},{2,1,6,5}})
    newShape("shape", "bar4_2_1", {2, 1, 6, 5}, "bar", {"vert", 4})

    --ALL SWITCHES

    newShape("switch", "switch1_1_1", {1, 1, 2, 1}, { {"slide", "autoFan3_1_1"} })

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "redCoin", {2, 1, 4, 1}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 5, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 4, 2}, "purpleCoin")
    --ITEMS
    newShape("item", "big-present", {2, 1, 2, 1}, {})

    --newShape("item", "coins", {1, 2, 7, 5}, 150)
    --newShape("item", "coins", {1, 2, 6, 1}, 150)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
