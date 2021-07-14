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
    newShape("item","map", {1, 1, 5, 3})
    newShape("shape","triangle1_1_1", {1, 1, 1, 4}, "triangleTopLeftShape", {1, 11})
    newShape("spitter","spitter1_1_1", {1, 1, 5, 4}, {"none","right","down","left"})
    newShape("door","door1_1_1", {1, 1, 5, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,2,1},{1,2,2,2}})
    newShape("autoFan","autoFan1_1_2", {1, 2, 4, 1}, "down")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,4,1},{1,2,5,1},{1,2,5,2}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 6, 1}, "left")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,6,1},{1,2,7,1}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 1, 2})
    newShape("shape","triangle2_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape")
    newTransition("triangle2_1_2", "slide", {}, {{1,2,6,2},{1,2,6,3},{1,2,7,5}})
    newShape("shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"horz"})
    newShape("shape","bar1_1_2", {1, 2, 3, 3}, "bar", {"vert", 3})
    newShape("manualFan","manualFan2_1_2", {1, 2, 3, 3}, "right")
    newShape("manualFan","manualFan3_1_2", {1, 2, 5, 3}, "down")
    newShape("shape","bar1_1_2", {1, 2, 6, 3}, "bar", {"horz", 2})
    newShape("shape","triangle3_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "slide", {}, {{1,2,1,5},{1,2,1,4},{1,2,3,4}})
    newShape("door","door1_1_2", {1, 2, 2, 5}, "down")
    newShape("door","door2_1_2", {1, 2, 4, 5}, "down")
    newShape("door","door3_1_2", {1, 2, 5, 5}, "down")

    --SCREEN 1-3
    newShape("shape","bar1_1_3", {1, 3, 1, 1}, "bar", {"horz", 2})
    newShape("door","door3_1_3", {1, 3, 3, 1}, "up")
    newShape("door","door3_1_3", {1, 3, 4, 1}, "up")
    newShape("shape","triangle1_1_3", {1, 3, 4, 2}, "triangleTopRightShape")
    newTransition("triangle1_1_3", "slide", {}, {{1,3,4,3},{1,3,4,2},{1,3,5,2},{1,3,5,1}})
    newShape("manualFan","manualFan1_1_3", {1, 3, 6, 1}, "down")
    newShape("door","door3_1_3", {1, 3, 7, 1}, "up")
    newShape("shape","bar2_1_3", {1, 3, 1, 2}, "bar", {"horz", 2})
    newShape("shape","triangle1_1_3", {1, 3, 1, 2}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_3", {1, 3, 2, 2}, "left")
    newTransition("autoFan1_1_3", "slide", {}, {{1,3,2,2},{1,3,3,2}})
    newShape("shape","bar3_1_3", {1, 3, 3, 3}, "bar", {"horz", 3})
    newShape("autoFan","autoFan2_1_3", {1, 3, 3, 3}, "up")
    newShape("manualFan","manualFan3_1_3", {1, 3, 5, 3}, "left")
    newShape("shape","bar4_1_3", {1, 3, 6, 3}, "bar", {"horz", 2})
    newShape("shape","bar5_1_3", {1, 3, 3, 4}, "bar", {"vert"})
    newShape("shape","bar6_1_3", {1, 3, 5, 4}, "bar", {"vert", 2})
    newShape("autoFan","autoFan3_1_3", {1, 3, 2, 5}, "right")
    newTransition("autoFan3_1_3", "slide", {}, {{1,3,1,5},{1,3,2,5}})
    newShape("shape","triangle1_1_3", {1, 3, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --GEMS
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 3, 3, 1}, "purple")
    newShape("gem","purple", {1, 3, 1, 3}, "purple")
    newShape("gem","purple", {1, 3, 3, 5}, "purple")
    newShape("gem","purple", {1, 3, 5, 5}, "purple")
    newShape("gem","purple", {1, 3, 7, 4}, "purple")
    newShape("gem","purple", {1, 3, 7, 2}, "purple")
    newShape("gem","purple", {1, 3, 4, 1}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 1, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 3, 4, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 2, 4}, 110)
    newShape("item","coins", {1, 2, 2, 3}, 80)
    newShape("item","coins", {1, 2, 2, 5}, 60)
    newShape("item","big-present", {1, 2, 7, 2}, {})
    newShape("item","small-present", {1, 2, 4, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
