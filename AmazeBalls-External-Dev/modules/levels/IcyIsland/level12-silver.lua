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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomRightShape", {1, 13})
    newTransition("triangle1_1_1", "slide", {}, {{1,1,1,1},{1,1,1,2}})
    newShape("shape","triangle2_1_1", {1, 1, 3, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 5, 1}, "triangleBottomRightShape")
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 1}, "left")
    newShape("shape","bar1_1_1", {1, 1, 6, 2}, "bar", {"vert", 4})
    newTransition("bar1_1_1", "slide", {}, {{1,1,5,2},{1,1,6,2}})
    newShape("autoFan","autoFan2_1_1", {1, 1, 7, 2}, "down")
    newTransition("autoFan2_1_1", "slide", {}, {{1,1,7,1},{1,1,7,2}})
    newShape("shape","triangle4_1_1", {1, 1, 4, 3}, "triangleBottomRightShape")
    newShape("autoFan","autoFan3_1_1", {1, 1, 6, 3}, "up")
    newShape("spitter","spitter1_1_1", {1, 1, 7, 3}, {"none", "none", "down", "none"})
    newShape("shape","triangle5_1_1", {1, 1, 1, 4}, "triangleBottomRightShape")
    newShape("shape","bar2_1_1", {1, 1, 3, 4}, "bar", {"horz", 4})
    newTransition("bar2_1_1", "slide", {}, {{1,1,3,2},{1,1,3,4}})
    newShape("shape","triangle6_1_1", {1, 1, 3, 4}, "triangleTopLeftShape")
    newShape("endPoint","endPoint1_1_1", {1, 1, 7, 4})
    newShape("shape","bar3_1_1", {1, 1, 6, 5}, "bar", {"horz", 3})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1, "up", "disabled"})
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleTopLeftShape", {1, 2, "breakable"})
    newShape("door","door2_1_2", {1, 2, 4, 1, "up", "disabled"})
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_2", {1, 2, 3, 2}, "triangleTopRightShape", {1, 2, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("item","map", {1, 2, 7, 2})
    newShape("shape","triangle5_1_2", {1, 2, 5, 3}, "triangleTopLeftShape", {1, 2, "breakable"})
    newShape("characterChangePoint","characterChangePoint1_1_2", {1, 2, 2, 4})
    newShape("item","compass", {1, 2, 3, 4})
    newShape("shape","bar1_1_2", {1, 2, 4, 4}, "bar", {"horz"})
    newTransition("bar1_1_2", "slide", {}, {{1,2,4,3},{1,2,4,4}})
    newShape("shape","triangle6_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle7_1_2", {1, 2, 4, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 7, 3}, { {"door-open", "door1_1_2"},{"door-open", "door2_1_2"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 3, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 2, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 3, 2}, 115)
    newShape("item","small-present", {1, 2, 4, 1}, {})

    newShape("item","small-present", {1, 1, 5, 2}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 4
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
