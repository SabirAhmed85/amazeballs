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
    newShape("shape","triangle1_2_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle2_1_1", {1, 1, 2, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape","bar1_1_1", {1, 1, 4, 3}, "bar", {"vert", 3})
    newShape("shape","bar2_1_1", {1, 1, 2, 4}, "bar", {"vert", 3})
    newShape("shape","bar3_1_1", {1, 1, 3, 4}, "bar", {"vert", 3})
    newShape("spitter","spitter1_1_1", {1, 1, 4, 5, "up","right","down","left"})
    newShape("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    newShape("manualFan","manualFan2_2_1", {2, 1, 5, 1}, "up")
    newShape("manualFan","manualFan3_2_1", {2, 1, 7, 1}, "left")
    newShape("shape","bar1_2_1", {2, 1, 7, 1}, "bar", {"vert", 4})
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 2}, "down")
    newShape("manualFan","manualFan4_2_1", {2, 1, 5, 2}, "left")
    newShape("tunnel","tunnel1_2_1", {2, 1, 1, 3, 2, 1, 7, 5, "none"})
    newTransition("tunnel1_2_1", "slide", {}, {{2,1,1,1},{2,1,1,3}})
    newShape("shape","triangle1_2_1", {2, 1, 4, 3}, "triangleBottomRightShape")
    newShape("autoFan","autoFan2_2_1", {2, 1, 6, 3}, "down")
    newShape("autoFan","autoFan3_2_1", {2, 1, 3, 4}, "right")
    newShape("manualFan","manualFan5_2_1", {2, 1, 7, 4}, "up")
    newShape("shape","bar2_2_1", {2, 1, 8, 4}, "bar", {"horz", 4})
    newShape("shape","triangle2_2_1", {2, 1, 4, 5}, "triangleTopRightShape", {1, 13})
    newShape("door","door1_2_1", {2, 1, 6, 5}, "down")

    --SCREEN 2-2
    newShape("endPoint","endPoint1_2_2", {2, 2, 1, 1})
    newShape("manualFan","manualFan1_2_2", {2, 2, 4, 1}, "right")
    newShape("autoFan","autoFan1_2_2", {2, 2, 5, 1}, "down")
    newShape("manualFan","manualFan2_2_2", {2, 2, 2, 2}, "up")
    newShape("manualFan","manualFan3_2_2", {2, 2, 6, 2}, "right")
    newShape("tunnel","tunnel1_2_2", {2, 2, 3, 3, 2, 2, 1, 5, "none"})
    newShape("manualFan","manualFan4_2_2", {2, 2, 5, 3}, "right")
    newShape("shape","triangle1_2_2", {2, 2, 4, 4}, "triangleBottomRightShape")
    newTransition("triangle1_2_2", "slide", {}, {{2,2,2,5},{2,2,2,4,"*"},{2,2,4,4}})
    newShape("manualFan","manualFan5_2_2", {2, 2, 6, 4}, "left")
    newShape("shape","bar1_2_2", {2, 2, 2, 5}, "bar", {"horz", 2})
    newShape("manualFan","manualFan6_2_2", {2, 2, 3, 5}, "up")
    newShape("autoFan","autoFan2_2_2", {2, 2, 7, 5}, "right")
    newTransition("autoFan2_2_2", "slide", {}, {{2,2,6,5},{2,2,7,5}})

    --GEMS  
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 5, 2}, "purple")
    newShape("gem","purple", {2, 2, 2, 1}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","redCoin", {2, 1, 7, 2}, "redCoin")
    newShape("gem","blueCoin", {2, 2, 1, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 4, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 3, 2, 215})
    newShape("item","coins", {2, 1, 6, 5}, 75)
    newShape("item","coins", {2, 2, 6, 3}, 180)
    newShape("item","coins", {2, 2, 4, 5}, 105})
    newShape("item","small-present", {1, 1, 4, 2}, {})
    newShape("item","clock", {2, 2, 4, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 5
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
