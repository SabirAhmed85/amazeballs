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
    newShape("gun","gun1_1_1", {1, 1, 1, 1}, "down")
    newShape("manualFan","manualFan1_1_1", {1, 1, 3, 1}, "left")
    newShape("manualFan","manualFan1_1_1", {1, 1, 6, 1}, "down")
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 1}, "up")
    newShape("gun","gun2_1_1", {1, 1, 3, 2}, "right")
    newShape("endPoint","endPoint1_1_1", {1, 1, 6, 3})
    newShape("spitter","spitter1_1_1", {1, 1, 3, 4, "up","right","down","left"})
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gun","gun3_1_1", {1, 1, 5, 4}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 4, 5}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("shape","triangle2_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,6,5},{1,1,7,3}})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 3, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopRightShape", {1, 2, "icy"})
    newShape("shape","triangle2_1_2", {1, 2, 5, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 2}, "right")
    newTransition("autoFan1_1_2", "slide", {}, {{1,2,1,1},{1,2,1,2}})
    newShape("gun","gun1_1_2", {1, 2, 4, 2}, "down")
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 2}, "left")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,7,2},{1,2,7,3}})
    newShape("spitter","spitter1_1_2", {1, 2, 3, 3}, {"none","none","down","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,2},{1,2,3,3}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 5, 3}, "up")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,5,3},{1,2,5,4}})
    newShape("shape","triangle3_1_2", {1, 2, 2, 4}, "triangleTopAndBottomShape", {1})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","redCoin", {1, 2, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 4, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 2, 1}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 3}, 85)
    newShape("item","coins", {1, 2, 5, 5, 215})

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
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
