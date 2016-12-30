local widget = require("widget")
local t = {}

local createLevelObjects = function (mainFunc, shapeArrayParameters)
	--------  CREATE OBJECTS HERE   -----------

    -- 1-1

    table.insert(shapeArrayParameters,{"shape","bar1_1_1", 1, 1, 1, 2, "bar", "vert", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar1_1_1"},{"slide"},{"brown"},{1},{1},{1,1,1,2},{2},{1,1,2,2}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 2, 1, "down"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 6, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_1", 1, 1, 1, 2, "triangleTopRightShape", 1, 13})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_1", 1, 1, 3, 2, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_1", 1, 1, 5, 2, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","bar2_1_1", 1, 1, 6, 2, "bar", "horz", 2})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar2_1_1"},{"slide"},{"brown"},{2},{1},{1,1,6,2},{2},{1,1,6,5}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 7, 2, "left"})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 3, 3, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"shape","bar3_1_1", 1, 1, 5, 3, "bar", "horz", 4})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"bar3_1_1"},{"slide"},{"brown"},{1},{1},{1,1,5,1},{2},{1,1,5,3}})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_1", 1, 1, 6, 3, "up"})
    table.insert(shapeArrayParameters,{"backFire","backFire1_1_1", 1, 1, 1, 5})
    table.insert(shapeArrayParameters,{"shape","triangle1_1_1", 1, 1, 2, 5, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"autoFan","autoFan2_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"door","door1_1_1", 1, 1, 3, 5, "down"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_1", 1, 1, 5, 5, "right"})
    table.insert(shapeArrayParameters,{"backFire","backFire2_1_1", 1, 1, 7, 5})
    table.insert(shapeArrayParameters,{"shape","bar4_1_1", 1, 1, 5, 6, "bar", "vert", 2})

    -- SCREEN 1-2
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 1, 1, "up"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_2", 1, 2, 3, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_2", 1, 2, 5, 1, "triangleTopAndBottomShape", 1})
    table.insert(shapeArrayParameters,{"door","door1_1_2", 1, 2, 7, 1, "up"})
    table.insert(shapeArrayParameters,{"endPoint","endPoint1_1_2", 1, 2, 3, 2})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_2", 1, 2, 2, 3, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"item","map", 1, 2, 3, 3})
    table.insert(shapeArrayParameters,{"shape","triangle5_1_2", 1, 2, 4, 3, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"gem","purple1_1_2", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"manualFan","manualFan1_1_2", 1, 2, 1, 5, "up"})
    table.insert(shapeArrayParameters,{"simple","simple1_1_2", 1, 2, 2, 5})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"simple1_1_2"},{"slide"},{"lightBlue"},{1},{1},{1,2,2,5},{2},{1,2,4,5},{3},{1,2,5,5},{4},{1,2,6,5}})
    table.insert(shapeArrayParameters,{"manualFan","manualFan2_1_2", 1, 2, 7, 5, "up"})

    --SCREEN 1-3

    table.insert(shapeArrayParameters,{"shape","triangle1_1_3", 1, 3, 1, 1, "triangleBottomRightShape", 1})
    table.insert(shapeArrayParameters,{"door","door1_1_3", 1, 3, 2, 1, "up"})
    table.insert(shapeArrayParameters,{"shape","triangle2_1_3", 1, 3, 7, 1, "triangleBottomLeftShape", 1})
    table.insert(shapeArrayParameters,{"shape","triangle3_1_3", 1, 3, 2, 4, "triangleTopLeftShape", 1})
    table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"triangle3_1_3"},{"slide"},{"green"},{1},{1},{1,3,2,4},{2},{1,3,2,5}})
    table.insert(shapeArrayParameters,{"shape","triangle4_1_3", 1, 3, 1, 5, "triangleTopRightShape", 1})
    table.insert(shapeArrayParameters,{"characterChangePoint","characterChangePoint1_1_3", 1, 3, 4, 4} )
    table.insert(shapeArrayParameters,{"shape","triangle5_1_3", 1, 3, 6, 4, "triangleTopRightShape", 1, _, "breakable"})
    table.insert(shapeArrayParameters,{"autoFan","autoFan1_1_3", 1, 3, 4, 5, "right"} )
    table.insert(shapeArrayParameters,{"shape","triangle6_1_3", 1, 3, 7, 5, "triangleTopLeftShape", 1})

    --GEMS
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 3, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 6, 2, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 1, 4, 5, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 3, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 4, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 2, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 2, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 4, 1, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 7, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","purple", 1, 3, 1, 3, "purple"})
    table.insert(shapeArrayParameters,{"gem","redCoin", 1, 3, 5, 5, "redCoin"})
    table.insert(shapeArrayParameters,{"gem","blueCoin", 1, 1, 2, 3, "blueCoin"})
    table.insert(shapeArrayParameters,{"gem","purpleCoin", 1, 2, 5, 2, "purpleCoin"})

    --ITEMS
    table.insert(shapeArrayParameters,{"item","coins", 1, 3, 3, 5, 100})
    table.insert(shapeArrayParameters,{"item","coins", 1, 3, 2, 3, 50})
    table.insert(shapeArrayParameters,{"item","coins", 1, 1, 5, 4, 250})
    table.insert(shapeArrayParameters,{"item","small-present", 1, 1, 4, 1, "present1_1_1", {} })
    table.insert(shapeArrayParameters,{"item","small-present", 1, 2, 7, 2, "present2_1_2", {} })

end
	t.createLevelObjects = createLevelObjects

t.thisScreenHorzValue = 1
t.thisScreenVertValue = 2
t.screenHorzTotal = 1
t.screenVertTotal = 3
t.ballFirstScreenHorzValue = 1
t.ballFirstScreenVertValue = 3
t.ballFirstHorzSquare = 2
t.ballFirstVertSquare = 1
t.ballFirstDirection = "right"
t.initialDirection = t.ballFirstDirection

return t
