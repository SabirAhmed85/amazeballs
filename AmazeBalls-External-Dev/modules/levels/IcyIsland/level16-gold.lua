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
    newShape("spitter","spitter1_1_1", {1, 1, 1, 1}, {"none","right","down","none"})
    newShape("shape","bar1_1_1", {1, 1, 3, 1}, "bar", {"vert", 3})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    newTransition("autoFan1_1_1", "slide", {}, {{1,1,2,2},{1,1,3,2}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 4, 2}, "up")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,4,1},{1,1,4,2}})
    newShape("autoFan","autoFan3_1_1", {1, 1, 5, 2}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 6, 2}, "triangleBottomRightShape")
    newShape("autoFan","autoFan4_1_1", {1, 1, 7, 2}, "left")
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 3}, "down")
    newShape("manualFan","manualFan2_1_1", {1, 1, 3, 3}, "up")
    newShape("manualFan","manualFan3_1_1", {1, 1, 7, 3}, "right")
    newShape("shape","bar2_1_1", {1, 1, 7, 4}, "bar", {"vert"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 3, 4})
    newShape("manualFan","manualFan4_1_1", {1, 1, 5, 4}, "left")
    newShape("shape","triangle2_1_1", {1, 1, 6, 4}, "triangleTopLeftShape", {1, 11})
    newShape("spitter","spitter1_1_1", {1, 1, 1, 5, "up","right","none","none"})
    newShape("manualFan","manualFan5_1_1", {1, 1, 4, 5}, "right")
    newShape("shape","bar3_1_1", {1, 1, 5, 6}, "bar", {"vert", 2})
    newShape("manualFan","manualFan6_1_1", {1, 1, 7, 5}, "up")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("door","door1_2_1", {2, 1, 1, 1}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    newShape("spitter","spitter1_2_1", {2, 1, 7, 1}, {"none","none","down","left"})
    newShape("door","door1_2_1", {2, 1, 1, 2}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 4, 2}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,2,2},{2,1,4,2}})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 2, 3}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 3, 3}, "triangleTopRightShape")
    newShape("shape","bar1_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    newShape("manualFan","manualFan1_2_1", {2, 1, 2, 4}, "down")
    newShape("manualFan","manualFan1_2_1", {2, 1, 5, 4}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 5, 5}, "up")
    newShape("spitter","spitter2_2_1", {2, 1, 7, 5, "up","none","none","left"})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 2, 5}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 4, 3}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 6, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 5, 3}, 90)
    newShape("item","coins", {2, 1, 1, 4}, 75)
    newShape("item","coins", {2, 1, 6, 4}, 20)
    newShape("item","small-present", {1, 1, 2, 1}, {})

    newShape("item","small-present", {2, 1, 1, 1}, {})

    newShape("item","big-present", {2, 1, 5, 3}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
