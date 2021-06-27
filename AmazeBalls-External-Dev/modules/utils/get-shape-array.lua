local getShapeArray = function (type, name, location, subType, props)
    local props = props or {};
    
    return {
        type = type,
        name = name,
        location = {
            xScreen = location[1],
            yScreen = location[2],
            xSquare = location[3],
            ySquare = location[4]
        },
        subType = subType,
        props = props
    };
end;

return getShapeArray;