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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 1}, "right")
    newShape("spitter", "spitter1_1_1", {1, 1, 5, 2}, {"none", "none", "down", "none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,1,1,2},{1,1,2,2},{1,1,5,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 1, 3}, "triangleTopRightShape", {1, 1})
    newShape("spitter", "spitter2_1_1", {1, 1, 6, 3, "up", "none", "none", "none"})
    newTransition("spitter2_1_2", "slide", {}, {{1,1,6,3},{1,1,6,5}})
    newShape("shape", "bar1_1_1", {1, 1, 7, 3}, "bar", {"vert", 2})
    newShape("door", "door1_1_1", {1, 1, 7, 3}, "right")
    newShape("spitter", "spitter3_1_1", {1, 1, 2, 4}, {"none", "right", "none", "none"})
    newTransition("spitter3_1_2", "slide", {}, {{1,1,2,3},{1,1,2,4}})
    newShape("spitter", "spitter4_1_1", {1, 1, 3, 4, "up", "none", "none", "none"})
    newTransition("spitter4_1_2", "slide", {}, {{1,1,3,4},{1,1,3,5}})
    newShape("shape", "triangle3_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 5, 4}, "right")
    newShape("spitter", "spitter5_1_1", {1, 1, 7, 4}, {"none", "none", "down", "none"})

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 3, 1}, "triangleTopLeftShape", {1, 5, "icy"})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 4, 1}, "right")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 1}, "down")
    newShape("spitter", "spitter1_2_1", {2, 1, 7, 1}, {"none", "none", "none", "left"})
    newTransition("spitter1_2_1", "slide", {}, {{2,1,7,1},{2,1,7,3},{2,1,7,5}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 2, 2}, "right")
    newShape("shape", "triangle2_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, 3, "icy"})
    newShape("shape", "triangle4_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("spitter", "spitter2_2_1", {2, 1, 1, 3}, {"none", "right", "none", "none"})
    newTransition("spitter2_2_1", "slide", {}, {{2,1,1,1},{2,1,1,3},{2,1,1,5}})
    newShape("shape", "triangle5_2_1", {2, 1, 4, 3}, "triangleBottomRightShape", {1, 9, "icy"})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 3, 4}, "right")
    newShape("autoFan", "autoFan3_2_1", {2, 1, 5, 4}, "up")
    newShape("shape", "triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape")
    newShape("shape", "bar1_2_1", {2, 1, 4, 5}, "bar", {"horz", 2})
    newShape("endPoint", "endPoint1_2_1", {2, 1, 4, 5})
    newShape("shape", "bar2_2_1", {2, 1, 5, 5}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan3_2_1", {2, 1, 6, 5}, "right")
    newShape("shape", "bar3_2_1", {2, 1, 4, 6}, "bar", {"vert", 3})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 5}, "purple")
    newShape("gem", "purple", {1, 1, 4, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 3}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 3, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 7, 2}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {2, 1, 6, 1, 465})
    newShape("item", "big-present", {2, 1, 3, 3}, {})
    newShape("item", "small-present", {1, 1, 4, 1}, {})
    newShape("item", "dummyBall", {2, 1, 4, 4}, {})
    newShape("item", "hook", {1, 1, 3, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
