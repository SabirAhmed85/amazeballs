    --[[   SMALL-PRESENTS AND BIG-PRESENTS : Detail of the Items they can contain.  ]]
    --[[File type kept as type lua for code formatting]]

    -- This is a CONTROL LIST which shows
    -- ALL THE DIFFERENT ITEMS which you can put into Presents.

    -- This is an example of how it looks in the level script, when inserting level items.

    table.insert(shapeArrayParameters,{"item","small-present", 2, 1, 1, 3, "small-present1_2_1", {
        --Tools
        --[8] = number of squares, [9] = directions, [10] = quantity
            -- Number of squares means the number of squares the bomb will explode in / the number of squares the hook-rope will travel
                --[[ max number of squares: 4 ]]
                -- [[as the levels go higher, the number of squares should gradually go higher. At the beginning they only get small weapons. ]]
            -- Directions means the different directions that the bomb will explode in / the hook will shoot
                -- [[ hook must only have 1 direction maximum ]]
                -- [[as the levels go higher, the number of different directions that the bomb has should gradually go higher, but should start off at 1. At the beginning they only get small bombs. ]]
            -- Quantity is the number of bombs / hooks to go into bag 
        {"item","bomb", _, _, _, _, _, 3, {"right", "left", "up"}, 3}
        ,{"item","hook", _, _, _, _, _, 3, {"left"}, 4}
        --[8] = directions, [9] = quantity
            -- Directions means the direction that the jet will make you travel in
            -- Quantity is the number of jets to go into bag 
        ,{"item","jet", _, _, _, _, _, {"up"}, 2}
        --[8] = number of seconds, [9] = quantity 
            -- Number of seconds means the number of seconds that the item will last
                --[[ max number of seconds can be 30 ]]
                --[[ seconds can only go in these intervals: 5, 10, 15, 20, 25, 30 ]]
            -- Quantity is the number of items to go into bag 
        ,{"item","clock", _, _, _, _, _, 10, 1}
        ,{"item","bulletVest", _, _, _, _, _, 20, 1}
        ,{"item","iceCape", _, _, _, _, _, 15, 1}
        ,{"item","fireCape", _, _, _, _, _, 15, 3}
        ,{"item","characterSpecial", _, _, _, _, _, 10, 2}
        --[8] = quantity 
        ,{"item","dummyBall", _, _, _, _, _, 2}
        ,{"item","superBall", _, _, _, _, _, 3}
        --Shapes
        ,{"simple"}
        ,{"backFire"}
        ,{"shape", "triangleTopRightShape"}
        ,{"shape", "triangleTopRightShape", "breakable"}
        ,{"bar", "horz"}
        ,{"bar", "vert"}
        ,{"spitter", {"up", "right", "down", "left"}}
        ,{"autoFan", "down"}
        ,{"manualFan", "down"}
    } })

    -- I want you to go through all the levels in Woody Walk and Fiery Fortress, Gold and Silver, and I want you to put items 
    -- into the different Small-Presents and Big-Presents.
    -- You should randomly choose different items to put into the Presents, and randomly pick different quanitities for the items. 
    -- However, you cannot have a quantity greater than 3 for any item.

    -- ALERT: YOU CANNOT USE AN ITEM BEFORE IT IS READY TO BE INTRODUCED. You can only use the items which are already introduced, and Below I have shown 
    -- you a list of which level to FIRST Introduce The different items

    -- When an item is first being introduced, for the first time, it MUST be in a big-present
    -- and it MUST be on its own with no oter Items

    -- You can never introduce an item in a level before that level which it should be introduced.
    -- Here are the levels where each item should be FIRST instroduced:

        -- clock: Woody Walk - 5 Silver (change the small-present to a big present)
        -- shape: Woody Walk - 10 Silver (change one of the small presents to a big-present)
        -- simple:  Woody Walk - 7 Gold (change the small present to a big-present)
        -- bar:  Woody Walk - 9 Gold (change one of the small presents to a big-present)
        -- bomb: Fiery Fortress - 5 Silver (should create a new small_present at 1,1,1,4 - containing bomb that has 2 Squares and Direction of "Down")
        -- backFire: Fiery Fortress - 9 Silver (small_present should change to big-present at 1,2,7,1)
        -- fireCape: Fiery Fortress - 13 Silver (small_present should change to big-present at 1,3,4,5)
        -- dummyBall: Fiery Fortress - 17 Silver (put it inside big-present at 1,2,7,5)
        -- characterSpecial: Fiery Fortress - 5 Gold (put inside big-present at 1,1,1,3)
        -- autoFan: Fiery Fortress - 9 Gold (put inside big-present at 1,1,6,3)


    -- Big presents must always have between 3 - 6 items, or they must have 1 NEW item which we
    -- are seeing for FIRST time: i.e. one 'First-time' item

    -- Small presents should have been 1 and 3 items in them.

    -- In every world, all the SILVER LEVELS ARE BEFORE ALL THE GOLD LEVELS in the timeline order. 
    -- e.g. If a weapon can only be first introduced in World 3, Level 5 Gold, that means that weapon
    -- cannot be used in World 3, Level 18 Silver, because Level 18 Silver is before Level 5 Gold.
