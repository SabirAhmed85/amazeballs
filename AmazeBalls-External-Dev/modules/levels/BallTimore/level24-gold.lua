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
    newShape("shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"horz"})
    newTransition("bar1_1_1", "slide", {}, {{1,1,7,1},{1,1,7,4}})
    newShape("shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3})
    newShape("spitter","spitter1_1_1", {1, 1, 6, 2, "up","none","none","left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,6,2},{1,1,6,3},{1,1,6,5}})
    newShape("shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopLeftShape")
    newTransition("triangle1_1_1", "flip-vertical")
    newShape("gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    newShape("shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    newShape("shape","triangle3_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, 3, "breakable"})
    newShape("shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, 20, "breakable"})
    newShape("door","door1_1_1", {1, 1, 7, 4}, "right")
    newShape("backFire","backFire1_1_1", {1, 1, 1, 5})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,1,5},{1,1,2,5}})
    newShape("shape","bar3_1_1", {1, 1, 3, 5}, "bar", {"horz", 3})
    newShape("shape","bar4_1_1", {1, 1, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-1
    newShape("spitter","spitter1_2_1", {2, 1, 7, 1}, {"none","none","down","none"})
    newTransition("spitter1_2_1", "slide", {}, {{2,1,6,1},{2,1,7,1}})
    newShape("door","door1_2_1", {2, 1, 1, 2}, "left")
    newShape("spitter","spitter2_2_1", {2, 1, 1, 2}, {"none","none","none","left"})
    newTransition("spitter2_2_1", "slide", {}, {{2,1,1,2},{2,1,1,3}})
    newShape("shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 3})
    newShape("spitter","spitter3_2_1", {2, 1, 4, 2}, {"none","none","none","left"})
    newTransition("spitter3_2_1", "slide", {}, {{2,1,4,1},{2,1,4,2}})
    newShape("shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle2_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("shape","triangle3_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle4_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    newShape("shape","bar2_2_1", {2, 1, 1, 5}, "bar", {"vert"})
    newTransition("bar2_2_1", "slide", {}, {{2,1,1,5},{2,1,3,5}})
    newShape("door","door1_2_1", {2, 1, 3, 5, "down", "disabled"})
    newShape("shape","triangle5_2_1", {2, 1, 4, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    newShape("shape","bar3_2_1", {2, 1, 6, 5}, "bar", {"vert", 4})

    --SCREEN 1-2
    newShape("spitter","spitter1_1_2", {1, 2, 1, 1}, {"none","none","down","none"})
    newShape("item","big-present", {1, 2, 3, 1}, {})

    newShape("gun","gun1_1_2", {1, 2, 3, 2}, "left")
    newShape("autoFan","autoFan1_1_2", {1, 2, 7, 2}, "right")
    newShape("door","door1_1_2", {1, 2, 7, 2}, "right")
    newShape("gun","gun1_1_2", {1, 2, 3, 3}, "down")
    newShape("gun","gun1_1_2", {1, 2, 4, 3}, "right")
    newShape("shape","bar1_1_2", {1, 2, 7, 4}, "bar", {"vert", 4})
    newTransition("bar1_1_2", "slide", {}, {{1,2,6,4},{1,2,7,4}})
    newShape("shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopLeftShape")
    newTransition("triangle1_1_2", "slide", {}, {{1,2,6,4},{1,2,7,5}})
    newShape("shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    --newShape("timeOut","timeOut1_1_2", {1, 2, 4, 5, 2})
    newShape("shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"horz", 3})
    newTransition("bar2_1_2", "slide", {}, {{1,2,6,4},{1,2,6,5}})

    --SCREEN 2-2
    newShape("door","door1_2_2", {2, 2, 1, 1}, "left", {"disabled"})
    newShape("autoFan","autoFan1_2_2", {2, 2, 2, 1}, "left")
    newTransition("autoFan1_2_2", "switchSlide", {}, {{2,2,2,1},{2,2,3,1}})
    newShape("manualFan","manualFan1_2_2", {2, 2, 5, 1}, "down")
    newTransition("manualFan1_2_2", "slide", {}, {{2,2,5,1},{2,2,5,2}})
    newShape("door","door2_2_2", {2, 2, 5, 1}, "up")
    newShape("gun","gun1_2_2", {2, 2, 6, 1}, "down")
    newShape("manualFan","manualFan2_2_2", {2, 2, 3, 2}, "right")
    newShape("shape","triangle1_2_2", {2, 2, 2, 3}, "triangleBottomRightShape")
    newTransition("triangle1_2_2", "switchSlide", {}, {{2,2,1,3},{2,2,2,3}})
    newShape("shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopLeftShape")
    newTransition("triangle2_2_2", "switchSlide", {}, {{2,2,4,3},{2,2,5,3}})
    newShape("autoFan","autoFan2_2_2", {2, 2, 3, 4}, "down")
    newShape("shape","triangle3_2_2", {2, 2, 4, 4}, "triangleBottomRightShape")
    newTransition("triangle3_2_2", "switchSlide", {}, {{2,2,4,4},{2,2,5,4}})
    newShape("shape","triangle4_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")
    newTransition("triangle4_2_2", "switchSlide", {}, {{2,2,6,4},{2,2,6,5}})
    newShape("gun","gun2_2_2", {2, 2, 2, 5}, "up")

    --SCREEN 3-2
    newShape("tunnel","tunnel1_3_2", {3, 2, 1, 1, 2, 3, 6, 1}, {"none"})
    newShape("autoFan","autoFan1_3_2", {3, 2, 4, 1}, "up")
    newShape("shape","triangle1_3_2", {3, 2, 5, 1}, "triangleBottomRightShape")
    newShape("shape","bar1_3_2", {3, 2, 8, 1}, "bar", {"horz", 2})
    newShape("shape","bar2_3_2", {3, 2, 3, 2}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_3_2", {3, 2, 4, 2}, "left")
    newShape("tunnel","tunnel2_3_2", {3, 2, 6, 2, 3, 2, 5, 5, "none"})
    newShape("shape","triangle1_3_2", {3, 2, 3, 3}, "triangleTopLeftShape")
    newShape("manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left")
    newShape("shape","triangle2_3_2", {3, 2, 6, 3}, "triangleTopLeftShape")
    newShape("shape","triangle3_3_2", {3, 2, 7, 3}, "triangleBottomRightShape")
    newShape("shape","bar3_3_2", {3, 2, 1, 4}, "bar", {"vert", 4})
    newTransition("bar3_3_2", "slide", {}, {{3,2,1,4},{3,2,2,4}})
    newShape("manualFan","manualFan1_3_2", {3, 2, 1, 4}, "up")
    newShape("tunnel","tunnel3_3_2", {3, 2, 2, 4, 3, 2, 5, 2}, "up")
    newShape("manualFan","manualFan1_3_2", {3, 2, 4, 4}, "left")
    newShape("autoFan","autoFan1_3_2", {3, 2, 5, 4}, "right")
    --newShape("item","coins", {3, 2, 1, 5}, 250)
    newShape("door","door1_3_2", {3, 2, 1, 5}, "down")
    newShape("manualFan","manualFan1_3_2", {3, 2, 4, 5}, "right")
    newShape("tunnel","tunnel4_3_2", {3, 2, 7, 5, 3, 2, 1, 3, "none"})
    newTransition("tunnel4_3_2", "switchSlide", {}, {{3,2,7,4},{3,2,7,5}})
    newShape("door","door2_3_2", {3, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 4-2
    newShape("endPoint","endPoint1_4_2", {4, 2, 7, 1})
    newShape("autoFan","autoFan1_4_2", {4, 2, 1, 2}, "down")
    newShape("gun","gun1_4_2", {4, 2, 3, 2}, "down")
    newShape("gun","gun2_4_2", {4, 2, 5, 2}, "down")
    newShape("shape","bar1_4_2", {4, 2, 7, 2}, "bar", {"vert", 3})
    newTransition("bar1_4_2", "switchSlide", {}, {{4,2,5,2},{4,2,7,2}})
    newShape("manualFan","manualFan1_4_2", {4, 2, 7, 2}, "right")
    newShape("shape","triangle1_4_2", {4, 2, 4, 3}, "triangleBottomRightShape")
    newShape("shape","triangle2_4_2", {4, 2, 7, 3}, "triangleTopLeftShape")
    newShape("gun","gun3_4_2", {4, 2, 2, 4}, "up")
    newShape("gun","gun4_4_2", {4, 2, 6, 4}, "up")
    newShape("manualFan","manualFan2_4_2", {4, 2, 1, 5}, "right")
    newShape("door","door1_4_2", {4, 2, 1, 5}, "down")
    newShape("simple","simple1_4_2", {4, 2, 2, 5})
    newShape("shape","triangle3_4_2", {4, 2, 4, 5}, "triangleTopLeftShape")

    --SCREEN 2-3
    newShape("door","door1_2_3", {2, 3, 3, 1}, "up")
    newShape("autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right")
    newShape("shape","bar1_2_3", {2, 3, 3, 2}, "bar", {"horz", 4})
    newTransition("bar1_2_3", "slide", {}, {{2,3,3,2},{2,3,3,3}})
    --newShape("timeOut","timeOut1_2_3", {2, 3, 4, 2, 3})
    newShape("shape","triangle1_2_3", {2, 3, 6, 2}, "triangleBottomRightShape", {1, 9})
    newTransition("triangle1_2_3", "flip-horizontal")
    newShape("autoFan","autoFan2_2_3", {2, 3, 7, 2}, "right")
    newShape("door","door1_2_3", {2, 3, 7, 2}, "right")
    --newShape("timeOut","timeOut2_2_3", {2, 3, 1, 3, 3})
    newShape("manualFan","manualFan1_2_3", {2, 3, 4, 3}, "down")
    newTransition("manualFan1_2_3", "slide", {}, {{2,3,3,3},{2,3,4,3}})
    newShape("shape","bar2_2_3", {2, 3, 5, 3}, "bar", {"horz", 2})
    newShape("autoFan","autoFan3_2_3", {2, 3, 6, 3}, "right")
    newTransition("autoFan3_2_3", "slide", {}, {{2,3,5,3},{2,3,6,3}})
    newShape("shape","bar3_2_3", {2, 3, 2, 4}, "bar", {"vert", 4})
    newTransition("bar3_2_3", "slide", {}, {{2,3,2,4},{2,3,3,4}})
    newShape("shape","triangle2_2_3", {2, 3, 2, 4}, "triangleTopRightShape")
    newTransition("triangle2_2_3", "slide", {}, {{2,3,2,4},{2,3,2,5}})
    newShape("autoFan","autoFan4_2_3", {2, 3, 3, 4}, "up")
    newShape("shape","bar4_2_3", {2, 3, 2, 5}, "bar", {"horz", 3})
    --newShape("timeOut","timeOut3_2_3", {2, 3, 4, 5, 3})
    newShape("shape","bar5_2_3", {2, 3, 5, 5}, "bar", {"vert", 2})
    newShape("shape","bar6_2_3", {2, 3, 6, 5}, "bar", {"vert", 4})
    newShape("shape","triangle3_2_3", {2, 3, 6, 5}, "triangleBottomLeftShape")
    newTransition("triangle3_2_3", "flip-horizontal")

    --SCREEN 3-3
    newShape("door","door1_3_3", {3, 3, 1, 1}, "up")
    newShape("shape","triangle1_3_3", {3, 3, 1, 1}, "triangleTopRightShape")
    newShape("gem","redCoin", {3, 3, 2, 1}, "redCoin")
    newShape("tunnel","tunnel1_3_3", {3, 3, 3, 1, 3, 3, 3, 5, "none"})
    newTransition("tunnel1_3_3", "slide", {}, {{3,3,3,1},{3,3,3,2}})
    newShape("door","door2_3_3", {3, 3, 4, 1}, "up")
    newShape("autoFan","autoFan1_3_3", {3, 3, 4, 1}, "up")
    newTransition("autoFan1_3_3", "slide", {}, {{3,3,4,1},{3,3,4,2}})
    newShape("tunnel","tunnel2_3_3", {3, 3, 5, 1, 3, 3, 3, 4, "none"})
    newTransition("tunnel2_3_3", "slide", {}, {{3,3,5,1},{3,3,5,2}})
    newShape("shape","triangle1_3_3", {3, 3, 6, 1}, "triangleTopRightShape")
    newShape("shape","triangle2_3_3", {3, 3, 7, 1}, "triangleTopLeftShape", {1, 5})
    newShape("simple","simple1_3_3", {3, 3, 1, 2})
    newShape("manualFan","manualFan1_3_3", {3, 3, 7, 2}, "right")
    newShape("manualFan","manualFan2_3_3", {3, 3, 1, 3}, "down")
    newShape("shape","triangle3_3_3", {3, 3, 4, 3}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle3_3_3", "slide", {}, {{3,3,3,3},{3,3,4,3}})
    newShape("shape","bar1_3_3", {3, 3, 7, 3}, "bar", {"horz"})
    newShape("item","map", {3, 3, 7, 3})
    newShape("tunnel","tunnel3_3_3", {3, 3, 2, 4, 3, 3, 7, 4, "none"})
    newTransition("tunnel3_3_3", "slide", {}, {{3,3,1,4},{3,3,2,4}})
    newShape("shape","bar2_3_3", {3, 3, 6, 4}, "bar", {"vert", 2})
    newTransition("bar2_3_3", "slide", {}, {{3,3,6,4},{3,3,7,4}})
    newShape("shape","triangle4_3_3", {3, 3, 1, 5}, "triangleTopRightShape", {1, 1})
    newShape("manualFan","manualFan3_3_3", {3, 3, 4, 5}, "down")
    newShape("shape","triangle5_3_3", {3, 3, 5, 5}, "triangleBottomLeftShape")
    newTransition("triangle5_3_3", "flip-vertical")

    --SCREEN 4-3
    newShape("door","door1_4_3", {4, 3, 1, 1}, "up")
    newShape("gun","gun1_4_3", {4, 3, 3, 1}, "up")
    newShape("spitter","spitter1_4_3", {4, 3, 1, 2, "up","none","down","none"})
    newShape("autoFan","autoFan1_4_3", {4, 3, 2, 2}, "up")
    newTransition("autoFan1_4_3", "slide", {}, {{4,3,2,2},{4,3,2,3}})
    newShape("shape","triangle1_4_3", {4, 3, 5, 2}, "triangleBottomLeftShape")
    newTransition("triangle1_4_3", "flip-vertical")
    newShape("shape","triangle2_4_3", {4, 3, 6, 2}, "triangleTopRightShape")
    newShape("shape","triangle3_4_3", {4, 3, 7, 2}, "triangleBottomLeftShape")
    newShape("spitter","spitter2_4_3", {4, 3, 6, 3}, {"none","none","none","left"})
    newShape("autoFan","autoFan2_4_3", {4, 3, 7, 3}, "up")
    newTransition("autoFan2_4_3", "slide", {}, {{4,3,7,3},{4,3,7,5}})
    newShape("shape","triangle4_4_3", {4, 3, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    newShape("shape","triangle5_4_3", {4, 3, 5, 5}, "triangleBottomLeftShape")

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 4, 2}, { {"door-open","door1_2_2"},{"slide","autoFan1_2_2"},{"slide","tunnel4_3_2"},{"door-open","door2_3_2"} }, {"one-way", "not-labelled"})
    newShape("switch","switch1_3_3", {3, 3, 2, 3}, { {"slide","triangle1_2_2"},{"slide","triangle3_2_2"} }, {"one-way"})
    newShape("switch","switch2_3_3", {3, 3, 6, 3}, { {"slide","triangle2_2_2"},{"slide","triangle4_2_2"} }, {"one-way"})

    newShape("switch","switch1_4_3", {4, 3, 3, 3}, { {"slide","bar1_4_2"} })

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 3
t.screenHorzTotal = 4
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 5
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
