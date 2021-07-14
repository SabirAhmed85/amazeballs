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
    newShape("item","map", {1, 1, 4, 2})
    newShape("characterChangePoint","characterChangePoint1_1_1", {1, 1, 4, 3})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape","triangle2_1_2", {1, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "right")
    newShape("shape","triangle3_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan2_1_2", {1, 2, 1, 3}, "up")
    newShape("shape","triangle4_1_2", {1, 2, 3, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("shape","triangle5_1_2", {1, 2, 4, 3}, "triangleTopRightShape", {1, _, "hyroll"})
    newShape("shape","triangle6_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan3_1_2", {1, 2, 3, 5}, "left")
    newShape("shape","bar1_1_2", {1, 2, 5, 5}, "bar", {"horz"})
    newShape("door","door1_1_2", {1, 2, 7, 5}, "right")

    --SCREEN 2-2
    newShape("endPoint","endPoint1_2_2", {2, 2, 1, 1})
    newShape("shape","triangle1_2_2", {2, 2, 3, 1}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan1_2_2", {2, 2, 7, 1}, "left")
    newShape("shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("shape","triangle3_2_2", {2, 2, 4, 2}, "triangleBottomRightShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan2_2_2", {2, 2, 6, 2}, "left")
    newShape("autoFan","autoFan3_2_2", {2, 2, 1, 3}, "right")
    newShape("shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"vert", 2})
    newShape("autoFan","autoFan4_2_2", {2, 2, 3, 3}, "right")
    newShape("shape","triangle4_2_2", {2, 2, 6, 3}, "triangleTopLeftShape", {1, _, "hyroll"})
    --newShape("timeOut","timeOut1_2_2", {2, 2, 1, 4, 5})
    newShape("autoFan","autoFan5_2_2", {2, 2, 2, 4}, "right")
    newShape("shape","triangle5_2_2", {2, 2, 7, 4}, "triangleTopLeftShape", {1, _, "hyroll"})
    newShape("autoFan","autoFan6_2_2", {2, 2, 1, 5}, "up")
    newShape("shape","bar2_2_2", {2, 2, 4, 5}, "bar", {"vert", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 5, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 4}, "purple")
    newShape("gem","purple", {2, 2, 5, 4}, "purple")
    newShape("gem","purple", {2, 2, 7, 3}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 1}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 7, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 2, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 5}, 80)
    newShape("item","coins", {1, 2, 6, 5}, 80)
    newShape("item","small-present", {1, 1, 7, 3}, {})
    newShape("item","small-present", {1, 2, 5, 3}, {})
    newShape("item","iceCape", {2, 2, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
