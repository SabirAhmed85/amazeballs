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
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("spitter", "spitter1_1_1", {1, 1, 5, 1}, {"none", "right", "down", "none"})
    newShape("characterChangePoint", "characterChangePoint1_1_1", {1, 1, 7, 1})
    newShape("spitter", "spitter2_1_1", {1, 1, 3, 2}, {"none", "right", "none", "none"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,2,2},{1,1,3,2},{1,1,3,1}})
    newShape("door", "door1_1_1", {1, 1, 7, 2}, "right")
    newShape("spitter", "spitter3_1_1", {1, 1, 5, 3}, {"none", "right", "none", "none"})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 7, 3}, "down")
    newShape("spitter", "spitter4_1_1", {1, 1, 3, 4, "up", "none", "none", "none"})
    newTransition("spitter4_1_1", "slide", {}, {{1,1,3,4},{1,1,3,5}})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 6, 4}, "up")
    newShape("shape", "bar1_1_1", {1, 1, 7, 5}, "bar", {"vert", 2})
    newShape("spitter", "spitter5_1_1", {1, 1, 2, 5, "up", "none", "none", "left"})
    newShape("shape", "triangle1_1_1", {1, 1, 6, 5}, "triangleBottomLeftShape", {1, 2, "icy"})
    newShape("shape", "bar2_1_1", {1, 1, 7, 6}, "bar", {"vert", 4})

    --SCREEN 2-1
    newShape("shape", "triangle1_2_1", {2, 1, 4, 1}, "triangleTopRightShape", {1, 16, "breakable"})
    newShape("spitter", "spitter1_2_1", {2, 1, 4, 2}, {"none", "none", "down", "none"})
    newTransition("spitter1_2_1", "slide", {}, {{2,1,4,2},{2,1,5,2}})
    newShape("spitter", "spitter2_2_1", {2, 1, 2, 3, "up", "right", "none", "none"})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 3, 3}, "up")
    newShape("shape", "bar1_2_1", {2, 1, 6, 3}, "bar", {"horz", 2})
    newTransition("bar1_2_1", "switchSlide", {}, {{2,1,6,2},{2,1,6,3}})
    newShape("endPoint", "manualFan2_2_1", {2, 1, 6, 3})
    newShape("shape", "bar2_2_1", {2, 1, 8, 3}, "bar", {"horz", 4})
    newShape("door", "door1_2_1", {2, 1, 1, 4}, "left")
    newShape("spitter", "spitter3_2_1", {2, 1, 4, 4}, {"none", "none", "none", "left"})
    newTransition("spitter3_2_1", "slide", {}, {{2,1,4,4},{2,1,4,5}})
    newShape("autoFan", "autoFan1_2_1", {2, 1, 5, 4}, "right")
    newShape("shape", "triangle2_2_1", {2, 1, 7, 4}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("spitter", "spitter4_2_1", {2, 1, 2, 5, "up", "none", "none", "left"})
    newShape("shape", "bar3_2_1", {2, 1, 5, 5}, "bar", {"horz", 3})
    newShape("spitter", "spitter5_2_1", {2, 1, 7, 5, "up", "none", "none", "left"})
    newShape("shape", "bar4_2_1", {2, 1, 5, 6}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 4, 5}, { {"slide", "bar1_2_1"} }, "two-way", "not-labelled")
    --GEMS
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 2, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 3}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 5}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "purple", {2, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 3}, "purple")
    newShape("gem", "purple", {2, 1, 4, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 5}, "purple")
    newShape("gem", "purple", {2, 1, 2, 4}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 2}, "purple")
    newShape("gem", "purple", {2, 1, 3, 1}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 3}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 4}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 7, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {2, 1, 7, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 3, 3}, 100)
    newShape("item", "coins", {1, 1, 1, 5}, 20)
    newShape("item", "coins", {2, 1, 2, 1}, 75)
    newShape("item", "superDummy", 1, 1, 5, 2}, {})

    newShape("item", "small-present", {2, 1, 6, 5}, {})

    newShape("item", "small-present", {2, 1, 5, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 1
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
