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
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 1})
    newShape("shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"vert", 3})
    newShape("shape","bar2_1_1", {1, 1, 5, 2}, "bar", {"vert", 2})
    newShape("simple","simple1_1_1", {1, 1, 6, 2})
    newTransition("simple1_1_1", "autoSlide", {timePerSquare = 400, pauseTime = 0}, {{1,1,4,2},{1,1,6,2}})
    newShape("backFire","backFire1_1_1", {1, 1, 3, 3})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,1,3},{1,1,3,3},{1,1,5,3}})
    newShape("shape","bar3_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    newTransition("bar3_1_1", "autoSlide", {timePerSquare = 340, pauseTime = 0}, {{1,1,2,4},{1,1,3,4}})
    newShape("shape","bar4_1_1", {1, 1, 6, 3}, "bar", {"vert", 3})
    newShape("backFire","backFire2_1_1", {1, 1, 6, 4})
    newTransition("backFire2_1_1", "autoSlide", {timePerSquare = 400, pauseTime = 0, labelled = false}, {{1,1,2,4},{1,1,6,4}})
    newShape("shape","bar5_1_1", {1, 1, 1, 6}, "bar", {"vert"})
    newShape("simple","simple2_1_1", {1, 1, 2, 5})
    newShape("shape","bar6_1_1", {1, 1, 6, 6}, "bar", {"vert", 2})

    --SCREEN 2-1
    newShape("door","door1_1_2", {1, 2, 2, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 2, 2}, "triangleTopRightShape", {1, 13})
    newShape("backFire","backFire1_1_2", {1, 2, 4, 2})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,4,2},{1,2,5,2}})
    newShape("shape","triangle2_1_2", {1, 2, 4, 3}, "triangleLeftAndRightShape", {2})
    newShape("shape","triangle3_1_2", {1, 2, 5, 3}, "triangleLeftAndRightShape", {1})
    newShape("backFire","backFire2_1_2", {1, 2, 7, 4})
    newTransition("backFire2_1_2", "slide", {"lightDarkBlue"}, {{1,2,7,2},{1,2,7,4}})

    --GEMS
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","redCoin", {1, 2, 1, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 2, 4}, 75)
    newShape("item","coins", {1, 2, 3, 3}, 90)
    newShape("item","small-present", {1, 1, 5, 4}, {})

    newShape("item","clock", {1, 2, 1, 3 })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 4
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
