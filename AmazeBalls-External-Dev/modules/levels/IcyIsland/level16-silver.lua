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
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("item","map", {1, 1, 2, 4})
    newShape("shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 6, 1}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "flip-vertical")
    newShape("shape","triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 2}, "left")
    newShape("shape","triangle3_1_2", {1, 2, 2, 3}, "triangleTopRightShape")
    newShape("shape","triangle4_1_2", {1, 2, 4, 3}, "triangleBottomLeftShape", {1, 4})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 4}, "right")
    newShape("shape","triangle5_1_2", {1, 2, 7, 4}, "triangleBottomLeftShape")
    newShape("endPoint","endPoint1_1_2", {1, 2, 2, 5})
    newShape("shape","triangle6_1_2", {1, 2, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan2_1_2", {1, 2, 6, 5}, "left")
    newShape("tunnel","tunnel1_1_2", {1, 2, 7, 5, 2, 2, 6, 1}, "down")

    --SCREEN 2-2
    newShape("shape","triangle1_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape")
    newShape("backFire","backFire1_2_2", {2, 2, 4, 2})
    newTransition("backFire1_2_2", "slide", {}, {{2,2,2,1},{2,2,2,2},{2,2,4,2}})
    newShape("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopRightShape", {1, 1})
    newShape("manualFan","manualFan1_2_2", {2, 2, 6, 3}, "left")
    newShape("shape","triangle3_2_2", {2, 2, 7, 3}, "triangleBottomRightShape")
    newTransition("triangle3_2_2", "flip-vertical")
    newShape("shape","triangle4_2_2", {2, 2, 7, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("tunnel","tunnel1_2_2", {2, 2, 2, 5, 1, 2, 2, 1}, {"none"})
    newShape("shape","triangle5_2_2", {2, 2, 5, 5}, "triangleTopLeftShape")

    --GEMS
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","purple", {2, 2, 5, 2}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 4}, "purple")
    newShape("gem","purple", {2, 2, 4, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","purple", {2, 2, 7, 5}, "purple")
    newShape("gem","purple", {2, 2, 4, 5}, "purple")
    newShape("gem","purple", {2, 2, 3, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 2}, "purple")
    newShape("gem","redCoin", {1, 1, 5, 3}, "redCoin")
    newShape("gem","blueCoin", {2, 2, 1, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 5, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 2}, 170)
    newShape("item","coins", {1, 2, 3, 1}, 110)
    newShape("item","coins", {2, 2, 3, 4}, 12)
    newShape("item","big-present", {2, 2, 1, 1}, {})
    newShape("item","small-present", {1, 1, 7, 4}, {})
    newShape("item","hook", {1, 2, 3, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
