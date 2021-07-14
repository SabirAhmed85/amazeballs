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
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 1}, "down")
    newTransition("autoFan1_1_1", "slide", {"darkBlue"}, {{1,1,4,1},{1,1,5,1},{1,1,6,1}})
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleTopRightShape", {1, 1, "breakable"})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")
    newShape("spitter","spitter1_1_1", {1, 1, 7, 5, "up","none","none","left"})
    newTransition("spitter1_1_1", "slide", {"darkBlue"}, {{1,1,7,4},{1,1,7,5}})

    --SCREEN 1-2
    newShape("manualFan","manualFan1_1_2", {1, 2, 1, 1}, "right")
    newShape("manualFan","manualFan2_1_2", {1, 2, 5, 1}, "down")
    newShape("door","door1_1_2", {1, 2, 7, 1}, "up")
    newShape("autoFan","autoFan1_1_2", {1, 2, 2, 2}, "down")
    newShape("manualFan","manualFan3_1_2", {1, 2, 3, 2}, "left")
    newShape("autoFan","autoFan2_1_2", {1, 2, 6, 2}, "left")
    newShape("manualFan","manualFan4_1_2", {1, 2, 3, 3}, "right")
    newShape("shape","bar1_1_2", {1, 2, 5, 3}, "bar", {"horz"})
    newShape("manualFan","manualFan5_1_2", {1, 2, 5, 3}, "right")
    newShape("shape","triangle1_1_2", {1, 2, 7, 3}, "triangleTopLeftShape", {1, 6})
    newShape("autoFan","autoFan3_1_2", {1, 2, 1, 4}, "up")
    newShape("manualFan","manualFan6_1_2", {1, 2, 3, 4}, "left")
    newShape("endPoint","endPoint1_1_2", {1, 2, 4, 4})
    newShape("manualFan","manualFan7_1_2", {1, 2, 2, 5}, "right")
    newShape("manualFan","manualFan8_1_2", {1, 2, 5, 5}, "up")

    --GEMS
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","redCoin", {1, 2, 1, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 6, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 4}, 29)
    newShape("item","coins", {1, 2, 3, 1}, 4)
    newShape("item","coins", {1, 2, 4, 3}, 20)
    newShape("item","big-present", {1, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
