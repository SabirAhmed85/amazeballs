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
    newShape("item","map", {1, 1, 1, 1})
    newShape("spitter","spitter1_1_1", {1, 1, 3, 1}, {"none","right","none","left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,3,1},{1,1,3,3}})
    newShape("shape","triangle2_1_1", {1, 1, 6, 1}, "triangleBottomLeftShape", {1, 23, "breakable"})
    newShape("spitter","spitter2_1_1", {1, 1, 2, 2}, {"none","none","down","none"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,2,2},{1,1,2,4}})
    newShape("shape","bar1_1_1", {1, 1, 4, 2}, "bar", {"horz", 2})
    newShape("spitter","spitter3_1_1", {1, 1, 5, 2}, {"none","right","none","none"})
    newTransition("spitter3_1_1", "slide", {}, {{1,1,5,2},{1,1,5,3}})
    newShape("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("door","door1_1_1", {1, 1, 2, 5}, "down")
    newShape("spitter","spitter4_1_1", {1, 1, 6, 5}, {"none","right","none","left"})
    newTransition("spitter4_1_1", "slide", {}, {{1,1,6,3},{1,1,6,5}})
    newShape("shape","triangle3_1_1", {1, 1, 7, 5}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 5, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 6, 1}, "up")
    newShape("spitter","spitter1_1_2", {1, 2, 2, 3}, {"none","right","none","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,2},{1,2,2,3}})
    newShape("spitter","spitter2_1_2", {1, 2, 5, 3, "up","none","none","none"})
    newTransition("spitter2_1_2", "slide", {}, {{1,2,5,1},{1,2,5,3}})
    newShape("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 4})
    newShape("spitter","spitter3_1_2", {1, 2, 6, 3, "up","none","none","left"})
    newTransition("spitter3_1_2", "slide", {}, {{1,2,6,3},{1,2,6,5}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 7, 3})
    newShape("spitter","spitter4_1_2", {1, 2, 4, 5}, {"none","right","none","none"})
    newTransition("spitter4_1_2", "slide", {}, {{1,2,4,2},{1,2,4,4},{1,2,4,5}})

    --SWITCHES

    --GEMS
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 7, 1}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 5}, 130)
    newShape("item","coins", {1, 2, 1, 2}, 140)
    newShape("item","big-present", {1, 2, 2, 5}, {})
    newShape("item","small-present", {1, 1, 4, 2}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
