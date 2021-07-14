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
    newShape("shape","triangle1_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 16})
    newShape("simple","simple1_1_1", {1, 1, 3, 2})
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,2},{1,1,3,4}})
    newShape("manualFan","manualFan1_1_1", {1, 1, 4, 2}, "right")
    newTransition("manualFan1_1_1", "autoSlide", {pauseTime = 1500, isActiveWhenSliding = false}, {{1,1,4,2},{1,1,4,4}})
    newShape("manualFan","manualFan2_1_1", {1, 1, 5, 2}, "down")
    newTransition("manualFan2_1_1", "autoSlide", {pauseTime = 1500, isActiveWhenSliding = false}, {{1,1,5,2},{1,1,5,4}})
    newShape("manualFan","manualFan3_1_1", {1, 1, 6, 2}, "left")
    newTransition("manualFan3_1_1", "autoSlide", {pauseTime = 1500, isActiveWhenSliding = false}, {{1,1,6,2},{1,1,6,4}})
    newShape("shape","bar1_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    newShape("shape","bar2_1_1", {1, 1, 5, 4}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("shape","triangle1_2_1", {2, 1, 2, 1}, "triangleBottomRightShape")
    --newShape("timeOut","timeOut1_2_1", {2, 1, 4, 1, 2})
    newShape("endPoint","endPoint1_2_1", {2, 1, 1, 2})
    newShape("shape","triangle2_2_1", {2, 1, 3, 2}, "triangleBottomRightShape")
    newShape("autoFan","autoFan1_2_1", {2, 1, 5, 2}, "up")
    newShape("manualFan","manualFan1_2_1", {2, 1, 7, 2}, "right")
    newShape("shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"vert", 4})
    newShape("shape","triangle3_2_1", {2, 1, 2, 3}, "triangleTopRightShape")
    newShape("shape","triangle4_2_1", {2, 1, 3, 3}, "triangleTopLeftShape")
    newShape("shape","triangle5_2_1", {2, 1, 4, 3}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("manualFan","manualFan2_2_1", {2, 1, 5, 3}, "right")
    newShape("shape","bar2_2_1", {2, 1, 1, 4}, "bar", {"horz", 4})
    newShape("manualFan","manualFan3_2_1", {2, 1, 7, 3}, "up")
    newShape("shape","bar3_2_1", {2, 1, 8, 3}, "bar", {"horz", 4})
    newShape("manualFan","manualFan4_2_1", {2, 1, 1, 4}, "up")
    newShape("autoFan","autoFan3_2_1", {2, 1, 3, 4}, "left")
    newShape("shape","triangle6_2_1", {2, 1, 5, 4}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 1}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 2}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 5, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 6, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 4, 1}, 250)
    newShape("item","coins", {2, 1, 5, 5}, 150)
    newShape("item","small-present", {2, 1, 4, 4}, {})

    newShape("item","big-present", {1, 1, 1, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
