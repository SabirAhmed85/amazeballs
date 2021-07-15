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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 2})
    newShape("shape","bar2_1_1", {1, 1, 5, 1}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_1", {1, 1, 2, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 2}, "left")
    newShape("shape","bar3_1_1", {1, 1, 6, 4}, "bar", {"vert", 2})
    newTransition("bar3_1_1", "switchSlide", {}, {{1,1,5,4},{1,1,6,4}})
    newShape("shape","triangle2_1_1", {1, 1, 5, 4}, "triangleTopRightShape", {1, 16, "breakable"})
    newShape("manualFan","manualFan2_1_1", {1, 1, 2, 5}, "left")
    newShape("shape","bar4_1_1", {1, 1, 5, 5}, "bar", {"horz"})
    newTransition("bar4_1_1", "slide", {}, {{1,1,5,4},{1,1,5,5}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 5}, "down")
    newShape("door","door1_1_1", {1, 1, 6, 5}, "down")

    --SCREEN 1-2
    newShape("autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    newShape("manualFan","manualFan1_1_2", {1, 2, 6, 1}, "right")
    newShape("shape","triangle1_1_2", {1, 2, 3, 2}, "triangleBottomRightShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,1,2},{1,2,3,2}})
    newShape("autoFan","autoFan2_1_2", {1, 2, 5, 2}, "down")
    newShape("manualFan","manualFan2_1_2", {1, 2, 5, 3}, "down")
    newShape("autoFan","autoFan3_1_2", {1, 2, 5, 4}, "right")
    newShape("door","door1_1_2", {1, 2, 7, 4}, "right")
    newShape("shape","bar1_1_2", {1, 2, 3, 5}, "bar", {"vert", 2})
    newShape("manualFan","manualFan3_1_2", {1, 2, 1, 5}, "up")
    newShape("manualFan","manualFan4_1_2", {1, 2, 6, 5}, "left")

    --SCREEN 2-2
    newShape("shape","triangle1_2_2", {2, 2, 2, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_2", {2, 2, 5, 1}, "triangleBottomLeftShape")
    newShape("shape","triangle3_2_2", {2, 2, 6, 1}, "triangleBottomRightShape")
    newShape("shape","triangle4_2_2", {2, 2, 3, 2}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle5_2_2", {2, 2, 6, 2}, "triangleTopRightShape")
    newShape("shape","triangle6_2_2", {2, 2, 1, 3}, "triangleTopRightShape")
    newShape("shape","triangle7_2_2", {2, 2, 5, 3}, "triangleTopLeftShape")
    newShape("endPoint","endPoint1_2_2", {2, 2, 6, 3})
    newShape("shape","triangle8_2_2", {2, 2, 7, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_2_2", {2, 2, 1, 4}, "right")
    newShape("autoFan","autoFan2_2_2", {2, 2, 4, 4}, "left")
    newShape("shape","triangle9_2_2", {2, 2, 1, 5}, "triangleBottomLeftShape")
    newShape("spitter","spitter1_2_2", {2, 2, 5, 5, "up","none","none","none"})
    newTransition("spitter1_2_2", "slide", {}, {{2,2,5,5},{2,2,6,5},{2,2,7,5}})
    newShape("shape","bar1_2_2", {2, 2, 2, 6}, "bar", {"vert", 2})
    newShape("shape","bar2_2_2", {2, 2, 3, 6}, "bar", {"vert", 2})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 7, 2}, { {"slide","bar3_1_1"} })

    --GEMS
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 5}, "purple")
    newShape("gem","purple", {1, 2, 5, 5}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 3}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 4}, "purple")
    newShape("gem","purple", {2, 2, 2, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 4}, "purple")
    newShape("gem","purple", {2, 2, 2, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 5, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","redCoin", {1, 1, 7, 4}, "redCoin")
    newShape("gem","blueCoin", {1, 2, 1, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 2, 7, 1}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {2, 2, 1, 1}, 40)
    newShape("item","small-present", {1, 1, 4, 4}, {})

    newShape("item","small-present", {2, 2, 7, 4}, {})

    newShape("item","big-present", {2, 2, 5, 4}, {})
    newShape("item","fireCape", {1, 2, 4, 2}, {})
    newShape("item","dummyBall", {1, 1, 1, 3}, {})
end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
