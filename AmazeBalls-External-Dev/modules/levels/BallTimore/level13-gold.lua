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
    newShape("autoFan","autoFan1_1_1", {1, 1, 1, 1}, "down")
    newShape("autoFan","autoFan2_1_1", {1, 1, 2, 1}, "left")
    newShape("shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("shape","triangle2_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {1})
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("autoFan","autoFan3_1_1", {1, 1, 4, 2}, "down")
    newShape("autoFan","autoFan4_1_1", {1, 1, 5, 2}, "right")
    newTransition("autoFan4_1_1", "slide", {}, {{1,1,4,3},{1,1,5,3},{1,1,5,2}})
    newShape("item","big-present", {1, 1, 6, 2}, {})

    newShape("simple","simple1_1_1", {1, 1, 4, 4})
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purpleCoin", {1, 1, 7, 4}, "purpleCoin")
    newShape("shape","triangle4_1_1", {1, 1, 1, 5}, "triangleTopLeftShape", {1, 3, "breakable"})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("shape","triangle5_1_1", {1, 1, 2, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle6_1_1", {1, 1, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle6_1_1", "slide", {}, {{1,1,4,5},{1,1,6,5}})
    newShape("shape","bar1_1_1", {1, 1, 7, 5}, "bar", {"horz", 2})
    newShape("shape","bar2_1_1", {1, 1, 7, 5}, "bar", {"vert", 2})
    newShape("gem","blueCoin", {1, 1, 7, 5}, "blueCoin")
    newShape("shape","bar3_1_1", {1, 1, 7, 6}, "bar", {"vert", 2})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 7, 1}, "triangleTopRightShape", {1, 5})
    newTransition("triangle1_1_2", "slide", {}, {{1,2,5,2},{1,2,5,1},{1,2,6,1},{1,2,7,1}})
    --newShape("timeOut","timeOut1_1_2", {1, 2, 1, 2, 3})
    newShape("door","door1_1_2", {1, 2, 7, 2}, "right")
    newShape("shape","triangle2_1_2", {1, 2, 5, 4}, "triangleTopLeftShape")
    newTransition("triangle2_1_2", "flip-vertical")
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 5}, "right")
    newShape("shape","triangle3_1_2", {1, 2, 6, 5}, "triangleTopLeftShape")
    newTransition("triangle3_1_2", "flip-horizontal")

    --SCREEN 2-2
    newShape("autoFan","autoFan1_2_2", {2, 2, 3, 1}, "right")
    newShape("simple","simple1_2_2", {2, 2, 6, 1})
    newShape("autoFan","autoFan2_2_2", {2, 2, 7, 1}, "down")
    newShape("shape","triangle3_2_2", {2, 2, 2, 2}, "triangleBottomRightShape", {1, 8, "breakable"})
    newShape("shape","triangle3_2_2", {2, 2, 4, 2}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("endPoint","endPoint1_2_2", {2, 2, 5, 2})
    newShape("autoFan","autoFan3_2_2", {2, 2, 3, 3}, "up")
    newShape("autoFan","autoFan4_2_2", {2, 2, 7, 3}, "left")
    newShape("shape","triangle3_2_2", {2, 2, 5, 4}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("shape","triangle3_2_2", {2, 2, 5, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_1_2", {1, 2, 4, 5}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 3
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
