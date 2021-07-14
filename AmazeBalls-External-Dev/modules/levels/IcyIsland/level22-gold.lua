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
    newShape("shape","bar1_1_1", {1, 1, 1, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 1, 1}, "left")
    newShape("shape","bar1_1_1", {1, 1, 4, 1}, "bar", {"vert"})
    newShape("manualFan","manualFan2_1_1", {1, 1, 4, 1}, "right")
    newShape("tunnel","tunnel1_1_1", {1, 1, 6, 1, 1, 1, 2, 4, "none"})
    newShape("manualFan","manualFan3_1_1", {1, 1, 1, 3}, "up")
    newShape("shape","bar1_1_1", {1, 1, 2, 3}, "bar", {"horz"})
    newShape("shape","triangle1_1_1", {1, 1, 4, 3}, "triangleTopRightShape")
    newShape("manualFan","manualFan4_1_1", {1, 1, 6, 3}, "up")
    newShape("simple","simple1_1_1", {1, 1, 7, 3})
    newShape("shape","triangle2_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape")
    newShape("gem","purple", {1, 1, 5, 4}, "purple")
    newShape("gem","purple", {1, 1, 6, 4}, "purple")
    newShape("door","door1_1_1", {1, 1, 4, 5}, "down")

    --SCREEN 2-1
    newShape("simple","simple1_2_1", {2, 1, 1, 1})
    newTransition("simple1_2_1", "slide", {}, {{2,1,1,1},{2,1,2,1},{2,1,3,1}})
    newShape("shape","triangle1_2_1", {2, 1, 4, 1}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle1_2_1", "slide", {}, {{2,1,4,1},{2,1,5,1}})
    newShape("autoFan","autoFan1_2_1", {2, 1, 7, 1}, "down")
    newTransition("autoFan1_2_1", "slide", {}, {{2,1,6,1},{2,1,7,1}})
    newShape("shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"vert", 4})
    newShape("shape","bar2_2_1", {2, 1, 3, 2}, "bar", {"vert", 4})
    newShape("backFire","backFire1_2_1", {2, 1, 3, 2})
    newTransition("backFire1_2_1", "slide", {}, {{2,1,2,2},{2,1,3,2}})
    newShape("autoFan","autoFan2_2_1", {2, 1, 7, 2}, "right")
    newTransition("autoFan2_2_1", "slide", {}, {{2,1,6,2},{2,1,7,2}})
    newShape("door","door1_2_1", {2, 1, 1, 3}, "left")
    newShape("shape","bar3_2_1", {2, 1, 5, 3}, "bar", {"horz", 2})
    newShape("autoFan","autoFan3_2_1", {2, 1, 6, 3}, "right")
    newShape("shape","bar4_2_1", {2, 1, 1, 4}, "bar", {"vert", 4})
    newTransition("bar4_2_1", "switchSlide", {}, {{2,1,1,4},{2,1,2,4}})
    newShape("backFire","backFire2_2_1", {2, 1, 1, 4})
    newTransition("backFire2_2_1", "slide", {}, {{2,1,1,4},{2,1,2,4}})
    newShape("shape","bar5_2_1", {2, 1, 4, 4}, "bar", {"horz", 3})
    newTransition("bar5_2_1", "slide", {}, {{2,1,4,3},{2,1,4,4}})
    newShape("autoFan","autoFan4_2_1", {2, 1, 6, 4}, "down")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,5,4},{2,1,6,4}})
    newShape("simple","simple2_2_1", {2, 1, 2, 5})
    newShape("simple","simple3_2_1", {2, 1, 3, 5})
    newTransition("simple3_2_1", "slide", {}, {{2,1,3,5},{2,1,5,5}})

    --SCREEN 1-2
    newShape("shape","triangle1_1_2", {1, 2, 2, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_1_2", {1, 2, 3, 1}, "down")
    newShape("shape","triangle2_1_2", {1, 2, 6, 1}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape","triangle3_1_2", {1, 2, 4, 2}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape","triangle4_1_2", {1, 2, 7, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape","bar1_1_2", {1, 2, 1, 3}, "bar", {"horz"})
    newShape("spitter","spitter1_1_2", {1, 2, 2, 3, "up", "right", "down", "none"})
    newShape("door","door1_1_2", {1, 2, 7, 3}, "right")
    newShape("endPoint","endPoint1_1_2", {1, 2, 4, 4})
    newShape("simple","simple1_1_2", {1, 2, 6, 4})
    newShape("shape","triangle5_1_2", {1, 2, 2, 5}, "triangleTopLeftShape")
    newShape("autoFan","autoFan1_1_2", {1, 2, 3, 5}, "up")
    newShape("shape","triangle6_1_2", {1, 2, 7, 5}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle6_1_2", "flip-vertical")

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 2, 1}, "up")
    newShape("manualFan","manualFan1_2_2", {2, 2, 3, 1}, "right")
    newShape("manualFan","manualFan2_2_2", {2, 2, 5, 1}, "down")
    newShape("shape","bar1_2_2", {2, 2, 6, 1}, "bar", {"horz", 2})
    newShape("manualFan","manualFan3_2_2", {2, 2, 7, 1}, "right")
    newShape("manualFan","manualFan4_2_2", {2, 2, 2, 2}, "up")
    newShape("manualFan","manualFan5_2_2", {2, 2, 3, 2}, "left")
    newShape("manualFan","manualFan6_2_2", {2, 2, 6, 2}, "down")
    newTransition("manualFan6_2_2", "slide", {}, {{2,2,6,2},{2,2,6,3}})
    newShape("door","door2_2_2", {2, 2, 1, 3}, "left", {"disabled"})
    newShape("manualFan","manualFan7_2_2", {2, 2, 1, 3}, "left")
    newShape("manualFan","manualFan8_2_2", {2, 2, 3, 3}, "up")
    newShape("shape","triangle1_2_2", {2, 2, 2, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan9_2_2", {2, 2, 3, 4}, "up")
    newShape("manualFan","manualFan10_2_2", {2, 2, 5, 4}, "right")
    newShape("manualFan","manualFan11_2_2", {2, 2, 7, 4}, "up")
    newShape("autoFan","autoFan1_2_2", {2, 2, 1, 5}, "up")
    newShape("manualFan","manualFan12_2_2", {2, 2, 4, 5}, "up")
    newShape("shape","bar2_2_2", {2, 2, 5, 6}, "bar", {"vert", 2})
    newShape("manualFan","manualFan13_2_2", {2, 2, 6, 5}, "left")

    --SWITCHES
    newShape("switch","switch1_2_1", {2, 1, 2, 3}, { {"slide","bar4_2_1"} })

    newShape("switch","switch1_2_2", {2, 2, 1, 1}, { {"door-open","door2_2_2"} })

    --GEMS
    newShape("gem","purple", {1, 1, 5, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {1, 1, 1, 4}, "purple")
    newShape("gem","purple", {1, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 3}, "purple")
    newShape("gem","purple", {2, 1, 7, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 2}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 3}, "purple")
    newShape("gem","purple", {2, 1, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 5, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 5, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 1}, "purple")
    newShape("gem","purple", {1, 2, 1, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 3, 4}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","purple", {2, 2, 2, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 2, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 7, 5}, "purple")
    newShape("gem","purple", {2, 2, 2, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 7, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","redCoin", {1, 2, 3, 2}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 7, 4}, "blueCoin")
    newShape("gem","purpleCoin", {2, 1, 1, 2}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 6, 2}, 20)
    newShape("item","coins", {2, 2, 4, 1}, 245)
    newShape("item","coins", {2, 1, 7, 4}, 29)
    newShape("item","big-present", {2, 1, 1, 5}, {})
    newShape("item","small-present", {1, 2, 6, 5}, {})
    newShape("item","small-present", {1, 1, 1, 2}, {})
    newShape("item","fireCape", {1, 2, 4, 3}, {})
    newShape("item","iceCape", {2, 2, 1, 4}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 3
t.ballFirstVertSquare = 5
t.ballFirstDirection = "up"
t.initialDirection = t.ballFirstDirection

return t
