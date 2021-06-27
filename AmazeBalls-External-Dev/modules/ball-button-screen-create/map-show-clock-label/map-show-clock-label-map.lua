local mapShowAndClockLabel_Map = function (mapShowAndClockLabel, levelItemsImageSheet, levelItemsSequenceData)
    local mapShowAndClockLabel_Map = display.newSprite(levelItemsImageSheet, levelItemsSequenceData)
    if currentMedal == "silver" then
        mapShowAndClockLabel_Map:setSequence("partialMap")
    else
        mapShowAndClockLabel_Map:setSequence("fullMap")
    end
    mapShowAndClockLabel_Map.xScale = 0.5
    mapShowAndClockLabel_Map.yScale = 0.5
    mapShowAndClockLabel_Map.x = mapShowAndClockLabel.x + 35
    mapShowAndClockLabel_Map.y = mapShowAndClockLabel.y - 21
    mapShowAndClockLabel_Map.alpha = 0

    return mapShowAndClockLabel_Map;
end;

return mapShowAndClockLabel_Map;