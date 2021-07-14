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
    newShape("autoFan","autoFan1_1_1", {1, 1, 3, 1}, "right")
    newShape("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    newShape("autoFan","autoFan2_1_1", {1, 1, 5, 1}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape", {1, 8})
    newTransition("triangle1_1_1", "slide", {"green"}, {{1,1,1,2},{1,1,3,2}})
    newShape("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleTopLeftShape", {1, 11})
    newTransition("triangle2_1_1", "slide", {"green"}, {{1,1,5,2},{1,1,7,2}})
    newShape("autoFan","autoFan3_1_1", {1, 1, 1, 3}, "right")
    newShape("autoFan","autoFan4_1_1", {1, 1, 7, 3}, "down")
    newShape("endPoint","endPoint1_1_1", {1, 1, 2, 4})
    newShape("autoFan","autoFan5_1_1", {1, 1, 4, 4}, "up")
    newTransition("autoFan5_1_1", "slide", {"orange"}, {{1,1,3,3},{1,1,4,4}})
    newShape("shape","triangle3_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    newTransition("triangle3_1_1", "slide", {"green"}, {{1,1,5,4},{1,1,6,4}})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 5}, "up")
    newShape("simple","simple1_1_1", {1, 1, 4, 5})
    newShape("shape","triangle4_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, 11})
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 4, 1, "up", "disabled"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 2, 2}, "bar", {"vert"})
    newShape("shape","bar2_1_2", {1, 2, 3, 2}, "bar", {"vert"})
    newShape("shape","bar3_1_2", {1, 2, 4, 2}, "bar", {"vert"})
    newShape("shape","bar4_1_2", {1, 2, 5, 2}, "bar", {"vert"})
    newShape("shape","bar5_1_2", {1, 2, 6, 2}, "bar", {"vert"})
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 1}, "left")
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 2}, "down")
    newShape("switch","switch1_1_2", {1, 2, 4, 2}, { {"door-open", "door2_1_2"} })
    newShape("shape","bar6_1_2", {1, 2, 4, 3}, "bar", {"vert"})
    newShape("manualFan","manualFan2_1_2", {1, 2, 6, 2}, "left")
    newShape("characterChangePoint","characterChangePoint1_1_2", {1, 2, 1, 3})
    newShape("autoFan","autoFan3_1_2", {1, 2, 2, 3}, "down")
    newShape("shape","triangle1_1_2", {1, 2, 4, 3}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("autoFan","autoFan4_1_2", {1, 2, 4, 4}, "down")
    newShape("shape","triangle2_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, 15, "breakable"})
    newShape("autoFan","autoFan5_1_2", {1, 2, 2, 5}, "right")
    newShape("simple","simple1_1_2", {1, 2, 5, 5})
    newShape("autoFan","autoFan5_1_2", {1, 2, 7, 5}, "up")

    --GEMS
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","redCoin", {1, 2, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 4, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 2, 5, 3}, 250)
    newShape("item","coins", {1, 2, 7, 4}, 75)
    newShape("item","coins", {1, 2, 6, 1}, 75)
    newShape("item","small-present", {1, 1, 7, 1}, {})

    newShape("item","big-present", {1, 2, 1, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t