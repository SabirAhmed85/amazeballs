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
    newShape("simple","simple1_1_1", {1, 1, 3, 1})
    newTransition("simple1_1_1", "slide", {}, {{1,1,3,1},{1,1,4,1}})
    newShape("shape","bar1_1_1", {1, 1, 6, 1}, "bar", {"vert", 3})
    newShape("shape","bar2_1_1", {1, 1, 7, 1}, "bar", {"vert", 3})
    newShape("simple","simple2_1_1", {1, 1, 6, 2})
    newTransition("simple2_1_1", "slide", {}, {{1,1,5,2},{1,1,6,2},{1,1,7,2}})
    newShape("backFire","backFire1_1_1", {1, 1, 2, 3})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,2,3},{1,1,2,4},{1,1,2,5}})
    newShape("shape","triangle1_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    newTransition("triangle1_1_1", "slide", {}, {{1,1,4,4},{1,1,5,4}})
    newShape("shape","bar3_1_1", {1, 1, 5, 3}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 7, 4}, "up")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,7,4},{1,1,7,5}})
    newShape("door","door1_1_1", {1, 1, 3, 5, "down", "disabled"})
    newShape("item","map", {1, 1, 6, 5})
    newShape("spitter","spitter1_1_1", {1, 1, 5, 5, "up", "none", "none", "none"})

    --SCREEN 1-2
    newShape("backFire","backFire1_1_2", {1, 2, 3, 1})
    newShape("door","door1_1_2", {1, 2, 5, 1}, "up")
    newShape("simple","simple1_1_2", {1, 2, 6, 2})
    newTransition("simple1_1_2", "switchSlide", {}, {{1,2,5,2},{1,2,6,2}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 5, 3}, "up")
    newTransition("manualFan1_1_2", "switchSlide", {}, {{1,2,5,3},{1,2,6,3}})
    newShape("shape","bar1_1_2", {1, 2, 7, 1}, "bar", {"horz", 2})
    newShape("shape","triangle1_1_2", {1, 2, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_1_2", {1, 2, 5, 4}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("shape","triangle3_1_2", {1, 2, 6, 4}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("door","door2_1_2", {1, 2, 7, 4}, "right")

    --SCREEN 2-2
    newShape("shape","triangle1_2_2", {2, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","bar1_2_2", {2, 2, 4, 2}, "bar", {"horz", 4})
    newTransition("bar1_2_2", "slide", {}, {{2,2,4,2},{2,2,4,3}})
    newShape("shape","triangle2_2_2", {2, 2, 5, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar2_2_2", {2, 2, 6, 2}, "bar", {"horz", 3})
    newShape("shape","triangle3_2_2", {2, 2, 7, 2}, "triangleBottomLeftShape")
    newTransition("triangle3_2_2", "slide", {}, {{2,2,7,2},{2,2,7,3}})
    newShape("shape","triangle4_2_2", {2, 2, 2, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","bar3_2_2", {2, 2, 1, 4}, "bar", {"horz", 2})
    newTransition("bar3_2_2", "switchSlide", {}, {{2,2,1,2},{2,2,1,4}})
    newShape("autoFan","autoFan1_2_2", {2, 2, 1, 4}, "up")
    newShape("endPoint","endPoint1_2_2", {2, 2, 2, 4})
    newShape("shape","triangle5_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan2_2_2", {2, 2, 7, 5}, "up")

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 5, 1}, { {"slide","simple1_1_2"},{"slide","manualFan1_1_2"},{"door-open","door1_1_1"},{"slide","bar3_2_2"} }, {"one-way"})

    --GEMS
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 4, 3}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 2, 5, 1}, "purple")
    newShape("gem","purple", {1, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {2, 2, 1, 3}, "purple")
    newShape("gem","purple", {2, 2, 3, 2}, "purple")
    newShape("gem","purple", {2, 2, 5, 3}, "purple")
    newShape("gem","purple", {2, 2, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 3}, "purple")
    newShape("gem","purple", {2, 2, 7, 4}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 1}, "purple")
    newShape("gem","purple", {2, 2, 2, 5}, "purple")
    newShape("gem","redCoin", {2, 2, 4, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 5, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 3, 3}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 1, 5}, 220)
    newShape("item","coins", {2, 2, 2, 2}, 130)
    newShape("item","big-present", {1, 2, 3, 2}, {})
    newShape("item","small-present", {1, 1, 7, 1}, {})
    newShape("item","dummyBall", {1, 2, 1, 4}, {})
    newShape("item","bomb", {1, 1, 4, 5}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
