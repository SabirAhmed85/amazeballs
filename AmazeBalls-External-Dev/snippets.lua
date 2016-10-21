-- A text object is created and is aligned left at point x=20
local textObj = display.newText(instance2.y, 0,0, nil, 14);
textObj:setReferencePoint(display.CenterLeftReferencePoint);
textObj.x = 20;

-- A text object is created and is aligned left at point x=20
local textObj = display.newText(triangle2.y, 0,0, nil, 14);
textObj:setReferencePoint(display.CenterLeftReferencePoint);
textObj.x = 50;

--ITEMS
table.insert(shapeArrayParameters,{"item","bomb", 1, 1, 6, 2, "bomb2_1_1", {3, "right", "left", "up"}, 3})
table.insert(shapeArrayParameters,{"item","clock", 1, 1, 3, 2, "clock1_1_1", 10, 1})

--spitter

table.insert(shapeArrayParameters,{"spitter","spitter1_1_1", 1, 1, 6, 5, "up","none","none","none"})
table.insert(mainFunc.allLevelSettings.transitionArrayIndex,{{"spitter1_1_1"},{"slide"},{},{3},{1},{1,1,4,5},{2},{1,1,5,5},{3},{1,1,6,5},{4},{1,1,7,5}})

--gun
table.insert(shapeArrayParameters,{"gun","gun1_1_1", 1, 1, 3, 1, "down"})

-- Mystery Block

table.insert(shapeArrayParameters,{"item","mystery-block", 1, 1, 6, 3, {
        {name = "manualFan", properties = {directions = {"down"} } },
        {name = "autoFan", properties = {directions = {"right"} } },
        {name = "autoFan", properties = {directions = {"down"} } },
        {name = "spitter", properties = {directions = {"up"} } }
    }} )

table.insert(shapeArrayParameters,  {"item","big-present", 1, 2, 6, 2, "present2_1_1", 
                                        { 
                                            {"item","clock", 1, 2, 3, 2, "clock1_1_1", 10, 1},
                                            {"triangle", "triangleTopRightShape"},
                                            {"spitter", {"up", "right", "down", "left"} },
                                            {"manualFan", "right"},
                                            {"manualFan", "down"},
                                            {"autoFan", "down"}
                                        } 
                                    } ) 