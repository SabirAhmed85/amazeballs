local mapShowAndClockLabel_Compass = function (mapShowAndClockLabel, levelItemsImageSheet, levelItemsSequenceData)
    local mapShowAndClockLabel_Compass = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
    mapShowAndClockLabel_Compass:setSequence("fullMap")
    mapShowAndClockLabel_Compass.x = mapShowAndClockLabel.x + 52
    mapShowAndClockLabel_Compass.y = mapShowAndClockLabel.y - 21
    mapShowAndClockLabel_Compass.xScale = 0.5
    mapShowAndClockLabel_Compass.yScale = 0.5
    mapShowAndClockLabel_Compass.alpha = 0

    return mapShowAndClockLabel_Compass;
end;

return mapShowAndClockLabel_Compass;