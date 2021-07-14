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
    newShape("endPoint", "endPoint1_1_1", {1, 1, 2, 1})
    newShape("gun", "gun1_1_1", {1, 1, 7, 2}, "left")
    newShape("shape", "triangle1_1_1", {1, 1, 2, 3}, "triangleBottomRightShape", {1, 3})
    newShape("item", "mystery-block", {1, 1, 5, 3}, {
        {name = "triangle", properties = {shape = "triangleBottomLeftShape"} },
        {name = "triangle", properties = {shape = "triangleBottomRightShape"} },
        {name = "autoFan", properties = { directions = {"right"} } },
        {name = "autoFan", properties = { directions = {"down"} } },
        {name = "manualFan", properties = { directions = {"right"} } },
        {name = "manualFan", properties = { directions = {"down"} } },
        {name = "spitter", properties = { directions = {"up", "right"} } },
    })
    newShape("manualFan", "manualFan1_1_1", {1, 1, 2, 5}, "up")
    newShape("spitter", "spitter1_1_1", {1, 1, 6, 5, "up", "none", "none", "left"})
    newTransition("spitter1_1_1", "slide", {}, {{1,1,5,5},{1,1,6,5}})

    --SCREEN 2-1
    newShape("autoFan", "autoFan1_2_1", {2, 1, 6, 1}, "down")
    newShape("gun", "gun1_2_1", {2, 1, 1, 2}, "down")
    newShape("tunnel", "tunnel1_2_1", {2, 1, 2, 2, 2, 3, 7, 5, "none"})
    --newShape("timeOut", "timeOut1_2_1", {2, 1, 7, 2, 3})
    --newTransition("timeOut1_2_1", "switchSlide", {labelled = false}, {{2,1,7,1},{2,1,7,2}})
    newShape("shape", "triangle1_2_1", {2, 1, 3, 3}, "triangleTopRightShape", {1, _, "fire"})
    newTransition("triangle1_2_1", "switchSlide", {labelled = false}, {{2,1,1,3},{2,1,3,3}})
    newShape("shape", "bar1_2_1", {2, 1, 2, 4}, "bar", {"horz", 3})
    newShape("manualFan", "manualFan1_2_1", {2, 1, 2, 4}, "up")
    newShape("spitter", "spitter1_2_1", {2, 1, 6, 4}, {"none", "none", "none", "left"})
    newTransition("spitter1_2_1", "switchSlide", {labelled = false}, {{2,1,6,4},{2,1,7,4}})
    newShape("autoFan", "autoFan2_2_1", {2, 1, 7, 4}, "down")
    newTransition("autoFan2_2_1", "switchSlide", {labelled = false}, {{2,1,7,2},{2,1,7,4}})
    newShape("door", "door1_2_1", {2, 1, 1, 5}, "left")
    newShape("tunnel", "tunnel2_2_1", {2, 1, 4, 5, 4, 3, 2, 1}, "right")
    newTransition("tunnel2_2_1", "switchSlide", {labelled = false}, {{2,1,4,4},{2,1,4,5}})
    newShape("spitter", "spitter2_2_1", {2, 1, 5, 5}, {"none", "none", "down", "left"})
    newTransition("spitter2_2_1", "switchSlide", {labelled = false}, {{2,1,5,5},{2,1,7,5}})
    newShape("door", "door2_2_1", {2, 1, 7, 5, "down", "enabled"})

    --SCREEN 3-1
    newShape("door", "door1_3_1", {3, 1, 1, 1}, "left")
    newShape("manualFan", "manualFan1_3_1", {3, 1, 2, 1}, "left")
    newShape("spitter", "spitter1_3_1", {3, 1, 6, 1}, {"none", "none", "none", "left"})
    newTransition("spitter1_3_1", "switchSlide", {}, {{3,1,6,1},{3,1,7,1}})
    newShape("gun", "gun1_3_1", {3, 1, 3, 2}, "left")
    newShape("shape", "triangle1_3_1", {3, 1, 3, 3}, "triangleBottomRightShape")
    newShape("shape", "triangle2_3_1", {3, 1, 5, 3}, "triangleBottomLeftShape")
    newShape("door", "door1_3_1", {3, 1, 1, 4}, "left")
    newShape("shape", "triangle3_3_1", {3, 1, 3, 4}, "triangleTopLeftShape")
    newShape("shape", "triangle4_3_1", {3, 1, 7, 4}, "triangleTopLeftShape", {1, _, "breakable"})
    --newShape("timeOut", "timeOut1_3_1", {3, 1, 2, 5, "1"})
    newShape("shape", "triangle5_3_1", {3, 1, 5, 5}, "triangleTopRightShape")
    newShape("shape", "triangle6_3_1", {3, 1, 7, 5}, "triangleBottomLeftShape")

    --SCREEN 2-2
    newShape("door", "door1_2_2", {2, 2, 7, 1, "up", "disabled"})
    newShape("gun", "gun1_2_2", {2, 2, 1, 2}, "right")
    newShape("shape", "triangle1_2_2", {2, 2, 4, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("autoFan", "autoFan1_2_2", {2, 2, 7, 2}, "right")
    newTransition("autoFan1_2_2", "switchSlide", {labelled = false}, {{2,2,5,2},{2,2,7,2}})
    newShape("door", "door1_2_2", {2, 2, 7, 2}, "right")
    newShape("autoFan", "autoFan2_2_2", {2, 2, 3, 3}, "left")
    newTransition("autoFan2_2_2", "switchSlide", {}, {{2,2,3,3},{2,2,4,3}})
    newShape("shape", "triangle2_2_2", {2, 2, 1, 4}, "triangleBottomRightShape")
    newTransition("triangle2_2_2", "switchSlide", {}, {{2,2,1,4},{2,2,2,4}})
    newShape("autoFan", "autoFan3_2_2", {2, 2, 6, 4}, "left")
    newTransition("autoFan3_2_2", "switchSlide", {}, {{2,2,4,4},{2,2,6,4}})
    newShape("shape", "bar1_2_2", {2, 2, 8, 4}, "bar", {"horz", 3})
    newShape("shape", "triangle3_2_2", {2, 2, 5, 5}, "triangleTopRightShape", {1, 13, "breakable"})
    newShape("manualFan", "manualFan1_2_2", {2, 2, 6, 5}, "down")
    newShape("autoFan", "autoFan4_2_2", {2, 2, 7, 5}, "up")

    --SCREEN 3-2
    newShape("door", "door1_3_2", {3, 2, 2, 1, "up", "disabled"})
    newShape("shape", "bar1_3_2", {3, 2, 4, 1}, "bar", {"vert"})
    newShape("shape", "bar2_3_2", {3, 2, 6, 1}, "bar", {"vert", 3})
    newShape("door", "door2_3_2", {3, 2, 7, 1}, "up")
    newShape("spitter", "spitter1_3_2", {3, 2, 2, 2, "up", "right", "down", "none"})
    newTransition("spitter1_3_2", "slide", {}, {{3,2,2,2},{3,2,3,2}})
    newShape("spitter", "spitter2_3_2", {3, 2, 7, 2, "up", "none", "down", "left"})
    newTransition("spitter2_3_2", "slide", {}, {{3,2,6,2},{3,2,7,2}})
    newShape("autoFan", "autoFan1_3_2", {3, 2, 1, 3}, "down")
    newShape("manualFan", "manualFan1_3_2", {3, 2, 3, 3}, "left")
    newShape("manualFan", "manualFan2_3_2", {3, 2, 2, 4}, "right")
    newShape("manualFan", "manualFan3_3_2", {3, 2, 4, 4}, "up")
    newShape("autoFan", "autoFan2_3_2", {3, 2, 5, 4}, "down")
    newShape("shape", "triangle1_3_2", {3, 2, 1, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle2_3_2", {3, 2, 2, 5}, "triangleBottomRightShape")
    newShape("shape", "bar3_3_2", {3, 2, 3, 5}, "bar", {"vert", 2})
    newShape("shape", "bar4_3_2", {3, 2, 4, 5}, "bar", {"horz", 4})
    newTransition("bar4_3_2", "switchSlide", {}, {{3,2,4,1},{3,2,4,5}})
    newShape("door", "door2_3_2", {3, 2, 4, 5}, "down")
    newShape("shape", "triangle3_3_2", {3, 2, 5, 5}, "triangleTopLeftShape")
    newShape("shape", "triangle4_3_2", {3, 2, 6, 5}, "triangleTopRightShape")
    newShape("shape", "bar5_3_2", {3, 2, 7, 5}, "bar", {"horz", 4})
    newTransition("bar5_3_2", "switchSlide", {}, {{3,2,7,1},{3,2,7,5}})
    newShape("shape", "bar6_3_2", {3, 2, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-3
    newShape("shape", "triangle1_2_3", {2, 3, 1, 1}, "triangleBottomLeftShape")
    newShape("door", "door1_2_3", {2, 3, 2, 1}, "up")
    newShape("shape", "triangle2_2_3", {2, 3, 4, 1}, "triangleTopRightShape", {1, _, "fire"})
    newShape("backFire", "backFire1_2_3", {2, 3, 6, 1})
    newTransition("backFire1_2_3", "switchSlide", {}, {{2,3,5,3},{2,3,5,2},{2,3,6,1}})
    newShape("door", "door2_2_3", {2, 3, 7, 1}, "up")
    newShape("autoFan", "autoFan1_2_3", {2, 3, 1, 2}, "right")
    newShape("manualFan", "manualFan1_2_3", {2, 3, 3, 2}, "down")
    newShape("autoFan", "autoFan2_2_3", {2, 3, 7, 2}, "up")
    newShape("shape", "bar1_2_3", {2, 3, 1, 3}, "bar", {"horz", 4})
    newTransition("bar1_2_3", "switchSlide", {}, {{2,3,1,2},{2,3,1,3}})
    newShape("manualFan", "manualFan2_2_3", {2, 3, 2, 3}, "right")
    newShape("item", "map", {2, 3, 3, 3})
    newShape("shape", "bar2_3_2", 2, 3, 5, 3}, "bar", {"horz", 3})
    --newShape("timeOut", "timeOut1_2_3", {2, 3, 6, 3, 2})
    newShape("spitter", "spitter1_2_3", {2, 3, 1, 4, "up", "none", "none", "none"})
    newTransition("spitter1_2_3", "slide", {}, {{2,3,1,4},{2,3,2,5}})
    newShape("manualFan", "manualFan3_2_3", {2, 3, 3, 4}, "right")
    newShape("shape", "bar3_2_3", {2, 3, 6, 4}, "bar", {"horz", 2})
    newShape("shape", "triangle3_2_3", {2, 3, 4, 5}, "triangleBottomLeftShape", {1, 2, "fire"})

    --SCREEN 3-3
    newShape("shape", "bar1_3_3", {3, 3, 7, 1}, "bar", {"vert", 4})
    newTransition("bar1_3_3", "switchSlide", {labelled=false}, {{3,3,5,1},{3,3,7,1}})
    newShape("manualFan", "manualFan1_3_3", {3, 3, 1, 2}, "up")
    newShape("manualFan", "manualFan2_3_3", {3, 3, 3, 2}, "down")
    newShape("manualFan", "manualFan3_3_3", {3, 3, 6, 2}, "up")
    newTransition("manualFan3_3_3", "switchSlide", {labelled=false}, {{3,3,4,2},{3,3,6,2}})
    newShape("shape", "triangle1_3_3", {3, 3, 7, 2}, "triangleTopRightShape", {1, 10, "breakable"})
    newShape("door", "door1_3_3", {3, 3, 1, 3}, "left")
    newShape("shape", "triangle2_3_3", {3, 3, 5, 3}, "triangleTopLeftShape", {1, 5})
    newTransition("triangle2_3_3", "flip-vertical")
    newShape("shape", "bar2_3_3", {3, 3, 7, 3}, "bar", {"horz"})
    newShape("shape", "bar3_3_3", {3, 3, 7, 3}, "bar", {"vert", 4})
    newTransition("bar3_3_3", "switchSlide", {labelled=false}, {{3,3,4,3},{3,3,7,3}})
    newShape("shape", "triangle3_3_3", {3, 3, 2, 4}, "triangleBottomRightShape", {1, 3})
    newTransition("triangle3_3_3", "flip-vertical")
    newShape("manualFan", "manualFan4_3_3", {3, 3, 3, 4}, "right")
    newTransition("manualFan4_3_3", "switchSlide", {labelled=false}, {{3,3,3,4},{3,3,4,4}})
    newShape("manualFan", "manualFan5_3_3", {3, 3, 6, 4}, "right")
    newTransition("manualFan5_3_3", "switchSlide", {labelled=false}, {{3,3,6,4},{3,3,7,4}})
    newShape("shape", "triangle4_3_3", {3, 3, 1, 5}, "triangleBottomRightShape", {1, 9, "fire"})
    newShape("shape", "bar4_3_3", {3, 3, 3, 5}, "bar", {"vert", 2})
    newShape("autoFan", "autoFan1_3_3", {3, 3, 4, 5}, "down")
    newTransition("autoFan1_3_3", "switchSlide", {labelled=false}, {{3,3,4,5},{3,3,5,5}})
    newShape("autoFan", "autoFan2_3_3", {3, 3, 6, 5}, "right")
    newShape("manualFan", "manualFan6_3_3", {3, 3, 7, 5}, "up")

    --SCREEN 4-3
    newShape("simple", "simple6_4_3", {4, 3, 4, 1})
    newShape("shape", "triangle1_4_3", {4, 3, 6, 1}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape", "triangle2_4_3", {4, 3, 2, 2}, "triangleBottomRightShape", {1, _, "fire"})
    newShape("shape", "triangle3_4_3", {4, 3, 5, 2}, "triangleBottomLeftShape", {1, _, "fire"})
    newShape("shape", "triangle4_4_3", {4, 3, 3, 3}, "triangleBottomRightShape", {1, 9, "icy"})
    newShape("tunnel", "tunnel1_4_3", {4, 3, 4, 3, 2, 1, 2, 5}, "left")
    newShape("shape", "triangle5_4_3", {4, 3, 3, 4}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape", "triangle6_4_3", {4, 3, 5, 4}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("shape", "triangle7_4_3", {4, 3, 2, 5}, "triangleTopRightShape", {1, _, "fire"})
    newShape("shape", "triangle8_4_3", {4, 3, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    newShape("switch", "switch1_1_1", {1, 1, 3, 3}, { {"flip-vertical", "triangle1_1_1"} })

    newShape("switch", "switch1_3_1", {3, 1, 2, 3}, { {"slide", "spitter1_3_1"} })

    newShape("switch", "switch1_2_2", {2, 2, 2, 5}, { {"slide", "autoFan1_2_2"},{"door-open", "door1_2_2"},
    {"slide", "triangle1_2_1"},{"slide", "spitter1_2_1"},{"slide", "autoFan2_2_1"},{"slide", "tunnel2_2_1"},{"slide", "spitter2_2_1"} }, {"one-way"})
        --remember to include timeOut in switch above

    newShape("switch", "switch1_3_2", {3, 2, 6, 3}, { {"slide", "autoFan3_2_2"} })
    newShape("switch", "switch2_3_2", {3, 2, 3, 5}, { {"slide", "autoFan2_2_2"} })

    newShape("switch", "switch1_2_3", {2, 3, 4, 3}, { {"slide", "bar1_2_3"},{"slide", "bar1_3_3"},{"slide", "manualFan3_3_3"},
    {"slide", "bar3_3_3"},{"slide", "manualFan4_3_3"},{"slide", "manualFan5_3_3"},{"slide", "autoFan1_3_3"},{"slide", "bar4_3_2"},{"slide", "bar5_3_2"} })


    --GEMS
    newShape("gem", "purple", {1, 1, 1, 3}, "purple")
    newShape("gem", "purple", {1, 1, 2, 4}, "purple")
    newShape("gem", "purple", {1, 1, 3, 5}, "purple")
    newShape("gem", "purple", {1, 1, 5, 1}, "purple")
    newShape("gem", "purple", {1, 1, 7, 3}, "purple")
    newShape("gem", "purple", {1, 1, 5, 4}, "purple")
    newShape("gem", "purple", {1, 1, 7, 5}, "purple")
    newShape("gem", "purple", {1, 1, 1, 5}, "purple")
    newShape("gem", "purple", {1, 1, 6, 1}, "purple")
    newShape("gem", "purple", {2, 1, 2, 1}, "purple")
    newShape("gem", "purple", {2, 1, 4, 1}, "purple")
    newShape("gem", "purple", {2, 1, 7, 1}, "purple")
    newShape("gem", "purple", {2, 1, 1, 5}, "purple")
    newShape("gem", "purple", {2, 1, 6, 2}, "purple")
    newShape("gem", "purple", {2, 1, 6, 3}, "purple")
    newShape("gem", "purple", {2, 1, 3, 4}, "purple")
    newShape("gem", "purple", {2, 1, 5, 4}, "purple")
    newShape("gem", "purple", {2, 1, 2, 3}, "purple")
    newShape("gem", "purple", {3, 1, 1, 4}, "purple")
    newShape("gem", "purple", {3, 1, 2, 4}, "purple")
    newShape("gem", "purple", {3, 1, 4, 3}, "purple")
    newShape("gem", "purple", {3, 1, 5, 4}, "purple")
    newShape("gem", "purple", {3, 1, 6, 5}, "purple")
    newShape("gem", "purple", {3, 1, 6, 4}, "purple")
    newShape("gem", "purple", {3, 1, 7, 2}, "purple")
    newShape("gem", "purple", {3, 1, 1, 1}, "purple")
    newShape("gem", "purple", {3, 1, 3, 1}, "purple")
    newShape("gem", "purple", {3, 1, 5, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 1}, "purple")
    newShape("gem", "purple", {2, 2, 1, 5}, "purple")
    newShape("gem", "purple", {2, 2, 5, 2}, "purple")
    newShape("gem", "purple", {2, 2, 6, 1}, "purple")
    newShape("gem", "purple", {2, 2, 6, 3}, "purple")
    newShape("gem", "purple", {2, 2, 3, 4}, "purple")
    newShape("gem", "purple", {2, 2, 7, 4}, "purple")
    newShape("gem", "purple", {2, 2, 7, 3}, "purple")
    newShape("gem", "purple", {3, 2, 2, 1}, "purple")
    newShape("gem", "purple", {3, 2, 2, 3}, "purple")
    newShape("gem", "purple", {3, 2, 3, 4}, "purple")
    newShape("gem", "purple", {3, 2, 4, 5}, "purple")
    newShape("gem", "purple", {3, 2, 4, 1}, "purple")
    newShape("gem", "purple", {3, 2, 4, 3}, "purple")
    newShape("gem", "purple", {3, 2, 1, 2}, "purple")
    newShape("gem", "purple", {3, 2, 5, 2}, "purple")
    newShape("gem", "purple", {3, 2, 7, 1}, "purple")
    newShape("gem", "purple", {3, 2, 7, 3}, "purple")
    newShape("gem", "purple", {3, 2, 7, 5}, "purple")
    newShape("gem", "purple", {3, 2, 6, 1}, "purple")
    newShape("gem", "purple", {3, 2, 1, 4}, "purple")
    newShape("gem", "purple", {3, 2, 6, 4}, "purple")
    newShape("gem", "purple", {3, 2, 3, 1}, "purple")
    newShape("gem", "purple", {3, 3, 7, 3}, "purple")
    newShape("gem", "purple", {2, 3, 2, 2}, "purple")
    newShape("gem", "purple", {2, 3, 3, 1}, "purple")
    newShape("gem", "purple", {2, 3, 3, 5}, "purple")
    newShape("gem", "purple", {2, 3, 4, 4}, "purple")
    newShape("gem", "purple", {2, 3, 1, 3}, "purple")
    newShape("gem", "purple", {2, 3, 1, 5}, "purple")
    newShape("gem", "purple", {2, 3, 7, 1}, "purple")
    newShape("gem", "purple", {2, 3, 5, 1}, "purple")
    newShape("gem", "purple", {2, 3, 7, 3}, "purple")
    newShape("gem", "purple", {3, 3, 2, 2}, "purple")
    newShape("gem", "purple", {3, 3, 4, 1}, "purple")
    newShape("gem", "purple", {3, 3, 4, 3}, "purple")
    newShape("gem", "purple", {3, 3, 5, 4}, "purple")
    newShape("gem", "purple", {3, 3, 1, 4}, "purple")
    newShape("gem", "purple", {3, 3, 3, 3}, "purple")
    newShape("gem", "purple", {3, 3, 5, 2}, "purple")
    newShape("gem", "purple", {3, 3, 1, 3}, "purple")
    newShape("gem", "purple", {4, 3, 6, 2}, "purple")
    newShape("gem", "purple", {4, 3, 2, 3}, "purple")
    newShape("gem", "purple", {4, 3, 6, 4}, "purple")
    newShape("gem", "purple", {4, 3, 7, 3}, "purple")
    newShape("gem", "purple", {4, 3, 1, 3}, "purple")
    newShape("gem", "purple", {4, 3, 3, 1}, "purple")
    newShape("gem", "purple", {4, 3, 5, 1}, "purple")
    newShape("gem", "purple", {4, 3, 4, 2}, "purple")
    newShape("gem", "purple", {4, 3, 7, 1}, "purple")
    newShape("gem", "purple", {4, 3, 3, 5}, "purple")
    newShape("gem", "purple", {4, 3, 5, 5}, "purple")
    newShape("gem", "redCoin", {2, 3, 5, 5}, "redCoin")
    newShape("gem", "blueCoin", {4, 3, 1, 1}, "blueCoin")
    newShape("gem", "purpleCoin", {3, 1, 4, 1}, "purpleCoin")

    --ITEMS
    newShape("item", "coins", {1, 1, 6, 4}, 310)
    newShape("item", "coins", {2, 1, 3, 5}, 185)
    newShape("item", "coins", {3, 2, 7, 4}, 60)
    newShape("item", "coins", {3, 2, 4, 2}, 170)
    newShape("item", "coins", {2, 3, 5, 4}, 165)
    newShape("item", "coins", {3, 3, 3, 5}, 100)
    newShape("item", "coins", {3, 3, 2, 1}, 100)
    newShape("item", "coins", {4, 3, 4, 5}, 500)
    newShape("item", "coins", {4, 3, 6, 3}, 600)
    newShape("item", "clock", {4, 3, 3, 2, 15})
    newShape("item", "hook", {4, 3, 5, 3}, {})

    newShape("item", "small-present", {2, 3, 7, 4}, {})

    newShape("item", "small-present", {4, 3, 2, 4}, {})

    newShape("item", "small-present", {1, 1, 6, 3}, {})

    newShape("item", "big-present", {4, 3, 4, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 2
t.thisScreenVertValue = 1
t.screenHorzTotal = 4
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 2
t.ballFirstScreenVertValue = 1
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
