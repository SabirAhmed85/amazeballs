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

    --SCREEN 2-1
    newShape("endPoint","endPoint1_2_1", {2, 1, 2, 1})
    newShape("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle1_2_1", {2, 1, 5, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_2_1", {2, 1, 6, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle1_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle1_2_1", {2, 1, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle1_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_2_1", {2, 1, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","triangle1_2_1", {2, 1, 6, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("spitter","spitter1_2_1", {2, 1, 7, 5, "up", "none","none","left"})

    --SCREEN 1-2
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 1}, "down")
    newShape("shape","triangle1_1_2", {1, 2, 1, 3}, "triangleTopRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,3},{1,2,2,3}})
    newShape("shape","triangle2_1_2", {1, 2, 4, 3}, "triangleLeftAndRightShape", {2})
    newTransition("triangle2_1_2", "flip-horizontal")
    newShape("door","door1_1_2", {1, 2, 7, 3}, "right")

    --SCREEN 2-2
    newShape("shape","bar1_2_2", {2, 2, 3, 1}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_2_2", {2, 2, 3, 1}, "up")
    newShape("shape","triangle1_2_2", {2, 2, 5, 1}, "triangleTopLeftShape")
    newShape("autoFan","autoFan1_2_2", {2, 2, 6, 1}, "up")
    newShape("door","door1_2_2", {2, 2, 7, 1}, "up")
    newShape("shape","triangle2_2_2", {2, 2, 2, 2}, "triangleBottomRightShape")
    newShape("shape","triangle3_2_2", {2, 2, 6, 2}, "triangleBottomRightShape")
    newShape("backFire","backFire1_2_2", {2, 2, 1, 3})
    newTransition("backFire1_2_2", "slide", {}, {{2,2,1,1},{2,2,1,2},{2,2,1,3},{2,2,1,4}})
    newShape("shape","bar2_2_2", {2, 2, 3, 3}, "bar", {"horz", 4})
    newTransition("bar2_2_2", "slide", {}, {{2,2,3,3},{2,2,3,4}})
    newShape("shape","bar3_2_2", {2, 2, 5, 3}, "bar", {"horz", 4})
    newTransition("bar3_2_2", "slide", {}, {{2,2,5,2},{2,2,5,3}})
    newShape("shape","triangle4_2_2", {2, 2, 7, 3}, "triangleTopLeftShape", {1, 6})
    newShape("shape","triangle5_2_2", {2, 2, 3, 4}, "triangleBottomLeftShape")
    newShape("manualFan","manualFan2_2_2", {2, 2, 5, 4}, "up")
    newShape("shape","triangle6_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")
    newShape("shape","triangle7_2_2", {2, 2, 7, 4}, "triangleBottomRightShape")
    newShape("shape","bar4_2_2", {2, 2, 1, 5}, "bar", {"horz", 3})
    newShape("manualFan","manualFan3_2_2", {2, 2, 2, 5}, "up")
    newShape("manualFan","manualFan4_2_2", {2, 2, 6, 5}, "right")
    newShape("autoFan","autoFan2_2_2", {2, 2, 7, 5}, "left")

    --GEMS
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 6, 3}, "purple")
    newShape("gem","purple", {2, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 5, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 1}, "purple")
    newShape("gem","purple", {2, 2, 3, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 1, 5}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 7, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 1, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {2, 1, 6, 4}, 90)
    newShape("item","coins", {1, 2, 1, 2}, 220)
    newShape("item","coins", {2, 2, 4, 5}, 160)
    newShape("item","small-present", {2, 2, 2, 1}, {})
    newShape("item","small-present", {2, 1, 4, 4}, {})
    newShape("item","big-present", {2, 1, 1, 2}, {})
    newShape("item","bomb", {2, 2, 7, 1}, {})
    newShape("item","clock", {2, 2, 2, 4}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
