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

    --SCREEN 1-2
    newShape("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"horz"})
    newShape("shape","bar2_1_1", {1, 1, 6, 1}, "bar", {"vert"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 1}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 1}, "right")
    newShape("shape","triangle1_1_1", {1, 1, 3, 2}, "triangleBottomRightShape")
    newShape("shape","triangle2_1_1", {1, 1, 5, 2}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 7, 2}, "triangleBottomLeftShape", {1, 7, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle4_1_1", "slide", {}, {{1,1,2,3},{1,1,3,3}})
    newShape("shape","triangle5_1_1", {1, 1, 6, 3}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle5_1_1", "slide", {}, {{1,1,5,3},{1,1,6,3}})
    newShape("shape","triangle6_1_1", {1, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle7_1_1", {1, 1, 3, 4}, "triangleTopRightShape")
    newShape("shape","triangle8_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, 13})
    newShape("shape","triangle9_1_1", {1, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle10_1_1", {1, 1, 5, 5}, "triangleTopLeftShape")
    newTransition("triangle10_1_1", "switchSlide", {}, {{1,1,5,4},{1,1,5,5}})
    newShape("shape","triangle11_1_1", {1, 1, 6, 5}, "triangleBottomRightShape", {1, _, "breakable"})

    --SCREEN 2-2
    newShape("simple","simple1_2_1", {2, 1, 1, 1})
    newShape("door","door1_2_1", {2, 1, 2, 1}, "up")
    newShape("manualFan","manualFan1_2_1", {2, 1, 3, 1}, "down")
    newShape("manualFan","manualFan2_2_1", {2, 1, 4, 1}, "left")
    newShape("shape","bar1_2_1", {2, 1, 5, 1}, "bar", {"horz", 2})
    newShape("manualFan","manualFan3_2_1", {2, 1, 5, 1}, "right")
    newShape("door","door2_2_1", {2, 1, 7, 1}, "up")
    newShape("shape","bar2_2_1", {2, 1, 8, 1}, "bar", {"horz", 2})
    newShape("shape","triangle1_2_1", {2, 1, 1, 2}, "triangleTopRightShape")
    newTransition("triangle1_2_1", "switchSlide", {}, {{2,1,1,2},{2,1,2,2}})
    newShape("shape","triangle2_2_1", {2, 1, 3, 2}, "triangleTopLeftShape")
    newShape("shape","triangle3_2_1", {2, 1, 5, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","bar3_2_1", {2, 1, 7, 2}, "bar", {"horz", 2})
    newTransition("bar3_2_1", "slide", {}, {{2,1,7,1},{2,1,7,2}})
    newShape("shape","bar4_2_1", {2, 1, 8, 2}, "bar", {"horz", 2})
    newShape("shape","triangle4_2_1", {2, 1, 2, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_2_1", {2, 1, 3, 3}, "triangleBottomLeftShape")
    newShape("manualFan","manualFan4_2_1", {2, 1, 4, 3}, "right")
    newShape("shape","bar5_2_1", {2, 1, 7, 3}, "bar", {"horz", 2})
    newTransition("bar5_2_1", "slide", {}, {{2,1,7,3},{2,1,7,4}})
    newShape("shape","bar6_2_1", {2, 1, 8, 3}, "bar", {"horz", 2})
    newShape("manualFan","manualFan5_2_1", {2, 1, 1, 4}, "right")
    newShape("autoFan","autoFan1_2_1", {2, 1, 3, 4}, "right")
    newShape("manualFan","manualFan6_2_1", {2, 1, 4, 4}, "down")
    newShape("shape","triangle1_2_1", {2, 1, 5, 4}, "triangleTopLeftShape")
    newShape("shape","bar7_2_1", {2, 1, 8, 4}, "bar", {"horz", 2})
    newShape("manualFan","manualFan7_2_1", {2, 1, 1, 5}, "right")
    newShape("shape","triangle6_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, 11})
    newShape("autoFan","autoFan2_2_1", {2, 1, 6, 5}, "right")
    newShape("shape","triangle7_2_1", {2, 1, 7, 5}, "triangleTopLeftShape")
    newTransition("triangle7_2_1", "slide", {}, {{2,1,7,1},{2,1,7,2},{2,1,7,3},{2,1,7,5}})
    newShape("shape","bar8_2_1", {2, 1, 8, 5}, "bar", {"horz", 2})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 4, 4}, { {"slide", "triangle10_1_1"} })

    --GEMS
    newShape("gem","purpleCoin", {2, 1, 6, 1}, "purpleCoin")

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 4
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
