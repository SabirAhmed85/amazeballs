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
    newShape("shape", "bar1_1_1", {1, 1, 5, 1}, "bar", {"vert", 3})
    newShape("shape", "bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    newShape("autoFan", "autoFan1_1_1", {1, 1, 4, 2}, "down")
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 3}, "down")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,2,3},{1,1,2,1,"*"},{1,1,5,1},{1,1,7,2}})
    newShape("shape", "triangle2_1_1", {1, 1, 2, 4}, "triangleTopRightShape")
    newShape("shape", "triangle3_1_1", {1, 1, 3, 4}, "triangleTopLeftShape")
    newShape("autoFan", "autoFan2_1_1", {1, 1, 6, 4}, "right")
    newTransition("autoFan2_1_1", "switchSlide", {}, {{1,1,5,4},{1,1,6,4}})
    newShape("manualFan", "manualFan2_1_1", {1, 1, 7, 4}, "up")
    newShape("shape", "bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    newShape("shape", "triangle4_1_1", {1, 1, 4, 5}, "triangleTopRightShape")
    newShape("shape", "triangle5_1_1", {1, 1, 6, 5}, "triangleTopRightShape", {1, 13})
    newTransition("triangle5_1_1", "flip-horizontal")
    newShape("door", "door1_1_1", {1, 1, 7, 5, "down", "disabled"})

    --SCREEN 1-2
    newShape("manualFan", "manualFan1_1_2", {1, 2, 1, 1}, "right")
    newTransition("manualFan1_1_2", "switchSlide", {}, {{1,2,1,1},{1,2,2,1}})
    newShape("shape", "triangle1_1_2", {1, 2, 5, 1}, "triangleTopLeftShape")
    newTransition("triangle1_1_2", "switchSlide", {}, {{1,2,2,2},{1,2,4,1},{1,2,5,1}})
    newShape("shape", "bar1_1_2", {1, 2, 7, 1}, "bar", {"horz"})
    newTransition("bar1_1_2", "switchSlide", {}, {{1,2,7,1},{1,2,7,2}})
    newShape("shape", "bar2_1_2", {1, 2, 6, 2}, "bar", {"horz", 3})
    newShape("shape", "triangle2_1_2", {1, 2, 2, 3}, "triangleBottomRightShape")
    newTransition("triangle2_1_2", "switchSlide", {}, {{1,2,2,3},{1,2,2,4}})
    newShape("shape", "bar3_1_2", {1, 2, 4, 3}, "bar", {"vert"})
    newShape("shape", "triangle3_1_2", {1, 2, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("autoFan", "autoFan1_1_2", {1, 2, 6, 3}, "left")
    newTransition("autoFan1_1_2", "switchSlide", {}, {{1,2,6,3},{1,2,7,4}})
    newShape("door", "door1_1_2", {1, 2, 4, 5}, "down")

    --SCREEN 1-3
    newShape("shape", "bar1_1_3", {1, 3, 1, 1}, "bar", {"vert", 3})
    newShape("shape", "triangle3_1_3", {1, 3, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_3", {1, 3, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape", "triangle3_1_3", {1, 3, 3, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "triangle3_1_3", {1, 3, 7, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle3_1_3", {1, 3, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan", "autoFan1_1_3", {1, 3, 1, 5}, "left")
    newShape("shape", "triangle3_1_3", {1, 3, 3, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("endPoint", "endPoint1_1_3", {1, 3, 4, 5})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 5, 2}, { {"slide", "autoFan2_1_1"},{"door-open", "door1_1_1"} }, {"one-way"})

    --GEMS
    newShape("gem", "purple", {1, 1, 3, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 3}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 6, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 1}, "purple")
    newShape("gem", "purple", {1, 2, 7, 2}, "purple")
    newShape("gem", "purple", {1, 2, 7, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 1}, "purple")
    newShape("gem", "purple", {1, 2, 4, 4}, "purple")
    newShape("gem", "purple", {1, 2, 4, 5}, "purple")
    newShape("gem", "purple", {1, 2, 3, 3}, "purple")
    newShape("gem", "purple", {1, 2, 6, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 3}, "purple")
    newShape("gem", "purple", {1, 2, 2, 5}, "purple")
    newShape("gem", "purple", {1, 2, 5, 4}, "purple")
    newShape("gem", "purple", {1, 2, 1, 2}, "purple")
    newShape("gem", "purple", {1, 3, 4, 1}, "purple")
    newShape("gem", "purple", {1, 3, 4, 3}, "purple")
    newShape("gem", "purple", {1, 3, 6, 1}, "purple")
    newShape("gem", "purple", {1, 3, 7, 2}, "purple")
    newShape("gem", "purple", {1, 3, 1, 3}, "purple")
    newShape("gem", "purple", {1, 3, 2, 5}, "purple")
    newShape("gem", "purple", {1, 3, 5, 5}, "purple")
    newShape("gem", "purple", {1, 3, 7, 5}, "purple")
    newShape("gem", "purple", {1, 3, 2, 2}, "purple")
    newShape("gem", "purple", {1, 3, 2, 4}, "purple")
    newShape("gem", "purple", {1, 3, 6, 4}, "purple")
    newShape("gem", "redCoin", {1, 1, 7, 5}, "redCoin")
    newShape("gem", "blueCoin", {1, 3, 1, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {1, 2, 5, 2}, "purpleCoin")
    --ITEMS
    newShape("item", "coins", {1, 2, 4, 3}, 33)
    newShape("item", "coins", {1, 3, 5, 4}, 405)
    newShape("item", "small-present", {1, 2, 1, 4}, {})
    newShape("item", "small-present", {1, 3, 2, 3}, {})
    newShape("item", "characterSpecial", {1, 3, 3, 4}, {})
    newShape("item", "hook", {1, 1, 4, 3}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
