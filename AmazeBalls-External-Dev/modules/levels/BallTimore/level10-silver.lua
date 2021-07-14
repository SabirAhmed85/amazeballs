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
    newShape("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "down")
    newShape("spitter","spitter1_1_1", {1, 1, 4, 1}, {"none","right","none","left"})
    newShape("shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan2_1_1", {1, 1, 6, 1}, "left")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    newShape("spitter","spitter2_1_1", {1, 1, 6, 2, "up","none","down","none"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,6,2},{1,1,6,3}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 3}, "right")
    newShape("item","map", {1, 1, 4, 3})
    newShape("endPoint","endPoint1_1_1", {1, 1, 1, 4})
    newShape("manualFan","manualFan3_1_1", {1, 1, 3, 4}, "left")
    newShape("shape","triangle2_1_1", {1, 1, 7, 4}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    newShape("shape","bar4_1_1", {1, 1, 1, 5}, "bar", {"horz"})
    newShape("autoFan","autoFan2_1_1", {1, 1, 5, 5}, "right")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,5,5},{1,1,5,4},{1,1,6,4}})
    newShape("shape","triangle4_1_1", {1, 1, 7, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("door","door2_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 6, 1}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,5,2},{2,1,6,1}})
    newShape("gun","gun1_2_1", {2, 1, 7, 1}, "down")
    newShape("autoFan","autoFan2_2_1", {2, 1, 2, 2}, "right")
    newShape("characterChangePoint","characterChangePoint1_2_1", {2, 1, 4, 2, "TheShuttleMickyTake"})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("manualFan","manualFan1_2_1", {2, 1, 2, 3}, "left")
    newShape("autoFan","autoFan3_2_1", {2, 1, 6, 3}, "right")
    newShape("gun","gun2_2_1", {2, 1, 5, 4}, "left")
    newShape("shape","triangle1_2_1", {2, 1, 6, 4}, "triangleTopRightShape")
    newTransition("triangle1_2_1", "slide", {}, {{2,1,6,4},{2,1,7,4}})
    --newShape("timeOut","timeOut1_2_1", {2, 1, 1, 5})
    newShape("shape","bar1_2_1", {2, 1, 2, 5}, "bar", {"horz", 2})
    newTransition("bar1_2_1", "slide", {}, {{2,1,2,2},{2,1,2,5}})
    newShape("shape","triangle2_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape","triangle3_2_1", {2, 1, 5, 5}, "triangleBottomRightShape")
    newTransition("triangle3_2_1", "slide", {}, {{2,1,4,4},{2,1,4,5,"*"},{2,1,5,5}})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","redCoin", {2, 1, 3, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 4, 5}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 1, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 7, 2}, 140)
    newShape("item","coins", {2, 1, 4, 2}, 145)
    newShape("item","small-present", {1, 1, 2, 5}, {})

    newShape("item","big-present", {1, 1, 4, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
