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
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 2}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 2}, "right")
    newShape("shape","bar1_1_1", {1, 1, 1, 3}, "bar", {"vert", 2})
    newTransition("bar1_1_1", "autoSlide", {}, {{1,1,1,3},{1,1,2,3}})
    newShape("shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopRightShape")
    newShape("item","map", {1, 1, 3, 3})
    newShape("spitter","spitter1_1_1", {1, 1, 4, 3}, {"none","right","none","none"})
    newShape("manualFan","manualFan1_1_1", {1, 1, 6, 3}, "up")
    newShape("door","door1_1_1", {1, 1, 7, 3}, "right")
    newShape("backFire","backFire1_1_1", {1, 1, 1, 5})
    newShape("autoFan","autoFan1_1_1", {1, 1, 2, 5}, "up")
    newShape("spitter","spitter2_1_1", {1, 1, 5, 5}, {"none","none","none","left"})
    newTransition("spitter2_1_1", "switchSlide", {labelled = false}, {{1,1,4,5},{1,1,5,5}})
    newShape("autoFan","autoFan1_1_1", {1, 1, 6, 5}, "right")
    newShape("door","door1_1_1", {1, 1, 7, 5}, "right")

    --SCREEN 2-1
    newShape("autoFan","autoFan1_2_1", {2, 1, 1, 1}, "right")
    newShape("manualFan","manualFan1_2_1", {2, 1, 4, 1}, "down")
    newShape("shape","triangle1_2_1", {2, 1, 5, 1}, "triangleBottomRightShape", {1, 9})
    newShape("manualFan","manualFan2_2_1", {2, 1, 5, 2}, "down")
    newShape("shape","bar1_2_1", {2, 1, 6, 2}, "bar", {"horz", 2})
    newShape("autoFan","autoFan2_2_1", {2, 1, 2, 3}, "right")
    newShape("autoFan","autoFan3_2_1", {2, 1, 4, 3}, "down")
    newShape("shape","triangle2_2_1", {2, 1, 7, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("manualFan","manualFan3_2_1", {2, 1, 3, 4}, "up")
    newTransition("manualFan2_2_1", "slide", {}, {{2,1,1,3},{2,1,1,4,"*"},{2,1,2,4},{2,1,3,4}})
    newShape("endPoint","endPoint1_2_1", {2, 1, 5, 4})
    newShape("shape","triangle3_2_1", {2, 1, 2, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door","door1_2_1", {2, 1, 4, 5}, "down")
    newShape("shape","triangle4_2_1", {2, 1, 7, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("door","door2_1_2", {1, 2, 4, 1}, "up")
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 1}, "up")
    newShape("shape","bar1_1_2", {1, 2, 6, 1}, "bar", {"horz", 3})
    newTransition("bar1_1_2", "switchSlide", {}, {{1,2,6,1},{1,2,6,2}})
    newShape("shape","triangle1_1_2", {1, 2, 7, 1}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape","bar2_1_2", {1, 2, 4, 2}, "bar", {"vert", 3})
    newTransition("bar2_1_2", "switchSlide", {}, {{1,2,3,2},{1,2,4,2}})
    newShape("shape","triangle2_1_2", {1, 2, 5, 2}, "triangleBottomRightShape")
    newTransition("triangle4_1_2", "slide", {}, {{1,2,5,2},{1,2,5,3}})
    newShape("shape","bar3_1_2", {1, 2, 2, 3}, "bar", {"horz", 3})
    newShape("manualFan","manualFan1_1_2", {1, 2, 2, 3}, "right")
    newShape("manualFan","manualFan1_1_2", {1, 2, 4, 3}, "up")
    newShape("manualFan","manualFan1_1_2", {1, 2, 7, 3}, "up")
    newShape("shape","triangle3_1_2", {1, 2, 6, 4}, "triangleTopRightShape")
    newTransition("triangle3_1_2", "flip-horizontal")
    newShape("manualFan","manualFan1_1_2", {1, 2, 7, 4}, "down")
    newTransition("manualFan1_1_2", "slide", {}, {{1,2,7,4},{1,2,7,5}})
    newShape("shape","triangle4_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","bar4_1_2", {1, 2, 5, 5}, "bar", {"horz", 2})

    --SCREEN 2-2
    newShape("manualFan","manualFan1_2_2", {2, 2, 5, 1}, "right")
    newTransition("manualFan1_2_2", "slide", {}, {{2,2,4,1},{2,2,5,1}})
    newShape("shape","triangle1_2_2", {2, 2, 7, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("door","door1_2_2", {2, 2, 1, 3}, "left")
    newShape("spitter","spitter1_2_2", {2, 2, 4, 3}, {"none","none","none","left"})
    newShape("shape","triangle2_2_2", {2, 2, 6, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_2_2", {2, 2, 1, 4}, "right")
    newShape("shape","triangle3_2_2", {2, 2, 2, 4}, "triangleBottomRightShape")
    newTransition("triangle3_2_2", "slide", {}, {{2,2,1,3},{2,2,2,4}})
    newShape("item","compass", {2, 2, 5, 4})
    newShape("simple", "simple1_2_2", {2, 2, 1, 5})
    newShape("shape","triangle4_2_2", {2, 2, 6, 5}, "triangleBottomLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_2_1", {2, 1, 3, 5}, { {"slide","bar1_1_2"} }, {"one-way"})

    newShape("switch","switch1_1_2", {1, 2, 6, 1}, { {"slide","spitter2_1_1"} }, {"one-way", "not-labelled"})
    --GEMS
    newShape("gem","purple", {1, 1, 1, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 5, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 1, 2}, "purple")
    newShape("gem","purple", {1, 1, 4, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 2, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 1}, "purple")
    newShape("gem","purple", {2, 1, 3, 3}, "purple")
    newShape("gem","purple", {2, 1, 4, 4}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 5, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 3}, "purple")
    newShape("gem","purple", {2, 1, 6, 5}, "purple")
    newShape("gem","purple", {2, 1, 7, 4}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 2}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 4}, "purple")
    newShape("gem","purple", {1, 2, 3, 3}, "purple")
    newShape("gem","purple", {1, 2, 6, 3}, "purple")
    newShape("gem","purple", {1, 2, 4, 4}, "purple")
    newShape("gem","purple", {1, 2, 2, 4}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 6, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 2}, "purple")
    newShape("gem","purple", {1, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 3, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 4}, "purple")
    newShape("gem","purple", {2, 2, 6, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 5}, "purple")
    newShape("gem","purple", {2, 2, 7, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 1, 1}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 1, 2}, "purple")
    newShape("gem","redCoin", {2, 1, 2, 1}, "redCoin")
    newShape("gem","blueCoin", {2, 2, 7, 3}, "blueCoin")
    newShape("gem","purpleCoin", {1, 2, 4, 5}, "purpleCoin")
    --ITEMS
    newShape("item","coins", {1, 1, 2, 1}, 21)
    newShape("item","coins", {1, 2, 3, 5}, 26)
    newShape("item","coins", {2, 2, 2, 2}, 180)
    newShape("item","big-present", {2, 1, 1, 2}, {})
    newShape("item","small-present", {1, 2, 5, 1}, {})
    newShape("item","iceCape", {2, 2, 2, 1}, {})
    newShape("item","dummyBall", {2, 1, 5, 5}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 2
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "down"
t.initialDirection = t.ballFirstDirection

return t
