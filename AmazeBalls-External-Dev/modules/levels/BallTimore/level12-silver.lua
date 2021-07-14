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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle3_1_1", {1, 1, 1, 2}, "triangleTopRightShape", {1, 1, "icy"})
    newShape("shape","triangle4_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape")
    newTransition("triangle4_1_1", "flip-horizontal")
    newShape("shape","triangle5_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 3})
    newShape("backFire","backFire1_1_1", {1, 1, 1, 4})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,4},{1,1,3,4},{1,1,4,4},{1,1,7,4}})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","bar2_1_1", {1, 1, 3, 6}, "bar", {"vert", 3})
    newShape("shape","bar3_1_1", {1, 1, 4, 6}, "bar", {"vert", 4})
    newShape("shape","bar4_1_1", {1, 1, 7, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("door","door1_1_2", {1, 2, 2, 1, "up", "disabled"})
    newShape("shape","triangle1_1_2", {1, 2, 6, 1}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("gun","gun1_1_2", {1, 2, 3, 2}, "down")
    newShape("shape","triangle2_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 6, 4}, "right")
    newShape("shape","triangle3_1_2", {1, 2, 3, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 4, 1}, { {"door-open","door1_1_2"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 1, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 1}, 90)
    newShape("item","coins", {1, 2, 2, 1}, 70)
    newShape("item","small-present", {1, 2, 1, 4}, {})

    newShape("item","hook", {1, 2, 6, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
