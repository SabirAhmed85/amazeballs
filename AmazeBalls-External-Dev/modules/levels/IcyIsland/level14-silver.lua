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
    newShape("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleLeftAndRightShape", {2})
    newShape("shape","bar1_1_1", {1, 1, 1, 2}, "bar", {"horz", 3})
    newShape("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomRightShape")
    newTransition("triangle2_1_1", "flip-vertical")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")

    --SCREEN 2-1
    newShape("shape","bar1_2_1", {2, 1, 7, 2}, "bar", {"horz"})
    newShape("shape","triangle2_2_1", {2, 1, 7, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","bar2_2_1", {2, 1, 8, 2}, "bar", {"horz"})
    newShape("spitter","spitter1_2_1", {2, 1, 3, 3}, {"none", "right", "none"}, "left")
    newTransition("spitter1_2_1", "slide", {}, {{2,1,3,3},{2,1,3,4},{2,1,3,5}})
    newShape("shape","bar3_2_1", {2, 1, 7, 3}, "bar", {"horz"})
    newTransition("bar3_2_1", "autoSlide", {}, {{2,1,7,3},{2,1,7,5}})
    newShape("door","door1_2_1", {2, 1, 1, 4}, "left")
    newShape("shape","bar4_2_1", {2, 1, 6, 4}, "bar", {"horz", 3})
    --newShape("item","coins", {2, 1, 6, 4}, 100)
    newShape("shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("door","door2_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 2-2
    newShape("endPoint","endPoint1_2_2", {2, 2, 3, 4})
    newShape("spitter","spitter1_2_2", {2, 2, 7, 4, "up", "right", "none", "none"})


    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 7, 4}, { {"door-open","door1_2_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 7, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","redCoin", {2, 1, 6, 4}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 2, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 5, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 7, 3, 445})
    newShape("item","big-present", {1, 1, 7, 5}, {})
    newShape("item","big-present", {2, 1, 1, 4}, {})
    newShape("item","small-present", {2, 1, 1, 5}, {})
    newShape("item","small-present", {2, 2, 4, 4}, {})
    newShape("item","characterSpecial", {2, 2, 7, 1}, {})
    newShape("item","hook", {2, 1, 5, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
