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
    newShape("simple", "simple1_1_1", {1, 1, 2, 3})
    newShape("shape", "triangle1_1_1", {1, 1, 4, 3}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape")
    newShape("shape", "bar1_1_1", {1, 1, 7, 3}, "bar", {"horz", 2})
    newTransition("bar1_1_1", "autoSlide", {timePerSquare = 480, pauseTime = 0, labelled = false}, {{1,1,7,3},{1,1,7,5}})
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right")

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 4, 1}, "left")
    newShape("shape", "bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 4, 2}, "down")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,4,2},{2,1,4,3,"*"},{2,1,5,3},{2,1,5,4}})
    newShape("shape", "bar2_2_1", {2, 1, 7, 3}, "bar", {"vert", 2})
    newShape("simple", "simple1_2_1", {2, 1, 1, 4}) -- instead of timeout for now
    --newShape("timeOut", "timeOut1_2_1", {2, 1, 1, 4, 2})
    newShape("shape", "triangle1_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape", {1, 7})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,4},{2,1,3,4},{2,1,3,3}})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 4, 4}, "up")
    newTransition("autoFan3_2_1", "slide", {}, {{2,1,4,4},{2,1,4,5}})
    newShape("autoFan", "autoFan4_2_1", {2, 1, 6, 4}, "up")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,5,2},{2,1,6,4}})
    newShape("shape", "triangle2_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape", {1, 2})
    newTransition("triangle2_2_1", "slide", {}, {{2,1,6,5},{2,1,7,4}})
    newShape("shape", "triangle3_2_1", {2, 1, 5, 5}, "triangleTopRightShape")
    newShape("door", "door1_2_1", {2, 1, 7, 5}, "right")

    --SCREEN 3-1
    newShape("simple", "simple1_3_1", {3, 1, 1, 1})
    newShape("shape", "triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_3_1", {3, 1, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_3_1", {3, 1, 6, 1}, "down")
    newShape("shape", "triangle3_3_1", {3, 1, 7, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple", "simple2_3_1", {3, 1, 4, 2})
    newShape("shape", "bar1_3_1", {3, 1, 5, 2}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_3_1", {3, 1, 5, 2})
    newShape("shape", "triangle4_3_1", {3, 1, 7, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle5_3_1", {3, 1, 2, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape", "triangle6_3_1", {3, 1, 4, 3}, "triangleTopLeftShape", {1, _, "breakable", 6})
    newShape("shape", "triangle7_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("simple", "simple3_3_1", {3, 1, 6, 3})
    newShape("shape", "triangle8_3_1", {3, 1, 2, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan2_3_1", {3, 1, 7, 4}, "up")
    newShape("autoFan", "autoFan3_3_1", {3, 1, 6, 5}, "right")
    newShape("autoFan", "autoFan4_3_1", {3, 1, 7, 5}, "down")

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {3, 1, 3, 5}, "purple")
    newShape("gem", "purple", {3, 1, 5, 5}, "purple")
    newShape("gem", "purple", {3, 1, 3, 4}, "purple")
    newShape("gem", "purple", {3, 1, 6, 2}, "purple")
    newShape("gem", "purple", {3, 1, 2, 2}, "purple")
    newShape("gem", "purple", {3, 1, 3, 3}, "purple")
    newShape("gem", "purple", {3, 1, 5, 1}, "purple")
    newShape("gem", "purple", {3, 1, 1, 4}, "purple")
    newShape("gem", "purple", {3, 1, 6, 4}, "purple")
    newShape("gem", "redCoin", {3, 1, 1, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 3, 4}, "blueCoin")
    newShape("gem", "purpleCoin", {3, 1, 4, 4}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 7, 3}, 245)
    newShape("item", "coins", {2, 1, 6, 1}, 395)
    newShape("item", "coins", {3, 1, 4, 5}, 75)
    newShape("item", "big-present", {2, 1, 7, 2}, {})
    newShape("item", "big-present", {3, 1, 5, 4}, {})
    newShape("item", "small-present", {1, 1, 1, 4}, {})
    newShape("item", "small-present", {2, 1, 2, 1}, {})
    newShape("item", "small-present", {3, 1, 7, 3}, {})
    newShape("item", "fireCape", {2, 1, 2, 5}, {})
    newShape("item", "dummyBall", {3, 1, 2, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 3
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
