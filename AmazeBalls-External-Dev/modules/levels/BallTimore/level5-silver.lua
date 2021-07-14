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
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 1}, "left")
    newShape("shape","triangle1_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape")
    newShape("autoFan","autoFan2_1_1", {1, 1, 3, 2}, "right")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,3,2},{1,1,4,2},{1,1,5,2}})
    newShape("shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopLeftShape")
    newShape("shape","triangle1_1_1", {1, 1, 6, 3}, "triangleBottomRightShape")
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 4}, "down")
    newShape("manualFan","manualFan2_1_1", {1, 1, 4, 4}, "down")
    newShape("gun","gun1_1_1", {1, 1, 5, 4}, "up")
    newShape("door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 1-2
    newShape("backFire","backFire1_1_2", {1, 2, 3, 1})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,3,2},{1,2,3,1},{1,2,4,1}})
    newShape("backFire","backFire2_1_2", {1, 2, 5, 1})
    newTransition("backFire2_1_2", "slide", {}, {{1,2,5,3},{1,2,5,2},{1,2,5,1},{1,2,6,1}})
    newShape("shape","triangle1_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,6,4},{1,2,7,4},{1,2,7,2}})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 4}, "up")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,1,4},{1,2,3,4}})
    newShape("shape","bar1_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    newShape("shape","bar2_1_2", {1, 2, 3, 5}, "bar", {"vert", 3})
    newShape("autoFan","autoFan2_1_2", {1, 2, 4, 5}, "right")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,4,3},{1,2,4,5},{1,2,6,5}})
    newShape("door","door1_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 1-3
    newShape("shape","triangle1_1_3", {1, 3, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_3", {1, 3, 7, 1}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("shape","triangle3_1_3", {1, 3, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_3", {1, 3, 4, 3}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("endPoint","endPoint1_1_3", {1, 3, 7, 4})
    newShape("simple","simple1_1_3", {1, 3, 1, 5})
    newTransition("simple1_1_3", "slide", {}, {{1,3,1,3},{1,3,1,5}})
    newShape("shape","triangle5_1_3", {1, 3, 3, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape","bar1_1_3", {1, 3, 7, 5}, "bar", {"vert"})
    newShape("shape","triangle6_1_3", {1, 3, 7, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 3, 1, 1}, "purple")
    newShape("gem","purple", {1, 3, 3, 1}, "purple")
    newShape("gem","purple", {1, 3, 5, 1}, "purple")
    newShape("gem","purple", {1, 3, 4, 2}, "purple")
    newShape("gem","purple", {1, 3, 5, 3}, "purple")
    newShape("gem","purple", {1, 3, 7, 3}, "purple")
    newShape("gem","purple", {1, 3, 2, 3}, "purple")
    newShape("gem","purple", {1, 3, 3, 4}, "purple")
    newShape("gem","purple", {1, 3, 4, 5}, "purple")
    newShape("gem","purple", {1, 3, 6, 5}, "purple")
    newShape("gem","purple", {1, 3, 2, 5}, "purple")
    newShape("gem","redCoin", {1, 2, 7, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 6, 5}, "blueCoin")
    newShape("gem","purpleCoin", {1, 3, 4, 4}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 7, 3}, 12)
    newShape("item","coins", {1, 2, 2, 1}, 14)
    newShape("item","coins", {1, 3, 6, 3}, 27)
    newShape("item","small-present", {1, 2, 2, 5}, {})
    newShape("item","small-present", {1, 3, 3, 2}, {})
    newShape("item","big-present", {1, 3, 6, 1}, {})
    newShape("item","superDummy", 1, 2, 1, 2}, {})
    newShape("item","iceCape", {1, 3, 2, 1}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
