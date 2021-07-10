local t = {}
local addToShapeArray = require("utils.add-to-shape-array");

local createLevelObjects = function (mainFunc, shapeArrayParameters)
    local sp = shapeArrayParameters;    --------  CREATE OBJECTS HERE   -----------

    -- 1-1
    addToShapeArray(sp, "shape","triangle1_1_1", {1, 1, 1, 1}, "triangleBottomLeftShape", {1, _, "fire"})
    addToShapeArray(sp, "shape","triangle2_1_1", {1, 1, 5, 1}, "triangleTopRightShape")
    addToShapeArray(sp, "autoFan","autoFan1_1_1", {1, 1, 7, 1}, "down")
    addToShapeArray(sp, "shape","triangle3_1_1", {1, 1, 3, 2}, "triangleLeftAndRightShape", {2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_1"},{"flip-horizontal"}})
    addToShapeArray(sp, "item","mystery-block", {1, 1, 7, 2}, {
        {name = "triangle", properties = {shape = "triangleTopRightShape"} },
        {name = "autoFan", properties = {directions = {"left"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "manualFan", properties = {directions = {"right"} } },
        {name = "spitter", properties = {directions = {"up"} } },
        {name = "spitter", properties = {directions = {"none", "right", "down", "left"} } }
    })
    addToShapeArray(sp, "autoFan","autoFan2_1_1", {1, 1, 6, 3}, "down")
    addToShapeArray(sp, "shape","triangle4_1_1", {1, 1, 4, 4}, "triangleTopAndBottomShape", {2})
    addToShapeArray(sp, "shape","triangle5_1_1", {1, 1, 6, 4}, "triangleTopLeftShape")
    addToShapeArray(sp, "shape","triangle6_1_1", {1, 1, 1, 5}, "triangleTopRightShape", {1, _, "fire"})
    addToShapeArray(sp, "simple","simple1_1_1", {1, 1, 3, 5})
    addToShapeArray(sp, "shape","triangle7_1_1", {1, 1, 6, 5}, "triangleBottomRightShape", {1, _, "breakable"})
    addToShapeArray(sp, "shape","bar1_1_1", {1, 1, 6, 5}, "bar", {"horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"switchSlide"},{},{2},{1},{1,1,6,3},{2},{1,1,6,5}})
    addToShapeArray(sp, "door","door1_1_1", {1, 1, 7, 5}, "down")

    -- SCREEN 1-2
    addToShapeArray(sp, "door","door1_1_2", {1, 2, 3, 1}, "up")
    addToShapeArray(sp, "shape","bar1_1_2", {1, 2, 6, 1}, "bar", {"vert", 2})
    addToShapeArray(sp, "shape","triangle1_1_2", {1, 2, 5, 2}, "triangleBottomLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle1_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,2},{2},{1,2,6,1}})
    addToShapeArray(sp, "shape","triangle2_1_2", {1, 2, 1, 3}, "triangleTopRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","triangle3_1_2", {1, 2, 4, 3}, "triangleTopRightShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_2"},{"slide"},{"green"},{2},{1},{1,2,3,4},{"*"},{1,2,3,3},{2},{1,2,4,3}})
    addToShapeArray(sp, "shape","triangle4_1_2", {1, 2, 5, 3}, "triangleTopLeftShape")
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle4_1_2"},{"slide"},{"green"},{1},{1},{1,2,5,3},{2},{1,2,6,4}})
    addToShapeArray(sp, "shape","triangle5_1_2", {1, 2, 1, 4}, "triangleBottomRightShape", {1, _, "icy"})
    addToShapeArray(sp, "shape","bar2_1_2", {1, 2, 8, 4}, "bar", {"horz", 3})
    addToShapeArray(sp, "endPoint","endPoint1_1_2", {1, 2, 7, 5})

    --SWITCHES
    addToShapeArray(sp, "switch","switch1_1_1", {1, 1, 2, 2}, { {"slide", "bar1_1_1"} }, {"one-way"})
    addToShapeArray(sp, "switch","switch2_1_1", {1, 1, 3, 4}, { {"flip-horizontal", "triangle2_1_1"} })


    --GEMS
    addToShapeArray(sp, "gem","purple", {1, 1, 1, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 2, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 3}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 7, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 5, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 5}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 4, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 1, 6, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 1}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 5, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 2, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 7, 4}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 3, 2}, "purple")
    addToShapeArray(sp, "gem","purple", {1, 2, 1, 5}, "purple")
    addToShapeArray(sp, "gem","redCoin", {1, 2, 7, 2}, "redCoin")
    addToShapeArray(sp, "gem","blueCoin", {1, 1, 6, 2}, "blueCoin")
    addToShapeArray(sp, "gem","purpleCoin", {1, 1, 1, 2}, "purpleCoin")

    --ITEMS
    addToShapeArray(sp, "item","coins", {1, 1, 5, 3, 270}) 
    addToShapeArray(sp, "item","coins", {1, 1, 1, 4, 200}) 
    addToShapeArray(sp, "item","coins", {1, 2, 2, 1, 40})  
    addToShapeArray(sp, "item","coins", {1, 2, 4, 1, 65 })
    addToShapeArray(sp, "item","small-present", {1, 1, 5, 2}, {})

    addToShapeArray(sp, "item","small-present", {1, 2, 2, 3}, {})

    addToShapeArray(sp, "item","bombs", 1, 2, 7, 3, {}})  

end
    t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 1
t.screenHorzTotal = 1
t.screenVertTotal = 2
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 2
t.ballFirstHorzSquare = 7
t.ballFirstVertSquare = 1
t.ballFirstDirection = "left"
t.initialDirection = t.ballFirstDirection

return t
