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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape","triangle2_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 3}, "down")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "down")
    newShape("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle5_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 4, 1}, "triangleBottomRightShape")
    newShape("spitter","spitter1_1_2", {1, 2, 7, 1}, {"none","none","none","left"})
    newShape("shape","triangle2_1_2", {1, 2, 1, 2}, "triangleBottomRightShape")
    newShape("shape","triangle3_1_2", {1, 2, 5, 2}, "triangleTopLeftShape", {1, 11, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_2", {1, 2, 1, 4}, "triangleTopRightShape")
    newShape("shape","triangle6_1_2", {1, 2, 5, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 2, 5}, "left")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,2,5},{1,2,2,4,"*"},{1,2,4,4}})
    newShape("spitter","spitter2_1_2", {1, 2, 4, 5}, {"none","right","none","none"})
    newShape("door","door1_1_2", {1, 2, 5, 5}, "down")
    newShape("shape","triangle7_1_2", {1, 2, 7, 5}, "triangleTopLeftShape")

    --SCREEN 1-3
    newShape("shape","triangle1_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_3", {1, 3, 6, 1}, "triangleTopRightShape", {1, 16})
    newShape("shape","triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape")
    newShape("spitter","spitter1_1_3", {1, 3, 6, 2, "up","none","none","none"})
    newTransition("spitter1_1_3", "slide", {}, {{1,3,5,2},{1,3,6,2}})
    newShape("spitter","spitter2_1_3", {1, 3, 2, 3, "up","none","down","none"})
    newShape("spitter","spitter3_1_3", {1, 3, 6, 4}, {"none","none","down","none"})
    newTransition("spitter3_1_3", "slide", {}, {{1,3,5,4},{1,3,6,4}})
    newShape("shape","triangle4_1_3", {1, 3, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_3", {1, 3, 5, 5}, "up")
    newShape("endPoint","endPoint1_1_3", {1, 3, 7, 5})

    --GEMS
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 3, 5, 1}, "purple")
    newShape("gem","purple", {1, 3, 5, 3}, "purple")
    newShape("gem","purple", {1, 3, 2, 2}, "purple")
    newShape("gem","purple", {1, 3, 2, 4}, "purple")
    newShape("gem","purple", {1, 3, 3, 5}, "purple")
    newShape("gem","purple", {1, 3, 6, 5}, "purple")
    newShape("gem","purple", {1, 3, 7, 2}, "purple")
    newShape("gem","purple", {1, 3, 7, 4}, "purple")
    newShape("gem","redCoin", {1, 2, 2, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 3, 4, 1}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 4, 5}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 1}, 220)
    newShape("item","coins", {1, 2, 5, 5}, 90)
    newShape("item","coins", {1, 3, 6, 3}, 34)
    newShape("item","big-present", {1, 1, 4, 3}, {})
    newShape("item","big-present", {1, 3, 1, 5}, {})
    newShape("item","small-present", {1, 1, 7, 5}, {})
    newShape("item","small-present", {1, 2, 1, 3}, {})
    newShape("item","small-present", {1, 3, 3, 1}, {})
    newShape("item","hook", {1, 1, 1, 4}, {})
    newShape("item","characterSpecial", {1, 2, 4, 2}, {})
    newShape("item","dummyBall", {1, 3, 4, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
