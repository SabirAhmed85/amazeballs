local objectInArea = function (object, topBound, rightBound, bottomBound, leftBound)
    return object.x > leftBound and object.x < rightBound
        and object.y > topBound and object.y < bottomBound;
end;

return objectInArea;