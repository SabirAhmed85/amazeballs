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
    
    -- 1-1
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape")
    newShape("shape", "triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape")
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"vert", 4})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 2}, "up")
    newTransition("autoFan1_1_1", "autoSlide", {timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500}, {{1,1,2,3},{1,1,2,2},{1,1,5,2}})
    newShape("shape", "triangle1_1_1", {1, 1, 6, 3}, "triangleBottomLeftShape", {1, 2})
    newShape("shape", "bar2_1_1", {1, 1, 2, 4}, "bar", {"horz", 3})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 2, 4}, "right")
    newTransition("autoFan2_1_1", "autoSlide", {timePerSquare = 200, isActiveWhenSliding = false, pauseTime = 2500}, {{1,1,2,5},{1,1,2,4},{1,1,5,4}})
    newShape("shape", "triangle1_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    newShape("shape", "bar3_1_1", {1, 1, 2, 5}, "bar", {"horz", 3})
    newShape("simple", "simple1_1_1", {1, 1, 3, 5})
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,3},{1,1,3,5}})
    newShape("door", "door1_1_1", {1, 1, 4, 5}, "down")
    newShape("backFire", "backFire1_1_1", {1, 1, 6, 5})
    newTransition("backFire1_1_1", "slide", {"lightDarkBlue"}, {{1,1,5,5},{1,1,6,5},{1,1,7,4}})
    newShape("shape", "bar4_1_1", {1, 1, 6, 6}, "bar", {"vert", 3})

    --SCREEN 1-2
    newShape("backFire", "backFire1_1_2", {1, 2, 1, 1})
    newTransition("backFire1_1_2", "slide", {"lightDarkBlue"}, {{1,2,1,1},{1,2,1,3},{1,2,3,1}})
    newShape("shape", "bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    newShape("shape", "bar2_1_2", {1, 2, 7, 1}, "bar", {"vert", 2})
    newShape("endPoint", "endPoint1_1_2", {1, 2, 7, 1})
    newShape("simple", "simple1_1_2", {1, 2, 7, 2})
    newTransition("simple1_1_2", "slide", {}, {{1,2,5,2},{1,2,6,2},{1,2,7,2}})
    newShape("shape", "bar3_1_2", {1, 2, 5, 4}, "bar", {"vert"})
    newShape("shape", "triangle1_1_2", {1, 2, 6, 4}, "triangleTopRightShape", {1, 13})
    newShape("shape", "triangle2_1_2", {1, 2, 1, 5}, "triangleTopLeftShape")
    newShape("backFire", "backFire2_1_2", {1, 2, 4, 5})
    newTransition("backFire2_1_2", "slide", {"lightDarkBlue"}, {{1,2,3,5},{1,2,4,5},{1,2,4,4},{1,2,4,3}})
    newShape("shape", "bar4_1_2", {1, 2, 5, 5}, "bar", {"vert"})

    --GEMS
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 2}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 1}, "purple")
    newShape("gem", "redCoin", {1, 1, 1, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 5, 4}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 2, 7, 4}, 150)
    newShape("item", "coins", {1, 2, 2, 4}, 75)
    newShape("item", "coins", {1, 1, 1, 4}, 150)
    newShape("item", "small-present", {1, 1, 7, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t