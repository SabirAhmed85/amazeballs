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
    newShape("shape", "triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle1_1_1", {1, 1, 2, 1}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 1, 4}, "left")
    newShape("shape", "bar1_1_1", {1, 1, 2, 4}, "bar", {"horz", 4})
    newTransition("bar1_1_1", "slide", {}, {{1,1,2,3},{1,1,2,4}})
    newShape("shape", "bar2_1_1", {1, 1, 3, 4}, "bar", {"horz", 4})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 3, 4}, "right")
    newShape("endPoint", "endPoint1_1_1", {1, 1, 2, 5})
    newShape("shape", "bar3_1_1", {1, 1, 1, 6}, "bar", {"vert", 4})

    --SCREEN 2-1
    newShape("manualFan", "manualFan1_2_1", {2, 1, 1, 1}, "left")
    newShape("autoFan", "autoFan1_2_1", {2, 1, 2, 1}, "down")
    newShape("simple", "simple1_2_1", {2, 1, 4, 1})
    newShape("item", "map", {2, 1, 6, 1})
    newShape("manualFan", "manualFan2_2_1", {2, 1, 2, 2}, "left")
    newShape("shape", "bar1_2_1", {2, 1, 1, 3}, "bar", {"horz"})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 4, 3}, "left")
    newShape("shape", "bar2_2_1", {2, 1, 6, 3}, "bar", {"horz"})
    newShape("shape", "triangle1_2_1", {2, 1, 6, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("autoFan", "autoFan3_2_1", {2, 1, 7, 3}, "left")
    newShape("door", "door1_2_1", {2, 1, 1, 4}, "left")
    newShape("manualFan", "manualFan3_2_1", {2, 1, 6, 4}, "left")
    newShape("manualFan", "manualFan4_2_1", {2, 1, 2, 5}, "right")
    newShape("door", "door2_2_1", {2, 1, 2, 5}, "down")
    newShape("manualFan", "manualFan5_2_1", {2, 1, 4, 5}, "down")
    newShape("manualFan", "manualFan6_2_1", {2, 1, 6, 5}, "right")
    newShape("manualFan", "manualFan7_2_1", {2, 1, 7, 5}, "down")
    newShape("door", "door3_2_1", {2, 1, 7, 5}, "down")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 2, 1}, "up")
    --newShape("item", "coins", {2, 2, 5, 1}, 20)
    newShape("autoFan", "autoFan1_2_2", {2, 2, 6, 1}, "up")
    newShape("door", "door1_2_2", {2, 2, 7, 1}, "up")
    newShape("manualFan", "manualFan1_2_2", {2, 2, 7, 1}, "right")
    newShape("manualFan", "manualFan2_2_2", {2, 2, 2, 2}, "left")
    newShape("manualFan", "manualFan3_2_2", {2, 2, 4, 2}, "down")
    newShape("autoFan", "autoFan2_2_2", {2, 2, 5, 3}, "down")
    newShape("autoFan", "autoFan3_2_2", {2, 2, 4, 4}, "right")
    newShape("manualFan", "manualFan4_2_2", {2, 2, 7, 4}, "up")
    newShape("autoFan", "autoFan4_2_2", {2, 2, 2, 5}, "up")
    newShape("manualFan", "manualFan5_2_2", {2, 2, 6, 5}, "left")
    newShape("shape", "bar1_2_2", {2, 2, 7, 5}, "bar", {"vert", 2})
    newTransition("bar1_2_2", "switchSlide", {}, {{2,2,6,5},{2,2,7,5}})

    --SWITCHES
    newShape("switch", "switch1_2_1", {2, 1, 6, 2}, { {"slide", "bar1_2_2"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 2, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 7, 2}, "purple")
    newShape("gem", "purple", {2, 1, 7, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 2, 1}, "purple")
    newShape("gem", "purple", {2, 2, 4, 1}, "purple")
    newShape("gem", "purple", {2, 2, 3, 5}, "purple")
    newShape("gem", "purple", {2, 2, 2, 4}, "purple")
    newShape("gem", "purple", {2, 2, 1, 2}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "purple", {2, 2, 7, 2}, "purple")
    newShape("gem", "purple", {2, 2, 4, 3}, "purple")
    newShape("gem", "purple", {2, 2, 1, 4}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 5, 4}, "purple")
    newShape("gem", "redCoin", {2, 2, 5, 5}, "redCoin")
    newShape("gem", "blueCoin", {2, 2, 7, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 1, 1, 2}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 1, 7, 4}, 80)
    newShape("item", "coins", {2, 2, 3, 1, 125})
    newShape("item", "small-present", {2, 1, 1, 5}, {})
    newShape("item", "hook", {1, 1, 2, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
