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
    newShape("autoFan", "autoFan1_1_1", {1, 1, 5, 1}, "down")
    newShape("shape", "triangle1_1_1", {1, 1, 6, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("door", "door1_1_1", {1, 1, 7, 1}, "right")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 2}, "left")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,1,2},{1,1,3,2}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 4, 2}, "right")
    newShape("shape", "bar1_1_1", {1, 1, 6, 2}, "bar", {"horz", 2})
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 2}, "up")
    newShape("autoFan", "autoFan3_1_1", {1, 1, 7, 2}, "down")
    newTransition("autoFan3_1_1", "slide", {}, {{1,1,7,2},{1,1,7,3}})
    newShape("manualFan", "manualFan3_1_1", {1, 1, 5, 3}, "right")
    newShape("manualFan", "manualFan4_1_1", {1, 1, 2, 4}, "right")
    newTransition("manualFan4_1_1", "slide", {}, {{1,1,2,3},{1,1,2,4}})
    newShape("shape", "triangle2_1_1", {1, 1, 7, 4}, "triangleTopRightShape")
    newTransition("triangle2_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("autoFan", "autoFan4_1_1", {1, 1, 1, 5}, "right")
    newShape("manualFan", "manualFan5_1_1", {1, 1, 4, 5}, "down")
    newTransition("manualFan5_1_1", "slide", {}, {{1,1,3,5},{1,1,4,5}})
    newShape("autoFan", "autoFan5_1_1", {1, 1, 5, 5}, "up")

    --SCREEN 2-1
    newShape("simple", "simple1_2_1", {2, 1, 2, 1})
    newTransition("simple1_2_1", "slide", {}, {{2,1,1,1},{2,1,2,1}})
    newShape("shape", "triangle1_2_1", {2, 1, 5, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle2_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_2_1", {2, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle4_2_1", {2, 1, 1, 4}, "triangleTopRightShape")
    newShape("shape", "triangle5_2_1", {2, 1, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "down")
    newShape("shape", "bar1_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 5, 1}, "up")

    --SCREEN 2-2
    newShape("spitter","spitter1_2_2", {2, 2, 1, 1}, {"none","right","none","left"})
    newShape("shape","triangle1_2_2", {2, 2, 4, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_2", {2, 2, 4, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_2_2", {2, 2, 1, 5})

    --GEMS
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 1}, "purple")
    newShape("gem","purple", {2, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 2, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 1, 3, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 5, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 4}, "purple")
    newShape("gem","purple", {2, 2, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 7, 5}, "purple")
    newShape("gem","redCoin", {2, 2, 6, 1}, "redCoin")
    newShape("gem","blueCoin", {2, 1, 5, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 2, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 4, 1}, 170)
    newShape("item","coins", {2, 2, 2, 1}, 75)
    newShape("item","coins", {2, 2, 3, 5}, 140)
    newShape("item","big-present", {1, 2, 5, 3}, {})
    newShape("item","small-present", {2, 2, 4, 3}, {})
    newShape("item","clock", {2, 1, 1, 2}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 5
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
