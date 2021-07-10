local t = {}
local addToShapeArray = require("utils.add-to-shape-array");
local addToTransitionArray = require("utils.add-to-transition-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;
    local ta = mainFunc.allLevelSettings.transitionArrayIndex;   

    --SCREEN 1-1
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 7, 1}, "bar", {"horz"})
    addToTransitionArray(ta,{{"bar1_1_1"},{"slide"},{},{1},{1},{1,1,7,1},{2},{1,1,7,4}})
    addToShapeArray(sp, "shape","bar2_1_1", {1, 1, 4, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "spitter","spitter1_1_1", {1, 1, 6, 2, "up","none","none","left"})
    addToTransitionArray(ta,{{"spitter1_1_1"},{"slide"},{},{1},{1},{1,1,6,2},{2},{1,1,6,3},{3},{1,1,6,5}})
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 3}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_1"},{"flip-vertical"}})
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 2, 3}, "blueCoin")
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 3, 3}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 2, 4}, "triangleBottomRightShape", {1, 3, "breakable"})
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 4}, "triangleBottomLeftShape", {1, 20, "breakable"})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 4}, "right")
    addToShapeArray(sp, "backFire","backFire1_1_1", {1, 1, 1, 5})
    addToTransitionArray(ta,{{"backFire1_1_1"},{"slide"},{},{1},{1},{1,1,1,5},{2},{1,1,2,5}})
    addToShapeArray(sp, "shape","bar3_1_1", {1, 1, 3, 5}, "bar", {"horz", 3})
    addToShapeArray(sp, "shape","bar4_1_1", {1, 1, 3, 6}, "bar", {"vert", 3})

    --SCREEN 2-1
    addToShapeArray(sp, "spitter","spitter1_2_1", {2, 1, 7, 1}, {"none","none","down","none"})
    addToTransitionArray(ta,{{"spitter1_2_1"},{"slide"},{},{2},{1},{2,1,6,1},{2},{2,1,7,1}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 1, 2}, "left")
    addToShapeArray(sp, "spitter","spitter2_2_1", {2, 1, 1, 2}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter2_2_1"},{"slide"},{},{1},{1},{2,1,1,2},{2},{2,1,1,3}})
    addToShapeArray(sp, "shape","bar1_2_1", {2, 1, 2, 2}, "bar", {"horz", 3})
    addToShapeArray(sp, "spitter","spitter3_2_1", {2, 1, 4, 2}, {"none","none","none","left"})
    addToTransitionArray(ta,{{"spitter3_2_1"},{"slide"},{},{2},{1},{2,1,4,1},{2},{2,1,4,2}})
    addToShapeArray(sp, "shape","triangle1_2_1", {2, 1, 2, 3}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle2_2_1", {2, 1, 7, 3}, "triangleTopLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle3_2_1", {2, 1, 3, 4}, "triangleTopLeftShape", {1, 5, "breakable"})
    addToShapeArray(sp, "shape","triangle4_2_1", {2, 1, 4, 4}, "triangleTopRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar2_2_1", {2, 1, 1, 5}, "bar", {"vert"})
    addToTransitionArray(ta,{{"bar2_2_1"},{"slide"},{},{1},{1},{2,1,1,5},{2},{2,1,3,5}})
    addToShapeArray(sp, "door","door1_2_1", {2, 1, 3, 5, "down", "disabled"})
    addToShapeArray(sp, "shape","triangle5_2_1", {2, 1, 4, 5}, "triangleBottomLeftShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar3_2_1", {2, 1, 6, 5}, "bar", {"vert", 4})

    --SCREEN 1-2
    addToShapeArray(sp, "spitter","spitter1_1_2", {1, 2, 1, 1}, {"none","none","down","none"})
    addToShapeArray(sp, "item","big-present", {1, 2, 3, 1}, {})

    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 3, 2}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 7, 2}, "right")
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 3, 3}, "down")
    addToShapeArray(sp, "gun","gun1_1_2", {1, 2, 4, 3}, "right")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 7, 4}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar1_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,7,4}})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 6, 4}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle1_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,7,5}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 5}, "triangleTopRightShape")
    --addToShapeArray(sp, "timeOut","timeOut1_1_2", {1, 2, 4, 5, 2})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 6, 5}, "bar", {"horz", 3})
    addToTransitionArray(ta,{{"bar2_1_2"},{"slide"},{},{2},{1},{1,2,6,4},{2},{1,2,6,5}})

    --SCREEN 2-2
    addToShapeArray(sp, "door","door1_2_2", {2, 2, 1, 1}, "left", {"disabled"})
    addToShapeArray(sp, "autoFan","autoFan1_2_2", {2, 2, 2, 1}, "left")
    addToTransitionArray(ta,{{"autoFan1_2_2"},{"switchSlide"},{},{1},{1},{2,2,2,1},{2},{2,2,3,1}})
    addToShapeArray(sp, "manualFan","manualFan1_2_2", {2, 2, 5, 1}, "down")
    addToTransitionArray(ta,{{"manualFan1_2_2"},{"slide"},{},{1},{1},{2,2,5,1},{2},{2,2,5,2}})
    addToShapeArray(sp, "door","door2_2_2", {2, 2, 5, 1}, "up")
    addToShapeArray(sp, "gun","gun1_2_2", {2, 2, 6, 1}, "down")
    addToShapeArray(sp, "manualFan","manualFan2_2_2", {2, 2, 3, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_2_2", {2, 2, 2, 3}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle1_2_2"},{"switchSlide"},{},{1},{2},{2,2,1,3},{2},{2,2,2,3}})
    addToShapeArray(sp, "shape","triangle2_2_2", {2, 2, 4, 3}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle2_2_2"},{"switchSlide"},{},{1},{1},{2,2,4,3},{2},{2,2,5,3}})
    addToShapeArray(sp, "autoFan","autoFan2_2_2", {2, 2, 3, 4}, "down")
    addToShapeArray(sp, "shape","triangle3_2_2", {2, 2, 4, 4}, "triangleBottomRightShape")
    addToTransitionArray(ta,{{"triangle3_2_2"},{"switchSlide"},{},{1},{1},{2,2,4,4},{2},{2,2,5,4}})
    addToShapeArray(sp, "shape","triangle4_2_2", {2, 2, 6, 4}, "triangleTopLeftShape")
    addToTransitionArray(ta,{{"triangle4_2_2"},{"switchSlide"},{},{1},{1},{2,2,6,4},{2},{2,2,6,5}})
    addToShapeArray(sp, "gun","gun2_2_2", {2, 2, 2, 5}, "up")

    --SCREEN 3-2
    addToShapeArray(sp, "tunnel","tunnel1_3_2", {3, 2, 1, 1, 2, 3, 6, 1}, {"none"})
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 4, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 5, 1}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar1_3_2", {3, 2, 8, 1}, "bar", {"horz", 2})
    addToShapeArray(sp, "shape","bar2_3_2", {3, 2, 3, 2}, "bar", {"vert", 3})
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 2}, "left")
    addToShapeArray(sp, "tunnel","tunnel2_3_2", {3, 2, 6, 2, 3, 2, 5, 5, "none"})
    addToShapeArray(sp, "shape","triangle1_3_2", {3, 2, 3, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 3}, "left")
    addToShapeArray(sp, "shape","triangle2_3_2", {3, 2, 6, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle3_3_2", {3, 2, 7, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","bar3_3_2", {3, 2, 1, 4}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar3_3_2"},{"slide"},{},{1},{1},{3,2,1,4},{2},{3,2,2,4}})
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 1, 4}, "up")
    addToShapeArray(sp, "tunnel","tunnel3_3_2", {3, 2, 2, 4, 3, 2, 5, 2}, "up")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 4}, "left")
    addToShapeArray(sp, "autoFan","autoFan1_3_2", {3, 2, 5, 4}, "right")
    --addToShapeArray(sp, "item","coins", {3, 2, 1, 5}, 250)
    addToShapeArray(sp, "door","door1_3_2", {3, 2, 1, 5}, "down")
    addToShapeArray(sp, "manualFan","manualFan1_3_2", {3, 2, 4, 5}, "right")
    addToShapeArray(sp, "tunnel","tunnel4_3_2", {3, 2, 7, 5, 3, 2, 1, 3, "none"})
    addToTransitionArray(ta,{{"tunnel4_3_2"},{"switchSlide"},{},{2},{1},{3,2,7,4},{2},{3,2,7,5}})
    addToShapeArray(sp, "door","door2_3_2", {3, 2, 7, 5}, "right", {"disabled"})

    --SCREEN 4-2
    addToShapeArray(sp, "endPoint","endPoint1_4_2", {4, 2, 7, 1})
    addToShapeArray(sp, "autoFan","autoFan1_4_2", {4, 2, 1, 2}, "down")
    addToShapeArray(sp, "gun","gun1_4_2", {4, 2, 3, 2}, "down")
    addToShapeArray(sp, "gun","gun2_4_2", {4, 2, 5, 2}, "down")
    addToShapeArray(sp, "shape","bar1_4_2", {4, 2, 7, 2}, "bar", {"vert", 3})
    addToTransitionArray(ta,{{"bar1_4_2"},{"switchSlide"},{},{2},{1},{4,2,5,2},{2},{4,2,7,2}})
    addToShapeArray(sp, "manualFan","manualFan1_4_2", {4, 2, 7, 2}, "right")
    addToShapeArray(sp, "shape","triangle1_4_2", {4, 2, 4, 3}, "triangleBottomRightShape")
    addToShapeArray(sp, "shape","triangle2_4_2", {4, 2, 7, 3}, "triangleTopLeftShape")
    addToShapeArray(sp, "gun","gun3_4_2", {4, 2, 2, 4}, "up")
    addToShapeArray(sp, "gun","gun4_4_2", {4, 2, 6, 4}, "up")
    addToShapeArray(sp, "manualFan","manualFan2_4_2", {4, 2, 1, 5}, "right")
    addToShapeArray(sp, "door","door1_4_2", {4, 2, 1, 5}, "down")
    addToShapeArray(sp, "simple","simple1_4_2", {4, 2, 2, 5})
    addToShapeArray(sp, "shape","triangle3_4_2", {4, 2, 4, 5}, "triangleTopLeftShape")

    --SCREEN 2-3
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 3, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_2_3", {2, 3, 2, 2}, "right")
    addToShapeArray(sp, "shape","bar1_2_3", {2, 3, 3, 2}, "bar", {"horz", 4})
    addToTransitionArray(ta,{{"bar1_2_3"},{"slide"},{},{1},{1},{2,3,3,2},{2},{2,3,3,3}})
    --addToShapeArray(sp, "timeOut","timeOut1_2_3", {2, 3, 4, 2, 3})
    addToShapeArray(sp, "shape","triangle1_2_3", {2, 3, 6, 2}, "triangleBottomRightShape", {1, 9})
    addToTransitionArray(ta,{{"triangle1_2_3"},{"flip-horizontal"}})
    addToShapeArray(sp, "autoFan","autoFan2_2_3", {2, 3, 7, 2}, "right")
    addToShapeArray(sp, "door","door1_2_3", {2, 3, 7, 2}, "right")
    --addToShapeArray(sp, "timeOut","timeOut2_2_3", {2, 3, 1, 3, 3})
    addToShapeArray(sp, "manualFan","manualFan1_2_3", {2, 3, 4, 3}, "down")
    addToTransitionArray(ta,{{"manualFan1_2_3"},{"slide"},{},{2},{1},{2,3,3,3},{2},{2,3,4,3}})
    addToShapeArray(sp, "shape","bar2_2_3", {2, 3, 5, 3}, "bar", {"horz", 2})
    addToShapeArray(sp, "autoFan","autoFan3_2_3", {2, 3, 6, 3}, "right")
    addToTransitionArray(ta,{{"autoFan3_2_3"},{"slide"},{},{1},{1},{2,3,5,3},{2},{2,3,6,3}})
    addToShapeArray(sp, "shape","bar3_2_3", {2, 3, 2, 4}, "bar", {"vert", 4})
    addToTransitionArray(ta,{{"bar3_2_3"},{"slide"},{},{2},{1},{2,3,2,4},{2},{2,3,3,4}})
    addToShapeArray(sp, "shape","triangle2_2_3", {2, 3, 2, 4}, "triangleTopRightShape")
    addToTransitionArray(ta,{{"triangle2_2_3"},{"slide"},{},{2},{1},{2,3,2,4},{2},{2,3,2,5}})
    addToShapeArray(sp, "autoFan","autoFan4_2_3", {2, 3, 3, 4}, "up")
    addToShapeArray(sp, "shape","bar4_2_3", {2, 3, 2, 5}, "bar", {"horz", 3})
    --addToShapeArray(sp, "timeOut","timeOut3_2_3", {2, 3, 4, 5, 3})
    addToShapeArray(sp, "shape","bar5_2_3", {2, 3, 5, 5}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","bar6_2_3", {2, 3, 6, 5}, "bar", {"vert", 4})
    addToShapeArray(sp, "shape","triangle3_2_3", {2, 3, 6, 5}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle3_2_3"},{"flip-horizontal"}})

    --SCREEN 3-3
    addToShapeArray(sp, "door","door1_3_3", {3, 3, 1, 1}, "up")
    addToShapeArray(sp, "shape","triangle1_3_3", {3, 3, 1, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "gem","redCoin", {3, 3, 2, 1}, "redCoin")
    addToShapeArray(sp, "tunnel","tunnel1_3_3", {3, 3, 3, 1, 3, 3, 3, 5, "none"})
    addToTransitionArray(ta,{{"tunnel1_3_3"},{"slide"},{},{1},{1},{3,3,3,1},{2},{3,3,3,2}})
    addToShapeArray(sp, "door","door2_3_3", {3, 3, 4, 1}, "up")
    addToShapeArray(sp, "autoFan","autoFan1_3_3", {3, 3, 4, 1}, "up")
    addToTransitionArray(ta,{{"autoFan1_3_3"},{"slide"},{},{1},{1},{3,3,4,1},{2},{3,3,4,2}})
    addToShapeArray(sp, "tunnel","tunnel2_3_3", {3, 3, 5, 1, 3, 3, 3, 4, "none"})
    addToTransitionArray(ta,{{"tunnel2_3_3"},{"slide"},{},{1},{1},{3,3,5,1},{2},{3,3,5,2}})
    addToShapeArray(sp, "shape","triangle1_3_3", {3, 3, 6, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle2_3_3", {3, 3, 7, 1}, "triangleTopLeftShape", {1, 5})
    addToShapeArray(sp, "simple","simple1_3_3", {3, 3, 1, 2})
    addToShapeArray(sp, "manualFan","manualFan1_3_3", {3, 3, 7, 2}, "right")
    addToShapeArray(sp, "manualFan","manualFan2_3_3", {3, 3, 1, 3}, "down")
    addToShapeArray(sp, "shape","triangle3_3_3", {3, 3, 4, 3}, "triangleBottomLeftShape", {1, 4})
    addToTransitionArray(ta,{{"triangle3_3_3"},{"slide"},{},{2},{1},{3,3,3,3},{2},{3,3,4,3}})
    addToShapeArray(sp, "shape","bar1_3_3", {3, 3, 7, 3}, "bar", {"horz"})
    addToShapeArray(sp, "item","map", {3, 3, 7, 3})
    addToShapeArray(sp, "tunnel","tunnel3_3_3", {3, 3, 2, 4, 3, 3, 7, 4, "none"})
    addToTransitionArray(ta,{{"tunnel3_3_3"},{"slide"},{},{2},{1},{3,3,1,4},{2},{3,3,2,4}})
    addToShapeArray(sp, "shape","bar2_3_3", {3, 3, 6, 4}, "bar", {"vert", 2})
    addToTransitionArray(ta,{{"bar2_3_3"},{"slide"},{},{1},{1},{3,3,6,4},{2},{3,3,7,4}})
    addToShapeArray(sp, "shape","triangle4_3_3", {3, 3, 1, 5}, "triangleTopRightShape", {1, 1})
    addToShapeArray(sp, "manualFan","manualFan3_3_3", {3, 3, 4, 5}, "down")
    addToShapeArray(sp, "shape","triangle5_3_3", {3, 3, 5, 5}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle5_3_3"},{"flip-vertical"}})

    --SCREEN 4-3
    addToShapeArray(sp, "door","door1_4_3", {4, 3, 1, 1}, "up")
    addToShapeArray(sp, "gun","gun1_4_3", {4, 3, 3, 1}, "up")
    addToShapeArray(sp, "spitter","spitter1_4_3", {4, 3, 1, 2, "up","none","down","none"})
    addToShapeArray(sp, "autoFan","autoFan1_4_3", {4, 3, 2, 2}, "up")
    addToTransitionArray(ta,{{"autoFan1_4_3"},{"slide"},{},{1},{1},{4,3,2,2},{2},{4,3,2,3}})
    addToShapeArray(sp, "shape","triangle1_4_3", {4, 3, 5, 2}, "triangleBottomLeftShape")
    addToTransitionArray(ta,{{"triangle1_4_3"},{"flip-vertical"}})
    addToShapeArray(sp, "shape","triangle2_4_3", {4, 3, 6, 2}, "triangleTopRightShape")
    addToShapeArray(sp, "shape","triangle3_4_3", {4, 3, 7, 2}, "triangleBottomLeftShape")
    addToShapeArray(sp, "spitter","spitter2_4_3", {4, 3, 6, 3}, {"none","none","none","left"})
    addToShapeArray(sp, "autoFan","autoFan2_4_3", {4, 3, 7, 3}, "up")
    addToTransitionArray(ta,{{"autoFan2_4_3"},{"slide"},{},{1},{1},{4,3,7,3},{2},{4,3,7,5}})
    addToShapeArray(sp, "shape","triangle4_4_3", {4, 3, 1, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","triangle5_4_3", {4, 3, 5, 5}, "triangleBottomLeftShape")

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 4, 2}, { {"door-open","door1_2_2"},{"slide","autoFan1_2_2"},{"slide","tunnel4_3_2"},{"door-open","door2_3_2"} }, {"one-way", "not-labelled"})
    addToShapeArray(sp, "switch","switch1_3_3", {3, 3, 2, 3}, { {"slide","triangle1_2_2"},{"slide","triangle3_2_2"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch2_3_3", {3, 3, 6, 3}, { {"slide","triangle2_2_2"},{"slide","triangle4_2_2"} }, {"one-way"})

    addToShapeArray(sp, "switch","switch1_4_3", {4, 3, 3, 3}, { {"slide","bar1_4_2"} })

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
