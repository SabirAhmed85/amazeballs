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
    newShape("shape","triangle1_1_1", {1, 1, 4, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 2}, "right")
    newShape("shape","bar1_1_1", {1, 1, 2, 2}, "bar", {"vert", 3})
    newTransition("bar1_1_1", "switchSlide", {}, {{1,1,1,2},{1,1,2,2}})
    newShape("shape","triangle2_1_1", {1, 1, 4, 2}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("shape","bar2_1_1", {1, 1, 6, 2}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 3}, "up")
    newShape("shape","bar3_1_1", {1, 1, 1, 4}, "bar", {"vert"})
    newTransition("bar3_1_1", "slide", {}, {{1,1,1,4},{1,1,2,4}})
    newShape("shape","triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomLeftShape", {1, 20, "breakable"})
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 1}, "down")
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 6, 2}, "left")
    newTransition("autoFan2_1_2", "slide", {}, {{1,2,4,2},{1,2,6,2},{1,2,6,3}})
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 2}, "up")
    newShape("endPoint","endPoint1_1_2", {1, 2, 1, 3})
    newShape("autoFan","autoFan3_1_2", {1, 2, 1, 4}, "down")
    newShape("shape","triangle3_1_2", {1, 2, 7, 4}, "triangleBottomRightShape")
    newShape("autoFan","autoFan4_1_2", {1, 2, 3, 5}, "right")
    newTransition("autoFan4_1_2", "slide", {}, {{1,2,3,4},{1,2,3,5},{1,2,4,5}})
    newShape("shape","bar1_1_2", {1, 2, 6, 5}, "bar", {"horz", 2})
    newShape("shape","triangle4_1_2", {1, 2, 7, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 1, 4}, { {"slide","bar1_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","redCoin", {1, 2, 3, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 2}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 4, 4}, 85)
    newShape("item","coins", {1, 1, 7, 1}, 115)
    newShape("item","coins", {1, 2, 2, 4}, 55)
    newShape("item","small-present", {1, 1, 6, 1}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
