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
    newShape("spitter","spitter1_1_1", {1, 1, 1, 1, "up", "none", "down", "none"})
    newShape("spitter","spitter2_1_1", {1, 1, 4, 1}, {"none", "none", "down"}, "left")
    newShape("spitter","spitter3_1_1", {1, 1, 6, 1}, {"none", "right", "none", "none"})
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("endPoint","endPoint1_1_1", {1, 1, 5, 2})
    newShape("spitter","spitter4_1_1", {1, 1, 6, 2, "up", "none", "none", "none"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 3}, "right")
    newShape("spitter","spitter5_1_1", {1, 1, 4, 3, "up", "right", "none", "none"})
    newShape("spitter","spitter6_1_1", {1, 1, 7, 3}, {"none", "none", "down", "none"})
    newShape("manualFan","manualFan2_1_1", {1, 1, 2, 4}, "left")
    newShape("spitter","spitter7_1_1", {1, 1, 6, 4, "up", "none", "down", "none"})
    newShape("manualFan","manualFan3_1_1", {1, 1, 7, 4}, "up")
    newShape("door","door2_1_1", {1, 1, 7, 4}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 1, 5}, "triangleBottomRightShape")
    newShape("item","map", {1, 1, 2, 5})
    newShape("shape","triangle2_1_1", {1, 1, 5, 5}, "triangleTopRightShape", {1, 13})
    --newShape("item","coins", {1, 1, 2, 1}, 50)

    --SCREEN 2-1
    newShape("spitter","spitter1_2_1", {2, 1, 2, 1}, {"none", "right", "down", "none"})
    newShape("spitter","spitter2_2_1", {2, 1, 5, 1}, {"none", "right", "down", "none"})
    newShape("shape","bar1_2_1", {2, 1, 6, 1}, "bar", {"vert", 3})
    newShape("autoFan","autoFan1_2_1", {2, 1, 7, 1}, "down")
    newShape("spitter","spitter3_2_1", {2, 1, 4, 2}, {"none", "right", "down", "none"})
    newShape("spitter","spitter4_2_1", {2, 1, 6, 2, "up", "none", "down", "none"})
    newShape("autoFan","autoFan2_2_1", {2, 1, 2, 3}, "right")
    newShape("spitter","spitter5_2_1", {2, 1, 4, 3, "up", "none", "down", "none"})
    newShape("door","door1_2_1", {2, 1, 1, 4}, "left")
    --newShape("item","coins", {2, 1, 2, 4}, 100)
    newShape("manualFan","manualFan1_2_1", {2, 1, 5, 4}, "left")
    newShape("door","door2_2_1", {2, 1, 1, 5}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 4, 5}, "left")
    newShape("spitter","spitter6_2_1", {2, 1, 5, 5}, {"none", "right", "none"}, "left")
    --newShape("item","coins", {2, 1, 1, 1}, 50)
    newShape("shape","bar2_2_1", {2, 1, 4, 6}, "bar", {"vert", 2})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 6, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {2, 1, 6, 4}, 140)
    newShape("item","small-present", {2, 1, 3, 3}, {})

    newShape("item","big-present", {2, 1, 7, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
