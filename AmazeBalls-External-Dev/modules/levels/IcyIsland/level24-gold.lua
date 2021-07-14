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
    newShape("shape","bar1_1_1", {1, 1, 2, 1}, "bar", {"vert", 3})
    newShape("manualFan","manualFan1_1_1", {1, 1, 2, 1}, "right")
    newShape("shape","bar2_1_1", {1, 1, 4, 1}, "bar", {"vert", 3})
    newShape("shape","triangle1_1_1", {1, 1, 5, 1}, "triangleBottomRightShape")
    newTransition("triangle1_1_1", "flip-horizontal")
    newShape("shape","triangle2_1_1", {1, 1, 1, 2}, "triangleBottomRightShape", {1, 3})
    newShape("shape","triangle3_1_1", {1, 1, 3, 2}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle3_1_1", "flip-horizontal")
    newShape("shape","triangle4_1_1", {1, 1, 6, 2}, "triangleBottomLeftShape")
    newShape("shape","bar3_1_1", {1, 1, 7, 2}, "bar", {"vert", 3})
    newShape("manualFan","manualFan2_1_1", {1, 1, 7, 2}, "down")
    newShape("gun","gun1_1_1", {1, 1, 5, 3}, "up")
    newShape("manualFan","manualFan3_1_1", {1, 1, 1, 4}, "left")
    newShape("shape","bar4_1_1", {1, 1, 2, 4}, "bar", {"horz", 2})
    newShape("autoFan","autoFan2_1_1", {1, 1, 2, 4}, "up")
    newShape("shape","bar5_1_1", {1, 1, 3, 4}, "bar", {"horz", 3})
    newTransition("bar5_1_1", "switchSlide", {}, {{1,1,3,3},{1,1,3,4}})
    newShape("backFire","backFire1_1_1", {1, 1, 6, 4})
    newTransition("backFire1_1_1", "slide", {}, {{1,1,6,5},{1,1,6,4},{1,1,7,4}})
    newShape("manualFan","manualFan4_1_1", {1, 1, 1, 5}, "down")
    newShape("door","door1_1_1", {1, 1, 1, 5, "down", "disabled"})
    newShape("shape","bar6_1_1", {1, 1, 2, 6}, "bar", {"vert", 2})
    newTransition("bar6_1_1", "switchSlide", {}, {{1,1,1,6},{1,1,2,6}})
    newShape("manualFan","manualFan5_1_1", {1, 1, 3, 5}, "left")
    newShape("item","mystery-block", {1, 1, 4, 5}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "manualFan", properties = {directions = {"left"} } },
        {name = "simple"},
        {name = "backFire"},
        {name = "spitter", properties = {directions = {"down", "left"} } }
    })
    newShape("door","door2_1_1", {1, 1, 6, 5}, "down")
    newShape("shape","bar7_1_1", {1, 1, 7, 6}, "bar", {"vert"})

    --SCREEN 1-2
    newShape("door","door1_1_2", {1, 2, 1, 1}, "up")
    newShape("shape","triangle1_1_2", {1, 2, 3, 1}, "triangleTopLeftShape", {1, 5, "breakable"})
    newShape("shape","triangle2_1_2", {1, 2, 5, 1}, "triangleTopLeftShape", {1, _, "breakable"})
    newShape("door","door2_1_2", {1, 2, 6, 1}, "up")
    newShape("spitter","spitter1_1_2", {1, 2, 3, 2}, {"none","none","down","none"})
    newTransition("spitter1_1_2", "slide", {}, {{1,2,2,2},{1,2,3,2}})
    newShape("manualFan","manualFan1_1_2", {1, 2, 6, 3}, "down")
    newShape("spitter","spitter2_1_2", {1, 2, 5, 4}, {"none","none","down","none"})
    newTransition("spitter2_1_2", "slide", {}, {{1,2,2,4},{1,2,5,4},{1,2,7,4}})
    newShape("shape","triangle3_1_2", {1, 2, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("door","door3_1_2", {1, 2, 2, 5}, "down")
    newShape("door","door4_1_2", {1, 2, 3, 5}, "down")
    newShape("door","door5_1_2", {1, 2, 5, 5}, "down")
    newShape("shape","triangle4_1_2", {1, 2, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("door","door6_1_2", {1, 2, 7, 5}, "down")

    --SCREEN 2-2
    newShape("shape","bar1_2_2", {2, 2, 1, 1}, "bar", {"vert", 3})
    newShape("backFire","backFire1_2_2", {2, 2, 1, 1})
    newTransition("backFire1_2_2", "slide", {}, {{2,2,1,1},{2,2,1,2},{2,2,2,2},{2,2,2,3}})
    newShape("shape","bar2_2_2", {2, 2, 4, 1}, "bar", {"horz", 4})
    newTransition("bar2_2_2", "slide", {}, {{2,2,4,1},{2,2,4,2}})
    newShape("shape","bar3_2_2", {2, 2, 5, 1}, "bar", {"vert", 4})
    newShape("shape","triangle1_2_2", {2, 2, 7, 1}, "triangleBottomLeftShape")
    newTransition("triangle1_2_2", "slide", {}, {{2,2,5,2},{2,2,7,2},{2,2,7,1}})
    newShape("shape","bar4_2_2", {2, 2, 1, 2}, "bar", {"horz", 3})
    newShape("door","door1_2_2", {2, 2, 1, 3}, "left")
    newShape("shape","bar5_2_2", {2, 2, 4, 3}, "bar", {"vert"})
    newShape("simple","simple1_2_2", {2, 2, 6, 3})
    newTransition("simple1_2_2", "slide", {}, {{2,2,3,4},{2,2,5,4},{2,2,6,3}})
    newShape("shape","bar6_2_2", {2, 2, 8, 3}, "bar", {"horz", 2})
    newShape("shape","bar7_2_2", {2, 2, 2, 5}, "bar", {"vert", 3})
    newTransition("bar7_2_2", "switchSlide", {}, {{2,2,2,5},{2,2,7,5}})
    newShape("backFire","backFire2_2_2", {2, 2, 3, 5})
    newTransition("backFire2_2_2", "slide", {}, {{2,2,1,5},{2,2,3,5}})
    newShape("door","door2_2_2", {2, 2, 4, 5}, "down")
    newShape("autoFan","autoFan1_2_2", {2, 2, 5, 5}, "down")
    newTransition("autoFan1_2_2", "switchSlide", {}, {{2,2,4,5},{2,2,5,5}})
    newShape("shape","bar8_2_2", {2, 2, 3, 6}, "bar", {"vert", 3})
    newShape("shape","bar9_2_2", {2, 2, 6, 6}, "bar", {"vert", 3})

    --SCREEN 1-3
    newShape("door","door1_1_3", {1, 3, 2, 1}, "up")
    newShape("door","door2_1_3", {1, 3, 3, 1}, "up")
    newShape("simple","simple1_1_3", {1, 3, 3, 1})
    newShape("autoFan","autoFan1_1_3", {1, 3, 6, 2}, "up")
    newShape("manualFan","manualFan1_1_3", {1, 3, 7, 2}, "left")
    newShape("shape","triangle1_1_3", {1, 3, 3, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("shape","triangle2_1_3", {1, 3, 4, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle3_1_3", {1, 3, 5, 3}, "triangleBottomRightShape")
    newTransition("triangle3_1_3", "switchSlide", {}, {{1,3,5,3},{1,3,6,3}})
    newShape("door","door3_1_3", {1, 3, 7, 3}, "right")
    newShape("shape","triangle4_1_3", {1, 3, 3, 4}, "triangleBottomLeftShape", {1, 2, "breakable"})
    newShape("autoFan","autoFan1_1_3", {1, 3, 5, 4}, "down")
    newShape("shape","bar1_1_3", {1, 3, 6, 4}, "bar", {"vert", 3})
    newTransition("bar1_1_3", "switchSlide", {}, {{1,3,5,4},{1,3,6,4}})
    newShape("autoFan","autoFan1_1_3", {1, 3, 7, 4}, "up")
    newShape("door","door4_1_3", {1, 3, 2, 5}, "down")
    newShape("simple","simple1_1_3", {1, 3, 4, 5})
    newShape("door","door5_1_3", {1, 3, 4, 5}, "down")
    newShape("door","door6_1_3", {1, 3, 5, 5}, "down")
    newShape("manualFan","manualFan1_1_3", {1, 3, 6, 5}, "right")
    newShape("door","door7_1_3", {1, 3, 7, 5}, "right", {"disabled"})
    newShape("shape","bar2_1_3", {1, 3, 3, 6}, "bar", {"vert", 2})

    --SCREEN 2-3
    newShape("shape","bar1_2_3", {2, 3, 1, 1}, "bar", {"vert", 2})
    newShape("door","door1_2_3", {2, 3, 2, 1}, "up")
    newShape("door","door2_2_3", {2, 3, 4, 1}, "up")
    newShape("shape","bar2_2_3", {2, 3, 3, 2}, "bar", {"vert"})
    newTransition("bar1_1_3", "slide", {}, {{2,3,2,2},{2,3,3,2}})
    newShape("shape","triangle1_2_3", {2, 3, 7, 2}, "triangleBottomLeftShape", {1, 4})
    newShape("shape","bar3_2_3", {2, 3, 2, 3}, "bar", {"vert", 2})
    newShape("item","map", {2, 3, 4, 3})
    newShape("autoFan","autoFan1_2_3", {2, 3, 7, 3}, "right")
    newShape("spitter","spitter1_2_3", {2, 3, 2, 4}, {"none","none","down","none"})
    newTransition("spitter1_2_3", "slide", {}, {{2,3,2,3},{2,3,2,4}})
    newShape("spitter","spitter2_2_3", {2, 3, 6, 4, "up","none","none","none"})
    newTransition("spitter2_2_3", "slide", {}, {{2,3,6,3},{2,3,6,4}})
    --newShape("item","coins", {2, 3, 7, 4}, 250)
    newShape("simple","simple1_2_3", {2, 3, 3, 5})
    newTransition("simple1_2_3", "slide", {}, {{2,3,1,5},{2,3,3,5},{2,3,4,5}})
    newShape("shape","bar4_2_3", {2, 3, 5, 5}, "bar", {"vert"})
    newTransition("bar4_2_3", "slide", {}, {{2,3,5,5},{2,3,6,5}})
    newShape("door","door3_2_3", {2, 3, 6, 5}, "down")
    newShape("autoFan","autoFan3_2_3", {2, 3, 7, 5}, "up")

    --SCREEN 1-4
    newShape("spitter","spitter1_1_4", {1, 4, 1, 1}, {"none","none","none","left"})
    newTransition("spitter1_1_4", "switchSlide", {}, {{1,4,1,1},{1,4,3,1}})
    newShape("door","door1_1_4", {1, 4, 2, 1, "up", "enabled"})
    newShape("door","door2_1_4", {1, 4, 4, 1, "up", "enabled"})
    newShape("spitter","spitter2_1_4", {1, 4, 7, 1, "up","none","none","none"})
    newTransition("spitter2_1_4", "switchSlide", {}, {{1,4,6,1},{1,4,7,1}})
    newShape("spitter","spitter3_1_4", {1, 4, 1, 2, "up","none","none","none"})
    newTransition("spitter3_1_4", "switchSlide", {}, {{1,4,1,2},{1,4,3,2}})
    newShape("spitter","spitter4_1_4", {1, 4, 7, 2}, {"none","none","none","left"})
    newTransition("spitter4_1_4", "switchSlide", {l}, {{1,4,5,2},{1,4,7,2}})
    newShape("spitter","spitter5_1_4", {1, 4, 2, 3, "up","right","none","none"})
    newTransition("spitter5_1_4", "slide", {}, {{1,4,2,3},{1,4,3,3}})
    newShape("spitter","spitter6_1_4", {1, 4, 7, 3}, {"none","none","down","none"})
    newTransition("spitter6_1_4", "switchSlide", {}, {{1,4,6,3},{1,4,7,3}})
    newShape("spitter","spitter7_1_4", {1, 4, 2, 4}, {"none","none","down","none"})
    newShape("spitter","spitter8_1_4", {1, 4, 5, 4, "up","none","none","none"})
    newTransition("spitter8_1_4", "slide", {}, {{1,4,4,4},{1,4,5,4}})
    newShape("spitter","spitter9_1_4", {1, 4, 7, 4}, {"none","right","none","none"})
    newTransition("spitter9_1_4", "switchSlide", {}, {{1,4,6,4},{1,4,7,4}})
    newShape("spitter","spitter10_1_4", {1, 4, 1, 5}, {"none","right","none","none"})
    newTransition("spitter10_1_4", "switchSlide", {}, {{1,4,1,5},{1,4,2,5}})
    newShape("endPoint","endPoint1_1_4", {1, 4, 3, 5})
    newShape("spitter","spitter11_1_4", {1, 4, 7, 5}, {"none","none","none","left"})
    newTransition("spitter11_1_4", "switchSlide", {}, {{1,4,6,5},{1,4,7,5}})
    newShape("shape","bar1_1_4", {1, 4, 2, 6}, "bar", {"vert", 3})
    newShape("shape","bar2_1_4", {1, 4, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-4
    newShape("shape","triangle1_2_4", {2, 4, 1, 1}, "triangleBottomLeftShape", {1, 2, "icy"})
    newShape("door","door1_2_4", {2, 4, 2, 1}, "up")
    newShape("autoFan","autoFan1_2_4", {2, 4, 3, 1}, "down")
    newShape("door","door2_2_4", {2, 4, 4, 1}, "up")
    newShape("door","door3_2_4", {2, 4, 6, 1}, "up")
    newShape("autoFan","autoFan2_2_4", {2, 4, 4, 2}, "up")
    newShape("shape","bar1_2_4", {2, 4, 4, 2}, "bar", {"horz", 3})
    newTransition("bar1_2_4", "slide", {}, {{2,4,4,1},{2,4,4,2}})
    newShape("shape","triangle2_2_4", {2, 4, 7, 2}, "triangleTopLeftShape", {1, _, "icy"})
    newShape("autoFan","autoFan3_2_4", {2, 4, 1, 3}, "up")
    newShape("shape","triangle3_2_4", {2, 4, 2, 3}, "triangleBottomLeftShape", {1, _, "icy"})
    newShape("shape","triangle4_2_4", {2, 4, 3, 3}, "triangleTopRightShape", {1, _, "icy"})
    newShape("autoFan","autoFan4_2_4", {2, 4, 4, 3}, "down")
    newShape("shape","triangle5_2_4", {2, 4, 5, 3}, "triangleBottomRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_2_4", {2, 4, 6, 3}, "left")
    newShape("manualFan","manualFan2_2_4", {2, 4, 2, 4}, "up")
    newShape("manualFan","manualFan3_2_4", {2, 4, 6, 4}, "right")
    newShape("door","door4_2_4", {2, 4, 1, 5}, "down")
    newShape("manualFan","manualFan4_2_4", {2, 4, 2, 5}, "down")
    newShape("autoFan","autoFan5_2_4", {2, 4, 4, 5}, "left")
    newShape("autoFan","autoFan6_2_4", {2, 4, 5, 5}, "right")
    newShape("manualFan","manualFan5_2_4", {2, 4, 7, 5}, "down")

    --SCREEN 2-5
    newShape("door","door1_2_5", {2, 5, 6, 1}, "up")
    newShape("shape","bar1_2_5", {2, 5, 1, 2}, "bar", {"horz", 4})
    --newShape("item","coins", {2, 5, 1, 2}, 500)
    newShape("shape","bar2_2_5", {2, 5, 1, 3}, "bar", {"vert", 4})
    newShape("shape","bar3_2_5", {2, 5, 1, 3}, "bar", {"horz", 3})
    newShape("shape","triangle1_2_5", {2, 5, 3, 3}, "triangleBottomLeftShape", {1, 4})
    newTransition("triangle1_2_5", "flip-vertical")
    newShape("shape","triangle2_2_5", {2, 5, 1, 5}, "triangleTopRightShape", {1, _, "icy"})
    newShape("manualFan","manualFan1_2_5", {2, 5, 3, 5}, "right")
    newShape("shape","triangle3_2_5", {2, 5, 6, 5}, "triangleTopLeftShape", {1, _, "icy"})

    --SWITCHES
    newShape("switch","switch1_1_1", {1, 1, 1, 3}, { {"door-open","door1_1_1"} })
    newShape("switch","switch2_1_1", {1, 1, 4, 3}, { {"slide","bar5_1_1"},{"slide","bar6_1_1"} })

    newShape("switch","switch1_2_2", {2, 2, 4, 3}, { {"slide","bar7_2_2"},{"slide","autoFan1_2_2"} })
    newShape("switch","switch2_2_2", {2, 2, 6, 5}, { 
        {"slide","spitter1_1_4"},{"slide","spitter2_1_4"},{"slide","spitter3_1_4"},{"slide","spitter4_1_4"},
        {"slide","spitter6_1_4"},{"slide","spitter9_1_4"},{"slide","spitter10_1_4"},{"slide","spitter11_1_4"},
        {"door-open","door1_1_4"},{"door-open","door2_1_4"},
    }, {"one-way", "not-labelled"})
    newShape("switch","switch1_1_3", {1, 3, 1, 4}, { {"door-open","door7_1_3"},{"slide","triangle3_1_3"},{"slide","bar1_1_3"} })


    --GEMS
    newShape("gem","purple", {1, 1, 2, 2}, "purple")
    newShape("gem","purple", {1, 1, 3, 3}, "purple")
    newShape("gem","purple", {1, 1, 2, 5}, "purple")
    newShape("gem","purple", {1, 1, 4, 4}, "purple")
    newShape("gem","purple", {1, 1, 5, 2}, "purple")
    newShape("gem","purple", {1, 1, 6, 3}, "purple")
    newShape("gem","purple", {1, 1, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 2, 1}, "purple")
    newShape("gem","purple", {1, 2, 2, 3}, "purple")
    newShape("gem","purple", {1, 2, 2, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 5}, "purple")
    newShape("gem","purple", {1, 2, 6, 2}, "purple")
    newShape("gem","purple", {1, 2, 1, 2}, "purple")
    newShape("gem","purple", {1, 2, 7, 1}, "purple")
    newShape("gem","purple", {1, 2, 7, 3}, "purple")
    newShape("gem","purple", {1, 2, 7, 5}, "purple")
    newShape("gem","purple", {1, 2, 4, 1}, "purple")
    newShape("gem","purple", {1, 2, 4, 3}, "purple")
    newShape("gem","purple", {2, 2, 2, 1}, "purple")
    newShape("gem","purple", {2, 2, 2, 4}, "purple")
    newShape("gem","purple", {2, 2, 1, 3}, "purple")
    newShape("gem","purple", {2, 2, 3, 1}, "purple")
    newShape("gem","purple", {2, 2, 3, 3}, "purple")
    newShape("gem","purple", {2, 2, 4, 2}, "purple")
    newShape("gem","purple", {2, 2, 5, 3}, "purple")
    newShape("gem","purple", {2, 2, 6, 1}, "purple")
    newShape("gem","purple", {1, 3, 5, 1}, "purple")
    newShape("gem","purple", {1, 3, 7, 1}, "purple")
    newShape("gem","purple", {1, 3, 2, 1}, "purple")
    newShape("gem","purple", {1, 3, 2, 3}, "purple")
    newShape("gem","purple", {1, 3, 6, 4}, "purple")
    newShape("gem","purple", {1, 3, 2, 4}, "purple")
    newShape("gem","purple", {1, 3, 1, 5}, "purple")
    newShape("gem","purple", {1, 3, 3, 5}, "purple")
    newShape("gem","purple", {1, 3, 5, 5}, "purple")
    newShape("gem","purple", {1, 3, 7, 5}, "purple")
    newShape("gem","purple", {1, 3, 7, 3}, "purple")
    newShape("gem","purple", {1, 3, 3, 2}, "purple")
    newShape("gem","purple", {1, 3, 4, 4}, "purple")
    newShape("gem","purple", {1, 4, 5, 3}, "purple")
    newShape("gem","purple", {1, 4, 5, 5}, "purple")
    newShape("gem","purple", {1, 4, 4, 1}, "purple")
    newShape("gem","purple", {1, 4, 4, 3}, "purple")
    newShape("gem","purple", {2, 3, 1, 1}, "purple")
    newShape("gem","purple", {2, 3, 5, 3}, "purple")
    newShape("gem","purple", {2, 3, 5, 5}, "purple")
    newShape("gem","purple", {2, 3, 1, 3}, "purple")
    newShape("gem","purple", {2, 3, 3, 3}, "purple")
    newShape("gem","purple", {2, 3, 3, 1}, "purple")
    newShape("gem","purple", {2, 3, 6, 2}, "purple")
    newShape("gem","purple", {2, 3, 6, 5}, "purple")
    newShape("gem","purple", {2, 3, 4, 2}, "purple")
    newShape("gem","purple", {2, 3, 4, 4}, "purple")
    newShape("gem","purple", {2, 4, 6, 1}, "purple")
    newShape("gem","purple", {2, 4, 6, 2}, "purple")
    newShape("gem","purple", {2, 4, 6, 5}, "purple")
    newShape("gem","purple", {2, 4, 5, 2}, "purple")
    newShape("gem","purple", {2, 4, 5, 4}, "purple")
    newShape("gem","purple", {2, 4, 7, 1}, "purple")
    newShape("gem","purple", {2, 4, 7, 3}, "purple")
    newShape("gem","purple", {2, 4, 1, 4}, "purple")
    newShape("gem","purple", {2, 4, 3, 4}, "purple")
    newShape("gem","purple", {2, 4, 5, 4}, "purple")
    newShape("gem","purple", {2, 4, 2, 1}, "purple")
    newShape("gem","purple", {2, 4, 1, 2}, "purple")
    newShape("gem","purple", {2, 4, 3, 2}, "purple")
    newShape("gem","purple", {2, 4, 1, 5}, "purple")
    newShape("gem","purple", {2, 5, 1, 1}, "purple")
    newShape("gem","purple", {2, 5, 3, 1}, "purple")
    newShape("gem","purple", {2, 5, 3, 4}, "purple")
    newShape("gem","purple", {2, 5, 4, 5}, "purple")
    newShape("gem","purple", {2, 5, 2, 3}, "purple")
    newShape("gem","purple", {2, 5, 2, 5}, "purple")
    newShape("gem","purple", {2, 5, 6, 2}, "purple")
    newShape("gem","purple", {2, 5, 6, 4}, "purple")
    newShape("gem","redCoin", {1, 4, 4, 5}, "redCoin")
    newShape("gem","blueCoin", {1, 1, 3, 1}, "blueCoin")
    newShape("gem","purpleCoin", {2, 5, 2, 2}, "purpleCoin")

    --ITEMS
    newShape("item","coins", {1, 3, 2, 2}, 80)
    newShape("item","coins", {1, 3, 7, 2}, 105)
    newShape("item","coins", {1, 4, 5, 1}, 65)
    newShape("item","coins", {1, 2, 1, 3}, 75)
    newShape("item","coins", {1, 1, 7, 3}, 28)
    newShape("item","coins", {1, 1, 2, 3}, 34)
    newShape("item","coins", {2, 2, 1, 4}, 135)
    newShape("item","coins", {2, 4, 4, 4}, 12)
    newShape("item","coins", {2, 4, 3, 5}, 65)
    newShape("item","coins", {2, 5, 6, 1}, 625)
    newShape("item","coins", {2, 5, 5, 5}, 74)
    newShape("item","small-present", {1, 4, 4, 2}, {})

    newShape("item","small-present", {1, 3, 2, 5}, {})

    newShape("item","small-present", {2, 2, 5, 1}, {})

    newShape("item","small-present", {2, 5, 6, 3}, {})

    newShape("item","small-present", {1, 4, 1, 4}, {})

    newShape("item","big-present", {2, 3, 2, 2}, {})

    newShape("item","big-present", {1, 1, 5, 5}, {})

    newShape("item","big-present", {2, 5, 1, 4}, {})


end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 2
t.screenVertTotal = 5
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 4
t.ballFirstHorzSquare = 1
t.ballFirstVertSquare = 3
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
