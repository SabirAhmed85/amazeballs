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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, 8})
    newShape("shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape")
    newShape("endPoint","endPoint1_1_1", {1, 1, 3, 3})
    newShape("shape","triangle5_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape")
    newTransition("triangle5_1_1", "slide", {}, {{1,1,6,3},{1,1,7,4}})
    newShape("shape","triangle6_1_1", {1, 1, 2, 4}, "triangleTopLeftShape", {1, 6})
    newTransition("triangle6_1_1", "slide", {}, {{1,1,1,5},{1,1,2,4}})
    newShape("shape","bar1_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    newTransition("bar1_1_1", "slide", {}, {{1,1,3,4},{1,1,4,4}})
    newShape("manualFan","manualFan1_1_1", {1, 1, 4, 4}, "up")
    newShape("shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"horz", 3})
    newTransition("bar2_1_1", "slide", {}, {{1,1,5,4},{1,1,5,5}})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","triangle7_1_1", {1, 1, 3, 5}, "triangleTopRightShape")
    newShape("shape","bar3_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})
    newTransition("bar3_1_1", "slide", {}, {{1,1,6,4},{1,1,6,5}})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape")
    newShape("door","door1_1_2", {1, 2, 7, 1}, "up")
    newShape("characterChangePoint","characterChangePoint1_1_2", {1, 2, 4, 2})
    newShape("shape","triangle3_1_2", {1, 2, 1, 3}, "triangleTopRightShape")
    newShape("shape","triangle4_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","bar1_1_2", {1, 2, 2, 4}, "bar", {"vert", 2})
    newShape("shape","bar2_1_2", {1, 2, 6, 4}, "bar", {"vert", 2})
    newShape("shape","triangle5_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("simple","simple1_1_2", {1, 2, 4, 5})
    newShape("shape","triangle6_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 5, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 2, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 3, 5}, 600)
    newShape("item","coins", {1, 2, 4, 4}, 150)
    newShape("item","coins", {1, 1, 4, 5}, 75)
    newShape("item","small-present", {1, 1, 1, 3}, {})

    newShape("item","small-present", {1, 1, 3, 4}, {})

    newShape("item","small-present", {1, 2, 6, 2}, {})

    newShape("item","big-present", {1, 2, 6, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
