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
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right", {"disabled"})
    newShape("tunnel","tunnel1_1_1", {1, 1, 1, 2, 1, 2, 2, 1}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleTopRightShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,2,2},{1,1,3,1}})
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleTopRightShape")
    newTransition("triangle2_1_1", "flip-vertical")
    newShape("gun","gun1_1_1", {1, 1, 7, 2}, "left")
    newShape("gun","gun2_1_1", {1, 1, 1, 3}, "right")
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 4}, "right")
    newTransition("autoFan1_1_1", "switchSlide", {}, {{1,1,6,1},{1,1,6,4}})
    newShape("shape","bar1_1_1", {1, 1, 7, 5}, "bar", {"vert"})
    newTransition("bar1_1_1", "slide", {}, {{1,1,6,5},{1,1,7,5}})
    newShape("backFire","backFire1_1_1", {1, 1, 4, 5})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,2,5},{1,1,3,5},{1,1,4,5}})

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 2, 2}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,2,1},{2,1,2,2}})
    newShape("gun","gun1_2_1", {2, 1, 4, 3}, "left")
    newShape("endPoint","endPoint1_2_1", {2, 1, 5, 3})
    newShape("shape","triangle1_2_1", {2, 1, 2, 5}, "triangleTopRightShape")
    newShape("shape","triangle1_2_1", {2, 1, 5, 5}, "triangleTopLeftShape")

    --SCREEN 1-2
    newShape("item","compass", {1, 2, 4, 1})
    newShape("door","door1_1_2", {1, 2, 6, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 1, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","triangle2_1_2", {1, 2, 5, 2}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("shape","triangle3_1_2", {1, 2, 6, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 1, 4}, "triangleBottomLeftShape", {1, 22, "breakable"})
    newShape("shape","triangle5_1_2", {1, 2, 4, 5}, "triangleBottomLeftShape", {1, 25, "breakable"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 3, 4}, { {"door-open","door1_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 1, 1}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 2, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 4}, "purple")
    newShape("gem","redCoin", {2, 1, 3, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 7, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 1, 3, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 1}, 60)
    newShape("item","coins", {2, 1, 4, 1}, 110)
    newShape("item","coins", {1, 2, 5, 4}, 220)
    newShape("item","small-present", {1, 2, 4, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
