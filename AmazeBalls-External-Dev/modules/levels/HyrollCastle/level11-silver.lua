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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 2})
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 1})
    newShape("backFire","backFire1_1_1", {1, 1, 7, 1})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,3,1},{1,1,5,1},{1,1,7,1},{1,1,7,2}})
    newShape("shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 4})
    newShape("shape","triangle1_1_1", {1, 1, 1, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("simple","simple1_1_1", {1, 1, 3, 3}, "right")
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,3},{1,1,4,3},{1,1,5,3}})
    newShape("shape","bar3_1_1", {1, 1, 3, 3}, "bar", {"vert", 2})
    newShape("shape","bar4_1_1", {1, 1, 4, 3}, "bar", {"vert", 2})
    newShape("shape","bar5_1_1", {1, 1, 5, 5}, "bar", {"vert", 2})
    newShape("shape","triangle3_1_1", {1, 1, 5, 5}, "triangleBottomLeftShape")

    --SCREEN 1-2
    newShape("backFire","backFire1_1_2", {1, 2, 5, 1})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,5,1},{1,2,5,2}})
    newShape("door","door1_1_2", {1, 2, 7, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 2, 2}, "triangleBottomRightShape")
    newShape("shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 3})
    newTransition("bar1_1_2", "switchSlide", {}, {{1,2,3,1},{1,2,3,2}})
    newShape("shape","bar2_1_2", {1, 2, 7, 2}, "bar", {"horz"})
    newShape("shape","bar3_1_2", {1, 2, 4, 3}, "bar", {"vert", 2})
    newShape("shape","triangle1_1_2", {1, 2, 4, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("backFire","backFire2_1_2", {1, 2, 4, 5})
    newTransition("backFire2_1_2", "slide", {}, {{1,2,4,5},{1,2,7,5}})
    newShape("shape","bar4_1_2", {1, 2, 7, 6}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 4, 1}, { {"slide", "bar1_1_2"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 5, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 4, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 5}, 90)
    newShape("item","coins", {1, 2, 4, 4}, 150)
    newShape("item","small-present", {1, 1, 1, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
