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
    newShape("shape", "bar1_1_1", {1, 1, 3, 2}, "bar", {"horz"})
    newTransition("bar1_1_1", "slide", {"brown"}, {{1,1,3,2},{1,1,3,3}})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 6, 2}, "down")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 2, 3})
    newShape("shape", "bar2_1_1", {1, 1, 4, 3}, "bar", {"horz", 3})
    newTransition("bar2_1_1", "slide", {"brown"}, {{1,1,4,3},{1,1,4,4}})
    newShape("shape", "bar3_1_1", {1, 1, 5, 3}, "bar", {"horz", 3})
    newTransition("bar3_1_1", "slide", {"brown"}, {{1,1,5,2},{1,1,5,3}})
    newShape("shape", "bar4_1_1", {1, 1, 7, 3}, "bar", {"horz", 3})
    newTransition("bar4_1_1", "slide", {"brown"}, {{1,1,7,1},{1,1,7,2},{1,1,7,3}})
    newShape("simple", "simple1_1_1", {1, 1, 6, 4})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 5}, "right")
    newShape("door", "door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 1-2
    newShape("door", "door1_2_1", {2, 1, 1, 2}, "left")
    newShape("shape", "triangle1_2_1", {2, 1, 4, 2}, "triangleTopAndBottomShape", {2})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,3,2},{2,1,4,2}})
    newShape("door", "door2_2_1", {2, 1, 1, 3}, "left")
    newShape("shape", "bar1_2_1", {2, 1, 2, 3}, "bar", {"horz", 3})
    newTransition("bar1_2_1", "slide", {"brown"}, {{2,1,2,1},{2,1,2,3}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 3, 3}, "left")
    newShape("simple", "simple1_2_1", {2, 1, 1, 5})
    newShape("shape", "triangle2_2_1", {2, 1, 4, 5}, "triangleTopAndBottomShape", {1})
    newTransition("triangle2_2_1", "slide", {}, {{2,1,3,5},{2,1,4,5}})

    --GEMS
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 1, 2}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "redCoin", {2, 1, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 1, 3}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 3, 3}, "purpleCoin")

    --ITEMS
    --newShape("item", "coins", {1, 1, 7, 5}, 90)
    --newShape("item", "coins", {2, 1, 6, 5}, 250)

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 6
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
