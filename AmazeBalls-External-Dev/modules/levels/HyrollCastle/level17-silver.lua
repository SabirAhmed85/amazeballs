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
    newShape("manualFan","manualFan1_1_1", {1, 1, 3, 1}, "down")
    newShape("characterChangePoint","characterChangePoint1_1_1", {1, 1, 3, 2})
    newShape("shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomRightShape", {1, 8})
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("manualFan","manualFan2_1_1", {1, 1, 3, 4}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, 13})

    --SCREEN 2-1
    newShape("manualFan","manualFan1_2_1", {2, 1, 1, 1}, "down")
    newTransition("manualFan1_2_1", "slide", {}, {{2,1,1,1},{2,1,1,2},{2,1,2,2},{2,1,3,2}})
    newShape("endPoint","endPoint1_2_1", {2, 1, 7, 1})
    newShape("shape","bar1_2_1", {2, 1, 3, 2}, "bar", {"vert", 3})
    newShape("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleBottomRightShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,3},{2,1,4,1}})
    newShape("shape","triangle2_2_1", {2, 1, 7, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 1, 5}, "right")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,1,5},{2,1,3,5}})
    newShape("manualFan","manualFan1_2_1", {2, 1, 4, 5}, "up")

    --GEMS
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 2}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 7, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 5, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {2, 1, 5, 1}, 50)
    newShape("item","coins", {1, 1, 7, 2}, 80)
    newShape("item","coins", {2, 1, 6, 2}, 90)
    newShape("item","small-present", {2, 1, 6, 1}, {})

    newShape("item","big-present", {2, 1, 7, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
