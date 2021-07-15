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
    newShape("shape", "triangle1_1_1", {1, 1, 5, 2}, "triangleTopAndBottomShape", {1})
    newShape("shape", "triangle2_1_1", {1, 1, 3, 3}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle2_1_1", "slide", {}, {{1,1,1,1},{1,1,2,1},{1,1,3,3}})
    newShape("shape", "triangle3_1_1", {1, 1, 7, 3}, "triangleTopRightShape", {1})
    newTransition("triangle3_1_1", "slide", {}, {{1,1,6,1},{1,1,7,3}})
    newShape("shape", "triangle4_1_1", {1, 1, 5, 4}, "triangleTopAndBottomShape", {2})
    newShape("door", "door1_1_1", {1, 1, 7, 4}, "right", {"disabled"})
    newShape("door", "door2_1_1", {1, 1, 1, 5}, "down")

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 6, 1}, "up")
    newShape("shape", "triangle1_1_2", {1, 2, 5, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,4,2},{1,2,5,1}})
    newShape("shape", "triangle2_1_2", {1, 2, 2, 4}, "triangleTopRightShape")
    newTransition("triangle2_1_2", "slide", {}, {{1,2,2,4},{1,2,3,4},{1,2,4,4}})
    newShape("shape", "triangle3_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 6})
    newTransition("triangle3_1_2", "slide", {}, {{1,2,1,2},{1,2,3,3},{1,2,6,4}})

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 1, 1}, "triangleBottomLeftShape")
    newShape("shape", "triangle2_2_1", {2, 1, 6, 1}, "triangleBottomRightShape")
    newShape("endPoint", "endPoint1_2_1", {2, 1, 1, 2})
    newShape("shape", "triangle3_2_1", {2, 1, 2, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "bar1_2_1", {2, 1, 7, 2}, "bar", {"vert", 3})
    newShape("shape", "triangle4_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle5_2_1", {2, 1, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("simple", "simple1_2_1", {2, 1, 6, 3})
    newTransition("simple1_2_1", "slide", {}, {{2,1,6,3},{2,1,7,3}})
    newShape("shape", "bar2_2_1", {2, 1, 7, 3}, "bar", {"vert", 3})
    newTransition("bar2_2_1", "slide", {}, {{2,1,6,3},{2,1,7,3}})
    newShape("shape", "triangle6_2_1", {2, 1, 2, 4}, "triangleBottomLeftShape")
    newShape("shape", "triangle7_2_1", {2, 1, 6, 4}, "triangleBottomRightShape")
    newShape("shape", "triangle8_2_1", {2, 1, 7, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle9_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    newShape("simple", "simple2_2_1", {2, 1, 3, 5})
    newShape("shape", "bar3_2_1", {2, 1, 5, 5}, "bar", {"horz", 2})
    newTransition("bar3_2_1", "slide", {}, {{2,1,5,4},{2,1,5,5}})
    newShape("shape", "triangle10_2_1", {2, 1, 6, 5}, "triangleTopLeftShape")

    --SWITCHES    
    newShape("switch", "switch1_1_2", {1, 2, 3, 1}, { {"door-open", "door1_1_1"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 1}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 4}, "purple")
    newShape("gem", "purple", {2, 1, 4, 5}, "purple")
    newShape("gem", "purple", {2, 1, 1, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 5, 2}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "redCoin", {1, 2, 6, 2}, "redCoin")
    newShape("gem", "blueCoin", {2, 1, 7, 2}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 3, 2}, "purpleCoin")

    newShape("item", "coins", {1, 1, 2, 4}, 140)
    newShape("item", "coins", {1, 1, 5, 1}, 75)
    newShape("item", "coins", {2, 1, 4, 1, 300}) 
    newShape("item", "small-present", {1, 2, 7, 1}, {})

    newShape("item", "big-present", {2, 1, 3, 3}, {})

    newShape("item", "coins", {1, 2, 7, 4, 105})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
