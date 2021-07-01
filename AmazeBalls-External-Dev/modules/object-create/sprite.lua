local sprite = function(sheet, sequenceData, sequence, play, width, height)
    local sprite = display.newSprite(sheet, sequenceData);
    if (play) then
        sprite:play();
    end;
    sprite:setSequence(sequence);

    if (width) then
        sprite.width = xCalc(width)
    end;
    if (height) then
        sprite.height = yCalc(height)
    end;

    return sprite;
end;

return sprite;