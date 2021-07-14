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
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "down")
    newShape("manualFan","manualFan2_1_1", {1, 1, 3, 1}, "down")
    newShape("shape","triangle1_1_1", {1, 1, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan2_1_1", {1, 1, 1, 2}, "right")
    newShape("shape","bar1_1_1", {1, 1, 8, 2}, "bar", {"horz", 2})
    newShape("autoFan","autoFan3_1_1", {1, 1, 2, 3}, "right")
    newShape("shape","bar2_1_1", {1, 1, 8, 3}, "bar", {"horz", 2})
    newShape("autoFan","autoFan4_1_1", {1, 1, 3, 4}, "right")
    newShape("shape","bar3_1_1", {1, 1, 8, 4}, "bar", {"horz", 2})
    newShape("autoFan","autoFan5_1_1", {1, 1, 4, 5}, "right")
    newShape("shape","bar4_1_1", {1, 1, 8, 5}, "bar", {"horz", 2})
    newShape("endPoint","endPoint1_1_1", {1, 1, 4, 2})
    newShape("autoFan","autoFan6_1_1", {1, 1, 7, 5}, "up")

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_1_2", {1, 2, 4, 1}, "up")
    newShape("shape","triangle2_1_2", {1, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_1_2", {1, 2, 2, 4}, "triangleTopLeftShape", {1, 6, "breakable"})
    newShape("shape","triangle4_1_2", {1, 2, 4, 4}, "triangleTopRightShape", {1, 13, "breakable"})

    --SCREEN 1-3
    newShape("door","door1_1_3", {1, 3, 3, 1}, "up")
    newShape("spitter","spitter1_1_3", {1, 3, 3, 1, "up","none","down","none"})
    newTransition("spitter1_1_3", "switchSlide", {}, {{1,3,3,1},{1,3,4,1}})
    newShape("manualFan","manualFan1_1_3", {1, 3, 4, 2}, "right")
    newShape("shape","bar1_1_3", {1, 3, 6, 2}, "bar", {"horz", 2})
    newTransition("bar1_1_3", "slide", {}, {{1,3,6,2},{1,3,6,4}})
    newShape("autoFan","autoFan1_1_3", {1, 3, 6, 2}, "down")
    --newShape("item","coins", {1, 3, 6, 4}, 250)
    newShape("autoFan","autoFan2_1_3", {1, 3, 4, 4}, "up")
    newShape("shape","bar2_1_3", {1, 3, 6, 4}, "bar", {"vert", 4})
    newTransition("bar2_1_3", "slide", {}, {{1,3,4,4},{1,3,6,4}})
    newShape("manualFan","manualFan2_1_3", {1, 3, 6, 4}, "left")
    newShape("gem","purple", {1, 3, 4, 5}, "purple")
    newShape("shape","bar3_1_3", {1, 3, 6, 5}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch","switch1_1_3", {1, 3, 5, 2}, { {"slide","spitter1_1_3"} })

    --GEMS
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 7, 2}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 3, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 3, 2, 2}, "purple")
    newShape("gem","purple", {1, 3, 6, 3}, "purple")
    newShape("gem","purple", {1, 3, 5, 4}, "purple")
    newShape("gem","purple", {1, 3, 4, 3}, "purple")
    newShape("gem","purple", {1, 3, 4, 5}, "purple")
    newShape("gem","purple", {1, 3, 3, 3}, "purple")
    newShape("gem","purple", {1, 3, 3, 5}, "purple")
    newShape("gem","redCoin", {1, 1, 3, 3}, "redCoin")
    newShape("gem","blueCoin", {1, 3, 3, 4}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 7, 2}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 2, 2}, 27)
    newShape("item","coins", {1, 2, 3, 1}, 85)
    newShape("item","coins", {1, 3, 3, 2}, 50)
    newShape("item","big-present", {1, 2, 2, 5}, {})
    newShape("item","small-present", {1, 2, 7, 3}, {})
    newShape("item","dummyBall", {1, 2, 1, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 3
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 2
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
