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

    -- SCREEN 1-1
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 2, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 3, 1}, "triangleBottomRightShape")
    newShape("autoFan","autoFan1_1_1", {1, 1, 4, 1}, "left")
    newShape("autoFan","autoFan2_1_1", {1, 1, 6, 1}, "down")
    newShape("shape","triangle4_1_1", {1, 1, 3, 2}, "triangleTopRightShape")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 3}, "down")
    newShape("shape","triangle5_1_1", {1, 1, 6, 3}, "triangleTopLeftShape")
    newShape("shape","triangle6_1_1", {1, 1, 1, 4}, "triangleTopAndBottomShape", {2})
    newShape("shape","bar1_1_1", {1, 1, 4, 4}, "bar", {"horz", 4})
    newTransition("bar1_1_1", "slide", {"brown"}, {{1,1,4,3},{1,1,4,4}})
    newShape("shape","triangle7_1_1", {1, 1, 4, 4}, "triangleTopLeftShape")
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 4}, "up")
    newTransition("autoFan3_1_1", "slide", {"orange"}, {{1,1,6,4},{1,1,6,5,"*"},{1,1,7,5}})
    newShape("shape","triangle8_1_1", {1, 1, 7, 4}, "triangleBottomRightShape", {1, 3})
    newShape("autoFan","autoFan4_1_1", {1, 1, 2, 5}, "up")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("shape","bar1_2_1", {2, 1, 2, 1}, "bar", {"horz"})
    newShape("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape")
    newShape("shape","triangle2_2_1", {2, 1, 2, 2}, "triangleBottomLeftShape", {1, 2})
    newShape("shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomLeftShape")
    newTransition("triangle3_2_1", "slide", {"green"}, {{2,1,5,2},{2,1,6,2}})
    newShape("shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"horz"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 1, 3}, "left")
    newTransition("autoFan1_2_1", "slide", {"orange"}, {{2,1,1,3},{2,1,2,3}})
    newShape("autoFan","autoFan2_2_1", {2, 1, 3, 3}, "left")
    newTransition("autoFan2_2_1", "slide", {"orange"}, {{2,1,3,3},{2,1,3,4},{2,1,3,5}})
    newShape("shape","triangle4_2_1", {2, 1, 4, 3}, "triangleBottomRightShape", {1, 9})
    newShape("shape","triangle5_2_1", {2, 1, 6, 3}, "triangleTopAndBottomShape", {2})
    newShape("shape","triangle6_2_1", {2, 1, 2, 4}, "triangleTopRightShape")
    newShape("autoFan","autoFan3_2_1", {2, 1, 4, 4}, "up")
    newShape("shape","triangle7_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle7_2_1", "slide", {"green"}, {{2,1,5,3},{2,1,5,4}})
    newShape("door","door2_2_1", {2, 1, 1, 5}, "left")
    newShape("autoFan","autoFan4_2_1", {2, 1, 6, 5}, "left")

    --GEMS
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 2}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","redCoin", {2, 1, 7, 2}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 3, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --newShape("item","coins", {1, 1, 4, 5}, 80)
    --newShape("item","coins", {2, 1, 4, 2}, 250)

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
