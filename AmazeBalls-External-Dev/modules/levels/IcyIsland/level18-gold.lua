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
    newShape("autoFan","autoFan1_1_1", {1, 1, 5, 1}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_1_1", {1, 1, 4, 1})
    newShape("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 7, 3}, "triangleBottomRightShape", {1, 9, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 2, 5}, "triangleBottomRightShape")
    newShape("autoFan","autoFan2_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 2, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 5, 1}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 3, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan2_1_2", {1, 2, 6, 2}, "right")
    newShape("shape","triangle3_1_2", {1, 2, 1, 3}, "triangleTopLeftShape", {1, 15})
    newTransition("triangle3_1_2", "flip-horizontal")
    newShape("shape","bar1_1_2", {1, 2, 3, 2}, "bar", {"horz", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,3,2},{1,2,3,3}})
    newShape("backFire","backFire1_1_2", {1, 2, 4, 3})
    newTransition("backFire1_1_2", "slide", {}, {{1,2,4,1},{1,2,4,3},{1,2,4,4}})
    newShape("shape","bar2_1_2", {1, 2, 2, 4}, "bar", {"vert", 3})
    newShape("shape","triangle4_1_2", {1, 2, 2, 4}, "triangleBottomRightShape")
    newTransition("triangle4_1_2", "slide", {}, {{1,2,2,4},{1,2,3,5}})
    newShape("shape","triangle5_1_2", {1, 2, 6, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 5}, "up")
    newShape("spitter","spitter1_1_2", {1, 2, 4, 5, "up","none","none","none"})
    newShape("shape","triangle6_1_2", {1, 2, 5, 5}, "triangleBottomLeftShape", {1, _, "icy"})

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 1, 3}, "left")
    newShape("shape","triangle1_2_2", {2, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    --newShape("item","coins", {2, 2, 2, 5}, 250)
    newShape("shape","triangle2_2_2", {2, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_2_2", {2, 2, 4, 5}, "triangleTopRightShape", {1, 10, "breakable"})

    --GEMS
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 1}, "purple")
    newShape("gem","purple", {2, 2, 3, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 1, 4}, "purple")
    newShape("gem","redCoin", {2, 2, 3, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 1, 1}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 2, 1, 2, 30)
    newShape("item","coins", {2, 2, 6, 3}, 28)
    newShape("item","big-present", {1, 2, 1, 5}, {})
    newShape("item","small-present", {1, 1, 2, 4}, {})
    newShape("item","small-present", {2, 2, 5, 2}, {})
    newShape("item","clock", {2, 2, 6, 4}, {})
    newShape("item","superDummy", 1, 2, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
