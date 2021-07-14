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
    newShape("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz"})
    newShape("shape","bar2_1_1", {1, 1, 1, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "down")
    newShape("shape","bar3_1_1", {1, 1, 2, 1}, "bar", {"horz"})
    newShape("manualFan","manualFan2_1_1", {1, 1, 2, 2}, "down")
    newTransition("manualFan2_1_1", "slide", {}, {{1,1,2,2},{1,1,2,1},{1,1,3,1}})
    newShape("shape","bar4_1_1", {1, 1, 1, 3}, "bar", {"horz", 2})
    newShape("manualFan","manualFan3_1_1", {1, 1, 1, 3}, "up")
    newTransition("manualFan3_1_1", "slide", {}, {{1,1,1,3},{1,1,1,5}})
    newShape("backFire","backFire1_1_1", {1, 1, 5, 4})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,3,4},{1,1,5,4}})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","bar5_1_1", {1, 1, 3, 5}, "bar", {"horz"})
    newShape("simple","simple1_1_1", {1, 1, 6, 5})
    newTransition("simple1_1_1", "slide", {}, {{1,1,5,5},{1,1,6,5},{1,1,6,3},{1,1,7,3}})
    newShape("shape","triangle1_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, 4})
    newShape("shape","bar6_1_1", {1, 1, 8, 5}, "bar", {"horz"})

    --SCREEN 1-2
    newShape("autoFan","autoFan1_1_2", {1, 2, 5, 1}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,2,1},{1,2,5,1},{1,2,5,3}})
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 2}, "down")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,6,2},{1,2,7,2}})
    newShape("autoFan","autoFan3_1_2", {1, 2, 2, 2}, "right")
    newTransition("autoFan3_1_2", "slide", {}, {{1,2,1,3},{1,2,1,2},{1,2,2,2}})
    newShape("backFire","backFire1_1_2", {1, 2, 3, 3})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,1,5},{1,2,3,5},{1,2,3,3}})
    newShape("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2})
    newShape("door","door1_1_2", {1, 2, 7, 3}, "right")
    newShape("backFire","backFire2_1_2", {1, 2, 6, 5})
    newTransition("backFire2_1_2", "slide", {}, {{1,2,5,5},{1,2,6,5},{1,2,6,4}})

    --SCREEN 2-2
    newShape("backFire","backFire1_2_2", {2, 2, 1, 3})
    newShape("endPoint","endPoint1_2_2", {2, 2, 5, 3})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 7, 3}, "purple")
    newShape("gem","redCoin", {1, 2, 7, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 4, 3}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 3, 3}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 1, 2}, 225)
    newShape("item","coins", {1, 2, 7, 3}, 80)
    newShape("item","big-present", {2, 2, 4, 3}, {})
    newShape("item","small-present", {1, 1, 7, 4}, {})
    newShape("item","small-present", {1, 2, 7, 5}, {})
    newShape("item","small-present", {1, 2, 4, 5}, {})
    newShape("item","characterSpecial", {2, 2, 6, 3}, {})
    newShape("item","clock", {1, 1, 5, 1, "clock1_1_1", 10, 1})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
