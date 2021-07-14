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

    -- 1-1
    newShape("autoFan","autoFan1_1_1", {1, 1, 7, 1}, "left")
    newTransition("autoFan1_1_1", "slide", {"orange"}, {{1,1,6,1},{1,1,7,1}})
    newShape("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleTopRightShape", {1, _, "fire"})
    newShape("autoFan","autoFan2_1_1", {1, 1, 3, 2}, "down")
    newTransition("autoFan2_1_1", "slide", {"orange"}, {{1,1,3,1},{1,1,3,2}})
    newShape("autoFan","autoFan3_1_1", {1, 1, 4, 2}, "left")
    newTransition("autoFan3_1_1", "slide", {"orange"}, {{1,1,4,2},{1,1,5,2}})
    newShape("autoFan","autoFan4_1_1", {1, 1, 1, 3}, "down")
    newTransition("autoFan4_1_1", "slide", {"orange"}, {{1,1,1,1},{1,1,1,3}})
    newShape("autoFan","autoFan5_1_1", {1, 1, 3, 3}, "right")
    newTransition("autoFan5_1_1", "slide", {"orange"}, {{1,1,2,4},{1,1,2,3,"*"},{1,1,3,3}})
    newShape("autoFan","autoFan6_1_1", {1, 1, 4, 3}, "up")
    newTransition("autoFan6_1_1", "slide", {"orange"}, {{1,1,4,3},{1,1,4,4}})
    newShape("shape","bar1_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    newShape("door","door1_1_1", {1, 1, 1, 5}, "down")
    newShape("autoFan","autoFan7_1_1", {1, 1, 2, 5}, "right")
    newTransition("autoFan7_1_1", "slide", {"orange"}, {{1,1,2,5},{1,1,3,4}})
    newShape("shape","triangle2_1_1", {1, 1, 4, 5}, "triangleBottomRightShape")
    newShape("shape","triangle3_1_1", {1, 1, 5, 5}, "triangleTopLeftShape", {1, _, "fire"})
    newShape("autoFan","autoFan8_1_1", {1, 1, 6, 5}, "up")
    newTransition("autoFan8_1_1", "slide", {"orange"}, {{1,1,6,3},{1,1,6,5}})

    -- 1-2
    newShape("autoFan","autoFan1_1_2", {1, 2, 1, 1}, "down")
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {"green"}, {{1,2,2,1},{1,2,4,2}})
    newShape("shape","triangle2_1_2", {1, 2, 5, 1}, "triangleTopLeftShape")
    newTransition("triangle2_1_2", "slide", {"green"}, {{1,2,5,1},{1,2,5,2}})
    newShape("endPoint","endPoint1_1_2", {1, 2, 6, 1}, "up")
    newShape("autoFan","autoFan2_1_2", {1, 2, 7, 1}, "right")
    newShape("shape","bar1_1_2", {1, 2, 6, 2}, "bar", {"vert", 2})
    newShape("shape","triangle3_1_2", {1, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 6, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_1_2", {1, 2, 7, 2}, "triangleTopLeftShape")
    --newShape("timeOut","timeOut1_1_2", {1, 2, 1, 3, 3})
    newShape("shape","triangle6_1_2", {1, 2, 2, 3}, "triangleTopLeftShape")
    newTransition("triangle6_1_2", "slide", {"green"}, {{1,2,2,3},{1,2,2,4}})
    newShape("shape","triangle7_1_2", {1, 2, 3, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle8_1_2", {1, 2, 5, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle9_1_2", {1, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar2_1_2", {1, 2, 3, 4}, "bar", {"vert", 3})
    newTransition("bar2_1_2", "slide", {"brown"}, {{1,2,3,4},{1,2,6,4}})
    newShape("shape","triangle10_1_2", {1, 2, 5, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("autoFan","autoFan3_1_2", {1, 2, 6, 4}, "up")
    newShape("shape","triangle11_1_2", {1, 2, 7, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle12_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle13_1_2", {1, 2, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle14_1_2", {1, 2, 4, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar3_1_2", {1, 2, 5, 6}, "bar", {"vert", 4})

    --GEMS
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 1, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 7, 5}, "purpleCoin")
    --ITEMS
    newShape("item","big-present", {1, 2, 6, 5}, {})

    --newShape("item","coins", {1, 1, 5, 2}, 90)
    --newShape("item","coins", {1, 2, 1, 3}, 90)
    --newShape("item","coins", {1, 2, 5, 5, 35)
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 2
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
