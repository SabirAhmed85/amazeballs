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
    newShape("endPoint", "endPoint1_1_1", {1, 1, 1, 1})
    newShape("shape", "triangle1_1_1", {1, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan", "autoFan1_1_1", {1, 1, 2, 2}, "right")
    newShape("tunnel", "tunnel1_1_1", {1, 1, 7, 2, 1, 1, 2, 5}, "up")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 1, 3}, "down")
    newShape("shape", "triangle2_1_1", {1, 1, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan", "autoFan3_1_1", {1, 1, 4, 3}, "up")
    newShape("spitter", "spitter1_1_1", {1, 1, 5, 3, "up", "right", "down", "none"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,5,2},{1,1,5,3}})
    newShape("manualFan", "manualFan1_1_1", {1, 1, 7, 3}, "left")
    newShape("spitter", "spitter2_1_1", {1, 1, 3, 4, "up", "right", "none", "none"})
    newTransition("spitter2_1_1", "slide", {}, {{1,1,2,4},{1,1,3,4}})
    newShape("shape", "triangle3_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "icy"})

    --SCREEN 1-2
    newShape("door", "door1_1_2", {1, 2, 2, 1, "up", "disabled"})
    newShape("spitter", "spitter1_1_2", {1, 2, 2, 1}, {"none", "none", "none", "left"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,1,1},{1,2,2,1}})
    newShape("shape", "triangle1_1_2", {1, 2, 3, 1}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("shape", "bar1_1_2", {1, 2, 4, 1}, "bar", {"vert", 3})
    newShape("manualFan", "manualFan1_1_2", {1, 2, 7, 1}, "left")
    newShape("spitter", "spitter2_1_2", {1, 2, 3, 2, "up", "right", "down", "none"})
    newTransition("spitter2_1_2", "slide", {}, {{1,2,2,2},{1,2,3,2},{1,2,4,2}})
    newShape("shape", "bar2_1_2", {1, 2, 6, 2}, "bar", {"horz", 2})
    newShape("shape", "bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 2})
    newTransition("bar2_1_2", "slide", {}, {{1,2,2,2},{1,2,2,3}})
    newShape("shape", "bar4_1_2", {1, 2, 3, 3}, "bar", {"vert", 2})
    newShape("spitter", "spitter3_1_2", {1, 2, 4, 3}, {"none", "right", "down", "none"})
    newTransition("spitter3_1_2", "slide", {}, {{1,2,3,3},{1,2,4,3}})
    newShape("shape", "triangle2_1_2", {1, 2, 6, 3}, "triangleTopRightShape")
    newTransition("triangle2_1_2", "slide", {}, {{1,2,5,1},{1,2,6,3},{1,2,7,4}})
    newShape("shape", "bar5_1_2", {1, 2, 4, 4}, "bar", {"vert", 2})
    newShape("spitter", "spitter4_1_2", {1, 2, 4, 4, "up", "none", "down", "left"})
    newTransition("spitter4_1_2", "slide", {}, {{1,2,1,4},{1,2,4,4},{1,2,5,4}})
    newShape("spitter", "spitter5_1_2", {1, 2, 3, 5, "up", "none", "none", "left"})
    newTransition("spitter5_1_2", "slide", {}, {{1,2,3,5},{1,2,4,5}})
    newShape("door", "door2_1_2", {1, 2, 4, 5, "down", "disabled"})

    --SCREEN 1-3
    newShape("item", "compass", {1, 3, 5, 1})
    newShape("shape", "triangle1_1_3", {1, 3, 6, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("spitter", "spitter1_1_3", {1, 3, 4, 2}, {"none", "none", "down", "left"})
    newShape("shape", "triangle2_1_3", {1, 3, 2, 3}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("tunnel", "tunnel1_1_3", {1, 3, 7, 3, 1, 2, 1, 3}, "right")
    newShape("item", "map", {1, 3, 4, 4})
    newShape("shape", "triangle3_1_3", {1, 3, 6, 4}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch", "switch1_1_2", {1, 2, 7, 2}, { {"door-open", "door2_1_2"} }, "two-way", "not-labelled")
    newShape("switch", "switch1_1_3", {1, 3, 6, 3}, { {"door-open", "door1_1_2"} }, "two-way", "not-labelled")
    --GEMS
    newShape("gem", "purple", {1, 1, 1, 2}, "purple")
    newShape("gem", "purple", {1, 1, 3, 1}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {1, 1, 4, 2}, "purple")
    newShape("gem", "purple", {1, 1, 6, 2}, "purple")
    newShape("gem", "purple", {1, 1, 1, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 5}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 2, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 1, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 1}, "purple")
    newShape("gem", "purple", {1, 2, 5, 2}, "purple")
    newShape("gem", "purple", {1, 2, 2, 3}, "purple")
    newShape("gem", "purple", {1, 2, 5, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 5}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 3, 1, 4}, "purple")
    newShape("gem", "purple", {1, 3, 3, 4}, "purple")
    newShape("gem", "purple", {1, 3, 5, 4}, "purple")
    newShape("gem", "purple", {1, 3, 7, 4}, "purple")
    newShape("gem", "purple", {1, 3, 3, 1}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 3, 6, 2}, "purple")
    newShape("gem", "purple", {1, 3, 4, 3}, "purple")
    newShape("gem", "purple", {1, 3, 4, 5}, "purple")
    newShape("gem", "purple", {1, 3, 2, 2}, "purple")
    newShape("gem", "redCoin", {1, 3, 2, 1}, "redCoin")
    newShape("gem", "blueCoin", {1, 1, 4, 5}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 6, 5}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 3, 1, 2}, 50)
    newShape("item", "coins", {1, 1, 7, 1}, 110)
    newShape("item", "coins", {1, 1, 6, 3}, 80)
    newShape("item", "small-present", {1, 3, 2, 4}, {})

    newShape("item", "small-present", {1, 1, 2, 1}, {})

    newShape("item", "small-present", {1, 1, 6, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
