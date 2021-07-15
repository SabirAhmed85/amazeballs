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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"horz", 3})
    newShape("shape","triangle1_1_1", {1, 1, 3, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 1})
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 2}, "down")
    newShape("shape","triangle3_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("autoFan","autoFan2_1_1", {1, 1, 7, 2}, "down")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,7,2},{1,1,7,3}})
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right")
    newShape("shape","triangle5_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 13})
    newTransition("triangle5_1_1", "slide", {}, {{1,1,4,3},{1,1,4,4}})
    newShape("shape","triangle6_1_1", {1, 1, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle6_1_1", "slide", {}, {{1,1,5,3},{1,1,5,4}})
    newShape("shape","triangle7_1_1", {1, 1, 1, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan3_1_1", {1, 1, 3, 5}, "right")
    newShape("shape","triangle8_1_1", {1, 1, 5, 5}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 6, 5}, "up")

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 3, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("simple","simple1_2_1", {2, 1, 7, 1}, "down")
    newTransition("simple1_2_1", "slide", {}, {{2,1,7,1},{2,1,7,3}})
    newShape("shape","triangle2_2_1", {2, 1, 1, 2}, "triangleBottomRightShape")
    newTransition("triangle2_2_1", "slide", {}, {{2,1,1,2},{2,1,2,3}})
    newShape("tunnel","tunnel1_2_1", {2, 1, 4, 3, 1, 1, 2, 3, "none"})
    newShape("shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 5, 5}, "up")

    --GEMS
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 7, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {2, 1, 5, 3}, 125)
    newShape("item","coins", {2, 1, 5, 1, 75 })
    newShape("item","coins", {2, 1, 3, 2, 250 })
    newShape("item","small-present", {1, 1, 4, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
