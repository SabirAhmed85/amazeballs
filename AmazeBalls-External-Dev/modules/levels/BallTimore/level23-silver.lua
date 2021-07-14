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
    newShape("shape","triangle1_1_1", {1, 1, 1, 1}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("manualFan","manualFan1_1_1", {1, 1, 5, 1}, "left")
    newTransition("manualFan1_1_1", "slide", {}, {{1,1,5,1},{1,1,6,1}})
    newShape("gun","gun1_1_1", {1, 1, 5, 2}, "left")
    newShape("gun","gun2_1_1", {1, 1, 5, 3}, "left")
    newShape("shape","triangle2_1_1", {1, 1, 1, 4}, "triangleBottomLeftShape")
    newTransition("triangle2_1_1", "flip-horizontal")
    newShape("endPoint","endPoint1_1_1", {1, 1, 5, 4})
    newShape("shape","bar1_1_1", {1, 1, 6, 4}, "bar", {"horz", 3})
    --newShape("timeOut","timeOut1_1_1", {1, 1, 7, 4, 5})
    newShape("shape","triangle3_1_1", {1, 1, 6, 5}, "triangleTopRightShape")
    newTransition("triangle3_1_1", "slide", {}, {{1,1,6,4},{1,1,6,5}})

    --SCREEN 2-1
    newShape("shape","triangle1_2_1", {2, 1, 1, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 4, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan1_2_1", {2, 1, 5, 1}, "right")
    newShape("autoFan","autoFan2_2_1", {2, 1, 7, 1}, "right")
    newShape("door","door1_2_1", {2, 1, 7, 1}, "right")
    newShape("autoFan","autoFan3_2_1", {2, 1, 3, 2}, "left")
    newTransition("autoFan3_2_1", "switchSlide", {}, {{2,1,3,2},{2,1,5,2}})
    newShape("autoFan","autoFan4_2_1", {2, 1, 6, 2}, "down")
    newTransition("autoFan4_2_1", "slide", {}, {{2,1,6,1},{2,1,6,2}})
    newShape("autoFan","autoFan5_2_1", {2, 1, 2, 3}, "down")
    newTransition("autoFan5_2_1", "switchSlide", {labelled=false}, {{2,1,2,3},{2,1,2,5}})
    newShape("autoFan","autoFan6_2_1", {2, 1, 3, 3}, "right")
    newShape("autoFan","autoFan7_2_1", {2, 1, 5, 3}, "up")
    newShape("manualFan","manualFan1_2_1", {2, 1, 7, 3}, "left")
    newShape("door","door2_2_1", {2, 1, 1, 4}, "left")
    newShape("autoFan","autoFan8_2_1", {2, 1, 2, 4}, "left")
    newTransition("autoFan8_2_1", "switchSlide", {}, {{2,1,2,4},{2,1,3,4}})
    newShape("autoFan","autoFan9_2_1", {2, 1, 4, 4}, "down")
    newTransition("autoFan9_2_1", "switchSlide", {}, {{2,1,4,3},{2,1,4,4}})
    --newShape("timeOut","timeOut1_2_1", {2, 1, 7, 4, 5})
    newShape("gun","gun1_2_1", {2, 1, 1, 5}, "right")
    newShape("autoFan","autoFan10_2_1", {2, 1, 3, 5}, "up")
    newShape("door","door3_2_1", {2, 1, 4, 5}, "down")
    newShape("autoFan","autoFan11_2_1", {2, 1, 7, 5}, "up")

    --SCREEN 3-1
    newShape("shape","triangle1_3_1", {3, 1, 2, 1}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("item","map", {3, 1, 3, 1}, "up")
    newShape("shape","triangle1_3_1", {3, 1, 5, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 7, 1}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 2, 2}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 7, 2}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 1, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 4, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door1_3_1", {3, 1, 1, 4}, "left")
    newShape("shape","triangle1_3_1", {3, 1, 1, 4}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 3, 4}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("door","door2_3_1", {3, 1, 1, 5}, "left")
    newShape("shape","triangle1_3_1", {3, 1, 3, 5}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_1", {3, 1, 4, 5}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("simple","simple1_3_1", {3, 1, 6, 5})
    newTransition("simple1_3_1", "slide", {}, {{3,1,5,5},{3,1,6,5}})
    newShape("shape","bar1_3_1", {3, 1, 7, 4}, "bar", {"horz"})
    newShape("shape","triangle1_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape", {1, 4, "breakable"})
    newShape("door","door3_3_1", {3, 1, 7, 5}, "down")

    --SCREEN 2-2
    newShape("manualFan","manualFan1_2_2", {2, 2, 3, 1}, "left")
    newShape("manualFan","manualFan2_2_2", {2, 2, 6, 1}, "left")
    newShape("door","door1_2_2", {2, 2, 7, 1}, "up")
    newShape("manualFan","manualFan3_2_2", {2, 2, 7, 1}, "up")
    newShape("backFire","backFire1_2_2", {2, 2, 4, 2})
    newTransition("backFire1_2_2", "slide", {}, {{2,2,2,2},{2,2,4,2},{2,2,6,2}})
    newShape("autoFan","autoFan1_2_2", {2, 2, 2, 3}, "left")
    newShape("shape","bar1_2_2", {2, 2, 3, 3}, "bar", {"horz", 3})
    newShape("manualFan","manualFan4_2_2", {2, 2, 3, 3}, "down")
    newShape("autoFan","autoFan2_2_2", {2, 2, 5, 3}, "left")
    newShape("shape","bar2_2_2", {2, 2, 6, 3}, "bar", {"horz", 3})
    newShape("manualFan","manualFan5_2_2", {2, 2, 6, 3}, "up")
    newShape("autoFan","autoFan3_2_2", {2, 2, 1, 4}, "up")
    newShape("manualFan","manualFan6_2_2", {2, 2, 6, 4}, "down")
    newShape("manualFan","manualFan7_2_2", {2, 2, 2, 5}, "right")
    newShape("shape","bar3_2_2", {2, 2, 5, 5}, "bar", {"vert", 3})
    newTransition("bar3_2_2", "switchSlide", {}, {{2,2,4,5},{2,2,5,5}})
    newShape("manualFan","manualFan8_2_2", {2, 2, 5, 5}, "up")
    newShape("autoFan","autoFan4_2_2", {2, 2, 7, 5}, "up")

    --SCREEN 3-2
    newShape("shape","triangle1_3_2", {3, 2, 3, 1}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("autoFan","autoFan1_3_2", {3, 2, 4, 1}, "down")
    newShape("door","door1_3_2", {3, 2, 6, 1}, "up")
    newShape("spitter","spitter1_3_2", {3, 2, 7, 1}, {"none","none","down","left"})
    newShape("shape","triangle1_3_2", {3, 2, 1, 2}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("gun","gun1_3_2", {3, 2, 5, 2}, "down")
    newShape("manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left")
    newShape("shape","triangle1_3_2", {3, 2, 6, 3}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_2", {3, 2, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_2", {3, 2, 1, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","triangle1_3_2", {3, 2, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("door","door2_3_2", {3, 2, 1, 5}, "left")
    newShape("shape","triangle1_3_2", {3, 2, 6, 5}, "triangleTopLeftShape", {1, _, "breakable"})

    --SWITCHES
    newShape("switch","switch1_2_1", {2, 1, 1, 2}, { {"slide","autoFan8_2_1"},{"slide","bar3_2_2"} }, {"one-way"})

    newShape("switch","switch1_2_2", {2, 2, 3, 4}, { {"slide","autoFan5_2_1"} }, {"one-way"})

    newShape("switch","switch1_3_2", {3, 2, 3, 3}, { {"slide","autoFan3_2_1"},{"slide","autoFan9_2_1"} }, {"one-way"})

    --GEMS
    newShape("gem","purple", {1, 1, 2, 1}, "purple")
    newShape("gem","purple", {1, 1, 4, 1}, "purple")
    newShape("gem","purple", {1, 1, 2, 4}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 7, 4}, "purple")
    newShape("gem","purple", {1, 1, 1, 5}, "purple")
    newShape("gem","purple", {1, 1, 6, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 3, 5}, "purple")
    newShape("gem","purple", {1, 1, 5, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 1, 7, 1}, "purple")
    newShape("gem","purple", {2, 1, 7, 2}, "purple")
    newShape("gem","purple", {2, 1, 2, 2}, "purple")
    newShape("gem","purple", {2, 1, 3, 1}, "purple")
    newShape("gem","purple", {2, 1, 4, 5}, "purple")
    newShape("gem","purple", {2, 1, 1, 3}, "purple")
    newShape("gem","purple", {2, 1, 1, 4}, "purple")
    newShape("gem","purple", {3, 1, 2, 4}, "purple")
    newShape("gem","purple", {3, 1, 2, 3}, "purple")
    newShape("gem","purple", {3, 1, 1, 1}, "purple")
    newShape("gem","purple", {3, 1, 1, 2}, "purple")
    newShape("gem","purple", {3, 1, 4, 1}, "purple")
    newShape("gem","purple", {3, 1, 6, 1}, "purple")
    newShape("gem","purple", {3, 1, 3, 2}, "purple")
    newShape("gem","purple", {3, 1, 5, 2}, "purple")
    newShape("gem","purple", {3, 1, 5, 3}, "purple")
    newShape("gem","purple", {3, 1, 7, 3}, "purple")
    newShape("gem","purple", {3, 1, 1, 5}, "purple")
    newShape("gem","purple", {3, 1, 4, 4}, "purple")
    newShape("gem","purple", {3, 1, 6, 4}, "purple")
    newShape("gem","purple", {2, 2, 3, 5}, "purple")
    newShape("gem","purple", {2, 2, 6, 5}, "purple")
    newShape("gem","purple", {2, 2, 7, 2}, "purple")
    newShape("gem","purple", {2, 2, 7, 4}, "purple")
    newShape("gem","purple", {2, 2, 1, 1}, "purple")
    newShape("gem","purple", {2, 2, 4, 1}, "purple")
    newShape("gem","purple", {2, 2, 2, 4}, "purple")
    newShape("gem","purple", {2, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 5, 4}, "purple")
    newShape("gem","purple", {2, 2, 4, 5}, "purple")
    newShape("gem","purple", {2, 2, 5, 1}, "purple")
    newShape("gem","purple", {3, 2, 7, 2}, "purple")
    newShape("gem","purple", {3, 2, 6, 4}, "purple")
    newShape("gem","purple", {3, 2, 5, 5}, "purple")
    newShape("gem","purple", {3, 2, 1, 5}, "purple")
    newShape("gem","purple", {3, 2, 3, 5}, "purple")
    newShape("gem","purple", {3, 2, 2, 1}, "purple")
    newShape("gem","purple", {3, 2, 5, 1}, "purple")
    newShape("gem","purple", {3, 2, 1, 3}, "purple")
    newShape("gem","purple", {3, 2, 2, 2}, "purple")
    newShape("gem","purple", {3, 2, 4, 2}, "purple")
    newShape("gem","purple", {3, 2, 7, 5}, "purple")
    newShape("gem","purple", {3, 2, 6, 1}, "purple")
    newShape("gem","purple", {3, 2, 2, 5}, "purple")
    newShape("gem","purple", {3, 2, 7, 4}, "purple")
    newShape("gem","redCoin", {2, 2, 1, 3}, "redCoin")
    newShape("gem","blueCoin", {3, 2, 6, 2}, "blueCoin")
    newShape("gem","purpleCoin", {3, 1, 7, 4}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 1, 2, 5}, 140)
    newShape("item","coins", {2, 1, 2, 1}, 85)
    newShape("item","coins", {3, 1, 3, 3}, 225)
    newShape("item","coins", {3, 1, 2, 5}, 70)
    newShape("item","coins", {3, 2, 4, 5}, 190)
    newShape("item","coins", {2, 2, 7, 3}, 130)
    newShape("item","small-present", {2, 1, 1, 5}, {})

    newShape("item","small-present", {3, 1, 6, 2}, {})

    newShape("item","big-present", {2, 2, 2, 1}, {})

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 3
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
